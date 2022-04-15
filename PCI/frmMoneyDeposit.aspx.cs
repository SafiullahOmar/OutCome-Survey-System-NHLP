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

using System.Runtime.Remoting.Channels;
using GsmComm.PduConverter;
using GsmComm.PduConverter.SmartMessaging;
using GsmComm.GsmCommunication;
using GsmComm.Interfaces;
using GsmComm.Server;

public partial class PCI_frmMoneyDeposit : System.Web.UI.Page
{
    OCM_DbGeneral db = new OCM_DbGeneral();
    private GsmCommMain comm;
    private delegate void SetTextCallback(string text);
    private SmsServer smsServer;
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
    public static List<EW> GetExtWorkers(string DistrictID)
    {
        List<EW> lst = new List<EW>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "select ExtWID,Name from FC_ExtensionWorkerInfo where DistrictID=" + DistrictID + " order by ExtWID";
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
    public static List<Farmer> GetFarmer(string LeadFormerId)
    {
        List<Farmer> lst = new List<Farmer>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "SELECT     FormerId, FormerName FROM         tbl_Former where LeadFormerId='" + LeadFormerId + "'";
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Farmer Dr = new Farmer();
            Dr.FarmerId = dr["FormerId"].ToString();
            Dr.Name = dr["FormerName"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static List<Farmer> GetFarmerMoneyDeposits(string ExtWorkerId,string Year,string Season)
    {
        List<Farmer> lst = new List<Farmer>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "GetFarmerMoneyDepositListByYear";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@ExtWorkerId", SqlDbType.VarChar).Value = ExtWorkerId;
        com.Parameters.AddWithValue("@SeasonId", SqlDbType.Int).Value = Season;

        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            Farmer Dr = new Farmer();
            Dr.FarmerId = dr["Id"].ToString();
            Dr.Name = dr["Name"].ToString();
            Dr.TotalAmount = Convert.ToDouble(dr["TotalAmount"].ToString());
            Dr.RecievedAmount = Convert.ToDouble(dr["RecievedAmount"].ToString());
            Dr.Balance = Convert.ToDouble(dr["Balance"].ToString());
            Dr.Edit = HttpContext.Current.User.IsInRole("Admin") == true ? true : false;
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    [System.Web.Script.Services.ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static void SaveFormDetail(FarmerDepositList formDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            List<EmailData> lst = new List<EmailData>();

            double amount = 0;
            if (formDetail.FarmerList.Count > 0)
            {
                foreach (Farmer f in formDetail.FarmerList)
                {
                    if (f.CurrentRMoney > 0)
                    {
                        dbT.ExecuteTransCommand(@"INSERT INTO [OCM].[dbo].[FC_FarmerRecieveAmount]
                       ([ExtWID]
                       ,[FarmerId]
                       ,[RecievedAmount]
                       ,[InvoiceDate],UserId,Remarks,Year,SeasonId,InvoiceNo,EntryDate) values
                       ('" + formDetail.ExtWorkerId + "','" + f.FarmerId + "','" + f.CurrentRMoney + "',N'" + formDetail.Date + "','" + usr.ProviderUserKey.ToString() + "',N'" + f.Remarks + "'," + formDetail.Year + ","+formDetail.SeasonId+",N'" + formDetail.InvoiceNo + "',N'" + DateTime.Now.ToString() + "')");

                        EmailData E = new EmailData();
                        E.FarmerName = f.Name;
                        E.PaidAmount = f.CurrentRMoney;
                        E.ExtWorkerName = formDetail.ExtWorkerName;
                        lst.Add(E);


                        amount += f.CurrentRMoney;
                    }
                }

            }

            if (amount > 0)
            {
                using (MailMessage mm = new MailMessage("fcmis.nhlp@gmaill.com", "omar.safiullah@gmail.com"))
                {

                    mm.Subject = "Farmer Contribution Amount Report";

                    string body = "<br/><div style='background-color:wheat;'><strong style='color:green;'>Dear Respected Colleagues,</strong><br/><br/>The Total (<strong style='color:red;background-color:wheat;'> " + amount + "</strong> ) amount have been recieved by PC (" + HttpContext.Current.User.Identity.Name + ") from Extension Worker:<strong>(" + formDetail.ExtWorkerName + ") </strong> with   <strong>Voucher Code:" + formDetail.InvoiceNo + "</strong> and submitted to system on  (" + DateTime.Now.ToString() + ") date .<br/><br/><strong> Please have a look on details which are described below:</strong><br/><br/> ";
                    foreach (EmailData s in lst)
                    {
                        body += "Farmer Name :" + s.FarmerName + " - Amount:<strong style='color:red;'>" + s.PaidAmount + "</strong><br/><br/>";
                    }

                    body += "Regards,<br/><strong style='color:blue;'> Please do not reply to this Email . This is Automatically created by NHLP MIS System</strong><br/><br/> Former Contribution Management Information System<br/> NHLP MIS UNIT <br/> MAIL , Kabul Afghanistan";
                    mm.Body = body;
                    mm.IsBodyHtml = false;

                    SmtpClient smtp = new SmtpClient();

                    smtp.Host = "smtp.gmail.com";

                    smtp.EnableSsl = true;

                    NetworkCredential NetworkCred = new NetworkCredential("fcmis.nhlp@gmail.com", "safi_khan123");

                    smtp.UseDefaultCredentials = true;

                    smtp.Credentials = NetworkCred;

                    smtp.Port = 587;
                    mm.BodyEncoding = System.Text.Encoding.UTF8;
                    mm.SubjectEncoding = System.Text.Encoding.Default;
                    mm.IsBodyHtml = true;

                    smtp.Send(mm);
                    //GsmCommMain comm = new GsmCommMain("COM4", 9600, 300);
                    //try
                    //{

                    //    bool retry;
                    //    do
                    //    {
                    //        retry = false;
                    //        try
                    //        {
                    //            //  Cursor.Current = Cursors.WaitCursor;
                    //            comm.Open();
                    //            //  Cursor.Current = Cursors.Default;
                    //            //  MessageBox.Show("Modem Connected Sucessfully");
                    //        }
                    //        catch (Exception)
                    //        {
                    //            // Cursor.Current = Cursors.Default;

                    //        }
                    //    }
                    //    while (retry);
                    //    string msg = "NHLP MIS:FCMIS Alert!, Dear Respected :(" + amount.ToString() + "  ) Amount have been recieved from " + formDetail.ExtWorkerName.ToString() + " Extension Worker ";
                    //    SmsSubmitPdu pdu;
                    //    byte dcs = (byte)DataCodingScheme.GeneralCoding.Alpha7BitDefault;
                    //    string[] numbers = { "0778754371","0784105355","0700237903","0797032545" };
                    //    for (int i = 0; i < numbers.Length; i++)
                    //    {
                    //        pdu = new SmsSubmitPdu(msg, numbers[i].ToString(), "", dcs);
                    //        comm.SendMessage(pdu);
                    //        System.Threading.Thread.Sleep(1000);
                    //    }
                    //    comm.Close();
                    //}
                    //catch (Exception ex)
                    //{
                    //    // MessageBox.Show("Modem is not available");
                    //    // code.Execute("update psh.dbo.donor_profile set don_sms2='notsend' where don_donor_id ='" + txtDonorId.Text + "'");
                    //    comm.Close();
                    //}




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
    public static List<FarmerAmount4Edit> EditFarmerAmountDetail(string FarmerId, string Year, string SeasonId, string ExtWorkerId)
    {
        List<FarmerAmount4Edit> lst = new List<FarmerAmount4Edit>();
        string constr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["OCMCon"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);
        SqlCommand com = con.CreateCommand();
        com.CommandText = "spPageDepositGetFarmerAmountDetail";
        com.CommandType = CommandType.StoredProcedure;
        com.Parameters.AddWithValue("@Year", SqlDbType.Int).Value = Year;
        com.Parameters.AddWithValue("@FarmerId", SqlDbType.VarChar).Value = FarmerId;
        com.Parameters.AddWithValue("@SeasonId", SqlDbType.Int).Value = SeasonId;
        com.Parameters.AddWithValue("@ExtWorkerId", SqlDbType.VarChar).Value = ExtWorkerId;
        con.Open();
        SqlDataReader dr = com.ExecuteReader();
        while (dr.Read())
        {
            FarmerAmount4Edit Dr = new  FarmerAmount4Edit();
            Dr.FarmerId = dr["FarmerId"].ToString();
            Dr.FarmerName = dr["Name"].ToString();
            Dr.Amount = Convert.ToDouble(dr["RecievedAmount"].ToString());
            Dr.EnteredByBefore = dr["UserId"].ToString();
            Dr.EntryDate = dr["EntryDate"].ToString();
            Dr.UserName = dr["UserName"].ToString();
            Dr.Year = dr["Year"].ToString();
            Dr.SeasonId = dr["SeasonId"].ToString();
            lst.Add(Dr);
        }
        dr.Close();
        con.Close();
        return lst;
    }
    [WebMethod]
    public static void UpdateFarmerAmount(FarmerAmountList4Edit fDetail)
    {
        OCM_DbGeneral dbT = new OCM_DbGeneral();
        try
        {

            dbT.BeginTransaction();
            MembershipUser usr = Membership.GetUser(HttpContext.Current.User.Identity.Name);
            if (fDetail.FarmerAmntList.Count > 0)
            {
                foreach (FarmerAmount4Edit f in fDetail.FarmerAmntList)
                {
                    if (f.Amount != f.PreviousAmount)
                    {
                        dbT.ExecuteTransCommand("insert into FC_FarmerUpdatedAmountDetail ([ExtWID],[FarmerId],[PreviosAmount],[NewAmount],[PreviousDate],[NewDate],[UpdatedBy],[EnteredByBefore]) values ('" + fDetail.ExWorkerId + "','" + fDetail.FarmerId + "','" + f.PreviousAmount + "','" + f.Amount + "',N'" + f.EntryDate + "',N'" + DateTime.Now.ToString() + "','" + usr.ProviderUserKey.ToString() + "','" + f.EnteredByBefore + "')");
                        dbT.ExecuteTransCommand("update FC_FarmerRecieveAmount set RecievedAmount='" + f.Amount + "',Updated='True' where ExtWID='" + fDetail.ExWorkerId + "' and FarmerId='" + fDetail.FarmerId + "' and Year=" + fDetail.Year + " and SeasonId="+fDetail.SeasonId+" and EntryDate=N'" + f.EntryDate + "'");


                    }

                }
            }

            dbT.EndTransaction();
        }
        catch (Exception e)
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
    public class Farmer
    {
        public string FarmerId { get; set; }
        public string Name { get; set; }
        public double TotalAmount { get; set; }
        public double RecievedAmount { get; set; }
        public double Balance { get; set; }
        public double CurrentRMoney { get; set; }
        public string Remarks { get; set; }
        public bool Edit { get; set; }
    }
    public class FarmerDepositList
    {
        public string InvoiceNo { get; set; }
        public string Date { get; set; }
        public string ExtWorkerId { get; set; }
        public string ExtWorkerName { get; set; }
        public string Year { get; set; }
        public string SeasonId { get; set; }
        public List<Farmer> FarmerList { get; set; }

    }
    public class EmailData
    {
        public string ExtWorkerName { get; set; }
        public string FarmerName { get; set; }
        public double PaidAmount { get; set; }

    }
    public class FarmerAmount4Edit
    {
        public string FarmerId { get; set; }
        public string Year { get; set; }
        public string SeasonId { get; set; }
        public double Amount { get; set; }
        public string EntryDate { get; set; }
        public string UserName { get; set; }
        public string FarmerName { get; set; }
        public string EnteredByBefore { get; set; }
        public double PreviousAmount { get; set; }

    }
    public class FarmerAmountList4Edit
    {
        public string ExWorkerId { get; set; }
        public string FarmerId { get; set; }
        public string Year { get; set; }
        public string SeasonId { get; set; }
        public List<FarmerAmount4Edit> FarmerAmntList { get; set; }
    }
    public class RoleNames
    {
        public string role { get; set; }
    }

}