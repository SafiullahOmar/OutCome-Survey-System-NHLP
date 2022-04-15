<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="frmReport.aspx.cs" Inherits="PCI_frmReport" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageTitle" runat="Server">
    Reports
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPgDescription" runat="Server">
    Details for REport here..
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPgContent" runat="Server">
    <style>
        .ov {
            overflow-y: scroll;
        }
    </style>
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid container-fullw bg-white">
        <div class="row">
            <div class="col-md-1">
            </div>
            <div class="col-md-10">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="ddlReportLevel">Report Level</label>
                                    <asp:DropDownList ID="ddlReportLevel" CssClass="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlReportLevel_SelectedIndexChanged">
                                        <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                        <asp:ListItem Text="Region" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Province" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="District" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="ddlReportType">Report Type</label>
                                    <asp:DropDownList ID="ddlReportType" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                        <asp:ListItem Text="Collection Amount Detail" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Amount Details by Extension Worker " Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Farmer Contribution" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label for="ddlYear">Year</label>
                                    <asp:DropDownList ID="ddlYear" CssClass="form-control" runat="server">
                                        <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                                        <asp:ListItem Text="2015" Value="2015"></asp:ListItem>
                                        <asp:ListItem Text="2016" Value="2016"></asp:ListItem>
                                        <asp:ListItem Text="2017" Value="2017"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                        </div>
                        <hr />

                        <div class="row">
                            <div class="col-md-4 ">
                                <div class="panel panel-white">
                                    <div class="panel-heading">
                                        Region
                                    </div>
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <asp:CheckBoxList ID="chklstRegion" AutoPostBack="true" Height="205px" CssClass="form-control ov" runat="server" OnSelectedIndexChanged="chklstRegion_SelectedIndexChanged">
                                            </asp:CheckBoxList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div id="Div1" class="panel panel-white">
                                    <div class="panel-heading">
                                        Province
                                    </div>
                                    <div class="panel-body"  style="height:250px;">
                                        <div class="form-group">
                                            <asp:CheckBoxList ID="chklstProvince" runat="server" Height="205px" CssClass="form-control ov" AutoPostBack="true" OnSelectedIndexChanged="chklstProvince_SelectedIndexChanged"></asp:CheckBoxList>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="col-md-4">
                                <div id="Div2" class="panel panel-white">
                                    <div class="panel-heading">
                                        District
                                    </div>
                                    <div class="panel-body" style="height:250px;">
                                        <div class="form-group">
                                            <asp:CheckBoxList ID="chklstDistrict" Height="205px" CssClass="form-control ov" runat="server"></asp:CheckBoxList>
                                        </div>
                                    </div>
                                </div>

                            </div>


                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <hr />
                <div class="row">
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-6">
                        <asp:Button ID="btnGenerate" CssClass="btn btn-success btn-block" runat="server" Text="Generate Report" OnClick="btnGenerate_Click" />
                    </div>
                    <div class="col-md-3">
                    </div>
                </div>
            </div>
            <div class="col-md-1">
            </div>
        </div>
    </div>
</asp:Content>

