<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="CDC.aspx.cs" Inherits="PCI_frmPCInfo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageTitle" runat="Server">
    Community CDC
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPgDescription" runat="Server">
    Details for CDC here..
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPgContent" runat="Server">
    <script src="../Script/CDC.js"></script>
    <style>
        .Red {
            color: red;
        }
    </style>
    <script type="text/javascript">

        $(function () {
            $("#<%=btnUpdate.ClientID%>").hide();
            $('#DivCDC').hide();
            //ddl district

            $("#<%=ddlProvince.ClientID%>").change(function () {

                if ($(this).val() == "-1") {

                    $("#ddlDistrict").attr("disabled", "disabled");
                    $('#DivCDC').hide();
                }
                else {

                    ShowCDC($('#<%=ddlProvince.ClientID%>').val());
                    $("#ddlDistrict").attr("disabled", false);
                    $.ajax({
                        type: "POST",
                        url: "CDC.aspx/GetDistrict",
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


                }
            });

            //ddl Extesion Worker

            $("#ddlDistrict").change(function () {

                if ($(this).val() == "-1") {

                    $("#ddlExtensionW").attr("disabled", "disabled");
                }
                else {

                    $("#ddlExtensionW").attr("disabled", false);
                    $.ajax({
                        type: "POST",
                        url: "CDC.aspx/GetExtensionW",
                        data: '{DistrictID: ' + $('#ddlDistrict').val() + '}',
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('#ddlExtensionW').empty();
                            var count = 1;
                            $.each(data.d, function (key, value) {
                                $('#ddlExtensionW').append($("<option></option>").val(value.ExtId).html(value.Name));
                            });

                            $('#ddlExtensionW').prepend("<option value='-1' selected='true'>-Select-</option>");
                            $('#ddlExtensionW option:first').attr("selected", "selected");
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
                    SaveCDC(province);
                }
            });


            //btn update
            $("#<%=btnUpdate.ClientID%>").click(function (e) {
                e.preventDefault();
                if (formValidation(e)) {
                    var province = $("#<%=ddlProvince.ClientID%>").val();
                    UpdateCDC(province);
                }
            });

        });
    </script>
    <div class="container-fluid container-fullw bg-white">
        <div class="row">
            <div class="col-md-1">
            </div>
            <div class="col-md-10">
                <fieldset>
                    <legend>CDC Preliminary Information</legend>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlProvince">Province</label>
                                <asp:DropDownList ID="ddlProvince" CssClass="form-control province" runat="server">
                                </asp:DropDownList>
                            </div>

                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlDistrict">District</label>
                                <select class="form-control district" id="ddlDistrict"></select>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtCode">CDC Code</label>
                                <input type="text" class="form-control" placeholder="Village" id="txtCode" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtCDCName">Community Name</label>
                                <input type="text" class="form-control" placeholder=" PC Name" id="txtCDCName" />
                            </div>
                        </div>
                        <div class="col-md-6">

                            <span>Chairman Name</span>
                            <input type="text" class="form-control" placeholder="Father Name" id="txtChairmanName" />

                        </div>

                    </div>
                    <div class="row">

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtContactNo">Chairman Contact No</label>
                                <input type="text" class="form-control" placeholder="Contact No" id="txtContactNo" />
                            </div>
                        </div>
                      <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtBankAccount">Bank Account</label>
                                <input type="text" class="form-control" placeholder="Contact No" id="txtBankAccount" />
                            </div>
                        </div>
                          <div class="col-md-12">
                            <div class="form-group">
                                <label for="ddlExtensionW">Extension Worker</label>
                                <select class="form-control " id="ddlExtensionW"></select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 btn">
                            <br />
                            <asp:Button ID="btnUpdate" class="btn-sm btn-success update" runat="server" Text="Update" />
                            <asp:Button ID="btnSave" class="btn-sm btn-primary save" runat="server" Text="Save" />
                            <hr />
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="col-md-1">
            </div>
        </div>


        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <strong>PC Basic Information</strong>

                    </div>
                    <div class="panel-body">
                        <div id="DivCDC">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>

        </div>
    </div>


    
    <input type="hidden" id="hdnCDCId" />
</asp:Content>

