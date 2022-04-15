using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using OCM;
using System.Web.Script.Services;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;

public partial class PCI_frmPCInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            fillDdll();
        }
    }
    private void fillDdll()
    {

        ddlProvince.DataSource = OCM_UserInfo.GetUserProvinces();
        ddlProvince.DataTextField = "ProvinceEngName";
        ddlProvince.DataValueField = "ProvinceID";
        ddlProvince.DataBind();
        ddlProvince.Items.Insert(0, new ListItem("--Select--", "-1"));
    }
    [WebMethod]
    public static List<District> GetDistrict(string ProvinceID)
    {
        List<District> lst = new List<District>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "select * from OCM_District where ProvinceID=" + ProvinceID + " order by DistrictID";
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
    public static bool SaveFormDetail(FormDetail formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            SqlParameter[] p = new SqlParameter[11];
            p[0] = new SqlParameter("@Code", SqlDbType.VarChar) { Value =formDetails.Code };
            p[1] = new SqlParameter("@CDCName", SqlDbType.VarChar) { Value =formDetails.CDCName };
            p[2] = new SqlParameter("@ChairmanName", SqlDbType.VarChar) { Value =formDetails.ChairmanName };
            p[3] = new SqlParameter("@ContactNo", SqlDbType.VarChar) { Value = formDetails.ChairmanContactNo };
            p[4] = new SqlParameter("@BankAccount", SqlDbType.VarChar) { Value =formDetails.BankAccountNo };
            p[5] = new SqlParameter("@DistrictId", SqlDbType.Int) { Value =formDetails.DistrictID };
            p[6] = new SqlParameter("@ProvinceId", SqlDbType.Int) { Value =formDetails.ProvinceID };
            p[7] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
            p[8] = new SqlParameter("@InsertedDate", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
            p[9] = new SqlParameter("@ExtWId", SqlDbType.NVarChar) { Value =formDetails.ExtWId };
            p[10] = new SqlParameter("@exist", SqlDbType.Bit);
            p[10].Direction = ParameterDirection.Output;
            bool flag = Convert.ToBoolean(dbT.ExecuteTransStoreProcedureReturn("spPageCDCSave", p, true, "@exist"));
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
    public static List<FormDetail> GetCDCLists(string Province)
    {
        List<FormDetail> lst = new List<FormDetail>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageCDCChairmanList4GridView";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@ProvinceId", SqlDbType.Int).Value = Province;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            FormDetail p = new FormDetail();            
            p.CDCName = dr["Name"].ToString();            
            p.ChairmanName = dr["ChairmanName"].ToString();
            p.District = dr["DistrictEngName"].ToString();
            p.Code = dr["Code"].ToString();           
            p.Province = dr["ProvinceEngName"].ToString();
            p.Id = dr["Code"].ToString();
            p.Edit = HttpContext.Current.User.IsInRole("Admin") == true ? true : false;
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static FormDetail GetCDCDetailByID(string CDCID)
    {
        FormDetail p = new FormDetail();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageCDCGetChairmanToUpdate";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Id", SqlDbType.VarChar).Value =CDCID;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            p.BankAccountNo = dr["Name"].ToString();
            p.BankAccountNo = dr["BankAccount"].ToString();
            p.CDCName = dr["Name"].ToString();
            p.ChairmanContactNo = dr["ChairmanContactNo"].ToString();
            p.ChairmanName = dr["ChairmanName"].ToString();
            p.Code = dr["Code"].ToString();
            p.DistrictID = dr["DistrictId"].ToString();
            p.ProvinceID = dr["ProvinceId"].ToString();
            p.ExtWId = dr["ExtWId"].ToString();
        }
        return p;
    }
    [WebMethod]
    public static void UpdateFormDetail(FormDetail formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {
            if (HttpContext.Current.User.IsInRole("Admin"))
            {
                dbT.BeginTransaction();
                MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
                SqlParameter[] p = new SqlParameter[11];
                p[0] = new SqlParameter("@Code", SqlDbType.VarChar) { Value = formDetails.Code };
                p[1] = new SqlParameter("@CDCName", SqlDbType.VarChar) { Value = formDetails.CDCName };
                p[2] = new SqlParameter("@ChairmanName", SqlDbType.VarChar) { Value = formDetails.ChairmanName };
                p[3] = new SqlParameter("@ContactNo", SqlDbType.VarChar) { Value = formDetails.ChairmanContactNo };
                p[4] = new SqlParameter("@BankAccount", SqlDbType.VarChar) { Value = formDetails.BankAccountNo };
                p[5] = new SqlParameter("@DistrictId", SqlDbType.Int) { Value = formDetails.DistrictID };
                p[6] = new SqlParameter("@ProvinceId", SqlDbType.Int) { Value = formDetails.ProvinceID };
                p[7] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                p[8] = new SqlParameter("@UpdationDate", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
                p[9] = new SqlParameter("@Id", SqlDbType.VarChar) { Value = formDetails.Id};
                p[10] = new SqlParameter("@ExtWId", SqlDbType.VarChar) { Value =formDetails.ExtWId };
                dbT.ExecuteTransStoreProcedure("spPageCDCUpdate", p, true);
                dbT.EndTransaction();
            }
        }
        catch (Exception)
        {
            dbT.EndTransaction();
            throw;
        }

    }
    [WebMethod]
    public static List<RoleNames> GetUserRoles()
    {
        List<RoleNames> lst = new List<RoleNames>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "GetUserRoleName";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@UserId", SqlDbType.UniqueIdentifier).Value = OCM_UserInfo.GetUserID();
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            lst.Add(new RoleNames() { 
            role=dr["RoleName"].ToString()
            });
        }
        dr.Close();
        return lst;
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
    public class FormDetail
    {
        public string Id { get; set; }
        public string CDCName { get; set; }
        public string ChairmanName { get; set; }
        public string Code { get; set; }
        public string ProvinceID { get; set; }
        public string DistrictID { get; set; }
        public string ExtWId { get; set; }
        public string Province { get; set; }
        public string District { get; set; }
        public string ChairmanContactNo
        {
            get;
            set;
        }
        public string BankAccountNo { get; set; }
        public bool Edit { get; set; } 
    }
    public class RoleNames{
        public string role { get; set; }
    }
    

}