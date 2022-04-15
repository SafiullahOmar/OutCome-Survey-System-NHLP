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
    public static bool SaveFormDetail(Pistachio formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            SqlParameter[] p = new SqlParameter[27];
            p[0]=new SqlParameter("@FarmerId",SqlDbType.NVarChar){Value=formDetail.FarmerId};
            p[1] = new SqlParameter("@ActivityId", SqlDbType.Int) { Value =10 };
            p[2]=new SqlParameter("@Year",SqlDbType.Int){Value=formDetail.Year};

            p[3]=new SqlParameter("@SeasonId",SqlDbType.Int){Value=formDetail.SeasonId};
            p[4] = new SqlParameter("@SeedsArea", SqlDbType.Decimal) { Value = formDetail.SeedsArea };
            p[5] = new SqlParameter("@SapplesArea", SqlDbType.Decimal) { Value = formDetail.SapplesArea };

            p[6] = new SqlParameter("@SeedsNoOfSpecies", SqlDbType.Float) { Value =formDetail.Seeds};
            p[7] = new SqlParameter("@SeedsSpeciesUnit", SqlDbType.Int) { Value =2};

            p[8] = new SqlParameter("@SapplesNoOfSpecies", SqlDbType.Float) { Value =formDetail.Sapples};
            p[9] = new SqlParameter("@SapplesSpeciesUnit", SqlDbType.Int) { Value =4};

            p[10]=new SqlParameter("@Longtitude",SqlDbType.NVarChar){Value=formDetail.Longtitude};
            p[11]=new SqlParameter("@Latitude",SqlDbType.NVarChar){Value=formDetail.Latitude};
            p[12] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString() )};
            p[13] = new SqlParameter("@InsertionDate", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
            p[14] = new SqlParameter("@IsDeleted", SqlDbType.Bit) { Value =0 };
            p[15] = new SqlParameter("@AreaUnit", SqlDbType.Int) { Value =1 };

            p[16] = new SqlParameter("@checkHing", SqlDbType.Bit) { Value =formDetail.checkHing};
            p[17] = new SqlParameter("@checkSeed", SqlDbType.Bit) { Value =formDetail.checkSeeds};
            p[18] = new SqlParameter("@checkSapples", SqlDbType.Bit) { Value =formDetail.checkSapples};
            p[19] = new SqlParameter("@checkWaterTank", SqlDbType.Bit) { Value =formDetail.checkWaterTank};
            p[20] = new SqlParameter("@checkFence", SqlDbType.Bit) { Value =formDetail.checkFence};

            p[21] = new SqlParameter("@interCropId", SqlDbType.Int) { Value =4};
             p[22] = new SqlParameter("@CropQuantity", SqlDbType.Float) { Value =formDetail.Hing};
             p[23] = new SqlParameter("@CropArea", SqlDbType.Float) { Value =formDetail.HingArea};
             p[24] = new SqlParameter("@NoOfTank", SqlDbType.Int) { Value =formDetail.WaterTank};
             p[25] = new SqlParameter("@FenceM", SqlDbType.Float) { Value =formDetail.Fence};

            p[26] = new SqlParameter("@exist", SqlDbType.Bit);
            p[26].Direction = ParameterDirection.Output;
            bool flag = Convert.ToBoolean(dbT.ExecuteTransStoreProcedureReturn("spPagePistachioSave", p, true, "@exist"));
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
    public static List<Farmer> GetFarmerLists(string Id, string Year, string SeasonId)
    {
        List<Farmer> lst = new List<Farmer>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPagePistachioFarmerList4GridView";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@ExtWId", SqlDbType.VarChar).Value = Id;
        com.Parameters.AddWithValue("@SeasonId", SqlDbType.Int).Value = SeasonId;
        com.Parameters.AddWithValue("@ActivityId", SqlDbType.Int).Value = 10;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Farmer p = new Farmer();
            p.Name = dr["Name"].ToString();
            p.FName = dr["FName"].ToString();
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
    public static Pistachio EditFarmerDetail(string FormerId, string ExtWId, string Year, string SeasonId, string ActivityId, string FarmerActivityId)
    {
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPagePistachioGetFarmerDetailToUpdate";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@ExtWId", SqlDbType.NVarChar).Value = ExtWId;
        com.Parameters.AddWithValue("@FarmerId", SqlDbType.NVarChar).Value = FormerId;
        com.Parameters.AddWithValue("@SeasonId", SqlDbType.Int).Value = SeasonId;
        com.Parameters.AddWithValue("@ActivityId", SqlDbType.Int).Value = 10;
        com.Parameters.AddWithValue("@FarmerActivityId", SqlDbType.VarChar).Value = FarmerActivityId;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();

        Pistachio p = new Pistachio();
        int row = 1;
        while (dr.Read())
        {
            if (row == 1)
            {
                p.DistrictId = dr["DistrictID"].ToString();
                p.ExtId = dr["ExtWId"].ToString();
                p.FarmerId = dr["FarmerId"].ToString();
                p.Latitude = dr["Latitude"].ToString();
                p.Longtitude = dr["Longtitude"].ToString();
                p.ProvinceId = dr["ProvinceID"].ToString();
                p.SeasonId = dr["SeasonId"].ToString();
                p.Year = dr["Year"].ToString();
                if (dr["NoOfTank"].ToString() != "")
                {
                    p.WaterTank = dr["NoOfTank"].ToString();
                    p.checkWaterTank = true;
                }
                if (dr["CropQuantity"].ToString() != "")
                {
                    p.HingArea = dr["CropArea"].ToString();
                    p.Hing = dr["CropQuantity"].ToString();
                    p.checkHing = true;
                }
                if (dr["FenceQuantity"].ToString() != "")
                {
                    p.Fence = dr["FenceQuantity"].ToString();
                    p.checkFence = true;
                }
            }
            if (dr["SpeciesUnit"].ToString() == "2") {
                p.Seeds = dr["NoOfSpecies"].ToString();
                p.SeedsArea = dr["Area"].ToString();
                p.checkSeeds = true;
            }
            if (dr["SpeciesUnit"].ToString() == "4")
            {
                p.Sapples = dr["NoOfSpecies"].ToString();
                p.SapplesArea = dr["Area"].ToString();
                p.checkSapples = true;
            }
        }

        dr.Close();
        con.Close();
        return p;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateDetail(Pistachio formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            SqlParameter[] p = new SqlParameter[26];
            p[0] = new SqlParameter("@FarmerId", SqlDbType.NVarChar) { Value = formDetail.FarmerId };
            p[1] = new SqlParameter("@ActivityId", SqlDbType.Int) { Value = 10 };
            p[2] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetail.Year };

            p[3] = new SqlParameter("@SeasonId", SqlDbType.Int) { Value = formDetail.SeasonId };
            p[4] = new SqlParameter("@SeedsArea", SqlDbType.Decimal) { Value = formDetail.SeedsArea };
            p[5] = new SqlParameter("@SapplesArea", SqlDbType.Decimal) { Value = formDetail.SapplesArea };

            p[6] = new SqlParameter("@SeedsNoOfSpecies", SqlDbType.Float) { Value = formDetail.Seeds };
            p[7] = new SqlParameter("@SeedsSpeciesUnit", SqlDbType.Int) { Value = 2 };

            p[8] = new SqlParameter("@SapplesNoOfSpecies", SqlDbType.Float) { Value = formDetail.Sapples };
            p[9] = new SqlParameter("@SapplesSpeciesUnit", SqlDbType.Int) { Value = 4 };

            p[10] = new SqlParameter("@Longtitude", SqlDbType.NVarChar) { Value = formDetail.Longtitude };
            p[11] = new SqlParameter("@Latitude", SqlDbType.NVarChar) { Value = formDetail.Latitude };
            p[12] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
            p[13] = new SqlParameter("@AreaUnit", SqlDbType.Int) { Value = 1 };

            p[14] = new SqlParameter("@checkHing", SqlDbType.Bit) { Value = formDetail.checkHing };
            p[15] = new SqlParameter("@checkSeed", SqlDbType.Bit) { Value = formDetail.checkSeeds };
            p[16] = new SqlParameter("@checkSapples", SqlDbType.Bit) { Value = formDetail.checkSapples };
            p[17] = new SqlParameter("@checkWaterTank", SqlDbType.Bit) { Value = formDetail.checkWaterTank };
            p[18] = new SqlParameter("@checkFence", SqlDbType.Bit) { Value = formDetail.checkFence };

            p[19] = new SqlParameter("@interCropId", SqlDbType.Int) { Value = 4 };
            p[20] = new SqlParameter("@CropQuantity", SqlDbType.Float) { Value = formDetail.Hing };
            p[21] = new SqlParameter("@CropArea", SqlDbType.Float) { Value = formDetail.HingArea };
            p[22] = new SqlParameter("@NoOfTank", SqlDbType.Int) { Value = formDetail.WaterTank };
            p[23] = new SqlParameter("@FenceM", SqlDbType.Float) { Value = formDetail.Fence };
            p[24] = new SqlParameter("@UpdationDate", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };            
            p[25] = new SqlParameter("@FarmerActivityId", SqlDbType.VarChar) { Value = formDetail.FarmerActivityId };
            dbT.ExecuteTransStoreProcedure("spPagePistachioUpdate", p, true);
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
        public bool Edit { get; set; }
    }
    public class Pistachio
    {
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

        public string Sapples { get; set; }
        public string SapplesArea { get; set; }
        public string Seeds { get; set; }
        public string SeedsArea { get; set; }
        public string Hing { get; set; }
        public string HingArea { get; set; }
        public string WaterTank { get; set; }
        public string Fence { get; set; }

        public string Longtitude { get; set; }
        public string Latitude { get; set; }
        public bool checkWaterTank{get;set;}
        public bool checkSeeds { get; set; }
        public bool checkSapples { get; set; }
        public bool checkFence { get; set; }
        public bool checkHing { get; set; }
        public bool Edit { get; set; }
    }
}