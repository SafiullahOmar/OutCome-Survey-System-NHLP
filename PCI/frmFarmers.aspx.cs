using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OCM;
using System.Web.Services;
using System.Web.Script.Services;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;

public partial class PCI_frmExtensionW : System.Web.UI.Page
{
    OCM_DbGeneral db = new OCM_DbGeneral();
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
    public static List<EW> GetExtW(string ProvinceID)
    {
        List<EW> lst = new List<EW>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "select ExtWID,Name from FC_ExtensionWorkerInfo where ProvinceID=" + ProvinceID + " order by ProvinceID";
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
    public static void SaveFormDetail(FormDetail formDetails)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {
            dbT.BeginTransaction();
            #region GenerateCode
            string idToReturn = "";
            string count = dbT.ExecuteTranScaller("select count(ExtWId)+1 as cnt from FC_FarmerInfo where ExtWId='" + formDetails.ExtId + "'");
            idToReturn = "FRM" + "-" + formDetails.ProvinceID.ToString() + formDetails.DistrictID.ToString() + "-" + count;

            #endregion
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            dbT.ExecuteTransCommand(@"INSERT INTO [OCM].[dbo].[FC_FarmerInfo]
           ([Id]
           ,[Name]
           ,[FName]
           ,[Gender]
           ,[ContactNo]
           ,[UserId]
           ,[Date],ExtWId)
     VALUES
           ('" + idToReturn + "',N'" + formDetails.Name + "',N'" + formDetails.FatherName + "','" + formDetails.Gender + "',N'" + formDetails.ContactNo + "','" + usr.ProviderUserKey.ToString() + "',N'" + DateTime.Now.ToString() + "','" + formDetails.ExtId + "')");

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
    public static List<FormDetail> GetFarmersLists(string DistrictId)
    {
        List<FormDetail> lst = new List<FormDetail>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = @"SELECT        FC_FarmerInfo.Id, FC_FarmerInfo.Name, FC_FarmerInfo.FName, FC_FarmerInfo.Gender, OCM_District.DistrictEngName, OCM_Province.ProvinceEngName, FC_FarmerInfo.ContactNo, 
                         FC_ExtensionWorkerInfo.Name AS ExtWName
FROM            FC_ExtensionWorkerInfo INNER JOIN
                         FC_FarmerInfo ON FC_ExtensionWorkerInfo.ExtWID = FC_FarmerInfo.ExtWId INNER JOIN
                         OCM_Province ON FC_ExtensionWorkerInfo.ProvinceID = OCM_Province.ProvinceID INNER JOIN
                         OCM_District ON FC_ExtensionWorkerInfo.DistrictID = OCM_District.DistrictID where OCM_District.DistrictID=" + DistrictId + " ";
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
            p.ExtensionWName = dr["ExtWName"].ToString();
            p.FarmerId = dr["Id"].ToString();
            p.Edit = HttpContext.Current.User.IsInRole("Admin") == true ? true : false;
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static FormDetail GetLFarmerDetailByID(string Id)
    {
        FormDetail p = new FormDetail();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = @"SELECT        FC_FarmerInfo.Name, FC_FarmerInfo.FName, FC_FarmerInfo.Gender, FC_FarmerInfo.ContactNo, FC_FarmerInfo.ExtWId, FC_ExtensionWorkerInfo.DistrictID, FC_ExtensionWorkerInfo.ProvinceID
FROM            FC_FarmerInfo INNER JOIN
                         FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID where FC_FarmerInfo.Id = '" + Id + "'";
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            p.Name = dr["Name"].ToString();
            p.FatherName = dr["FName"].ToString();
            p.GenderBL = dr["Gender"].ToString();
            p.ProvinceID = dr["ProvinceID"].ToString();
            p.DistrictID = dr["DistrictID"].ToString();
            p.ContactNo = dr["ContactNo"].ToString();
            p.ExtId = dr["ExtWId"].ToString();
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
                dbT.ExecuteTransCommand(@"UPDATE [dbo].[FC_FarmerInfo]
                                   SET [Name] =N'" + formDetails.Name + "'" +
                                          ",[FName] = N'" + formDetails.FatherName + "'" +
                                          ",[Gender] = '" + formDetails.Gender + "'" +
                                          ",[ContactNo] = N'" + formDetails.ContactNo + "'" +
                                          ",[ExtWId] = '" + formDetails.ExtId + "'" +
                                          "where Id='" + formDetails.FarmerId + "'");
                dbT.EndTransaction();
            }
        }
        catch (Exception)
        {
            dbT.RollBackTransaction();
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
            lst.Add(new RoleNames()
            {
                role = dr["RoleName"].ToString()
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
        public string ExtId { get; set; }
        public string FarmerId { get; set; }
        public string ExtensionWName { get; set; }
        public bool Edit { get; set; }
    }
    public class RoleNames
    {
        public string role { get; set; }
    }
}