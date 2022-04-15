using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;

public partial class ShowError : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // String hiddenFieldValue = hidLastTab.Value;
        //StringBuilder js = new StringBuilder();
        //js.Append("<script type='text/javascript'>");
        //js.Append("var previouslySelectedTab = ");
        //js.Append(hiddenFieldValue);
        //js.Append(";</script>");
        //this.Header.Controls.Add(new LiteralControl(js.ToString()));

        if (OCM_CommonException.LastException != null)
        {
            lblMessage.Text = "<font color='red'><h4>Error occured in the application</h4></font>Message : <p>" + OCM_CommonException.LastException.Message + "</p>";
            lblSource.Text = Request.Url.ToString() + "<br/> <font color='red'>" + OCM_CommonException.LastException.Source + "</font>";
            lblInnerException.Text = "<p>" + OCM_CommonException.LastException.ToString() + "</p>";
            lblStackTrace.Text = "<p>" + OCM_CommonException.LastException.StackTrace + "</p>";
        }
        else
        {
            lblMessage.Text = "No Exeption";
        }
    }
  
}




