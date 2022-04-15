<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="DemoOrchard.aspx.cs" Inherits="CIG_CIGMale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPageTitle" runat="Server">
    Demo Orchard
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPgDescription" runat="Server">
    Details for Demo Orchard are here..
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPgContent" runat="Server">
    <script src="../Script/DemoOrchard.js"></script>
    <script type="text/javascript">
        $(function () {

            $("#<%=btnUpdate.ClientID%>").hide();
            $("#<%=btnSave.ClientID%>").show();
            LoadFruit();
            //ShowControlsByRoles();
            //ddl province

            $("#<%=ddlProvince.ClientID%>").change(function () {
                if ($(this).val() == "-1") {
                    $("#ddlDistrict").attr("disabled", "disabled");
                }
                else {
                    $("#ddlDistrict").attr("disabled", false);
                    $.ajax({
                        type: "POST",
                        url: "DemoOrchard.aspx/GetDistrict",
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
                        url: "DemoOrchard.aspx/GetExtensionW",
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
                        url: "DemoOrchard.aspx/GetFarmers",
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


            //ddl Fruit

            $("#ddlFruitType").change(function () {
                if ($(this).val() == "-1") {
                    $("#ddlVariety").attr("disabled", "disabled");
                    $("#ddlVariety").val('-1');
                    $("#ddlDensity").attr("disabled", "disabled");
                    $("#ddlDensity").val('-1');
                    $('#txtAreaInGerib').empty().attr("disabled", "disabled");
                    $('#txtNoOfTrees').empty().attr("disabled", "disabled");
                    $("#txtAreaInGerib").val('');
                    $("#txtNoOfTrees").val('');

                }
                else {

                    $.ajax({
                        type: "POST",
                        url: "DemoOrchard.aspx/GetVaiety",
                        data: '{FruitId: ' + $('#ddlFruitType').val() + '}',
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (r) {
                            $("#ddlVariety").attr("disabled", false);
                            $("#ddlDensity").attr("disabled", false);
                            $('#txtAreaInGerib').attr("disabled", false);
                            $('#txtNoOfTrees').attr("disabled", false);


                            //Variety
                            $('#ddlVariety').empty();
                            $.each(r.d, function (key, value) {
                                $('#ddlVariety').append($("<option></option>").val(value.VarietyId).html(value.Variety));
                            });

                            $('#ddlVariety').prepend("<option value='-1' selected='true'>-Select-</option>");

                            $('#ddlVariety option:first').attr("selected", "selected");


                        },
                        error: function (data) {
                            alert("error found");
                        }

                    });


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

            // Get Former Information by Lead former

            $('#btnFromerDetails').click(function (e) {
                e.preventDefault();
                var LeadFormer = $('#ddlLeadFormer').val();
                var LeadFormerText = $('#ddlLeadFormer').find('option:selected').text();
                LoadFormerInformation(LeadFormer, LeadFormerText);
            });

            var Ptotal = 0;
            $('#txtEstablishedByProject').keyup(function () {
                if ($(this).val() != "") {
                    Ptotal = parseFloat($(this).val()) + parseFloat($('#txtEstablishedByFarmer').val());
                    $('#txtAreaInGerib').val(Ptotal.toString());
                }
            });

            var Ftotal = 0;
            $('#txtEstablishedByFarmer').keyup(function () {
                if ($(this).val() != "") {
                    Ftotal = parseFloat($(this).val()) + parseFloat($('#txtEstablishedByProject').val());
                    $('#txtAreaInGerib').val(Ftotal.toString());
                }
            });

            $('#txtRehabilited').keyup(function () {
                if (parseFloat($('#txtAreaInGerib').val()) < parseFloat($(this).val())) {
                    $(this).val('');
                    $.alert({
                        icon: 'glyphicon glyphicon-saved',
                        closeIcon: true,
                        title: 'Alert',
                        content: 'Rehabilited area Should not be <strong>MORE</strong> than Total Area!'
                    });
                }
            });

        });

        function LoadShowFarmers() {
            var obj = JSON.stringify({ Id: $('#ddlExtensionW').val(), Year: $('#ddlYear').val(), SeasonId: $('#ddlSeason').val() });
            ShowFarmers(obj);
        }
        function FruitVariety(edit, value) {
            alert(edit);
            $("#ddlFruitType").trigger("change");

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
                                <asp:DropDownList ID="ddlProvince" class="form-control province" runat="server">
                                </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator2" ControlToValidate="ddlProvince" ValueToCompare="-1" Operator="NotEqual" runat="server" ErrorMessage=""></asp:CompareValidator>
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
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <fieldset>
                    <legend>Orchard Details</legend>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="ddlFruitType">
                                    Fruit Type</label>
                                <select class="form-control " id="ddlFruitType"></select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="ddlVariety">
                                    Variety</label>
                                <select class="form-control " id="ddlVariety"></select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="txtAreaInGerib">Area(Gerib)</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtAreaInGerib" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="txtNoOfTrees">
                                    No Of Trees</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtNoOfTrees" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="ddlDensity">
                                    Density</label>
                                <select class="form-control " id="ddlDensity">
                                    <option value="-1">--Select--</option>
                                    <option value="1">Medium</option>
                                    <option value="2">High</option>
                                </select>
                            </div>
                        </div>


                    </div>


                </fieldset>
            </div>
            <div class="col-md-1"></div>
        </div>
        <div class="row bg-light-grey">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <fieldset>
                    <legend>GPS Coordinates Details</legend>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtLongtitude">
                                    Longtitude</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtLongtitude" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtLatitude">
                                    Latitude</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtLatitude" />
                            </div>
                        </div>
                    </div>


                </fieldset>
            </div>
            <div class="col-md-3"></div>
        </div>

        <div class="row">
            <div class="col-md-12 btn">
                <hr />
                <asp:LinkButton ID="btnSave" class="btn btn-sm btn-success btn-wide btn-squared btnSave" runat="server"><i class="fa fa-save" aria-hidden="true"></i> Save</asp:LinkButton>
                <asp:LinkButton ID="btnUpdate" class="btn btn-sm btn-info btn-wide btn-squared btnUpdate" runat="server"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Update</asp:LinkButton>

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

    <input type="hidden" id="hdnFarmerId" /><input type="hidden" id="hdnExtWIdFarmerId" /><input type="hidden" id="hdnFarmerActivityId" /><input type="hidden" id="hdnDetailId" />

</asp:Content>

