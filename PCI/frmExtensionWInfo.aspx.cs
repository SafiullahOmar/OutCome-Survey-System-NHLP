using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OCM;
using System.Web.Services;
using System.Data.SqlClient;
using System.Web.Script.Services;
using System.Web.Security;
using System.Data;
public partial class PCI_frmExtensionWInfo : System.Web.UI.Page
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

        ddlActivity.DataSource = db.SelectRecords(@"select ActivityId,Activity from tbl_Activity");
        ddlActivity.DataTextField = "Activity";
        ddlActivity.DataValueField = "ActivityId";
        ddlActivity.DataBind();
        ddlActivity.Items.Insert(0, new ListItem("--Select--", "-1"));

        for (int i = 2012; i <= 2017; i++)
        {
            ddlYear.Items.Add(new System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString()));
        }
        ddlYear.Items.Insert(0, new ListItem("--Select--", "-1"));
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
    public static List<PC> GetPC(string ProvinceID)
    {
        List<PC> lst = new List<PC>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "select PCId,Name from tbl_PC where ProvinceID=" + ProvinceID + " order by ProvinceID";
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            PC Dr = new PC();
            Dr.PCId = dr["PCId"].ToString();
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
            string count = dbT.ExecuteTranScaller("select count(ProvinceID)+1 as cnt from Tbl_LeadFormerWorker where ProvinceID=" + formDetails.ProvinceID + "");
            idToReturn = "Ext" + "-" + formDetails.ProvinceID + formDetails.DistrictID + "-" + count;

            #endregion


            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            dbT.ExecuteTransCommand(@"INSERT INTO [OCM].[dbo].[Tbl_LeadFormerWorker]
           ([ExtWID]
           ,[Name]
           ,[FName]
           ,[Gender]
           ,[DistrictID]
           ,[ProvinceID]
           ,[ContactNo]
           ,[UserId]
           ,[Date],Village,ActivityId,ExtWorkerName,Year,PCId,Percentage)
     VALUES
           ('" + idToReturn + "',N'" + formDetails.Name + "',N'" + formDetails.FatherName + "','" + formDetails.Gender + "'," + formDetails.DistrictID + "," + formDetails.ProvinceID + ",N'" + formDetails.ContactNo + "','" + usr.ProviderUserKey.ToString() + "',N'" + DateTime.Now.ToString() + "',N'" + formDetails.village + "'," + formDetails.ActivityId + ",N'" + formDetails.ExtensionWorker + "'," + formDetails.Year + ",'" + formDetails.PCId + "',"+formDetails.Percentage+")");

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
    public static List<FormDetail> GetExtensionWLists(string Province)
    {
        List<FormDetail> lst = new List<FormDetail>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = @"SELECT        Tbl_LeadFormerWorker.Name, Tbl_LeadFormerWorker.FName, Tbl_LeadFormerWorker.Gender, OCM_Province.ProvinceEngName, OCM_District.DistrictEngName, Tbl_LeadFormerWorker.ContactNo, 
                         Tbl_LeadFormerWorker.Village,Tbl_LeadFormerWorker.Percentage, Tbl_LeadFormerWorker.ExtWorkerName, Tbl_LeadFormerWorker.Year, tbl_PC.Name AS PCName, Tbl_LeadFormerWorker.ExtWID
FROM            Tbl_LeadFormerWorker INNER JOIN
                         OCM_District ON Tbl_LeadFormerWorker.DistrictID = OCM_District.DistrictID INNER JOIN
                         OCM_Province ON Tbl_LeadFormerWorker.ProvinceID = OCM_Province.ProvinceID INNER JOIN
                         tbl_PC ON Tbl_LeadFormerWorker.PCId = tbl_PC.PCId where OCM_Province.ProvinceID=" + Province + " ";
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
            p.ExtensionWorker = dr["ExtWorkerName"].ToString();
            p.village = dr["Village"].ToString();
            p.Year = dr["Year"].ToString();
            p.PCName = dr["PCName"].ToString();
            p.LeadFormerId = dr["ExtWID"].ToString();
            p.Percentage = dr["Percentage"].ToString();
            p.Edit = HttpContext.Current.User.IsInRole("Admin") == true ? true : false;
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static FormDetail GetLFarmerDetailByID(string LeadFormerID)
    {
        FormDetail p = new FormDetail();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = @"select * from Tbl_LeadFormerWorker where ExtWID = '" + LeadFormerID + "'";
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
            p.village = dr["Village"].ToString();
            p.ActivityId = dr["ActivityId"].ToString();
            p.ExtensionWorker = dr["ExtWorkerName"].ToString();
            p.Year = dr["Year"].ToString();
            p.PCId = dr["PCId"].ToString();
            p.Percentage = dr["Percentage"].ToString();
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
                dbT.ExecuteTransCommand(@"UPDATE [dbo].[Tbl_LeadFormerWorker]
                                   SET [Name] =N'" + formDetails.Name + "'" +
                                          ",[FName] = N'" + formDetails.FatherName + "'" +
                                          ",[Gender] = '" + formDetails.Gender + "'" +
                                          ",[DistrictID] = " + formDetails.DistrictID + "" +
                                          ",[ProvinceID] = " + formDetails.ProvinceID + "" +
                                          ",[ContactNo] = N'" + formDetails.ContactNo + "'" +
                                          ",[Village] = N'" + formDetails.village + "'" +
                                          ",[ActivityId] = " + formDetails.ActivityId + "" +
                                          ",[ExtWorkerName] = N'" + formDetails.ExtensionWorker + "'" +
                                         " ,[Year] = " + formDetails.Year + "" +
                                          ",[PCId] = '" + formDetails.PCId + "'" +
                                          ",[Percentage] = '" + formDetails.Percentage + "'" +
                                          "where ExtWID='" + formDetails.LeadFormerId + "'");
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
    public class PC
    {
        public string PCId { get; set; }
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
        public string village { get; set; }
        public string Year { get; set; }
        public string ActivityId { get; set; }
        public string ExtensionWorker { get; set; }
        public string PCId { get; set; }
        public string PCName { get; set; }
        public string LeadFormerId { get; set; }
        public string Percentage { get; set; }
        public bool Edit { get; set; }
    }
    public class RoleNames
    {
        public string role { get; set; }
    }
}