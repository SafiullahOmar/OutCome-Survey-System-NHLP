using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OCM;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

public partial class Admin_Default : System.Web.UI.Page
{
    OCM_DbGeneral db = new OCM_DbGeneral();
    protected void Page_Load(object sender, EventArgs e)
    {
        Title = "FCMIS : Create User";
        Page.ClientScript.RegisterOnSubmitStatement(this.GetType(), "val", "fnOnUpdateValidators();");
        // CreateUserWizard1. = "ایجاد کاربر";
        if (!IsPostBack)
        {
            fillDll();
        }
    }
    private void fillDll()
    {
        DropDownList ddlProvince = CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlProvince") as DropDownList;
        if (ddlProvince != null)
        {
            DataTable dt = db.SelectRecords(@"Select '-1' as ProvinceID,N'--Select--' as ProvinceEngName union SELECT [ProvinceID] ,[ProvinceEngName] FROM  [OCM_Province]");
            ddlProvince.DataSource = dt;
            ddlProvince.DataValueField = "ProvinceID";
            ddlProvince.DataTextField = "ProvinceEngName";
            ddlProvince.DataBind();
        }
    }
    [System.Web.Services.WebMethod]
    public static string CheckAvailability(string userName)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString);
        string returnval = string.Empty;
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(@"SELECT     aspnet_Users.UserId, aspnet_Users.UserName, aspnet_Applications.ApplicationName
FROM         aspnet_Applications INNER JOIN
                      aspnet_Users ON aspnet_Applications.ApplicationId = aspnet_Users.ApplicationId
WHERE     (aspnet_Applications.ApplicationName = N'OCM' and aspnet_Users.UserName=N'" + userName + "')", con);
            System.Data.DataTable dt = new System.Data.DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
                returnval = "true";
            else
                returnval = "false";
        }
        catch
        {
            returnval = "erorr";
        }
        return returnval;
    }
    [System.Web.Services.WebMethod]
    public static string CheckEmailAvailability(string email)
    {
        SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString);
        string returnval = string.Empty;
        try
        {
            SqlDataAdapter da = new SqlDataAdapter(@"SELECT * FROM [aspnet_Membership] where [Email]='" + email + "'", con);
            System.Data.DataTable dt = new System.Data.DataTable();
            da.Fill(dt);
            if (dt.Rows.Count > 0)
                returnval = "true";
            else
                returnval = "false";
        }
        catch
        {
            returnval = "erorr";
        }
        return returnval;
    }
    protected void ddlProvince_SelectedIndexChanged(object sender, EventArgs e)
    {

        DropDownList ddlDistrict = CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlDistrict") as DropDownList;
        DropDownList ddlProvince = CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlProvince") as DropDownList;
        if (ddlDistrict != null && ddlProvince != null)
        {
            DataTable dt = db.SelectRecords(@"Select '-1' as DistrictID,N'--Select--' as DistrictEngName union SELECT [DistrictID] ,[DistrictEngName] FROM [dbo].[OCM_District] where ProvinceID=" + ddlProvince.SelectedValue);
            ddlDistrict.DataSource = dt;
            ddlDistrict.DataValueField = "DistrictID";
            ddlDistrict.DataTextField = "DistrictEngName";
            ddlDistrict.DataBind();
        }
    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {

        ProfileCommon p = (ProfileCommon)ProfileCommon.Create(CreateUserWizard1.UserName);
        p.FullName = ((TextBox)(CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtFullName"))).Text;
        p.Age = ((TextBox)(CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtAge"))).Text;
        p.Designation = ((TextBox)(CreateUserWizardStep1.ContentTemplateContainer.FindControl("txtDesignation"))).Text;
        p.Province = ((DropDownList)(CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlProvince"))).SelectedValue;
        p.District = ((DropDownList)(CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlDistrict"))).SelectedValue;
        p.Save();

        MembershipUser usr = Membership.GetUser(CreateUserWizard1.UserName);
        string UserID = usr.ProviderUserKey.ToString();
        db.ExecuteQuery("Update aspnet_Users set ProvinceID=" + ((DropDownList)(CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlProvince"))).SelectedValue + ", DistrictID=" + ((DropDownList)(CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlDistrict"))).SelectedValue + " where UserId=N'" + UserID + "'");
    }
}