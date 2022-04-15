using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OCM;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Data;

public partial class PCI_frmReport : System.Web.UI.Page
{
    OCM_DbGeneral db = new OCM_DbGeneral();
    DataTable dt = new DataTable();
    string style = @"<style>
.tableHeader{width:100px; background-color: #c4d79b;font-size:16px;font-weight: bold; text-transform: capitalize; border:1px solid black;word-wrap: break-word;}
.tableCell{background-color: #FFFFFF; text-align:left;word-wrap: break-word;font-size:0.7em}.title{ font-size: 1.2em;  font-weight: bold;text-align:center;  color: #000000;  font-style: normal;  font-variant: normal; border:0px solid white;   text-transform: capitalize;  background-color: #FFFFff;}
.tableCellGeneral{background-color: #ffc000; text-align:left;word-wrap: break-word;font-size:13px;font-weight: bold; text-transform: capitalize; border:1px solid black;}.tableCellProcurementCol{background-color: #d8e4bc; text-align:center;word-wrap: break-word;font-size:13px;font-weight: bold; text-transform: capitalize; border:1px solid black;}
.tableCellProgram{background-color: #b7dee8; text-align:center;word-wrap: break-word;font-weight: bold; font-size:13px;}
.BudgettableHeader{width:100px; background-color: #a6a6a6;font-size:16px;font-weight: bold; text-transform: capitalize; border:1px thin red;word-wrap: break-word;}
.BudgettableCellGeneral{background-color: #da9694;height:30px; text-align:center;word-wrap: break-word;font-size:13px;font-weight: bold; text-transform: capitalize; border:1px thin gray;}
.BudgettableCellProgram{background-color: #92d050;height:26px; text-align:center;word-wrap: break-word;font-size:13px;font-weight: bold; text-transform: capitalize; border:1px thin gray;}
.tableTitle{height:25px; text-align:center;word-wrap: break-word;font-size:19px;font-weight: bold; text-transform: capitalize;}

.ProjectListtableHeader{width:100px; background-color: #fffff;font-size:16px;font-weight: bold; text-transform: capitalize; border:1px solid black;word-wrap: break-word;}
.ProjectListtableCellGeneral{background-color: #ffc000; text-align:left;word-wrap: break-word;font-size:13px;font-weight: bold; text-transform: capitalize; border:1px solid black;}
.ProjectListWorkCell{background-color: #ffdbb1; text-align:center;word-wrap: break-word;font-weight: bold; font-size:13px;}
.ProjectListGoodsCell{background-color: #cde4ef; text-align:center;word-wrap: break-word;font-weight: bold; font-size:13px;}
.ProjectListServiceCell{background-color: #f0e68e; text-align:center;word-wrap: break-word;font-weight: bold; font-size:13px;}
.ProjectListCell{background-color: #ffffff; text-align:center;word-wrap: break-word;font-weight: bold; font-size:13px;}

.ProjectPaymentCostListtableHeader{width:100px; background-color: #688a8b;font-size:16px; color:white;font-weight: bold; text-transform: capitalize; border:1px solid black;word-wrap: break-word;}
.Report6tableCellGeneral{background-color: #f5bcb7; text-align:left;word-wrap: break-word;font-size:13px;color:black;font-weight: bold; text-transform: capitalize; border:1px solid black;}

.DonorTableHeader{width:100px; background-color: #cde4ef;font-size:16px;font-weight: bold; text-transform: capitalize;word-wrap: break-word;}
</style>";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fill();
        }
    }
    private void fill()
    {
        chklstRegion.DataSource = db.SelectRecords(@"select id,name from OCM_Region");
        chklstRegion.DataTextField = "name";
        chklstRegion.DataValueField = "id";
        chklstRegion.DataBind();
        chklstDistrict.Enabled = false;
        chklstProvince.Enabled = false;
        chklstRegion.Enabled = false;
    }
    protected void chklstRegion_SelectedIndexChanged(object sender, EventArgs e)
    {

        string condition = getSelectedItemsFromCheckBoxList(" where", "OCM_Province", "region", chklstRegion);
        if (!string.IsNullOrEmpty(condition) && (ddlReportLevel.SelectedValue != "1"))
        {
            string query = "select ProvinceID,ProvinceEngName from OCM_Province" + condition;
            chklstProvince.DataSource = db.SelectRecords(query);
            chklstProvince.DataTextField = "ProvinceEngName";
            chklstProvince.DataValueField = "ProvinceID";
            chklstProvince.DataBind();
        }
        else
        {
            chklstProvince.DataSource = "";
            chklstProvince.DataBind();
        }
    }
    private string getSelectedItemsFromCheckBoxList(string prefix, string tbl, string column, CheckBoxList lst)
    {
        StringBuilder condition = new StringBuilder();
        condition.Append(prefix + " " + tbl + "." + column + " in(");
        int count = 0;
        foreach (System.Web.UI.WebControls.ListItem itm in lst.Items)
        {
            if (itm.Selected)
            {
                condition.Append(itm.Value + ",");
                count++;
            }
        }
        if (count == 0)
        {
            condition.Clear();
        }
        else
        {
            condition.Remove(condition.Length - 1, 1);
            condition.Append(")");
        }
        return condition.ToString();
    }
    protected void chklstProvince_SelectedIndexChanged(object sender, EventArgs e)
    {
        string condition = getSelectedItemsFromCheckBoxList(" where", "OCM_District", "ProvinceID", chklstProvince);
        string query = "select DistrictID,DistrictEngName from OCM_District" + condition;
        if (!string.IsNullOrEmpty(condition) && (ddlReportLevel.SelectedValue != "2"))
        {
            chklstDistrict.DataSource = db.SelectRecords(query);
            chklstDistrict.DataTextField = "DistrictEngName";
            chklstDistrict.DataValueField = "DistrictID";
            chklstDistrict.DataBind();
        }
        else
        {
            chklstDistrict.DataSource = "";
            chklstDistrict.DataBind();
        }
    }
    protected void ddlReportLevel_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlReportLevel.SelectedValue != "-1")
        {

            if (ddlReportLevel.SelectedValue == "1")
            {
                chklstRegion.Enabled = true;
                chklstDistrict.Enabled = false;
                chklstProvince.Enabled = false;

            }
            else if (ddlReportLevel.SelectedValue == "2")
            {
                chklstDistrict.Enabled = false;
                chklstProvince.Enabled = true;
                chklstRegion.Enabled = true;
            }
            else if (ddlReportLevel.SelectedValue == "3")
            {
                chklstDistrict.Enabled = true;
                chklstProvince.Enabled = true;
                chklstRegion.Enabled = true;
            }

            ChckBxItemsValue(chklstProvince, false);
            ChckBxItemsValue(chklstDistrict, false);
            ChckBxItemsValue(chklstRegion, false);
        }
        else
        {
            chklstDistrict.Enabled = false;
            chklstProvince.Enabled = false;
            chklstRegion.Enabled = false;
            ChckBxItemsValue(chklstRegion, false);
            ChckBxItemsValue(chklstProvince, false);
            ChckBxItemsValue(chklstDistrict, false);
        }
    }
    private void ChckBxItemsValue(CheckBoxList chklst, bool value)
    {
        foreach (System.Web.UI.WebControls.ListItem li in chklst.Items)
        {
            li.Selected = value;
        }
    }

    private HtmlTable HTMLTable(string percentWidth, int borderWidth, string borderColor)
    {
        HtmlTable tbl = new HtmlTable();
        tbl.Width = percentWidth;
        tbl.Border = borderWidth;
        tbl.BorderColor = borderColor;
        return tbl;
    }
    private HtmlTableCell Cell(string innerHtml, string cssClass)
    {
        HtmlTableCell c = new HtmlTableCell();
        c.InnerHtml = innerHtml;
        c.Attributes.Add("class", cssClass);
        return c;
    }
    private HtmlTableCell Cell(string innerHtml, string cssClass, string textAlign)
    {
        HtmlTableCell c = new HtmlTableCell();
        c.InnerHtml = innerHtml;
        c.Style.Add(HtmlTextWriterStyle.TextAlign, textAlign);
        if (textAlign.ToLower() == "center")
            c.Style.Add(HtmlTextWriterStyle.VerticalAlign, "middle");
        c.Attributes.Add("class", cssClass);
        return c;
    }
    private HtmlTableCell Cell(string innerHtml, string cssClass, int colSpan)
    {
        HtmlTableCell c = new HtmlTableCell();
        c.InnerHtml = innerHtml;
        c.Attributes.Add("class", cssClass);
        c.ColSpan = colSpan;
        return c;
    }
    private HtmlTableCell Cell(string innerHtml, string cssClass, int colSpan, string textAlign)
    {
        HtmlTableCell c = new HtmlTableCell();
        c.InnerHtml = innerHtml;
        c.Attributes.Add("class", cssClass);
        c.ColSpan = colSpan;
        c.Style.Add(HtmlTextWriterStyle.TextAlign, textAlign);
        if (textAlign.ToLower() == "center")
            c.Style.Add(HtmlTextWriterStyle.VerticalAlign, "middle");
        return c;
    }
    private HtmlTableCell Cell(string innerHtml, string cssClass, int colSpan, int rowSpan)
    {
        HtmlTableCell c = new HtmlTableCell();
        c.InnerHtml = innerHtml;
        c.Attributes.Add("class", cssClass);
        c.ColSpan = colSpan;
        c.RowSpan = rowSpan;
        return c;
    }
    private HtmlTableCell CellRowSpan(string innerHtml, string cssClass, int rowSpan)
    {
        HtmlTableCell c = new HtmlTableCell();
        c.InnerHtml = innerHtml;
        c.Attributes.Add("class", cssClass);
        c.RowSpan = rowSpan;
        return c;
    }
    private HtmlTableCell CellRowSpan(string innerHtml, string cssClass, int rowSpan, string textAlign)
    {
        HtmlTableCell c = new HtmlTableCell();
        c.InnerHtml = innerHtml;
        c.Attributes.Add("class", cssClass);
        c.RowSpan = rowSpan;
        c.Style.Add(HtmlTextWriterStyle.TextAlign, textAlign);
        if (textAlign.ToLower() == "center")
            c.Style.Add(HtmlTextWriterStyle.VerticalAlign, "middle");
        return c;
    }

    public string GetUrl(string imagepath)
    {
        string[] splits = Request.Url.AbsoluteUri.Split('/');
        if (splits.Length >= 2)
        {
            string url = splits[0] + "//";
            for (int i = 2; i < splits.Length - 1; i++)
            {
                url += splits[i];
                url += "/";
            }
            return url + imagepath;
        }
        return imagepath;
    }
    private HtmlTable TitleTable(int colspan, string headerText)
    {
        HtmlTable titletable = HTMLTable("100", 0, "white");
        HtmlTableRow titleRow = new HtmlTableRow();

        string img = GetUrl("images/minlogo.png");

        string img2 = GetUrl("images/emislogo.png");

        titleRow.Cells.Add(Cell("<img style='float:right' src='" + img + "'", ""));

        //if (ddlLanguage.SelectedValue == "1")
        //    titleRow.Cells.Add(Cell("Ministry Of Education<br/> Education Management Information System (EMIS) Generated Report<br/>" + headerText + "<br/><br/>", "title", colspan));
        //else
        //    titleRow.Cells.Add(Cell("دپوهنی وزارت<br/> دپوهنی   د اداری لپاره معلوماتی سستم تولیدی راپور<br/>" + headerText + "<br/><br/>", "title", colspan));

        titleRow.Cells.Add(Cell("<img style='float:left' src='" + img2 + "'", ""));
        // titleRow.Cells.Add(Cell("", ""));
        titletable.Rows.Add(titleRow);
        return titletable;

    }
    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        if (ddlReportType.SelectedValue == "1")
        {
            TotalRecievedAmount();
        }
       else if (ddlReportType.SelectedValue == "2")
        {
            ContributionByLeadFarmer();
        }
        else if (ddlReportType.SelectedValue == "3") {
            FarmerContribution();
        }
    }
    private void TotalRecievedAmount()
    {
        if (ddlReportLevel.SelectedValue == "1")
        {
            #region Report 1
            HtmlGenericControl div = new HtmlGenericControl();
            div.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            HtmlTable tblTitle = HTMLTable("100", 0, "");
            tblTitle.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            HtmlTableRow title = new HtmlTableRow();
            title.Cells.Add(Cell("MAIL", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title);

            HtmlTableRow title3 = new HtmlTableRow();
            title3.Cells.Add(Cell("National Horticulture & Livestock Project", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title3);

            HtmlTableRow title4 = new HtmlTableRow();
            title4.Cells.Add(Cell("Farmer Contribution Total & Recieved Amount By Region", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title4);

            HtmlTable tblToExport = HTMLTable("100", 1, "black");
            tblToExport.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            //header
            HtmlTableRow headerRow = new HtmlTableRow();
            tblToExport.Rows.Add(headerRow);
            HtmlTableRow headerSubRow = new HtmlTableRow();
            headerRow.Cells.Add(CellRowSpan("S.NO", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Region", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Total Amount", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Recieved Amount", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Balance", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Year", "tableHeader", 2, "center"));
            tblToExport.Rows.Add(headerSubRow);
            dt = db.SelectRecords(@"
;with tbl as (
SELECT        OCM_Region.name as region, ISNULL(SUM(FC_FormerFruitDetails.Amount), 0)  as TotalAmount, FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId,
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount
                               WHERE        (FarmerId = FC_FarmerInfo.Id) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)) AS RecievedAmount, FC_Season.SeasonName,
							   
							   ( ISNULL(SUM(FC_FormerFruitDetails.Amount), 0)-
								(SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount
                               WHERE        (FarmerId = FC_FarmerInfo.Id) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)

							   )) as balance
FROM            FC_FormerFruitDetails INNER JOIN
                         FC_FarmerInfo ON FC_FormerFruitDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
						FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID INNER JOIN
                         OCM_Province ON FC_ExtensionWorkerInfo.ProvinceID = OCM_Province.ProvinceID INNER JOIN
                         OCM_Region ON OCM_Province.Region = OCM_Region.id INNER JOIN
                         FC_Season ON FC_FormerFruitDetails.SeasonId = FC_Season.SeasonId
WHERE        (FC_FormerFruitDetails.IsDeleted = 'false') AND (FC_FormerFruitDetails.Year =  " + ddlYear.SelectedValue + ")  AND " + getSelectedItemsFromCheckBoxList("", "OCM_Region", "id", chklstRegion) + ""
+"GROUP BY OCM_Region.name, FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId, FC_FarmerInfo.Id, FC_Season.SeasonName )"
+"select isnull(sum(TotalAmount),0) as TotalAmount,Year,isnull(sum(RecievedAmount),0) as RecievedAmount ,isnull(sum(balance),0)"
+"as balance,region from tbl group by Year,region ");
            if (dt.Rows.Count > 0)
            {
                int count = 1;
                double TotalAmount = 0;
                double RecievedAmount = 0;
                double Balance = 0;
                foreach (DataRow rw in dt.Rows)
                {
                    HtmlTableRow Row = new HtmlTableRow();
                    Row.Cells.Add(Cell(count.ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["Region"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["TotalAmount"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["RecievedAmount"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["balance"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["Year"].ToString(), "tableCell", "center"));
                    TotalAmount += Convert.ToDouble(rw["TotalAmount"].ToString());
                    RecievedAmount += Convert.ToDouble(rw["RecievedAmount"].ToString());
                    Balance += Convert.ToDouble(rw["balance"].ToString());
                    tblToExport.Rows.Add(Row);
                    count++;
                }

                HtmlTableRow footer = new HtmlTableRow();
                footer.Cells.Add(Cell("Total", "tableCellGeneral", 2, "center"));
                footer.Cells.Add(Cell(TotalAmount.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell(RecievedAmount.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell(Balance.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell("", "tableCellGeneral", "center"));
                tblToExport.Rows.Add(footer);
            }
            div.Controls.Add(tblTitle);
            div.Controls.Add(tblToExport);
            Response.Clear();
            Response.Buffer = true;

            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("content-disposition", "attachment;filename=AmountDetails.xls");
            Response.Charset = "utf-8";
            //this.EnableViewState = false;

            System.IO.StringWriter sw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);
            Response.Write(style);
            //titleTable.RenderControl(htw);
            div.RenderControl(htw);
            //Response.OutputStream.Write(new byte[] { 0xef, 0xbb, 0xbf }, 0, 3);
            Response.Write(sw.ToString());
            Response.End();
            #endregion

        }
        else if (ddlReportLevel.SelectedValue == "2")
        {
            HtmlGenericControl div = new HtmlGenericControl();
            div.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            HtmlTable tblTitle = HTMLTable("100", 0, "");
            tblTitle.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            HtmlTableRow title = new HtmlTableRow();
            title.Cells.Add(Cell("MAIL", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title);

            HtmlTableRow title3 = new HtmlTableRow();
            title3.Cells.Add(Cell("National Horticulture & Livestock Project", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title3);

            HtmlTableRow title4 = new HtmlTableRow();
            title4.Cells.Add(Cell("Farmer Contribution Amount By Province", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title4);

            HtmlTable tblToExport = HTMLTable("100", 1, "black");
            tblToExport.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            //header
            HtmlTableRow headerRow = new HtmlTableRow();
            tblToExport.Rows.Add(headerRow);
            HtmlTableRow headerSubRow = new HtmlTableRow();
            headerRow.Cells.Add(CellRowSpan("S.NO", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Province", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Total Amount", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Recieved Amount", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Balance", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Year", "tableHeader", 2, "center"));
            tblToExport.Rows.Add(headerSubRow);
            dt = db.SelectRecords(@";with tbl as ( 
SELECT        ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) AS TotalAmount, FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId,
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount
                               WHERE        (FarmerId = FC_FarmerInfo.Id) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)) AS RecievedAmount, FC_Season.SeasonName, 
                         ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) -
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount AS FC_FarmerRecieveAmount_1
                               WHERE        (FarmerId = FC_FarmerInfo.Id) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)) AS balance, OCM_Province.ProvinceEngName
FROM            FC_FormerFruitDetails INNER JOIN
                         FC_FarmerInfo ON FC_FormerFruitDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
						 FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID INNER JOIN
                         OCM_Province ON FC_ExtensionWorkerInfo.ProvinceID = OCM_Province.ProvinceID INNER JOIN
                         FC_Season ON FC_FormerFruitDetails.SeasonId = FC_Season.SeasonId
WHERE        (FC_FormerFruitDetails.IsDeleted = 'false') AND (FC_FormerFruitDetails.Year = 2016) AND " + getSelectedItemsFromCheckBoxList("", "OCM_Province", "ProvinceID", chklstProvince) + ""
+"GROUP BY FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId, FC_FarmerInfo.Id, FC_Season.SeasonName, OCM_Province.ProvinceEngName )"
+"select isnull(sum(TotalAmount),0) as TotalAmount,Year,isnull(sum(RecievedAmount),0) as RecievedAmount,isnull(sum(balance),0)"
 +"as balance,ProvinceEngName from tbl "
+"group by Year,ProvinceEngName");

            if (dt.Rows.Count > 0)
            {
                int count = 1;
                double TotalAmount = 0;
                double RecievedAmount = 0;
                double Balance = 0;
                foreach (DataRow rw in dt.Rows)
                {
                    HtmlTableRow Row = new HtmlTableRow();
                    Row.Cells.Add(Cell(count.ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["ProvinceEngName"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["TotalAmount"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["RecievedAmount"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["balance"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["Year"].ToString(), "tableCell", "center"));
                    TotalAmount += Convert.ToDouble(rw["TotalAmount"].ToString());
                    RecievedAmount += Convert.ToDouble(rw["RecievedAmount"].ToString());
                    Balance += Convert.ToDouble(rw["balance"].ToString());
                    tblToExport.Rows.Add(Row);
                    count++;
                }

                HtmlTableRow footer = new HtmlTableRow();
                footer.Cells.Add(Cell("Total", "tableCellGeneral", 2, "center"));
                footer.Cells.Add(Cell(TotalAmount.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell(RecievedAmount.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell(Balance.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell("", "tableCellGeneral", "center"));
                tblToExport.Rows.Add(footer);
            }
            div.Controls.Add(tblTitle);
            div.Controls.Add(tblToExport);
            Response.Clear();
            Response.Buffer = true;

            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("content-disposition", "attachment;filename=AmountDetails.xls");
            Response.Charset = "utf-8";
            //this.EnableViewState = false;

            System.IO.StringWriter sw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);
            Response.Write(style);
            //titleTable.RenderControl(htw);
            div.RenderControl(htw);
            //Response.OutputStream.Write(new byte[] { 0xef, 0xbb, 0xbf }, 0, 3);
            Response.Write(sw.ToString());
            Response.End();
        }

    }
    private void ContributionByLeadFarmer()
    {
        if (ddlReportLevel.SelectedValue == "1")
        {
            #region region
            HtmlGenericControl div = new HtmlGenericControl();
            div.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            HtmlTable tblTitle = HTMLTable("100", 0, "");
            tblTitle.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            HtmlTableRow title = new HtmlTableRow();
            title.Cells.Add(Cell("MAIL", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title);

            HtmlTableRow title3 = new HtmlTableRow();
            title3.Cells.Add(Cell("National Horticulture & Livestock Project", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title3);

            HtmlTableRow title4 = new HtmlTableRow();
            title4.Cells.Add(Cell("Farmer Contribution Total & Recieved Amount By Region", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title4);

            HtmlTable tblToExport = HTMLTable("100", 1, "black");
            tblToExport.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            //header
            HtmlTableRow headerRow = new HtmlTableRow();
            tblToExport.Rows.Add(headerRow);
            HtmlTableRow headerSubRow = new HtmlTableRow();
            headerRow.Cells.Add(CellRowSpan("S.NO", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Region", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Extension Worker", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Father Name", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Total Amount", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Recieved Amount", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Balance", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Year", "tableHeader", 2, "center"));
            tblToExport.Rows.Add(headerSubRow);
            dt = db.SelectRecords(@";with tbl as ( 
SELECT        ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) AS TotalAmount, FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId,
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount
                               WHERE        (FarmerId = FC_FarmerInfo.Id) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)) AS RecievedAmount, FC_Season.SeasonName, 
                         ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) -
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount AS FC_FarmerRecieveAmount_1
                               WHERE        (FarmerId = FC_FarmerInfo.Id) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)) AS balance, FC_ExtensionWorkerInfo.Name, 
                         FC_ExtensionWorkerInfo.FName, OCM_Region.name AS Region
FROM            FC_FormerFruitDetails INNER JOIN
                         FC_FarmerInfo ON FC_FormerFruitDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
                         OCM_Province ON FC_FarmerInfo.ProvinceID = OCM_Province.ProvinceID INNER JOIN
                         FC_Season ON FC_FormerFruitDetails.SeasonId = FC_Season.SeasonId INNER JOIN
                         OCM_Region ON OCM_Province.Region = OCM_Region.id INNER JOIN
                         FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID
WHERE        (FC_FormerFruitDetails.IsDeleted = 'false') AND (FC_FormerFruitDetails.Year = " + ddlYear.SelectedValue + ")  AND  " + getSelectedItemsFromCheckBoxList("", "OCM_Region", "id", chklstRegion) + ""
+" GROUP BY FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId, FC_FarmerInfo.Id, FC_Season.SeasonName, FC_ExtensionWorkerInfo.Name, FC_ExtensionWorkerInfo.FName, OCM_Region.name )"
+"select isnull(sum(TotalAmount),0) as TotalAmount,Year,isnull(sum(RecievedAmount),0) as RecievedAmount ,isnull(sum(balance),0)"
+"as balance,Name,FName,region from tbl "
+"group by Year,Name,FName,region order by region");

            if (dt.Rows.Count > 0)
            {
                int count = 1;
                double TotalAmount = 0;
                double RecievedAmount = 0;
                double Balance = 0;
                foreach (DataRow rw in dt.Rows)
                {
                    HtmlTableRow Row = new HtmlTableRow();
                    Row.Cells.Add(Cell(count.ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["Region"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["Name"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["FName"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["TotalAmount"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["RecievedAmount"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["balance"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["Year"].ToString(), "tableCell", "center"));
                    TotalAmount += Convert.ToDouble(rw["TotalAmount"].ToString());
                    RecievedAmount += Convert.ToDouble(rw["RecievedAmount"].ToString());
                    Balance += Convert.ToDouble(rw["balance"].ToString());
                    tblToExport.Rows.Add(Row);
                    count++;
                }

                HtmlTableRow footer = new HtmlTableRow();
                footer.Cells.Add(Cell("Total", "tableCellGeneral", 4, "center"));
                footer.Cells.Add(Cell(TotalAmount.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell(RecievedAmount.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell(Balance.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell("", "tableCellGeneral", "center"));
                tblToExport.Rows.Add(footer);
            }
            div.Controls.Add(tblTitle);
            div.Controls.Add(tblToExport);
            Response.Clear();
            Response.Buffer = true;

            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("content-disposition", "attachment;filename=LeadFarmerDetail.xls");
            Response.Charset = "utf-8";
            //this.EnableViewState = false;

            System.IO.StringWriter sw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);
            Response.Write(style);
            //titleTable.RenderControl(htw);
            div.RenderControl(htw);
            //Response.OutputStream.Write(new byte[] { 0xef, 0xbb, 0xbf }, 0, 3);
            Response.Write(sw.ToString());
            Response.End();
            #endregion
        }
        else if (ddlReportLevel.SelectedValue == "2") {
            #region region
            HtmlGenericControl div = new HtmlGenericControl();
            div.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            HtmlTable tblTitle = HTMLTable("100", 0, "");
            tblTitle.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            HtmlTableRow title = new HtmlTableRow();
            title.Cells.Add(Cell("MAIL", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title);

            HtmlTableRow title3 = new HtmlTableRow();
            title3.Cells.Add(Cell("National Horticulture & Livestock Project", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title3);

            HtmlTableRow title4 = new HtmlTableRow();
            title4.Cells.Add(Cell("Farmer Contribution Total & Recieved Amount By Region", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title4);

            HtmlTable tblToExport = HTMLTable("100", 1, "black");
            tblToExport.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            //header
            HtmlTableRow headerRow = new HtmlTableRow();
            tblToExport.Rows.Add(headerRow);
            HtmlTableRow headerSubRow = new HtmlTableRow();
            headerRow.Cells.Add(CellRowSpan("S.NO", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Region", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Province", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Extension Worker", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Father Name", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Total Amount", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Recieved Amount", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Balance", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Year", "tableHeader", 2, "center"));
            tblToExport.Rows.Add(headerSubRow);
            dt = db.SelectRecords(@" ;with tbl as (
SELECT        ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) AS TotalAmount, FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId,
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount
                               WHERE        (FarmerId = FC_FarmerInfo.Id) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)) AS RecievedAmount, FC_Season.SeasonName, 
                         ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) -
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount AS FC_FarmerRecieveAmount_1
                               WHERE        (FarmerId = FC_FarmerInfo.Id) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)) AS balance, FC_ExtensionWorkerInfo.Name, 
                         FC_ExtensionWorkerInfo.FName, OCM_Province.ProvinceEngName, OCM_Region.name AS Region
FROM            FC_FormerFruitDetails INNER JOIN
                         FC_FarmerInfo ON FC_FormerFruitDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
                         OCM_Province ON FC_FarmerInfo.ProvinceID = OCM_Province.ProvinceID INNER JOIN
                         FC_Season ON FC_FormerFruitDetails.SeasonId = FC_Season.SeasonId INNER JOIN
                         OCM_Region ON OCM_Province.Region = OCM_Region.id INNER JOIN
                         FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID
WHERE        (FC_FormerFruitDetails.IsDeleted = 'false') AND (FC_FormerFruitDetails.Year =  " + ddlYear.SelectedValue + ") AND " + getSelectedItemsFromCheckBoxList("", "OCM_Province", "ProvinceID", chklstProvince) + ""
  + "GROUP BY FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId, FC_FarmerInfo.Id, FC_Season.SeasonName, FC_ExtensionWorkerInfo.Name, FC_ExtensionWorkerInfo.FName, OCM_Province.ProvinceEngName, OCM_Region.name )"
+"select isnull(sum(TotalAmount),0) as TotalAmount,Year,isnull(sum(RecievedAmount),0) as RecievedAmount ,isnull(sum(balance),0)"
 +"as balance,Name,FName,ProvinceEngName,region from tbl "
+"group by Year,Name,FName,ProvinceEngName,region order by ProvinceEngName");

            if (dt.Rows.Count > 0)
            {
                int count = 1;
                double TotalAmount = 0;
                double RecievedAmount = 0;
                double Balance = 0;
                foreach (DataRow rw in dt.Rows)
                {
                    HtmlTableRow Row = new HtmlTableRow();
                    Row.Cells.Add(Cell(count.ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["Region"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["ProvinceEngName"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["Name"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["FName"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["TotalAmount"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["RecievedAmount"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["balance"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["Year"].ToString(), "tableCell", "center"));
                    TotalAmount += Convert.ToDouble(rw["TotalAmount"].ToString());
                    RecievedAmount += Convert.ToDouble(rw["RecievedAmount"].ToString());
                    Balance += Convert.ToDouble(rw["balance"].ToString());
                    tblToExport.Rows.Add(Row);
                    count++;
                }

                HtmlTableRow footer = new HtmlTableRow();
                footer.Cells.Add(Cell("Total", "tableCellGeneral", 5, "center"));
                footer.Cells.Add(Cell(TotalAmount.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell(RecievedAmount.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell(Balance.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell("", "tableCellGeneral", "center"));
                tblToExport.Rows.Add(footer);
            }
            div.Controls.Add(tblTitle);
            div.Controls.Add(tblToExport);
            Response.Clear();
            Response.Buffer = true;

            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("content-disposition", "attachment;filename=LeadFarmerDetail.xls");
            Response.Charset = "utf-8";
            //this.EnableViewState = false;

            System.IO.StringWriter sw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);
            Response.Write(style);
            //titleTable.RenderControl(htw);
            div.RenderControl(htw);
            //Response.OutputStream.Write(new byte[] { 0xef, 0xbb, 0xbf }, 0, 3);
            Response.Write(sw.ToString());
            Response.End();
            #endregion
        }
    }
    private void FarmerContribution() {
        if (ddlReportLevel.SelectedValue == "1")
        {
            #region region
            HtmlGenericControl div = new HtmlGenericControl();
            div.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            HtmlTable tblTitle = HTMLTable("100", 0, "");
            tblTitle.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            HtmlTableRow title = new HtmlTableRow();
            title.Cells.Add(Cell("MAIL", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title);

            HtmlTableRow title3 = new HtmlTableRow();
            title3.Cells.Add(Cell("National Horticulture & Livestock Project", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title3);

            HtmlTableRow title4 = new HtmlTableRow();
            title4.Cells.Add(Cell("Farmer Contribution Total & Recieved Amount By Region", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title4);

            HtmlTable tblToExport = HTMLTable("100", 1, "black");
            tblToExport.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            //header
            HtmlTableRow headerRow = new HtmlTableRow();
            tblToExport.Rows.Add(headerRow);
            HtmlTableRow headerSubRow = new HtmlTableRow();
            headerRow.Cells.Add(CellRowSpan("S.No", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Region", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Extension Worker", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Farmer", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Father Name", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Total Amount", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Recieved Amount", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Balance", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Year", "tableHeader", 2, "center"));
            tblToExport.Rows.Add(headerSubRow);
            dt = db.SelectRecords(@";with tbl as ( 

SELECT        ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) AS TotalAmount, FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId,
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount
                               WHERE        (FarmerId = FC_FarmerInfo.Id) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)) AS RecievedAmount, FC_Season.SeasonName, 
                         ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) -
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount AS FC_FarmerRecieveAmount_1
                               WHERE        (FarmerId = FC_FarmerInfo.Id) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)) AS balance, FC_ExtensionWorkerInfo.Name, 
                         OCM_Region.name AS region, FC_FarmerInfo.Name AS FormerName, FC_FarmerInfo.FName
FROM            FC_FormerFruitDetails INNER JOIN
                         FC_FarmerInfo ON FC_FormerFruitDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
						 FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID INNER JOIN
                         OCM_Province ON FC_ExtensionWorkerInfo.ProvinceID = OCM_Province.ProvinceID INNER JOIN
                         FC_Season ON FC_FormerFruitDetails.SeasonId = FC_Season.SeasonId INNER JOIN
                         OCM_Region ON OCM_Province.Region = OCM_Region.id 
WHERE        (FC_FormerFruitDetails.IsDeleted = 'false') AND (FC_FormerFruitDetails.Year =  " + ddlYear.SelectedValue + ") AND " + getSelectedItemsFromCheckBoxList("", "OCM_Region", "id", chklstRegion) + ""
   +"GROUP BY FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId, FC_FarmerInfo.Id, FC_Season.SeasonName, FC_ExtensionWorkerInfo.Name, OCM_Region.name, FC_FarmerInfo.Name, FC_FarmerInfo.FName )"
+"select isnull(sum(TotalAmount),0) as TotalAmount,Year,isnull(sum(RecievedAmount),0) as RecievedAmount ,isnull(sum(balance),0)"
+"as balance,FormerName,Name,FName,region from tbl "
+"group by Year,Name,FName,region,FormerName order by region");

            if (dt.Rows.Count > 0)
            {
                int count = 1;
                double TotalAmount = 0;
                double RecievedAmount = 0;
                double Balance = 0;
                foreach (DataRow rw in dt.Rows)
                {
                    HtmlTableRow Row = new HtmlTableRow();
                    Row.Cells.Add(Cell(count.ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["Region"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["Name"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["FormerName"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["FName"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["TotalAmount"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["RecievedAmount"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["balance"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["Year"].ToString(), "tableCell", "center"));
                    TotalAmount += Convert.ToDouble(rw["TotalAmount"].ToString());
                    RecievedAmount += Convert.ToDouble(rw["RecievedAmount"].ToString());
                    Balance += Convert.ToDouble(rw["balance"].ToString());
                    tblToExport.Rows.Add(Row);
                    count++;
                }

                HtmlTableRow footer = new HtmlTableRow();
                footer.Cells.Add(Cell("Total", "tableCellGeneral", 5, "center"));
                footer.Cells.Add(Cell(TotalAmount.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell(RecievedAmount.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell(Balance.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell("", "tableCellGeneral", "center"));
                tblToExport.Rows.Add(footer);
            }
            div.Controls.Add(tblTitle);
            div.Controls.Add(tblToExport);
            Response.Clear();
            Response.Buffer = true;

            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("content-disposition", "attachment;filename=FarmerDetail.xls");
            Response.Charset = "utf-8";
            //this.EnableViewState = false;

            System.IO.StringWriter sw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);
            Response.Write(style);
            //titleTable.RenderControl(htw);
            div.RenderControl(htw);
            //Response.OutputStream.Write(new byte[] { 0xef, 0xbb, 0xbf }, 0, 3);
            Response.Write(sw.ToString());
            Response.End();
            #endregion
        }
        else if (ddlReportLevel.SelectedValue == "2")
        {
            #region region
            HtmlGenericControl div = new HtmlGenericControl();
            div.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            HtmlTable tblTitle = HTMLTable("100", 0, "");
            tblTitle.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            HtmlTableRow title = new HtmlTableRow();
            title.Cells.Add(Cell("MAIL", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title);

            HtmlTableRow title3 = new HtmlTableRow();
            title3.Cells.Add(Cell("National Horticulture & Livestock Project", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title3);

            HtmlTableRow title4 = new HtmlTableRow();
            title4.Cells.Add(Cell("Farmer Contribution Total & Recieved Amount By Region", "tableTitle", 6, "center"));
            tblTitle.Rows.Add(title4);

            HtmlTable tblToExport = HTMLTable("100", 1, "black");
            tblToExport.Style.Add(HtmlTextWriterStyle.Direction, "ltr");

            //header
            HtmlTableRow headerRow = new HtmlTableRow();
            tblToExport.Rows.Add(headerRow);
            HtmlTableRow headerSubRow = new HtmlTableRow();
            headerRow.Cells.Add(CellRowSpan("S.No", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Province", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Extension Worker", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Farmer", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Father Name", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Total Amount", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Recieved Amount", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Balance", "tableHeader", 2, "center"));
            headerRow.Cells.Add(CellRowSpan("Year", "tableHeader", 2, "center"));
            tblToExport.Rows.Add(headerSubRow);
            dt = db.SelectRecords(@";with tbl as ( 
SELECT        ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) AS TotalAmount, FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId,
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount
                               WHERE        (FarmerId = FC_FarmerInfo.Id) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)) AS RecievedAmount, FC_Season.SeasonName, 
                         ISNULL(SUM(FC_FormerFruitDetails.Amount), 0) -
                             (SELECT        ISNULL(SUM(RecievedAmount), 0) AS Expr1
                               FROM            FC_FarmerRecieveAmount AS FC_FarmerRecieveAmount_1
                               WHERE        (FarmerId = FC_FarmerInfo.Id) AND (Year = FC_FormerFruitDetails.Year) AND (SeasonId = FC_FormerFruitDetails.SeasonId)) AS balance, FC_ExtensionWorkerInfo.Name, 
                         FC_FarmerInfo.Name AS FormerName, FC_FarmerInfo.FName, OCM_Province.ProvinceEngName
FROM            FC_FormerFruitDetails INNER JOIN
                         FC_FarmerInfo ON FC_FormerFruitDetails.FarmerId = FC_FarmerInfo.Id INNER JOIN
						  FC_ExtensionWorkerInfo ON FC_FarmerInfo.ExtWId = FC_ExtensionWorkerInfo.ExtWID INNER JOIN
                         OCM_Province ON FC_ExtensionWorkerInfo.ProvinceID = OCM_Province.ProvinceID INNER JOIN
                         FC_Season ON FC_FormerFruitDetails.SeasonId = FC_Season.SeasonId 
WHERE        (FC_FormerFruitDetails.IsDeleted = 'false') AND (FC_FormerFruitDetails.Year = " + ddlYear.SelectedValue + ")AND " + getSelectedItemsFromCheckBoxList("", "OCM_Province", "ProvinceID", chklstProvince) + ""
+"GROUP BY FC_FormerFruitDetails.Year, FC_FormerFruitDetails.SeasonId, FC_FarmerInfo.Id, FC_Season.SeasonName, FC_ExtensionWorkerInfo.Name, FC_FarmerInfo.Name, FC_FarmerInfo.FName, OCM_Province.ProvinceEngName )"
+"select isnull(sum(TotalAmount),0) as TotalAmount,Year,isnull(sum(RecievedAmount),0) as RecievedAmount ,isnull(sum(balance),0)"
 +"as balance,FormerName,Name,FName,ProvinceEngName from tbl "
+"group by Year,Name,FName,ProvinceEngName,FormerName order by ProvinceEngName");
            if (dt.Rows.Count > 0)
            {
                int count = 1;
                double TotalAmount = 0;
                double RecievedAmount = 0;
                double Balance = 0;
                foreach (DataRow rw in dt.Rows)
                {
                    HtmlTableRow Row = new HtmlTableRow();
                    Row.Cells.Add(Cell(count.ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["ProvinceEngName"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["Name"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["FormerName"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["FName"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["TotalAmount"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["RecievedAmount"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["balance"].ToString(), "tableCell", "center"));
                    Row.Cells.Add(Cell(rw["Year"].ToString(), "tableCell", "center"));
                    TotalAmount += Convert.ToDouble(rw["TotalAmount"].ToString());
                    RecievedAmount += Convert.ToDouble(rw["RecievedAmount"].ToString());
                    Balance += Convert.ToDouble(rw["balance"].ToString());
                    tblToExport.Rows.Add(Row);
                    count++;
                }

                HtmlTableRow footer = new HtmlTableRow();
                footer.Cells.Add(Cell("Total", "tableCellGeneral", 5, "center"));
                footer.Cells.Add(Cell(TotalAmount.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell(RecievedAmount.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell(Balance.ToString(), "tableCellGeneral", "center"));
                footer.Cells.Add(Cell("", "tableCellGeneral", "center"));
                tblToExport.Rows.Add(footer);
            }
            div.Controls.Add(tblTitle);
            div.Controls.Add(tblToExport);
            Response.Clear();
            Response.Buffer = true;

            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("content-disposition", "attachment;filename=FarmerDetail.xls");
            Response.Charset = "utf-8";
            //this.EnableViewState = false;

            System.IO.StringWriter sw = new System.IO.StringWriter();
            System.Web.UI.HtmlTextWriter htw = new System.Web.UI.HtmlTextWriter(sw);
            Response.Write(style);
            //titleTable.RenderControl(htw);
            div.RenderControl(htw);
            //Response.OutputStream.Write(new byte[] { 0xef, 0xbb, 0xbf }, 0, 3);
            Response.Write(sw.ToString());
            Response.End();
            #endregion
        }
    }
}