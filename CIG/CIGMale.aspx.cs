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
    public static List<Fruit> GetFruit()
    {
        List<Fruit> lst = new List<Fruit>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "SharedGetFruit";
        com.Parameters.AddWithValue("@ActivityId", SqlDbType.Int).Value = 1;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Fruit Dr = new Fruit();
            Dr.FruitId = dr["FruitId"].ToString();
            Dr.FName = dr["Fruit"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static bool SaveFormDetail(MaleCIG formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
             bool flag=false;
            if (formDetail.CIGList.Count > 0)
            {
                foreach (Garden G in formDetail.CIGList)
                {
                    SqlParameter[] p = new SqlParameter[18];
                    p[0] = new SqlParameter("@FarmerId", SqlDbType.VarChar) { Value = formDetail.FarmerId };
                    p[1] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetail.Year };
                    p[2] = new SqlParameter("@SeasonId", SqlDbType.Int) { Value = formDetail.SeasonId };
                    p[3] = new SqlParameter("@FruitToolsId", SqlDbType.Int) { Value = G.FruitId };
                    p[4] = new SqlParameter("@NoOfTrees", SqlDbType.Int) { Value = G.NoOfTree };
                    p[5] = new SqlParameter("@Area", SqlDbType.Decimal) { Value = G.Area };
                    p[6] = new SqlParameter("@AreaByProject", SqlDbType.Float) { Value = G.EstablishedByProject };
                    p[7] = new SqlParameter("@AreaByFarmer", SqlDbType.Float) { Value = G.EstablishedByFarmer };
                    p[8] = new SqlParameter("@Rehabilited", SqlDbType.Float) { Value = G.Rehabilited };
                    p[9] = new SqlParameter("@Longtitude", SqlDbType.NVarChar) { Value = G.Longtitude };
                    p[10] = new SqlParameter("@Latitude", SqlDbType.NVarChar) { Value = G.Latitude };
                    p[11] = new SqlParameter("@Position", SqlDbType.Int) { Value = formDetail.GroupPositionId };
                    p[12] = new SqlParameter("@Membership", SqlDbType.Int) { Value = formDetail.GroupMembershipId };
                    p[13] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                    p[14] = new SqlParameter("@InsertedDate", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
                    p[15] = new SqlParameter("@AreaUnit", SqlDbType.Int) { Value = 1 };
                    p[16] = new SqlParameter("@CIGType", SqlDbType.Int) { Value =1};
                    p[17] = new SqlParameter("@exist", SqlDbType.Bit);
                    p[17].Direction = ParameterDirection.Output;
                    flag= Convert.ToBoolean(dbT.ExecuteTransStoreProcedureReturn("SpPageMaleCIGSave", p, true, "@exist"));
                    if (flag == true) {
                        dbT.RollBackTransaction();
                        return flag;
                    }
                }
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
    public static List<Farmer> GetFarmerLists(string Id, string Year,string SeasonId)
    {
        List<Farmer> lst = new List<Farmer>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageCIGMaleGetFarmerList4GridView";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@ExtWId", SqlDbType.NVarChar).Value = Id;
        com.Parameters.AddWithValue("@SeasonId", SqlDbType.Int).Value = SeasonId;
        com.Parameters.AddWithValue("@CIGType", SqlDbType.Int).Value = 1;
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

            p.Edit = HttpContext.Current.User.IsInRole("Admin") == true ? true : false;
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static MaleCIG EditFarmerDetail(string FormerId, string ExtWId, string Year,string SeasonId)
    {
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageCIGMaleGetFarmerDetailToUpdate";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@ExtWId", SqlDbType.VarChar).Value = ExtWId;
        com.Parameters.AddWithValue("@FarmerId", SqlDbType.VarChar).Value =FormerId;
        com.Parameters.AddWithValue("@SeasonId", SqlDbType.Int).Value = SeasonId;
        com.Parameters.AddWithValue("@CIGType", SqlDbType.Int).Value = 1;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        MaleCIG M = new MaleCIG();
        List<Garden> lst = new List<Garden>();
        int c = 1;
        while (dr.Read())
        {
            Garden p = new Garden();
            p.Area = dr["Area"].ToString();         
            p.EstablishedByFarmer = dr["AreaByFarmer"].ToString();
            p.EstablishedByProject = dr["AreaByProject"].ToString();            
            p.FruitId = dr["FruitToolsId"].ToString();            
            p.Latitude = dr["Latitude"].ToString();
            p.Longtitude = dr["Longtitude"].ToString();
            p.NoOfTree = dr["NoOfTrees"].ToString();            
            p.Rehabilited = dr["Rehabilited"].ToString();
            p.Fruit = dr["Fruit"].ToString();
            lst.Add(p);
            if (c == 1) {
                M.SeasonId = dr["SeasonId"].ToString();
                M.Year = dr["Year"].ToString();
                M.ProvinceId = dr["ProvinceID"].ToString();
                M.GroupMembershipId = dr["MembershipId"].ToString();
                M.GroupPositionId = dr["PositionId"].ToString();
                M.ExtId = dr["ExtWId"].ToString();
                M.FarmerId = dr["FarmerId"].ToString();
                M.DistrictId = dr["DistrictID"].ToString();
            }
        }
        M.CIGList = lst;
        dr.Close();
        con.Close();
        return M;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateDetail(MaleCIG formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            if (formDetail.CIGList.Count > 0)
            {
                foreach (Garden G in formDetail.CIGList)
                {
                    SqlParameter[] p = new SqlParameter[17];
                    p[0] = new SqlParameter("@FarmerId", SqlDbType.VarChar) { Value = formDetail.FarmerId };
                    p[1] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetail.Year };
                    p[2] = new SqlParameter("@SeasonId", SqlDbType.Int) { Value = formDetail.SeasonId };
                    p[3] = new SqlParameter("@ExtWId", SqlDbType.VarChar) { Value = formDetail.ExtId };
                    p[4] = new SqlParameter("@FruitToolsId", SqlDbType.Int) { Value = G.FruitId };
                    p[5] = new SqlParameter("@NoOfTrees", SqlDbType.Int) { Value = G.NoOfTree };
                    p[6] = new SqlParameter("@Area", SqlDbType.Decimal) { Value = G.Area };
                    p[7] = new SqlParameter("@AreaByFarmer", SqlDbType.Float) { Value = G.EstablishedByFarmer };
                    p[8] = new SqlParameter("@AreaByProject", SqlDbType.Float) { Value = G.EstablishedByProject };
                    p[9] = new SqlParameter("@Rehabilited", SqlDbType.Float) { Value = G.Rehabilited };
                    p[10] = new SqlParameter("@Longtitude", SqlDbType.NVarChar) { Value = G.Longtitude };
                    p[11] = new SqlParameter("@Latitude", SqlDbType.NVarChar) { Value = G.Latitude };
                    p[12] = new SqlParameter("@Position", SqlDbType.Int) { Value = formDetail.GroupPositionId };
                    p[13] = new SqlParameter("@Membership", SqlDbType.Int) { Value = formDetail.GroupMembershipId };
                    p[14] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                    p[15] = new SqlParameter("@UpdationDate", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
                    p[16] = new SqlParameter("@AreaUnit", SqlDbType.Int) { Value = 1 };
                    dbT.ExecuteTransStoreProcedure("spPageMaleCIGUpdate", p, true);
                }
            }
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
        public string Year { get; set; }
        public string SeasonId { get; set; }
        public string Area { get; set; }
        public bool Edit { get; set; }
    }
    public class Fruit
    {
        public string FruitId { get; set; }
        public string FName { get; set; }
    }
    public class MaleCIG
    {
        public string Year { get; set; }
        public string SeasonId { get; set; }
        public string ProvinceId { get; set; }
        public string ProvinceName { get; set; }
        public string DistrictId { get; set; }
        public string DistrictName { get; set; }
        public string ExtensionWName { get; set; }
        public string ExtId { get; set; }
        public string FarmerName { get; set; }
        public string FarmerId { get; set; }       
        public string GroupPositionId { get; set; }
        public string GroupMembershipId { get; set; }
        public List<Garden> CIGList { get; set; }
        public bool Edit { get; set; }
    }
    public class Garden {

        public string FruitId { get; set; }
        public string Fruit { get; set; }
        public string NoOfTree { get; set; }
        public string Area { get; set; }
        public string EstablishedByFarmer { get; set; }
        public string EstablishedByProject { get; set; }
        public string Rehabilited { get; set; }
        public string Longtitude { get; set; }
        public string Latitude { get; set; }
    }

}