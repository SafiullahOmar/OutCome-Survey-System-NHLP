<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="CDCProjectsInstallments.aspx.cs" Inherits="CIG_PlasticTunnel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPageTitle" runat="Server">
    CDC Projects Installment Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPgDescription" runat="Server">
    CDC Projects Installment Details here..
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPgContent" runat="Server">
    <script src="../Script/CDCProjectsInstallments.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#<%=btnUpdate.ClientID%>").hide();
            $("#<%=btnSave.ClientID%>").show();
            $('#txtTax').attr("disabled", "disabled");
            $('#txtBankTransfer').attr("disabled", "disabled");
            $('#txtNetInstallment').attr("disabled", "disabled");
            //ddl province

            $("#<%=ddlProvince.ClientID%>").change(function () {
                if ($(this).val() == "-1") {
                    $("#ddlDistrict").attr("disabled", "disabled");
                }
                else {
                    $("#ddlDistrict").attr("disabled", false);
                    $.ajax({
                        type: "POST",
                        url: "CDCProjectsInstallments.aspx/GetDistrict",
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
                        url: "CDCProjectsInstallments.aspx/GetExtensionW",
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

            //ddl Extesion Worker

            $("#ddlExtensionW").change(function () {

                if ($(this).val() == "-1") {

                    $("#ddlCDCCode").attr("disabled", "disabled");
                }
                else {

                    $("#ddlCDCCode").attr("disabled", false);
                    var ExtObj = JSON.stringify({ ExtWId: $('#ddlExtensionW').val() });
                    $.ajax({
                        type: "POST",
                        url: "CDCProjectsInstallments.aspx/GetCDC",
                        data:ExtObj,
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('#ddlCDCCode').empty();
                            var count = 1;
                            $.each(data.d, function (key, value) {
                                $('#ddlCDCCode').append($("<option></option>").val(value.CommunityId).html(value.Detail));
                            });

                            $('#ddlCDCCode').prepend("<option value='-1' selected='true'>-Select-</option>");
                            $('#ddlCDCCode option:first').attr("selected", "selected");
                            
                        },
                        error: function (data) {
                            alert("error found");
                        }

                    });


                }
            });


            //ddl CDC

            $("#ddlCDCCode").change(function () {

                if ($(this).val() == "-1") {

                    $("#ddlOwner").attr("disabled", "disabled");
                }
                else {

                    $("#ddlOwner").attr("disabled", false);
                    var CDCObj = JSON.stringify({ CDCId: $('#ddlCDCCode').val(), Year: $('#ddlYear').val(), SeasonId: $('#ddlSeason').val() });
                    $.ajax({
                        type: "POST",
                        url: "CDCProjectsInstallments.aspx/GetProjectOwner",
                        data: CDCObj,
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('#ddlOwner').empty();
                            var count = 1;
                            $.each(data.d, function (key, value) {
                                $('#ddlOwner').append($("<option></option>").val(value.ProjectId).html(value.Detail));
                            });

                            $('#ddlOwner').prepend("<option value='-1' selected='true'>-Select-</option>");
                            $('#ddlOwner option:first').attr("selected", "selected");
                            LoadShowProjectLists();
                        },
                        error: function (data) {
                            alert("error found");
                        }

                    });


                }
            });

            //ddl Owner
            $('#ddlOwner').change(function () {
                if ($(this).val() == "-1") {
                    $('#ddlInstallment').attr("disabled", "disbaled");
                }
                else {
                    $('#ddlInstallment').attr("disabled",false);
                    LoadShowProjectLists();
                }
            });

            //ddl %

            $("#ddlPercentage").change(function () {

                if ($(this).val() == "-1") {
                    
                    $('#txtTax').val('');
                    $('#txtBankTransfer').val('');
                    $('#txtNetInstallment').val('');

                }
                else {

                    var OwnerObj = JSON.stringify({ CDCId: $('#ddlCDCCode').val(), Year: $('#ddlYear').val(), SeasonId: $('#ddlSeason').val(),ProjectId:$('#ddlOwner').val() });
                    $.ajax({
                        type: "POST",
                        url: "CDCProjectsInstallments.aspx/GetProjectOwnerPayDetail",
                        data: OwnerObj,
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            var tax = parseFloat(data.d) * parseFloat($("#ddlPercentage").val()) * 0.07;
                            var NetPay = (parseFloat(data.d) * parseFloat($("#ddlPercentage").val())) - parseFloat(tax) - 80;
                            $('#txtTax').val(tax);
                            $('#txtBankTransfer').val('80');
                            $('#txtNetInstallment').val(NetPay);
                        },
                        error: function (data) {
                            alert("error found");
                        }

                    });


                }
            });

            $('#<%=btnSave.ClientID%>').click(function (e) {
                e.preventDefault();
                if (formValidation(e)) {
                    SaveInstallments();
                }
            });

            //update Form information

            $('#<%=btnUpdate.ClientID%>').click(function (e) {
                e.preventDefault();
                if (formValidation(e)) {
                    Update();
                }
            });


            var Atotal = 0;
            $('#txtSeeds').keyup(function () {
                if ($(this).val() != "") {
                    $('#txtArea').val('250');
                } else {
                    $('#txtArea').val('');
                }
            });



        });

        function LoadShowProjectLists() {
            var obj = JSON.stringify({ CommunityId: $('#ddlCDCCode').val(), ProjectId: $('#ddlOwner').val() });
            ShowInstallments(obj);
        }
    </script>

    <div class="container-fluid container-fullw bg-white">

        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10   ">
                <fieldset>
                    <legend>Farmer Details</legend>

                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="ddlYear">Year</label>
                                <select class="form-control " id="ddlYear">
                                    <option value="-1">--Select-- </option>
                                    <option value="2016">2016 </option>
                                    <option value="2017">2017</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="ddlSeason">Season</label>
                                <select class="form-control " id="ddlSeason">
                                    <option value="-1">--Select-- </option>
                                    <option value="1">Fall</option>
                                    <option value="2">Spring</option>
                                </select>
                            </div>

                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="ddlProvince">Province</label>
                                <asp:dropdownlist id="ddlProvince" class="form-control province" runat="server">
                                </asp:dropdownlist>
                                <asp:comparevalidator id="CompareValidator2" controltovalidate="ddlProvince" valuetocompare="-1" operator="NotEqual" runat="server" errormessage=""></asp:comparevalidator>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="ddlDistrict">District</label>
                                <select class="form-control " id="ddlDistrict"></select>
                            </div>
                        </div>
                        
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlExtensionW">Extension Worker</label>
                                <select class="form-control " id="ddlExtensionW"></select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlCDCCode">Community Code</label>
                                <select class="form-control " id="ddlCDCCode"></select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlProject">Owner Name</label>
                                <select class="form-control " id="ddlOwner">
                                </select>
                            </div>
                        </div>

                    </div>
                </fieldset>
            </div>
            <div class="col-md-1"></div>
        </div>
        
        <div class="row bg-light-grey">
            <div class="col-md-12">
                <fieldset>
                    <legend>Orchard Details</legend>
                    <div class="row">
                        
                         <div class="col-md-3">
                            <div class="form-group">
                                <label for="ddlInstallment">Installment</label>
                                <select class="form-control " id="ddlInstallment">
                                    <option value="-1">--Select--</option>
                                    <option value="1">1st Installment</option>
                                    <option value="2">2nd Installment</option>
                                    <option value="3">3rd Installment</option>
                                    <option value="4">4th Installment</option>
                                </select>
                            </div>
                        </div>
                         <div class="col-md-3">
                            <div class="form-group">
                                <label for="ddlPercentage">% from Total NHLP Payable Cost</label>
                                <select class="form-control " id="ddlPercentage">
                                     <option value="-1">--Select--</option>
                                    <option value="0.25">25 %</option>
                                    <option value="0.40">40 %</option>
                                    <option value="0.50">50 %</option>
                                    <option value="0.75">75 %</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtTax">
                                    '7%' tax deduction</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtTax" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtBankTransfer">
                                   Bank Transfer Fee
                                </label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtBankTransfer" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="txtNetInstallment">
                                   Installment-Net Payment
                                </label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtNetInstallment" />
                            </div>
                        </div>

                    </div>

                </fieldset>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 btn">
                <hr />
                <asp:linkbutton id="btnSave" class="btn btn-sm btn-success btn-wide btn-squared btnSave" runat="server"><i class="fa fa-save" aria-hidden="true"></i> Save</asp:linkbutton>
                <asp:linkbutton id="btnUpdate" class="btn btn-sm btn-info btn-wide btn-squared btnUpdate" runat="server"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Update</asp:linkbutton>

            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <strong>Preliminary Information</strong>

                    </div>
                    <div class="panel-body">
                        <div id="DivCDCProjectsDetail">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>

        </div>
    </div>

    <input type="hidden" id="hdnCommunityId" /><input type="hidden" id="hdnProjectId" />



    <%--codes for plastic tunnel--%>
</asp:Content>

