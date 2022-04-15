﻿using System;
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
    public static List<Fruit> GetFruit()
    {
        List<Fruit> lst = new List<Fruit>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandType = CommandType.StoredProcedure;
        com.CommandText = "SharedGetFruit";
        com.Parameters.AddWithValue("@ActivityId", SqlDbType.Int).Value = 11;
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
    public static bool SaveFormDetail(KitchenGarden formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            bool flag = false;
            if (formDetail.CropList.Count > 0)
            {
                foreach (Crop G in formDetail.CropList)
                {
                    SqlParameter[] p = new SqlParameter[15];
                    p[0] = new SqlParameter("@FarmerId", SqlDbType.VarChar) { Value = formDetail.FarmerId };
                    p[1] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetail.Year };
                    p[2] = new SqlParameter("@SeasonId", SqlDbType.Int) { Value = formDetail.SeasonId };
                    p[3] = new SqlParameter("@ActivityId", SqlDbType.Float) { Value = 11 };
                    p[4] = new SqlParameter("@FruitCropId", SqlDbType.Int) { Value = G.FruitId };
                    p[5] = new SqlParameter("@NoOfSpecies", SqlDbType.Int) { Value = G.Seeds };
                    p[6] = new SqlParameter("@SpeciesUnit", SqlDbType.Float) { Value = 2 };
                    p[7] = new SqlParameter("@Area", SqlDbType.Decimal) { Value = G.Area };
                    p[8] = new SqlParameter("@AreaUnit", SqlDbType.Float) { Value = 2 };
                    p[9] = new SqlParameter("@Longtitude", SqlDbType.NVarChar) { Value = formDetail.Longtitude };
                    p[10] = new SqlParameter("@Latitude", SqlDbType.NVarChar) { Value = formDetail.Latitude };
                    p[11] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                    p[12] = new SqlParameter("@InsertionDate", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
                    p[13] = new SqlParameter("@IsDeleted", SqlDbType.Int) { Value = 0 };
                    p[14] = new SqlParameter("@exist", SqlDbType.Bit);
                    p[14].Direction = ParameterDirection.Output;
                    flag = Convert.ToBoolean(dbT.ExecuteTransStoreProcedureReturn("spPageKGSave", p, true, "@exist"));
                    if (flag == true)
                    {
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
    public static List<Farmer> GetFarmerLists(string Id, string Year, string SeasonId)
    {
        List<Farmer> lst = new List<Farmer>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageKGFarmerList4GridView";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@ExtWId", SqlDbType.NVarChar).Value = Id;
        com.Parameters.AddWithValue("@SeasonId", SqlDbType.Int).Value = SeasonId;
        com.Parameters.AddWithValue("@ActivityId", SqlDbType.Int).Value = 11;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Farmer p = new Farmer();
            p.Name = dr["Name"].ToString();
            p.FName = dr["FName"].ToString();
            p.TArea = dr["Area"].ToString();
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
    public static KitchenGarden EditFarmerDetail(string FormerId, string ExtWId, string Year, string SeasonId, string FarmerActivityId)
    {
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageKGGetFarmerDetailToUpdate";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@ExtWId", SqlDbType.VarChar).Value = ExtWId;
        com.Parameters.AddWithValue("@FarmerId", SqlDbType.VarChar).Value = FormerId;
        com.Parameters.AddWithValue("@SeasonId", SqlDbType.Int).Value = SeasonId;
        com.Parameters.AddWithValue("@ActivityId", SqlDbType.Int).Value = 11;
        com.Parameters.AddWithValue("@FarmerActivityId", SqlDbType.VarChar).Value = FarmerActivityId;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        KitchenGarden K = new KitchenGarden();
        List<Crop> lst = new List<Crop>();
        int c = 1;
        while (dr.Read())
        {
            Crop p = new Crop();
            p.Area = dr["Area"].ToString();
            p.Seeds = dr["NoOfSpecies"].ToString();
            p.Fruit = dr["Fruit"].ToString();
            p.FruitId = dr["FruitCropId"].ToString();
            lst.Add(p);
            if (c == 1)
            {
                K.SeasonId = dr["SeasonId"].ToString();
                K.Year = dr["Year"].ToString();
                K.ProvinceId = dr["ProvinceID"].ToString();
                K.Latitude = dr["Latitude"].ToString();
                K.Longtitude = dr["Longtitude"].ToString();
                K.ExtId = dr["ExtWId"].ToString();
                K.FarmerId = dr["FarmerId"].ToString();
                K.DistrictId = dr["DistrictID"].ToString();
            }
        }
        K.CropList = lst;
        dr.Close();
        con.Close();
        return K;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateDetail(KitchenGarden formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            SqlParameter[] c = new SqlParameter[5];
            c[0] = new SqlParameter("@FarmerId", SqlDbType.VarChar) { Value = formDetail.FarmerId };
            c[1] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetail.Year };
            c[2] = new SqlParameter("@SeasonId", SqlDbType.Int) { Value = formDetail.SeasonId };
            c[3] = new SqlParameter("@ActivityId", SqlDbType.Float) { Value = 11 };
            c[4] = new SqlParameter("@FarmerActivityId", SqlDbType.VarChar) { Value = formDetail.FarmerActivityId };
            dbT.ExecuteTransStoreProcedure("spSetFalseNonContrActivityDetails", c, true);
            if (formDetail.CropList.Count > 0)
            {
                foreach (Crop G in formDetail.CropList)
                {
                    SqlParameter[] p = new SqlParameter[14];
                    p[0] = new SqlParameter("@FarmerId", SqlDbType.VarChar) { Value = formDetail.FarmerId };
                    p[1] = new SqlParameter("@Year", SqlDbType.Int) { Value = formDetail.Year };
                    p[2] = new SqlParameter("@SeasonId", SqlDbType.Int) { Value = formDetail.SeasonId };
                    p[3] = new SqlParameter("@ActivityId", SqlDbType.Float) { Value = 11 };
                    p[4] = new SqlParameter("@FruitCropId", SqlDbType.Int) { Value = G.FruitId };
                    p[5] = new SqlParameter("@NoOfSpecies", SqlDbType.Int) { Value = G.Seeds };
                    p[6] = new SqlParameter("@SpeciesUnit", SqlDbType.Float) { Value = 2 };
                    p[7] = new SqlParameter("@Area", SqlDbType.Decimal) { Value = G.Area };
                    p[8] = new SqlParameter("@AreaUnit", SqlDbType.Float) { Value = 2 };
                    p[9] = new SqlParameter("@Longtitude", SqlDbType.NVarChar) { Value = formDetail.Longtitude };
                    p[10] = new SqlParameter("@Latitude", SqlDbType.NVarChar) { Value = formDetail.Latitude };
                    p[11] = new SqlParameter("@UserId", SqlDbType.UniqueIdentifier) { Value = new System.Data.SqlTypes.SqlGuid(usr.ProviderUserKey.ToString()) };
                    p[12] = new SqlParameter("@UpdationDate", SqlDbType.NVarChar) { Value = DateTime.Now.ToString() };
                    p[13] = new SqlParameter("@FarmerActivityId", SqlDbType.VarChar) { Value = formDetail.FarmerActivityId };
                    dbT.ExecuteTransStoreProcedure("spPageKGUpdate", p, true);
                    
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
        public string TArea { get; set; }
        public string FarmerActivityId { get; set; }
        public bool Edit { get; set; }
    }
    public class Fruit
    {
        public string FruitId { get; set; }
        public string FName { get; set; }
    }
    public class KitchenGarden
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
        public string Longtitude { get; set; }
        public string Latitude { get; set; }
        public string FarmerActivityId { get; set; }
        public List<Crop> CropList { get; set; }
        public bool Edit { get; set; }
    }
    public class Crop
    {

        public string FruitId { get; set; }
        public string Fruit { get; set; }
        public string Seeds { get; set; }
        public string Area { get; set; }
    }

}