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
using System.Net.Mail;
using System.Net;
using System.Data;

public partial class PCI_frmLeadFormerInfo : System.Web.UI.Page
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


        for (int i = 2012; i <= 2017; i++)
        {
            ddlYear.Items.Add(new System.Web.UI.WebControls.ListItem(i.ToString(), i.ToString()));
        }
        ddlYear.Items.Insert(0, new ListItem("---", "-1"));

        //using (MailMessage mm = new MailMessage("omar.safiullahkhan@gmail.com", "hanifullah.hemat@yahoo.com"))
        //{

        //    mm.Subject = "k";

        //    mm.Body = "sdf asdfjhsadf kasdkljfh lkajsdhflhjjlh asdlkfjhjlkhasdf ljkhasdfjlhjklhdsaf lkjhsadfhkljh asdfkjhasdfh ljhlasdfh asdlfkjhasdf ljhsadf lasjdfh";


        //    mm.IsBodyHtml = false;

        //    SmtpClient smtp = new SmtpClient();

        //    smtp.Host = "smtp.gmail.com";

        //    smtp.EnableSsl = true;

        //    NetworkCredential NetworkCred = new NetworkCredential("omar.safiullahkhan@gmail.com", "najiullah11");

        //    smtp.UseDefaultCredentials = true;

        //    smtp.Credentials = NetworkCred;

        //    smtp.Port = 587;
        //    mm.BodyEncoding = System.Text.Encoding.UTF8;
        //    mm.SubjectEncoding = System.Text.Encoding.Default;
        //    mm.IsBodyHtml = true;

        //    smtp.Send(mm);

        //    ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);

        //}

        //// Gmail Address from where you send the mail
        //var fromAddress = "omar.safiullahkhan@gmail.com";
        //// any address where the email will be sending
        //var toAddress = "omar.safiullahkhan@gmail.com";
        ////Password of your gmail address
        //const string fromPassword = "najiullah11";
        //// Passing the values and make a email formate to display
        //string subject = "h";
        //string body = "From: h\n";
        //body += "Email: h\n";
        //body += "Subject: h\n";
        //body += "Question: \nh\n";
        //// smtp settings
        //var smtp = new System.Net.Mail.SmtpClient();
        //{
        //    smtp.Host = "smtp.gmail.com";
        //    smtp.Port = 587;
        //    smtp.EnableSsl = true;
        //    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
        //    smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
        //    smtp.Timeout = 20000;
        //}
        //// Passing values to smtp object
        //ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
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
    public static List<LeadFarmer> GetLeadFarmer(string DistrictID)
    {
        List<LeadFarmer> lst = new List<LeadFarmer>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "SELECT     ExtWID, Name FROM         Tbl_LeadFormerWorker where DistrictID=" + DistrictID + "";
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            LeadFarmer Dr = new LeadFarmer();
            Dr.LeadFarmerId = dr["ExtWID"].ToString();
            Dr.Name = dr["Name"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
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
    public static List<Former> GetFarmerInfo(string Id)
    {
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        List<Former> lst = new List<Former>();
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
            Former f = new Former();
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
    public static void SaveFormDetail(Former formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            #region GenerateCode
            string idToReturn = "";
            string count = dbT.ExecuteTranScaller("select count(FormerId)+1 as cnt from tbl_Former where LeadFormerId='" + formDetail.LeadFormerId + "'");
            idToReturn = "FRM" + "-" + formDetail.LeadFormerId + "-" + count;

            #endregion


            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            dbT.ExecuteTransCommand(@"INSERT INTO [OCM].[dbo].[tbl_Former]
           ([FormerId]
           ,[FormerName]
           ,[FatherName]
           ,[LeadFormerId],UserId,Date)
     VALUES
           ('" + idToReturn + "',N'" + formDetail.Name + "',N'" + formDetail.FName + "','" + formDetail.LeadFormerId + "','" + usr.ProviderUserKey.ToString() + "',N'" + DateTime.Now.ToString() + "')");
            if (formDetail.FormerConList.Count > 0)
            {
                foreach (FormerContribution f in formDetail.FormerConList)
                {
                    dbT.ExecuteTransCommand(@"INSERT INTO [OCM].[dbo].[tbl_FormerFruitDetails]
           ([FormerId]
           ,[FruitId]
           ,[FPercentage]
           ,[Area]
           ,[Amount]
            ,[SeasonId]
           ,[UserId]
           ,[Date],[Year])
     VALUES
           ('" + idToReturn + "'," + f.FruitId + ",'" + f.Percentage + "','" + f.Area + "','" + f.Amount + "'," + f.SeasonId + ",'" + usr.ProviderUserKey.ToString() + "',N'" + DateTime.Now.ToString() + "'," + f.Year + ")");
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
    public static List<Former> GetFarmerLists(string Id)
    {
        List<Former> lst = new List<Former>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = @"SELECT        tbl_Former.FormerName, tbl_Former.FatherName, ISNULL(SUM(tbl_FormerFruitDetails.Amount), 0) AS TotalAmount, Tbl_LeadFormerWorker.ExtWID, tbl_Former.FormerId, tbl_FormerFruitDetails.Year
FROM            tbl_FormerFruitDetails INNER JOIN
                         tbl_Former ON tbl_FormerFruitDetails.FormerId = tbl_Former.FormerId INNER JOIN
                         Tbl_LeadFormerWorker ON tbl_Former.LeadFormerId = Tbl_LeadFormerWorker.ExtWID
GROUP BY tbl_Former.FormerName, tbl_Former.FatherName, Tbl_LeadFormerWorker.ExtWID, tbl_Former.FormerId, tbl_FormerFruitDetails.Year
HAVING        (Tbl_LeadFormerWorker.ExtWID = '" + Id + "')";
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Former p = new Former();
            p.Name = dr["FormerName"].ToString();
            p.FName = dr["FatherName"].ToString();
            p.Amount = dr["TotalAmount"].ToString();
            p.LeadFormerId = dr["ExtWID"].ToString();
            p.FarmerId = dr["FormerId"].ToString();
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
    public static Former EditFarmerDetail(string FormerId, string LeadFormerId)
    {
        Former lst = new Former();
        List<FormerContribution> FClst = new List<FormerContribution>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = @"SELECT        tbl_Former.FormerName, tbl_Former.FatherName, tbl_FormerFruitDetails.FPercentage, tbl_FormerFruitDetails.Area, tbl_FormerFruitDetails.FruitId, tbl_Fruit.Fruit, tbl_FormerFruitDetails.Amount, 
                         tbl_FormerFruitDetails.SeasonId, tbl_FormerFruitDetails.Year, tbl_Former.LeadFormerId, tbl_FormerFruitDetails.FormerId, tbl_Season.SeasonName, Tbl_LeadFormerWorker.Year AS LFYear, 
                         Tbl_LeadFormerWorker.Percentage as LFPercentage
FROM            tbl_Former INNER JOIN
                         tbl_FormerFruitDetails ON tbl_Former.FormerId = tbl_FormerFruitDetails.FormerId INNER JOIN
                         tbl_Fruit ON tbl_FormerFruitDetails.FruitId = tbl_Fruit.FruitID INNER JOIN
                         tbl_Season ON tbl_FormerFruitDetails.SeasonId = tbl_Season.SeasonId INNER JOIN
                         Tbl_LeadFormerWorker ON tbl_Former.LeadFormerId = Tbl_LeadFormerWorker.ExtWID
WHERE        (tbl_Former.LeadFormerId = '" + LeadFormerId + "') AND (tbl_FormerFruitDetails.FormerId = '" + FormerId + "')";
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        int c = 1;
        while (dr.Read())
        {
            FormerContribution p = new FormerContribution();
            p.Amount = Convert.ToDouble(dr["Amount"].ToString());
            p.FruitId = dr["FruitId"].ToString();
            p.Fruit = dr["Fruit"].ToString();
            p.Percentage = dr["LFPercentage"].ToString();
            p.SeasonId = Convert.ToInt16(dr["SeasonId"].ToString());
            p.SeasonName = dr["SeasonName"].ToString();
            p.Area = Convert.ToDouble(dr["Area"].ToString());
            p.Year = dr["LFYear"].ToString();
            FClst.Add(p);
            if (c == 1)
            {
                lst.Name = dr["FormerName"].ToString();
                lst.FName = dr["FatherName"].ToString();
                lst.LeadFormerId = dr["LeadFormerId"].ToString();
                lst.FarmerId = dr["FormerId"].ToString(); ;
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
    public static void UpdateDetail(Former formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            dbT.ExecuteTransCommand(@"update tbl_Former set FormerName=N'" + formDetail.Name + "',FatherName=N'" + formDetail.FName + "',UpdatedBy='" + usr.ProviderUserKey.ToString() + "',UpdatedDate=N'" + DateTime.Now.ToString() + "' where FormerId='" + formDetail.FarmerId + "'");
            if (formDetail.FormerConList.Count > 0)
            {
                foreach (FormerContribution f in formDetail.FormerConList)
                {
                    dbT.ExecuteTransCommand(@"delete from tbl_FormerFruitDetails where FormerId='" + formDetail.FarmerId + "' and Year=" + f.Year + "");
                    dbT.ExecuteTransCommand(@"INSERT INTO [OCM].[dbo].[tbl_FormerFruitDetails]
                       ([FormerId]
                       ,[FruitId]
                       ,[FPercentage]
                       ,[Area]
                       ,[Amount]
                        ,[SeasonId]
                       ,[UserId]
                       ,[Date],[Year])
                 VALUES
                       ('" + formDetail.FarmerId + "'," + f.FruitId + ",'" + f.Percentage + "','" + f.Area + "','" + f.Amount + "'," + f.SeasonId + ",'" + usr.ProviderUserKey.ToString() + "',N'" + DateTime.Now.ToString() + "'," + f.Year + ")");
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
    public class LeadFarmer
    {
        public string LeadFarmerId { get; set; }
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
    public class Former
    {
        public string LeadFormerId { get; set; }
        public string Name { get; set; }
        public string FName { get; set; }
        public string Amount { get; set; }
        public string RecievedAmount { get; set; }
        public string Balance { get; set; }
        public string LeadFarmer { get; set; }
        public string FarmerId { get; set; }
        public string Year { get; set; }
        public bool Edit { get; set; }
        public List<FormerContribution> FormerConList { get; set; }
    }
    public class FormerContribution
    {
        public string FruitId { get; set; }
        public string Percentage { get; set; }
        public double Area { get; set; }
        public double Amount { get; set; }
        public int SeasonId { get; set; }
        public string Fruit { get; set; }
        public string SeasonName { get; set; }
        public string Year { get; set; }
    }
    public class RoleNames
    {
        public string role { get; set; }
    }
}