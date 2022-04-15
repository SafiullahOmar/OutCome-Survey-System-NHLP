using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OCM;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.Security;
using System.Web.Script.Services;
using System.Data;

public partial class PCI_frmFarmerContribution : System.Web.UI.Page
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
    //check this one
    [WebMethod]
    public static FruitYPDetail GetFruit(string Id)
    {
        List<Fruit> lst = new List<Fruit>();
        FruitYPDetail F = new FruitYPDetail();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = @"SELECT     tbl_Fruit.FruitID, tbl_Fruit.Fruit
FROM         Tbl_LeadFormerWorker INNER JOIN
                      tbl_Fruit ON Tbl_LeadFormerWorker.ActivityId = tbl_Fruit.ActivityID
WHERE     (Tbl_LeadFormerWorker.ExtWID = '" + Id + "')";
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Fruit Dr = new Fruit();
            Dr.FruitId = dr["FruitID"].ToString();
            Dr.FruitName = dr["Fruit"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        F.Detail = lst;
        com.CommandText = @"select Year,Percentage from Tbl_LeadFormerWorker
WHERE     (Tbl_LeadFormerWorker.ExtWID = '" + Id + "')";
        dr = com.ExecuteReader();
        while (dr.Read())
        {
            F.Percentage = dr["Percentage"].ToString();
            F.Year = dr["Year"].ToString();
        }
        dr.Close();
        con.Close();
        return F;
    }
    [WebMethod]
    public static string GetAmount(string FruitID)
    {
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "select TotalAmount from tbl_Fruit where FruitID=" + FruitID + "";
        con.Open();
        string Amount = "";
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Amount = dr["TotalAmount"].ToString();
        }
        dr.Close();
        con.Close();
        return Amount;
    }
    [WebMethod]
    public static List<EW> GetExtensionW(string DistrictID)
    {
        List<EW> lst = new List<EW>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "select ExtWID,Name from FC_ExtensionWorkerInfo where DistrictID=" + DistrictID + " order by ProvinceID";
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
        com.CommandText = "select Id,Name from FC_FarmerInfo where ExtWId='" + ExtWId + "' order by ExtWId";
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
    public static List<Fruit> GetFruitTools(string ActivityId)
    {
        List<Fruit> lst = new List<Fruit>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "select FruitID,Fruit from FC_FruitTools where ActivityID=" + ActivityId + "";
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Fruit Dr = new Fruit();
            Dr.FruitId = dr["FruitID"].ToString();
            Dr.FruitName = dr["Fruit"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static FruitVariertyCropsPercentageDetail GetPercentage(string FruitId, string ProvinceId, string Year)
    {
        FruitVariertyCropsPercentageDetail _Detail = new FruitVariertyCropsPercentageDetail();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();

        List<InterCrops> lst = new List<InterCrops>();
        com.CommandText = @"SELECT Id,InterCrops from FC_InterCrops";
        con.Open();

        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            InterCrops Dr = new InterCrops();
            Dr.Id = dr["Id"].ToString();
            Dr.InterCrop = dr["InterCrops"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        _Detail.InterCropsList = lst;

        List<FruitVariety> lstV = new List<FruitVariety>();
        com.CommandText = @"SELECT VarietyId,Variety from FC_FruitVariety
WHERE     (FC_FruitVariety.FruitId = '" + FruitId + "')";
        dr = com.ExecuteReader();
        while (dr.Read())
        {
            FruitVariety Dr = new FruitVariety();
            Dr.VarietyId = dr["VarietyId"].ToString();
            Dr.Variety = dr["Variety"].ToString();
            lstV.Add(Dr);
        }
        dr.Close();
        _Detail.FruitVarityList = lstV;

        com.CommandText = "spPageFarmerContrinbutionGetPercentage";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@FruitToolsId", SqlDbType.Int).Value = FruitId;
        com.Parameters.AddWithValue("@ProvinceId", SqlDbType.Int).Value = ProvinceId;
        dr = com.ExecuteReader();
        while (dr.Read())
        {
            _Detail.Percentage = dr["Percentage"].ToString();
        }
        dr.Close();
        con.Close();
        return _Detail;
    }
    [WebMethod]
    public static List<Farmer> GetFarmerInfo(string Id)
    {
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        List<Farmer> lst = new List<Farmer>();
        SqlCommand com = con.CreateCommand();
        com.CommandText = @"SELECT     FormerId, FormerName,
    (
    	select isnull(sum(tbl_FormerFruitDetails.Amount),0) from tbl_FormerFruitDetails where tbl_FormerFruitDetails.FormerId=tbl_Former.FormerId
    ) as TotalAmount,
    (
    select isnull(sum( tbl_FormerRecieveAmount.RecievedAmount),0) from tbl_FormerRecieveAmount where tbl_FormerRecieveAmount.FormerId=tbl_Former.FormerId
    )as RecievedAmount,
    (
    (
    	select isnull(sum(tbl_FormerFruitDetails.Amount),0) from tbl_FormerFruitDetails where tbl_FormerFruitDetails.FormerId=tbl_Former.FormerId
    )-
    (
    select isnull(sum( tbl_FormerRecieveAmount.RecievedAmount),0) from tbl_FormerRecieveAmount where tbl_FormerRecieveAmount.FormerId=tbl_Former.FormerId
    )
    ) as Balance
    FROM         tbl_Former
     WHERE     (tbl_Former.LeadFormerId = '" + Id + "')";
        con.Open();

        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Farmer f = new Farmer();
            f.Name = dr["FormerName"].ToString();
            f.Amount = dr["TotalAmount"].ToString();
            f.RecievedAmount = dr["RecievedAmount"].ToString();
            f.Balance = dr["Balance"].ToString();
            // f.LeadFarmer = dr[""].ToString();
            lst.Add(f);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SaveFormDetail(Farmer formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            if (formDetail.FormerConList.Count > 0)
            {
                foreach (FormerContribution f in formDetail.FormerConList)
                {
                    dbT.ExecuteTransCommand(@"INSERT INTO [OCM].[dbo].[FC_FormerFruitDetails]
               ([FarmerId]
               ,[FruitId]
               ,[FPercentage]
               ,[Area]
               ,[Amount]
                ,[SeasonId]
               ,[UserId]
               ,[Date],[Year],[AmountPerPKG],[IsDeleted],[PayableDate],[InterCropId],[FruitVarietyId],[DAP],[InterCrop],[Latitude],[Longtitude])
         VALUES
               ('" + formDetail.FarmerId + "'," + f.FruitId + ",'" + f.Percentage + "','" + f.Area + "','" + f.Amount + "'," + formDetail.SeasonId + ",'" + usr.ProviderUserKey.ToString() + "',N'" + DateTime.Now.ToString() + "'," + formDetail.Year + ",'" + f.AmountPerPKG + "','False',N'" + DateTime.Now.AddDays(30).ToString() + "',"+f.InterCropId+","+f.FruitVarietyId+",'"+f.DAP+"','"+f.InterCropInKG+"',"+f.Latitude+","+f.Longtitude+")");
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
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static List<Farmer> GetFarmerLists(string Id, string Year, string SeasonId)
    {
        List<Farmer> lst = new List<Farmer>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = @"SELECT        FC_FarmerInfo.Name, FC_FarmerInfo.FName, FC_ExtensionWorkerInfo.Name AS EName, FC_FormerFruitDetails.Year,FC_FormerFruitDetails.SeasonId, FC_ExtensionWorkerInfo.ExtWID, SUM(FC_FormerFruitDetails.Amount) AS TotalAmount,  FC_FarmerInfo.Id
FROM            FC_ExtensionWorkerInfo INNER JOIN
                         FC_FarmerInfo ON FC_ExtensionWorkerInfo.ExtWID = FC_FarmerInfo.ExtWId INNER JOIN
                         FC_FormerFruitDetails ON FC_FarmerInfo.Id = FC_FormerFruitDetails.FarmerId
where        (FC_ExtensionWorkerInfo.ExtWID = '" + Id + "') AND (FC_FormerFruitDetails.Year=" + Year + ") AND (FC_FormerFruitDetails.SeasonId=" + SeasonId + ") AND (FC_FormerFruitDetails.IsDeleted='False') GROUP BY FC_FarmerInfo.Name, FC_FarmerInfo.FName, FC_ExtensionWorkerInfo.Name, FC_FormerFruitDetails.Year,FC_FormerFruitDetails.SeasonId, FC_ExtensionWorkerInfo.ExtWID,FC_FarmerInfo.Id ";
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Farmer p = new Farmer();
            p.Name = dr["Name"].ToString();
            p.FName = dr["FName"].ToString();
            p.Amount = dr["TotalAmount"].ToString();
            p.ExtId = dr["ExtWID"].ToString();
            p.FarmerId = dr["Id"].ToString();
            p.Year = dr["Year"].ToString();
            p.SeasonId = Convert.ToInt16(dr["SeasonId"].ToString());
            p.Edit = HttpContext.Current.User.IsInRole("Admin") == true ? true : false;
            lst.Add(p);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static Farmer EditFarmerDetail(string FormerId, string ExtWId, string Year, String SeasonId)
    {
        Farmer lst = new Farmer();
        List<FormerContribution> FClst = new List<FormerContribution>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = @"SELECT        FC_FarmerInfo.Name, FC_FarmerInfo.FName, FC_FormerFruitDetails.FPercentage, FC_FormerFruitDetails.Area, FC_FormerFruitDetails.FruitId, FC_FruitTools.Fruit, FC_FormerFruitDetails.Amount, 
                         FC_FormerFruitDetails.SeasonId,FC_FormerFruitDetails.AmountPerPKG, FC_FormerFruitDetails.Year, FC_FarmerInfo.ExtWId, FC_FormerFruitDetails.FarmerId, FC_Season.SeasonName,FC_FormerFruitDetails.InterCropId,FC_FormerFruitDetails.FruitVarietyId,FC_FormerFruitDetails.DAP,FC_FormerFruitDetails.InterCrop,FC_FormerFruitDetails.Longtitude,FC_FormerFruitDetails.Latitude
FROM            FC_FarmerInfo INNER JOIN
                         FC_FormerFruitDetails ON FC_FarmerInfo.Id = FC_FormerFruitDetails.FarmerId INNER JOIN
                         FC_FruitTools ON FC_FormerFruitDetails.FruitId = FC_FruitTools.FruitID INNER JOIN
                         FC_Season ON FC_FormerFruitDetails.SeasonId = FC_Season.SeasonId INNER JOIN
                         FC_Activity ON FC_FruitTools.ActivityID = FC_Activity.ActivityId INNER JOIN
                         FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID
    WHERE       (FC_FarmerInfo.ExtWId = '" + ExtWId + "') AND (FC_FormerFruitDetails.FarmerId = '" + FormerId + "')  AND (FC_FormerFruitDetails.Year = " + Year + ")  AND (FC_FormerFruitDetails.SeasonId = " + SeasonId + ") AND (FC_FormerFruitDetails.IsDeleted='False')";
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        int c = 1;
        while (dr.Read())
        {
            FormerContribution p = new FormerContribution();
            p.Amount = Convert.ToDouble(dr["Amount"].ToString());
            p.FruitId = dr["FruitId"].ToString();
            p.Fruit = dr["Fruit"].ToString();
            p.Percentage = dr["FPercentage"].ToString();
            p.SeasonName = dr["SeasonName"].ToString();
            p.Area = Convert.ToDouble(dr["Area"].ToString());
            p.AmountPerPKG = Convert.ToDouble(dr["AmountPerPKG"].ToString());
            p.InterCropId = dr["InterCropId"].ToString();
            p.FruitVarietyId = dr["FruitVarietyId"].ToString();
            p.DAP = Convert.ToDouble(dr["DAP"].ToString());
            p.InterCropInKG = Convert.ToDouble(dr["InterCrop"].ToString());
            p.Longtitude = dr["Longtitude"].ToString();
            p.Latitude = dr["Latitude"].ToString();
            FClst.Add(p);
            if (c == 1)
            {
                lst.ExtId = dr["ExtWId"].ToString();
                lst.FarmerId = dr["FarmerId"].ToString();
                lst.SeasonId = Convert.ToInt16(dr["SeasonId"].ToString());
                lst.Year = dr["Year"].ToString();
            }
            c++;
        }

        dr.Close();
        lst.FormerConList = FClst;
        con.Close();
        return lst;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void UpdateDetail(Farmer formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            if (formDetail.FormerConList.Count > 0)
            {
                DateTime PrevDate = Convert.ToDateTime(dbT.ExecuteTranScaller("select PayableDate from FC_FormerFruitDetails where FarmerId='" + formDetail.FarmerId + "' and Year=" + formDetail.Year + " and SeasonId=" + formDetail.SeasonId + ""));
                dbT.ExecuteTransCommand(@"update FC_FormerFruitDetails set IsDeleted='True' where FarmerId='" + formDetail.FarmerId + "' and Year=" + formDetail.Year + " and SeasonId=" + formDetail.SeasonId + "");
                foreach (FormerContribution f in formDetail.FormerConList)
                {
                    dbT.ExecuteTransCommand(@"INSERT INTO [OCM].[dbo].[FC_FormerFruitDetails]
                           ([FarmerId]
                           ,[FruitId]
                           ,[FPercentage]
                           ,[Area]
                           ,[Amount]
                           ,[SeasonId]
                           ,[UserId]
                           ,[Date],[Year],[UpdateDate],[UpdateBy],[AmountPerPKG],[IsDeleted],[PayableDate],[InterCropId],[FruitVarietyId],[DAP],[InterCrop],[Latitude],[Longtitude])
                     VALUES
                           ('" + formDetail.FarmerId + "'," + f.FruitId + ",'" + f.Percentage + "','" + f.Area + "','" + f.Amount + "'," + formDetail.SeasonId + ",'" + usr.ProviderUserKey.ToString() + "',N'" + DateTime.Now.ToString() + "'," + formDetail.Year + ",N'" + DateTime.Now.ToString() + "','" + usr.ProviderUserKey.ToString() + "','" + f.AmountPerPKG + "','False',N'" + PrevDate.AddDays(30).ToString() + "'," + f.InterCropId + "," + f.FruitVarietyId + ",'" + f.DAP + "','" + f.InterCropInKG + "'," + f.Latitude + "," + f.Longtitude + ")");
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

    public class Fruit
    {
        public string FruitId { get; set; }
        public string FruitName { get; set; }

    }
    public class FruitYPDetail
    {
        public List<Fruit> Detail { get; set; }
        public string Year { get; set; }
        public string Percentage { get; set; }
    }
    public class Farmer
    {
        public string Name { get; set; }
        public string FName { get; set; }
        public string Amount { get; set; }
        public string RecievedAmount { get; set; }
        public string Balance { get; set; }
        public string ExtensionWorker { get; set; }
        public string FarmerId { get; set; }
        public string ExtId { get; set; }
        public string Year { get; set; }
        public int SeasonId { get; set; }
        public string ProvinceType { get; set; }
        public bool Edit { get; set; }
        public List<FormerContribution> FormerConList { get; set; }
    }
    public class FormerContribution
    {
        public string FruitId { get; set; }
        public string Percentage { get; set; }
        public double Area { get; set; }
        public double Amount { get; set; }
        public string Fruit { get; set; }
        public string SeasonName { get; set; }
        public double AmountPerPKG { get; set; }
        public double DAP { get; set; }
        public double InterCropInKG { get; set; }
        public string InterCropId { get; set; }
        public string FruitVarietyId { get; set; }
        public string Latitude { get; set; }
        public string Longtitude { get; set; }
    }
    public class RoleNames
    {
        public string role { get; set; }
    }
    public class FruitVariertyCropsPercentageDetail
    {
        public string Percentage { set; get; }
        public List<FruitVariety> FruitVarityList { get; set; }
        public List<InterCrops> InterCropsList { get; set; }
        public bool FruitStatus { get; set; }
    }
    public class FruitVariety
    {
        public string VarietyId { get; set; }
        public string Variety { get; set; }
    }
    public class InterCrops
    {
        public string Id { get; set; }
        public string InterCrop { get; set; }
    }
}