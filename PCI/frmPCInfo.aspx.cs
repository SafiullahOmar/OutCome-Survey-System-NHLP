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
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SaveFormDetail(FormDetail formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            #region GenerateCode
            string idToReturn = "";
            string count = dbT.ExecuteTranScaller("select count(ProvinceID)+1 as cnt from tbl_PC where ProvinceID=" + formDetails.ProvinceID + "");
            idToReturn = "PC" + "-" + formDetails.ProvinceID.ToString() + formDetails.DistrictID.ToString() + "-" + count;

            #endregion
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            dbT.ExecuteTransCommand(@"INSERT INTO [dbo].[tbl_PC]
           ([PCId]
           ,[Name]
           ,[FName]
           ,[Gender]
           ,[DistrictID]
           ,[ProvinceID]
           ,[ContactNo]
           ,[UserId]
           ,[Date]
           ,[Village])
     VALUES
           ('" + idToReturn + "',N'" + formDetails.Name + "',N'" + formDetails.FatherName + "','" + formDetails.Gender + "'," + formDetails.DistrictID + "," + formDetails.ProvinceID + ",N'" + formDetails.ContactNo + "','" + usr.ProviderUserKey.ToString() + "',N'" + DateTime.Now.ToString() + "',N'" + formDetails.village + "')");

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
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<FormDetail> GetPcsLists(string Province)
    {
        List<FormDetail> lst = new List<FormDetail>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = @"SELECT        tbl_PC.PCId, tbl_PC.Name, tbl_PC.FName, tbl_PC.Gender, tbl_PC.ContactNo, tbl_PC.Village, OCM_Province.ProvinceEngName, OCM_District.DistrictEngName
FROM            OCM_District INNER JOIN
                         OCM_Province ON OCM_District.ProvinceID = OCM_Province.ProvinceID INNER JOIN
                         tbl_PC ON OCM_District.DistrictID = tbl_PC.DistrictID AND OCM_Province.ProvinceID = tbl_PC.ProvinceID
WHERE        (OCM_Province.ProvinceID = " + Province + ")";
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            FormDetail p = new FormDetail();
            p.Name = dr["Name"].ToString();
            p.FatherName = dr["FName"].ToString();
            p.GenderBL = dr["Gender"].ToString();
            p.Province = dr["ProvinceEngName"].ToString();
            p.District = dr["DistrictEngName"].ToString();
            p.ContactNo = dr["ContactNo"].ToString();
            p.village = dr["Village"].ToString();
            p.PCId = dr["PCId"].ToString();
            p.Edit = HttpContext.Current.User.IsInRole("Admin") == true ? true : false;
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static FormDetail GetPcsDetailByID(string PCID)
    {
        FormDetail p = new FormDetail();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = @"select * from tbl_PC where PCId = '" + PCID + "'";
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            p.Name = dr["Name"].ToString();
            p.FatherName = dr["FName"].ToString();
            p.GenderBL = dr["Gender"].ToString();
            p.Province = dr["ProvinceID"].ToString();
            p.District = dr["DistrictID"].ToString();
            p.ContactNo = dr["ContactNo"].ToString();
            p.village = dr["Village"].ToString();
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
                MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
                dbT.BeginTransaction();
                dbT.ExecuteTransCommand(@"UPDATE [dbo].[tbl_PC]
               SET [Name] =N'" + formDetails.Name + "'" +
                      ",[FName] =N'" + formDetails.FatherName + "'" +
                      ",[Gender] = '" + formDetails.Gender + "'" +
                      ",[DistrictID] = " + formDetails.DistrictID + "" +
                      ",[ProvinceID] = " + formDetails.ProvinceID + "" +
                      ",[ContactNo] =N'" + formDetails.ContactNo + "'" +
                      ",[Village] = N'" + formDetails.village + "'" +
                     " ,[UpdatedBy] = N'" + usr.ProviderUserKey.ToString() + "'" +
                      ",[UpdatedDate] = N'" + DateTime.Now.ToString() + "'" +
                " WHERE PCId='" + formDetails.PCId + "'");
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
    public class FormDetail
    {
        public string PCId { get; set; }
        public string Name { get; set; }
        public string FatherName { get; set; }
        public string Gender { get; set; }
        public string ProvinceID { get; set; }
        public string DistrictID { get; set; }
        public string GenderBL { set; get; }
        public string Province { get; set; }
        public string District { get; set; }
        public string ContactNo
        {
            get;
            set;
        }
        public string village { get; set; }
        public string Year { get; set; }
        public string Activity { get; set; }
        public string ExtensionWorker { get; set; }
        public bool Edit { get; set; } 
    }
    public class RoleNames{
        public string role { get; set; }
    }
    

}