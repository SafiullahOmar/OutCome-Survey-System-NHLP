using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OCM;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using System.Web.Script.Services;
using System.Web.Security;

public partial class CIG_PlasticTunnel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            fillDdll();
    }
    private void fillDdll()
    {

        ddlProvince.DataSource = OCM_UserInfo.GetUserProvinces();
        ddlProvince.DataTextField = "ProvinceEngName";
        ddlProvince.DataValueField = "ProvinceID";
        ddlProvince.DataBind();
        SqlParameter[] p = new SqlParameter[1];
        p[0] = new SqlParameter("@ActivityId", SqlDbType.Int) { Value = 1 };
        ddlProvince.DataSource = new OCM_DbGeneral().ExecuteSelectStoreProcedure("SharedGetFruit", p, true);
        ddlProvince.Items.Insert(0, new ListItem("--Select--", "-1"));
    }
    [WebMethod]
    public static List<District> GetDistrict(string ProvinceID)
    {
        List<District> lst = new List<District>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "SharedGetDistrict";
        com.Parameters.AddWithValue("@ProvinceId", SqlDbType.Int).Value = ProvinceID;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            District Dr = new District();
            Dr.DistrictId = dr["DistrictID"].ToString();
            Dr.DistrictName = dr["DistrictEngName"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static List<CDC> GetCDC(string ExtWId)
    {
        List<CDC> lst = new List<CDC>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "SharedGetCDC";
        com.Parameters.AddWithValue("@ExtWId", SqlDbType.VarChar).Value = ExtWId;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            CDC Dr = new CDC();
            Dr.CommunityId = dr["CommunityId"].ToString();
            Dr.Detail = dr["Detail"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static List<EW> GetExtensionW(string DistrictID)
    {
        List<EW> lst = new List<EW>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "SharedGetExtensionWorker";
        com.Parameters.AddWithValue("@DistrictId", SqlDbType.Int).Value = DistrictID;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            EW Dr = new EW();
            Dr.ExtId = dr["ExtWID"].ToString();
            Dr.Name = dr["Name"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static List<ProjectOwner> GetProjectOwner(string CDCId, string Year, string SeasonId)
    {
        List<ProjectOwner> lst = new List<ProjectOwner>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "spPageCDCProjectInstallmentsGetOwner";
        com.Parameters.AddWithValue("@SeasonId", SqlDbType.Int).Value = SeasonId;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@CommunityId", SqlDbType.VarChar).Value = CDCId;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            ProjectOwner Dr = new ProjectOwner();
            Dr.Detail = dr["Detail"].ToString();
            Dr.ProjectId = dr["ProjectId"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static string GetProjectOwnerPayDetail(string CDCId, string Year, string SeasonId, string ProjectId)
    {
        List<ProjectOwner> lst = new List<ProjectOwner>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "spPageCDCProjectInstallmentsGetCost";
        com.Parameters.AddWithValue("@SeasonId", SqlDbType.Int).Value = SeasonId;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@CommunityId", SqlDbType.VarChar).Value = CDCId;
        com.Parameters.AddWithValue("@ProjectId", SqlDbType.VarChar).Value = ProjectId;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        string TotalCost="";
        while (dr.Read())
        {
            TotalCost = dr["NHLPCost"].ToString();
        }
        dr.Close();
        con.Close();
        return TotalCost;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static bool SaveFormDetail(Installment formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            bool flag = false;
            SqlParameter[] p = new SqlParameter[12];
            p[0] = new SqlParameter("@CommunityId", SqlDbType.VarChar) { Value = formDetail.CommunityId };
            p[1] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetail.Year };
            p[2] = new SqlParameter("@SeasonId", SqlDbType.Int) { Value = formDetail.SeasonId };
            p[3] = new SqlParameter("@ProjectId", SqlDbType.VarChar) { Value = formDetail.ProjectId };
            p[4] = new SqlParameter("@InstallmentId", SqlDbType.Int) { Value = formDetail.InstallmentId };
            p[5] = new SqlParameter("@Percentage", SqlDbType.Float) { Value = formDetail.Percentage };
            p[6] = new SqlParameter("@Tax", SqlDbType.Float) { Value = formDetail.Tax };
            p[7] = new SqlParameter("@BankFee", SqlDbType.Float) { Value = formDetail.BankFee };
            p[8] = new SqlParameter("@NetInstallment", SqlDbType.Decimal) { Value = formDetail.NetInstallment };
            p[9] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
            p[10] = new SqlParameter("@InsertionDate", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
            p[11] = new SqlParameter("@exist", SqlDbType.Bit);
            p[11].Direction = ParameterDirection.Output;
            flag = Convert.ToBoolean(dbT.ExecuteTransStoreProcedureReturn("spPageCDCProjectInstallmentsSave", p, true, "@exist"));
            if (flag == true)
            {
                dbT.RollBackTransaction();
                return flag;
            }

            dbT.EndTransaction();
            return flag;
        }
        catch (Exception)
        {
            dbT.RollBackTransaction();
            throw;
        }
        finally
        {

        }
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<CDCPrjects> GetProjectInstallments(string CommunityId, string ProjectId)
    {
        List<CDCPrjects> lst = new List<CDCPrjects>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageCDCProjectInstallmentList4GridView";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@CommunityId", SqlDbType.VarChar).Value = CommunityId;
        com.Parameters.AddWithValue("@ProjectId", SqlDbType.NVarChar).Value = ProjectId;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            CDCPrjects p = new CDCPrjects();
            p.CommunityId = dr["CommunityId"].ToString();
            p.OwnerName = dr["OwnerName"].ToString();
            p.ProjectType = dr["ProjectType"].ToString();
            p.ProjectId = dr["ProjectId"].ToString();
            p.NetInstallment = dr["InstallmentId"].ToString();
            p.InstallmentId = dr["NetInstallment"].ToString();
            p.Edit = HttpContext.Current.User.IsInRole("Admin") == true ? true : false;
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Installment EditCDCProjectsInstallments(string CommunityId, string ProjectId)
    {
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageCDCProjectInstallmentGetToUpdate";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@CommunityId", SqlDbType.VarChar).Value = CommunityId;
        com.Parameters.AddWithValue("@ProjectId", SqlDbType.VarChar).Value =ProjectId;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        Installment K = new Installment();
        int c = 1;
        while (dr.Read())
        {
            K.BankFee = dr["BankTransferCost"].ToString();
            K.InstallmentId = dr["InstallmentId"].ToString();
            K.NetInstallment = dr["NetInstallment"].ToString();
            K.Percentage = dr["Percentage"].ToString();
            K.ProjectId = dr["ProjectId"].ToString();
            K.Tax = dr["Tax"].ToString();
            K.DistrictId = dr["DistrictId"].ToString();
            K.ExtWId = dr["ExtWId"].ToString();
            K.ProvinceId = dr["ProvinceId"].ToString();
            K.SeasonId = dr["SeasonId"].ToString();
            K.Year = dr["Year"].ToString();
            K.CommunityId = dr["CommunityId"].ToString();

        }
        dr.Close();
        con.Close();
        return K;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static bool UpdateDetail(Installment formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            bool flag = false;
            SqlParameter[] p = new SqlParameter[12];
            p[0] = new SqlParameter("@CommunityId", SqlDbType.VarChar) { Value = formDetail.CommunityId };
            p[1] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetail.Year };
            p[2] = new SqlParameter("@SeasonId", SqlDbType.Int) { Value = formDetail.SeasonId };
            p[3] = new SqlParameter("@ProjectId", SqlDbType.VarChar) { Value = formDetail.ProjectId };
            p[4] = new SqlParameter("@InstallmentId", SqlDbType.Int) { Value = formDetail.InstallmentId };
            p[5] = new SqlParameter("@Percentage", SqlDbType.Float) { Value = formDetail.Percentage };
            p[6] = new SqlParameter("@Tax", SqlDbType.Float) { Value = formDetail.Tax };
            p[7] = new SqlParameter("@BankFee", SqlDbType.Float) { Value = formDetail.BankFee };
            p[8] = new SqlParameter("@NetInstallment", SqlDbType.Decimal) { Value = formDetail.NetInstallment };
            p[9] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
            p[10] = new SqlParameter("@Updationdate", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
            p[11] = new SqlParameter("@exist", SqlDbType.Bit);
            p[11].Direction = ParameterDirection.Output;
            flag = Convert.ToBoolean(dbT.ExecuteTransStoreProcedureReturn("spPageCDCProjectInstallmentsUpdate", p, true, "@exist"));
            if (flag == true)
            {
                dbT.RollBackTransaction();
                return flag;
            }

            dbT.EndTransaction();
            return flag;

        }
        catch (Exception)
        {
            dbT.RollBackTransaction();
            throw;
        }
        finally
        {

        }
    }
    public class District
    {
        public string DistrictId { get; set; }
        public string DistrictName { get; set; }

    }
    public class EW
    {
        public string ExtId { get; set; }
        public string Name { get; set; }
    }
    public class CDC
    {
        public string CommunityId { get; set; }
        public string Detail { get; set; }
    }
    public class ProjectOwner
    {
        public string ProjectId { get; set; }
        public string Detail { get; set; }
    }
   
    public class CDCPrjects
    {
        public string OwnerName { get; set; }
        public string ProjectType { get; set; }
        public string CommunityId { get; set; }
        public string ProjectId { get; set; }
        public string NetInstallment { get; set; }
        public string InstallmentId { get; set; }
        public bool Edit { get; set; }
    }

    public class Installment
    {
        public string ProjectId { get; set; }
        public string CommunityId { get; set; }
        public string InstallmentId { get; set; }
        public string Percentage { get; set; }
        public string Tax { get; set; }
        public string BankFee { get; set; }
        public string NetInstallment { get; set; }
        public string Year { get; set; }
        public string SeasonId { get; set; }
        public string DistrictId { get; set; }
        public string ProvinceId { get; set; }
        public string ExtWId { get; set; }

    }

}