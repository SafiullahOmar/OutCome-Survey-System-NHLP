using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OCM;
using System.Web.Script.Services;
public partial class Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlConnection.ClearAllPools();

        }
    }
    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static InfoByProvince[] ProvinceInfo()
    {
        StringBuilder sb = new StringBuilder();
        OCM_DbGeneral db = new OCM_DbGeneral();
        DataTable dt = new DataTable();
        List<InfoByProvince> lst = new List<InfoByProvince>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "SpDashboardByProvince";
        com.CommandType = CommandType.StoredProcedure;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            lst.Add(new InfoByProvince()
            {
                province =dr["ProvinceEngName"].ToString(), 
                sample1 = double.Parse(dr["TotalAmount"].ToString()),
                sample2 = double.Parse(dr["RecievedAmount"].ToString())
            });
        }

        return lst.ToArray();
    }
    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static InfoByRegion[] RegionInfo()
    {
        List<InfoByRegion> lst = new List<InfoByRegion>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "SpDashboardByRegion";
        com.CommandType = CommandType.StoredProcedure;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            lst.Add(new InfoByRegion()
            {
                region = dr["RegionName"].ToString(),
                sample1 = double.Parse(dr["TotalAmount"].ToString()),
                sample2 = double.Parse(dr["RecievedAmount"].ToString())
            });
        }

        return lst.ToArray();
    }
    [System.Web.Services.WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static FarmerInfo[] AlertInformation()
    {
        List<FarmerInfo> lst = new List<FarmerInfo>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageDashboardGetFarmerAlert";
        com.CommandType = CommandType.StoredProcedure;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            lst.Add(new FarmerInfo()
            {
                FarmerId = dr["FarmerId"].ToString(),
                TotalAmount = dr["TotalAmount"].ToString(),
                Name = dr["Name"].ToString(),
                FName = dr["FName"].ToString(),
                ExtName = dr["ExtName"].ToString(),
                Year = dr["Year"].ToString(),
                SeasonId = dr["SeasonId"].ToString(),
                ProvinceEngName = dr["ProvinceEngName"].ToString(),
                RegionName = dr["RegionName"].ToString(),
                RecievedAmount = dr["RecievedAmount"].ToString(),
                Balance = dr["Balance"].ToString(),
                SeasonName = dr["SeasonName"].ToString()
            });
        }

        return lst.ToArray();
    }
    public class InfoByProvince {
        public int count { get; set; }
        public string province { get; set; }
        public double sample1 { get; set; }
        public double sample2 { get; set; }
    }
    public class InfoByRegion
    {
        public int count { get; set; }
        public string region { get; set; }
        public double sample1 { get; set; }
        public double sample2 { get; set; }
    }
    public class FarmerInfo {
        public string FarmerId { get; set; }
        public string TotalAmount { get; set; }
        public string Name { get; set; }
        public string FName { get; set; }
        public string ExtName { get; set; }
        public string Year { get; set; }
        public string SeasonId { get; set; }
        public string ProvinceEngName { get; set; }
        public string RegionName { get; set; }
        public string RecievedAmount { get; set; }
        public string Balance { get; set; }
        public string SeasonName { get; set; }
    }
    
   
}