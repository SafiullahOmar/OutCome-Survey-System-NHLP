<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="frmExtensionWInfo.aspx.cs" Inherits="PCI_frmExtensionWInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style>
        .Red {
            color: red;
        }
    </style>
    <script src="../Script/SaveExtensionWorker.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#<%=btnUpdate.ClientID%>").hide();
            $("#<%=btnSave.ClientID%>").show();
            $('#ExtW').hide();
            //ShowControlsByRoles();
            $("input:radio[name=rdSex][value='True']").prop('checked', 'checked');
            //ddl district

            $("#<%=ddlProvince.ClientID%>").change(function () {

                if ($(this).val() == "-1") {

                    $("#ddlDistrict").attr("disabled", "disabled");
                    $('#<%=ddlPC.ClientID%>').attr("disabled", "disabled");
                }
                else {
                   
                    $("#ddlDistrict").attr("disabled", false);
                    $('#<%=ddlPC.ClientID%>').attr("disabled", false);
                    //Gridview List for Extension Workers
                    ShowExtensionWorkers($('#<%=ddlProvince.ClientID%>').val());
                    //ShowControlsByRoles();
                    $.ajax({
                        type: "POST",
                        url: "frmExtensionWInfo.aspx/GetDistrict",
                        data: '{ProvinceID: ' + $('#<%=ddlProvince.ClientID%>').val() + '}',
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('#ddlDistrict').empty();
                            $.each(data.d, function (key, value) {
                                $('#ddlDistrict').append($("<option></option>").val(value.DistrictId).html(value.DistrictName));
                            });
                            $('#ddlDistrict').prepend("<option value='-1' selected='true'>-Select-</option>");
                            $('#ddlDistrict option:first').attr("selected", "selected");
                        },
                        error: function (data) {
                            alert("error found");
                        }

                    });

                   
                    //Pc Dropdown list
                    $.ajax({
                        type: "POST",
                        url: "frmExtensionWInfo.aspx/GetPC",
                        data: '{ProvinceID: ' + $('#<%=ddlProvince.ClientID%>').val() + '}',
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('#<%=ddlPC.ClientID%>').empty();
                            $.each(data.d, function (key, value) {
                                $('#<%=ddlPC.ClientID%>').append($("<option></option>").val(value.PCId).html(value.Name));
                            });
                            $('#<%=ddlPC.ClientID%>').prepend("<option value='-1' selected='true'>-Select-</option>");
                            $('#<%=ddlPC.ClientID%> option:first').attr("selected", "selected");
                        },
                        error: function (data) {
                            alert("error found");
                        }

                    });


                }
            });

            //btn Save
            $("#<%=btnSave.ClientID%>").click(function (e) {
                e.preventDefault();
                if (formValidation(e)) {
                    var province = $("#<%=ddlProvince.ClientID%>").val();
                    var gender = $("input:radio[name^='rdSex']:checked").val();
                    var year = $("#<%=ddlYear.ClientID%>").val();
                    var activity = $("#<%=ddlActivity.ClientID%>").val();
                    var PC = $("#<%=ddlPC.ClientID%>").val();
                    var Percentage = $("#<%=ddlPercentage.ClientID%>").val();
                    SaveExtensionWorker(province, gender, year, activity,PC,Percentage);
                }
            });

            //btn Update
            $("#<%=btnUpdate.ClientID%>").click(function (e) {
                e.preventDefault();
                if (formValidation(e)) {
                    var province = $("#<%=ddlProvince.ClientID%>").val();
                    var gender = $("input:radio[name^='rdSex']:checked").val();
                    var year = $("#<%=ddlYear.ClientID%>").val();
                    var activity = $("#<%=ddlActivity.ClientID%>").val();
                    var PC = $("#<%=ddlPC.ClientID%>").val();
                    var Percentage = $("#<%=ddlPercentage.ClientID%>").val();
                    Update(province, gender, year, activity, PC,Percentage);
                }
            });

        });
    </script>
    <div class="widget-head">
        <i class="glyphicon glyphicon-th-list"></i>Lead Farmer Information 
        <div style="float: right; cursor: pointer;">
            <button id="btnLoadSearchMd" class="btn-primary"><span class="glyphicon glyphicon-search">Search</span></button>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-2">
        </div>
        <div class="col-lg-8">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <strong>Preliminary Information</strong>
                </div>
                <div class="panel-body">

                    <div class="row">
                        <div class="col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Province</span>
                                <asp:DropDownList ID="ddlProvince" CssClass="form-control province" runat="server">
                                </asp:DropDownList>

                            </div>
                            <asp:CompareValidator ID="CompareValidator3" ValueToCompare="-1" Operator="NotEqual" ControlToValidate="ddlProvince" runat="server" ErrorMessage="***"></asp:CompareValidator>
                        </div>
                        <div class="col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">District</span>
                                <select class="form-control district" id="ddlDistrict"></select>

                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="input-group">
                                <span class="input-group-addon">Village</span>
                                <input type="text" class="form-control" placeholder="Village" id="txtVillage" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="input-group">
                                <span class="input-group-addon">Sex</span>
                                <div class="form-control">
                                    <label>
                                        <input type="radio" name="rdSex" class="radio-inline" value="True" />Male
                                    </label>
                                    <label>
                                        <input type="radio" name="rdSex" class="radio-inline" value="False" />Female</label>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">

                            <span style="font-weight: bold">Name of Lead Farmer</span>
                            <input type="text" class="form-control" placeholder=" Lead Former Name" id="txtName" />

                        </div>
                        <div class="col-lg-6">

                            <span style="font-weight: bold">Father Name</span>
                            <input type="text" class="form-control" placeholder="Father Name" id="txtFatherName" />

                        </div>

                    </div>
                    <div class="row">

                        <div class="col-lg-6">

                            <span style="font-weight: bold">Contact No</span>
                            <input type="text" class="form-control" placeholder="Contact No" id="txtContactNo" />

                        </div>
                        <div class="col-lg-6">

                            <span style="font-weight: bold">Year</span>
                            <asp:DropDownList ID="ddlYear" CssClass="form-control year" runat="server">
                            </asp:DropDownList>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ddlYear" Operator="NotEqual" ValueToCompare="-1" ErrorMessage="***"></asp:CompareValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">

                            <span style="font-weight: bold;">Activity</span>
                            <asp:DropDownList ID="ddlActivity" CssClass="form-control activity" runat="server">
                            </asp:DropDownList>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ddlActivity" Operator="NotEqual" ValueToCompare="-1" ErrorMessage="***"></asp:CompareValidator>
                        </div>
                        <div class="col-lg-12">
                            <hr />
                        </div>
                         <div class="col-lg-12">

                            <span style="font-weight: bold;">Contribution Percentage</span>
                            <asp:DropDownList ID="ddlPercentage" CssClass="form-control Percentage" runat="server">
                                <asp:ListItem Text="--Select--" Value="-1"> </asp:ListItem>
                                <asp:ListItem Text="100%" Value="100"></asp:ListItem>
                                <asp:ListItem Text="75%" Value="75"></asp:ListItem>
                                <asp:ListItem Text="50%" Value="50"></asp:ListItem>
                                <asp:ListItem Text="35%" Value="35"></asp:ListItem>
                                <asp:ListItem Text="25%" Value="25"></asp:ListItem>
                                <asp:ListItem Text="10%" Value="10"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="ddlPercentage" Operator="NotEqual" ValueToCompare="-1" ErrorMessage="***"></asp:CompareValidator>
                        </div>
                        <div class="col-lg-12">

                            <span style="font-weight: bold;">PC Name</span>
                            <asp:DropDownList ID="ddlPC" CssClass="form-control PC" runat="server">
                            </asp:DropDownList>
                            <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="ddlPC" Operator="NotEqual" ValueToCompare="-1" ErrorMessage="***"></asp:CompareValidator>
                        </div>
                        <div class="col-lg-12">
                            <span style="font-weight: bold">Extension Worker Name</span>
                            <input type="text" class="form-control" placeholder="Extension Worker Name" id="txtExtWorkerName" />
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-lg-12 btn">
                            <br />
                            <asp:Button ID="btnUpdate" class="btn-sm btn-success btnUpdate" runat="server" Text="Update" />
                            <asp:Button ID="btnSave" class="btn-sm btn-primary btnSave" runat="server" Text="Save" />
                            <hr />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-2">
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <strong>Preliminary Information</strong>

                </div>
                <div class="panel-body">
                    <div id="ExtW">
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-1"></div>

    </div>
    <%--Alert Modal--%>

    <div id="MdAlert" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 id="IdH3Title"></h4>
                </div>
                <div class="modal-body">

                    <div id="IdMessage">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn blue" aria-hidden="true" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdnLeadFId" />
</asp:Content>

