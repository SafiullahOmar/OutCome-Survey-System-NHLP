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

public partial class CIG_CIGMale : System.Web.UI.Page
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
        SqlParameter[] p=new SqlParameter[1];
        p[0]=new SqlParameter("@ActivityId",SqlDbType.Int){Value=1};
        ddlProvince.DataSource=new OCM_DbGeneral().ExecuteSelectStoreProcedure("SharedGetFruit",p,true);
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
    public static List<Farmer> GetFarmers(string ExtWId)
    {
        List<Farmer> lst = new List<Farmer>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "SharedGetFarmer";
        com.Parameters.AddWithValue("@ExtensionWorker", SqlDbType.NVarChar).Value = ExtWId;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Farmer Dr = new Farmer();
            Dr.FarmerId = dr["Id"].ToString();
            Dr.Name = dr["Name"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static bool SaveFormDetail(MicroNutrient formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            SqlParameter[] p = new SqlParameter[14];
            p[0]=new SqlParameter("@FarmerId",SqlDbType.NVarChar){Value=formDetail.FarmerId};
            p[1] = new SqlParameter("@ActivityId", SqlDbType.Int) { Value =9 };
            p[2]=new SqlParameter("@Year",SqlDbType.Int){Value=formDetail.Year};
            p[3]=new SqlParameter("@SeasonId",SqlDbType.Int){Value=formDetail.SeasonId};
            p[4] = new SqlParameter("@NoOfSpecies", SqlDbType.Float) { Value = formDetail.Nutrient };
            p[5] = new SqlParameter("@SpeciesUnit", SqlDbType.Int) { Value =5};
            p[6]=new SqlParameter("@Area",SqlDbType.Decimal){Value=formDetail.Area};
            p[7]=new SqlParameter("@Longtitude",SqlDbType.NVarChar){Value=formDetail.Longtitude};
            p[8]=new SqlParameter("@Latitude",SqlDbType.NVarChar){Value=formDetail.Latitude};
            p[9] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString() )};
            p[10] = new SqlParameter("@InsertionDate", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
            p[11] = new SqlParameter("@IsDeleted", SqlDbType.Bit) { Value =0 };
            p[12] = new SqlParameter("@AreaUnit", SqlDbType.Int) { Value =1 };
            p[13] = new SqlParameter("@exist", SqlDbType.Bit);
            p[13].Direction = ParameterDirection.Output;
            bool flag = Convert.ToBoolean(dbT.ExecuteTransStoreProcedureReturn("spPageMicroNutrientSave", p, true, "@exist"));
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
    public static List<Farmer> GetFarmerLists(string Id, string Year,string SeasonId)
    {
        List<Farmer> lst = new List<Farmer>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageMicroNutrientFarmerList4GridView";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@ExtWId", SqlDbType.VarChar).Value = Id;
        com.Parameters.AddWithValue("@SeasonId", SqlDbType.Int).Value = SeasonId;
        com.Parameters.AddWithValue("@ActivityId", SqlDbType.Int).Value = 9;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Farmer p = new Farmer();
            p.Name = dr["Name"].ToString();
            p.FName = dr["FName"].ToString();
            p.Area = dr["Area"].ToString();
            p.ExtWId = dr["ExtWID"].ToString();
            p.FarmerId = dr["FarmerId"].ToString();
            p.SeasonId = dr["SeasonId"].ToString();
            p.Year = dr["Year"].ToString();
            p.FarmerActivityId = dr["FarmerActivityId"].ToString();
            p.Edit = HttpContext.Current.User.IsInRole("Admin") == true ? true : false;
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static MicroNutrient EditFarmerDetail(string FormerId, string ExtWId, string Year, string SeasonId, string ActivityId, string FarmerActivityId)
    {
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageMicroNutrientGetFarmerDetailToUpdate";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@ExtWId", SqlDbType.NVarChar).Value = ExtWId;
        com.Parameters.AddWithValue("@FarmerId", SqlDbType.NVarChar).Value = FormerId;
        com.Parameters.AddWithValue("@SeasonId", SqlDbType.Int).Value = SeasonId;
        com.Parameters.AddWithValue("@ActivityId", SqlDbType.Int).Value = 9;
        com.Parameters.AddWithValue("@FarmerActivityId", SqlDbType.VarChar).Value = FarmerActivityId;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();

        MicroNutrient p = new MicroNutrient();
        while (dr.Read())
        {
            p.Area = dr["Area"].ToString();
            p.DistrictId = dr["DistrictID"].ToString();
            p.ExtId = dr["ExtWId"].ToString();
            p.FarmerId = dr["FarmerId"].ToString();
            p.Latitude = dr["Latitude"].ToString();
            p.Longtitude = dr["Longtitude"].ToString();
            p.Nutrient = dr["NoOfSpecies"].ToString();
            p.ProvinceId = dr["ProvinceID"].ToString();
            p.SeasonId = dr["SeasonId"].ToString();
            p.Year = dr["Year"].ToString();

        }

        dr.Close();
        con.Close();
        return p;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateDetail(MicroNutrient formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            SqlParameter[] p = new SqlParameter[13];
            p[0] = new SqlParameter("@FarmerId", SqlDbType.NVarChar) { Value = formDetail.FarmerId };
            p[1] = new SqlParameter("@ActivityId", SqlDbType.Int) { Value = 9 };
            p[2] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetail.Year };
            p[3] = new SqlParameter("@SeasonId", SqlDbType.Int) { Value = formDetail.SeasonId };
            p[4] = new SqlParameter("@NoOfSpecies", SqlDbType.Float) { Value = formDetail.Nutrient };
            p[5] = new SqlParameter("@SpeciesUnit", SqlDbType.Int) { Value = 5 };
            p[6] = new SqlParameter("@Area", SqlDbType.Decimal) { Value = formDetail.Area };
            p[7] = new SqlParameter("@Longtitude", SqlDbType.NVarChar) { Value = formDetail.Longtitude };
            p[8] = new SqlParameter("@Latitude", SqlDbType.NVarChar) { Value = formDetail.Latitude };
            p[9] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
            p[10] = new SqlParameter("@UpdationDate", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
            p[11] = new SqlParameter("@AreaUnit", SqlDbType.Int) { Value = 1 };
            p[12] = new SqlParameter("@FarmerActivityId", SqlDbType.VarChar) { Value =formDetail.FarmerActivityId  };
            dbT.ExecuteTransStoreProcedure("spPageMicroNutrientUpdate", p, true);
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
    public class Farmer
    {
        public string Name { get; set; }
        public string FName { get; set; }       
        public string ExtensionWorker { get; set; }
        public string FarmerId { get; set; }
        public string ExtWId { get; set; }
        public string FarmerActivityId { get; set; }
        public string Year { get; set; }
        public string SeasonId { get; set; }
        public string Area { get; set; }
        public bool Edit { get; set; }
    }
    public class MicroNutrient {
        public string ActivityId { get; set; }
        public string Year { get; set; }
        public string SeasonId { get; set; }
        public string ProvinceId { get; set; }
        public string ProvinceName { get; set; }
        public string DistrictId { get; set; }
        public string DistrictName { get; set; }
        public string ExtensionWName { get; set; }
        public string ExtId { get; set; }
        public string FarmerActivityId { get; set; }
        public string FarmerName { get; set; }
        public string FarmerId { get; set; }
        public string Nutrient { get; set; }
        public string Area { get; set; }
        public string Longtitude { get; set; }
        public string Latitude { get; set; }
        public bool Edit { get; set; }
    }
}