<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Saffron.aspx.cs" Inherits="CIG_CIGMale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPageTitle" runat="Server">
    Saffron Production
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPgDescription" runat="Server">
    Details for Saffron Production are here..
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPgContent" runat="Server">
    <script src="../Script/SaffronProduction.js"></script>
    <script type="text/javascript">
        $(function () {

            $("#<%=btnUpdate.ClientID%>").hide();
            $("#<%=btnSave.ClientID%>").show();

            //ddl province

            $("#<%=ddlProvince.ClientID%>").change(function () {
                if ($(this).val() == "-1") {
                    $("#ddlDistrict").attr("disabled", "disabled");
                }
                else {
                    $("#ddlDistrict").attr("disabled", false);
                    $.ajax({
                        type: "POST",
                        url: "Saffron.aspx/GetDistrict",
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
                        url: "Saffron.aspx/GetExtensionW",
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

            //ddl Farmer
            $("#ddlExtensionW").change(function () {

                if ($(this).val() == "-1") {

                    $("#ddlFarmer").attr("disabled", "disabled");
                }
                else {

                    $("#ddlFarmer").attr("disabled", false);
                    $("#ddlYear").attr("disabled", false);
                    var ExtObj = JSON.stringify({ ExtWId: $('#ddlExtensionW').val() });
                    $.ajax({
                        type: "POST",
                        url: "Saffron.aspx/GetFarmers",
                        data: ExtObj,
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('#ddlFarmer').empty();
                            var count = 1;
                            $.each(data.d, function (key, value) {
                                $('#ddlFarmer').append($("<option></option>").val(value.FarmerId).html(value.Name));
                            });

                            $('#ddlFarmer').prepend("<option value='-1' selected='true'>-Select-</option>");
                            $('#ddlFarmer option:first').attr("selected", "selected");
                        },
                        error: function (data) {
                            alert("error found");
                        }

                    });

                    LoadShowFarmers();

                }
            });


            //Save Form information

            $('#<%=btnSave.ClientID%>').click(function (e) {
                e.preventDefault();
                if (formValidation(e)) {
                    SaveFormerInfo();
                }
            });

            //update Form information

            $('#<%=btnUpdate.ClientID%>').click(function (e) {
                e.preventDefault();
                if (formValidation(e)) {
                    Update();
                }
            });


            var Ftotal = 0;
            $('#txtArea').keyup(function () {
                if ($(this).val() != "") {
                    Ftotal = parseFloat($(this).val()) * 0.4;
                    $('#txtSaffron').val(Ftotal.toString());
                } else {
                    $('#txtSaffron').val('');
                }
            });


        });

        function LoadShowFarmers() {
            var obj = JSON.stringify({ Id: $('#ddlExtensionW').val(), Year: $('#ddlYear').val(), SeasonId: $('#ddlSeason').val() });
            ShowFarmers(obj);
        }
    </script>

    <div class="container-fluid container-fullw bg-white">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10   ">
                <fieldset>
                    <legend>Farmer Details</legend>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlYear">Year</label>
                                <select class="form-control " id="ddlYear">
                                    <option value="-1">--Select-- </option>
                                    <option value="2016">2016 </option>
                                    <option value="2017">2017</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlSeason">Season</label>
                                <select class="form-control " id="ddlSeason">
                                    <option value="-1">--Select-- </option>
                                    <option value="1">Fall</option>
                                    <option value="2">Spring</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlProvince">Province</label>
                                <asp:dropdownlist id="ddlProvince" class="form-control province" runat="server">
                                </asp:dropdownlist>
                                <asp:comparevalidator id="CompareValidator2" controltovalidate="ddlProvince" valuetocompare="-1" operator="NotEqual" runat="server" errormessage=""></asp:comparevalidator>
                            </div>
                        </div>


                    </div>
                    <div class="row">

                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlDistrict">District</label>
                                <select class="form-control " id="ddlDistrict"></select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlExtensionW">Extension Worker</label>
                                <select class="form-control " id="ddlExtensionW"></select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlFarmer">Farmer</label>
                                <select class="form-control " id="ddlFarmer"></select>
                            </div>
                        </div>

                    </div>
                </fieldset>
            </div>
            <div class="col-md-1"></div>
        </div>
        <div class="row bg-light-grey">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <fieldset>
                    <legend>Details</legend>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtArea">
                                    Area (Meter Sqr)</label>
                                <input type="text" class="form-control" placeholder="0.00"  id="txtArea"  />
                            </div>

                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtGarden">
                                    Saffron Per KG</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtSaffron" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtLongtitude">
                                    Longtitude</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtLongtitude" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtLatitude">
                                    Latitude</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtLatitude" />
                            </div>
                        </div>
                    </div>


                </fieldset>
            </div>
            <div class="col-md-2"></div>
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
                        <div id="DivFarmers">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>

        </div>
    </div>
    <input type="hidden" id="hdnFarmerId" /><input type="hidden" id="hdnExtWIdFarmerId" /><input type="hidden" id="hdnFarmerActivityId" />
</asp:Content>

