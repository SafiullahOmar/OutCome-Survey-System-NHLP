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
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static bool SaveFormDetail(ProjectDetail formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            bool flag = false;
            SqlParameter[] p = new SqlParameter[14];
            p[0] = new SqlParameter("@CommunityId", SqlDbType.VarChar) { Value = formDetail.CommunityId };
            p[1] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetail.Year };
            p[2] = new SqlParameter("@SeasonId", SqlDbType.Int) { Value = formDetail.SeasonId };
            p[3] = new SqlParameter("@ProjectTypeId", SqlDbType.Int) { Value = formDetail.ProjectTypeId };
            p[4] = new SqlParameter("@ContractCost", SqlDbType.Decimal) { Value = formDetail.ContractCost };
            p[5] = new SqlParameter("@NHLPCost", SqlDbType.Decimal) { Value = formDetail.NHLPCost };
            p[6] = new SqlParameter("@OwnerName", SqlDbType.NVarChar) { Value = formDetail.OwnerName };
            p[7] = new SqlParameter("@OwnerConactNo", SqlDbType.NVarChar) { Value = formDetail.OwnerContactNo };
            p[8] = new SqlParameter("@NoOfMembers", SqlDbType.Int) { Value = formDetail.NoOfMembers };
            p[9] = new SqlParameter("@Latitude", SqlDbType.NVarChar) { Value = formDetail.Latitude };
            p[10] = new SqlParameter("@Longtitude", SqlDbType.NVarChar) { Value = formDetail.Longtitude };
            p[11] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
            p[12] = new SqlParameter("@InsertionDate", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
            p[13] = new SqlParameter("@exist", SqlDbType.Bit);
            p[13].Direction = ParameterDirection.Output;
            flag = Convert.ToBoolean(dbT.ExecuteTransStoreProcedureReturn("spPageCDCProjectsDetailSAVE", p, true, "@exist"));
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
    public static List<CDCPrjects> GetProjectLists(string Id, string Year, string SeasonId)
    {
        List<CDCPrjects> lst = new List<CDCPrjects>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageCDCProjectDetailsList4GridView";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@ExtWId", SqlDbType.NVarChar).Value = Id;
        com.Parameters.AddWithValue("@SeasonId", SqlDbType.Int).Value = SeasonId;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            CDCPrjects p = new CDCPrjects();
            p.OwnerName = dr["OwnerName"].ToString();
            p.ProjectType = dr["ProjectType"].ToString();
            p.CDCCode = dr["CommunityId"].ToString();
            p.Year=dr["Year"].ToString();
            p.SeasonId = dr["SeasonId"].ToString();
            p.ExtWId = dr["ExtWId"].ToString();
            p.ProjectId = dr["ProjectId"].ToString();
            p.Edit = HttpContext.Current.User.IsInRole("Admin") == true ? true : false;
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static ProjectDetail EditCDCProjectDetail(string ExtWId, string Year, string SeasonId, string CommunityId, string ProjectId)
    {
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageCDCProjectDetailGetToUpdate";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@ExtWId", SqlDbType.VarChar).Value = ExtWId;
        com.Parameters.AddWithValue("@SeasonId", SqlDbType.Int).Value = SeasonId;
        com.Parameters.AddWithValue("@CommunityId", SqlDbType.Int).Value = CommunityId;
        com.Parameters.AddWithValue("@Id", SqlDbType.VarChar).Value = ProjectId;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        ProjectDetail K = new ProjectDetail();
        int c = 1;
        while (dr.Read())
        {
            K.ContractCost = dr["ContractCost"].ToString();
            K.DistrictId = dr["DistrictId"].ToString();
            K.ExtId = dr["ExtWId"].ToString();
            K.Latitude = dr["Latitude"].ToString();
            K.Longtitude = dr["Longtitude"].ToString();
            K.NHLPCost = dr["NHLPCost"].ToString();
            K.NoOfMembers = dr["NoOfOtherMembers"].ToString();
            K.OwnerContactNo = dr["OwnerContactNo"].ToString();
            K.OwnerName = dr["OwnerName"].ToString();
            K.ProjectTypeId = dr["ProjectType"].ToString();
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
    public static void UpdateDetail(ProjectDetail formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            SqlParameter[] p = new SqlParameter[14];
            p[0] = new SqlParameter("@CommunityId", SqlDbType.VarChar) { Value = formDetail.CommunityId };
            p[1] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetail.Year };
            p[2] = new SqlParameter("@SeasonId", SqlDbType.Int) { Value = formDetail.SeasonId };
            p[3] = new SqlParameter("@ProjectTypeId", SqlDbType.Int) { Value = formDetail.ProjectTypeId };
            p[4] = new SqlParameter("@ContractCost", SqlDbType.Decimal) { Value = formDetail.ContractCost };
            p[5] = new SqlParameter("@NHLPCost", SqlDbType.Decimal) { Value = formDetail.NHLPCost };
            p[6] = new SqlParameter("@OwnerName", SqlDbType.NVarChar) { Value = formDetail.OwnerName };
            p[7] = new SqlParameter("@OwnerConactNo", SqlDbType.NVarChar) { Value = formDetail.OwnerContactNo };
            p[8] = new SqlParameter("@NoOfMembers", SqlDbType.Int) { Value = formDetail.NoOfMembers };
            p[9] = new SqlParameter("@Latitude", SqlDbType.NVarChar) { Value = formDetail.Latitude };
            p[10] = new SqlParameter("@Longtitude", SqlDbType.NVarChar) { Value = formDetail.Longtitude };
            p[11] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
            p[12] = new SqlParameter("@updationDate", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
            p[13] = new SqlParameter("@ProjectId", SqlDbType.VarChar) { Value = formDetail.ProjectId };
            dbT.ExecuteTransStoreProcedure("spPageCDCProjectsDetailUpdate", p, true);
            dbT.EndTransaction();

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
    public class CDCPrjects
    {
        public string OwnerName { get; set; }
        public string ProjectType { get; set; }
        public string CommunityId { get; set; }
        public string CDCCode { get; set; }
        public string Year { get; set; }
        public string SeasonId { get; set; }
        public string ExtWId { get; set; }
        public string ProjectId { get; set; }
        public bool Edit { get; set; }
    }

    public class ProjectDetail
    {
        public string ProjectId { get; set; }
        public string Year { get; set; }
        public string SeasonId { get; set; }
        public string ProvinceId { get; set; }
        public string ProvinceName { get; set; }
        public string DistrictId { get; set; }
        public string DistrictName { get; set; }
        public string ExtensionWName { get; set; }
        public string ExtId { get; set; }
        public string CommunityId { get; set; }
        public string NoOfMembers { get; set; }
        public string Longtitude { get; set; }
        public string Latitude { get; set; }

        public string OwnerContactNo { get; set; }
        public string OwnerName { get; set; }
        public string NHLPCost { get; set; }
        public string ContractCost { get; set; }
        public string ProjectTypeId { get; set; }

    }

}