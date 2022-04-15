<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="frmFarmerContribution.aspx.cs" Inherits="PCI_frmFarmerContribution" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageTitle" runat="Server">
    Farmer Contribution
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPgDescription" runat="Server">
    Details for FC here..
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPgContent" runat="Server">
    <script src="../Script/FContribution.js"></script>
    <script type="text/javascript">
        $(function () {

            $("#<%=btnUpdate.ClientID%>").hide();
            $("#<%=btnSave.ClientID%>").show();
            $('#DivPayableDate').html('');
            $("#txtPercentage").attr('disabled', 'disabled');

            $('#txtDAPInKG').empty().attr("disabled", "disabled");
            $('#txtInterCropInKG').empty().attr("disabled", "disabled");
            $('#ddlInterCrop').empty().attr("disabled", "disabled");
            $('#ddlFoodVariety').empty().attr("disabled", "disabled");

            $('#txtArea').empty().attr("disabled", "disabled");
            $('#txtAmount').empty().attr("disabled", "disabled");

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
                        url: "frmFarmerContribution.aspx/GetDistrict",
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
                        url: "frmFarmerContribution.aspx/GetExtensionW",
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
                        url: "frmFarmerContribution.aspx/GetFarmers",
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
            $("#ddlActivity").change(function () {

                if ($(this).val() == "-1") {

                    $("#ddlFruitTools").attr("disabled", "disabled");
                    $('#txtDAPInKG').val('').attr("disabled", "disabled");
                    $('#txtInterCropInKG').val('').attr("disabled", "disabled");
                    $('#ddlInterCrop').empty().attr("disabled", "disabled");
                    $('#ddlFoodVariety').empty().attr("disabled", "disabled");

                }
                else {

                    $("#ddlFruitTools").attr("disabled", false);
                    $("#txtPercentage").val('');
                    $.ajax({
                        type: "POST",
                        url: "frmFarmerContribution.aspx/GetFruitTools",
                        data: '{ActivityId: ' + $('#ddlActivity').val() + '}',
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('#ddlFruitTools').empty();
                            var count = 1;
                            $.each(data.d, function (key, value) {
                                $('#ddlFruitTools').append($("<option></option>").val(value.FruitId).html(value.FruitName));
                            });

                            $('#ddlFruitTools').prepend("<option value='-1' selected='true'>-Select-</option>");
                            $('#ddlFruitTools option:first').attr("selected", "selected");
                            //
                            if ($('#ddlActivity').val() == "1") {
                                
                                //$('#txtDAPInKG').empty().attr("disabled", false);
                                $('#txtInterCropInKG').empty().attr("disabled", false);
                                $('#ddlInterCrop').empty().attr("disabled", false);
                                $('#ddlFoodVariety').empty().attr("disabled", false);
                            } else {

                                $('#txtDAPInKG').empty().attr("disabled", "disabled");
                                $('#txtInterCropInKG').empty().attr("disabled", "disabled");
                                $('#ddlInterCrop').empty().attr("disabled", "disabled");
                                $('#ddlFoodVariety').empty().attr("disabled", "disabled");
                            }
                        },
                        error: function (data) {
                            alert("error found");
                        }

                    });


                }
            });



            //ddl Fruit
            $("#ddlFruitTools").change(function () {

                if ($(this).val() == "-1") {
                    $("#txtPercentage").attr("disabled", "disabled");
                    $('#txtArea').empty().attr("disabled", "disabled");
                    $('#txtAmount').empty().attr("disabled", "disabled");
                    $("#txtPercentage").val('');
                    $("#txtArea").val('');
                    $("#txtAmount").val('');
                    $('#txtDAPInKG').val('');
                    $('#txtInterCropInKG').val('');
                }
                else {
                    var FruitObj = JSON.stringify({ FruitId: $("#ddlFruitTools").val(), ProvinceId: $('#<%=ddlProvince.ClientID%>').val(), Year: $('#ddlYear').val() });
                    $.ajax({
                        type: "POST",
                        url: "frmFarmerContribution.aspx/GetPercentage",
                        data: FruitObj,
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (r) {
                            $('#txtArea').empty().attr("disabled",false);
                            $('#txtAmount').empty().attr("disabled",false);

                            $("#txtPercentage").val('');
                            $("#txtPercentage").val(r.d.Percentage);
                            $('#txtDAPInKG').val('');
                            $('#txtInterCropInKG').val('');
                            $("#txtArea").val('');
                            $("#txtAmount").val('');

                            if ($('#ddlActivity').val() == "1") {
                                //InterCrop
                                $('#ddlInterCrop').empty();
                                $.each(r.d.InterCropsList, function (key, value) {
                                    $('#ddlInterCrop').append($("<option></option>").val(value.Id).html(value.InterCrop));
                                });

                                $('#ddlInterCrop').prepend("<option value='-1' selected='true'>-Select-</option>");
                                $('#ddlInterCrop option:first').attr("selected", "selected");

                                //Variety
                                $('#ddlFoodVariety').empty();
                                $.each(r.d.FruitVarityList, function (key, value) {
                                    $('#ddlFoodVariety').append($("<option></option>").val(value.VarietyId).html(value.Variety));
                                });

                                $('#ddlFoodVariety').prepend("<option value='-1' selected='true'>-Select-</option>");
                                $('#ddlFoodVariety option:first').attr("selected", "selected");

                            }
                        },
                        error: function (data) {
                            alert("error found");
                        }

                    });


                }
            });
            // Count
            var mtotal = 0;
            $('#txtAmount').keyup(function () {
                if ($(this).val() != "" && $('#txtPercentage').val() != '-1') {
                    mtotal = parseFloat($(this).val()) * parseFloat($('#txtArea').val()) * parseFloat($('#txtPercentage').val()) / 100;
                    $('#txtTotalAmount').val(mtotal.toString());
                }
            });

            var m2total = 0,DAP=0,Crop=0;
            $('#txtArea').keyup(function () {
                if ($(this).val() != "" && $('#txtPercentage').val() != '-1') {
                    m2total = parseFloat($(this).val()) * parseFloat($('#txtAmount').val()) * parseFloat($('#txtPercentage').val()) / 100;
                    $('#txtTotalAmount').val(m2total.toString());
                    if ($('#ddlActivity').val() == "1") {
                        DAP = parseFloat($(this).val()) * 20;
                        $('#txtDAPInKG').val(DAP.toString());
                    } else {
                        $('#txtDAPInKG').empty();
                    }

                }
            });

            // btn Add
            $('#btnAdd').click(function (e) {
                e.preventDefault();
                var flag = true;
                var fruit = $('#ddlFruitTools').find('option:selected').text();
                if (fruit == '' || $('#ddlFruitTools').val() == '-1') { $('#ddlFruitTools').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#ddlFruitTools').css('background-color', 'white'); }

                if ($('#txtPercentage').val() == "-1" || $('#txtPercentage').val() == '') { $('#txtPercentage').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#txtPercentage').css('background-color', 'white'); }

                if ($('#ddlSeason').val() == "-1" || $('#ddlSeason').val() == '') { $('#ddlSeason').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#ddlSeason').css('background-color', 'white'); }

                if ($('#ddlYear').val() == "-1" || $('#ddlYear').val() == '') { $('#ddlYear').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#ddlYear').css('background-color','white'); }

                if ($('#txtArea').val() == '') { $('#txtArea').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#txtArea').css('background-color', 'white'); }

                if ($('#txtAmount').val() == '') { $('#txtAmount').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#txtAmount').css('background-color', 'white'); }

                if ($('#ddlFoodVariety').val() == "-1"&&$('#ddlActivity').val()=="1") { $('#ddlFoodVariety').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#ddlFoodVariety').css('background-color', 'white'); }

                if ($('#ddlInterCrop').val() == "-1" && $('#ddlActivity').val() == "1") { $('#ddlInterCrop').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#ddlInterCrop').css('background-color', 'white'); }

                if ($('#txtInterCropInKG').val() == "" && $('#ddlActivity').val() == "1") { $('#txtInterCropInKG').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#txtInterCropInKG').css('background-color', 'white'); }
                if (flag) {

                    var fruitValue = $('#ddlFruitTools').val();
                    var percentage = $('#txtPercentage').val();
                    var Area = $('#txtArea').val();
                    var amount = $('#txtTotalAmount').val();
                    var amountPerPKG = $('#txtAmount').val();
                    var season = $('#ddlSeason').find('option:selected').text();
                    var seasonValue = $('#ddlSeason').val();
                    var Year = $('#ddlYear').val();
                    var markup = "<tr><td><input type='checkbox' name='record'></td><td><span id='fruit' style='display:none'>" + fruitValue + "</span>" + fruit + "</td><td><span id='percentage'>" + percentage + "</span></td><td><span>" + Year + "</span></td><td><span id='season' style='display:none'>" + seasonValue + "</span>" + season + "</td><td><span id='area'>" + Area + "</span></td><td><span id='amntPerpKG' style='dispaly:none'>" + amountPerPKG + "</span></td><td><span id='amount'>" + amount + "</span></td><td><span>" + (parseFloat($('#txtAmount').val()) * parseFloat($('#txtArea').val())) + "</span><span id='Variety' style='display:none'>" + $('#ddlFoodVariety').val() + "</span><span id='Crop' style='display:none'>" + $('#ddlInterCrop').val() + "</span><span id='DAP' style='display:none'>" + $('#txtDAPInKG').val() + "</span><span id='CropKG' style='display:none'>" + $('#txtInterCropInKG').val() + "</span><span id='Latitude' style='display:none'>" + $('#txtLatitude').val() + "</span><span id='Longtitude' style='display:none'>" + $('#txtLongtitude').val() + "</span></td></tr>";
                    $("#tbl tbody").append(markup);
                    SumCAmount();
                    SumTAmount();
                    // clear components
                    $('#txtArea').val('');
                    $('#txtAmount').val('');
                    $('#txtTotalAmount').val('');
                    $('#txtDAPInKG').val('');
                    $('#txtInterCropInKG').val('');
                    $('#txtLongtitude').val('');
                    $('#txtLatitude').val('');
                    var d = new Date();
                    d.setDate(d.getDate() + 30);
                    $('#DivPayableDate').html('');
                    $('#DivPayableDate').html("<span><strong>Payable by Date</strong></span><br/>" + d);

                }
                else { return false; }
            });

            // Find and remove selected table rows
            $("#btnRemove").click(function (e) {
                e.preventDefault();
                $("#tbl tbody").find('input[name="record"]').each(function () {
                    if ($(this).is(":checked")) {
                        $(this).parents("tr").remove();
                        SumCAmount();
                        SumTAmount();
                    }
                });
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



        });

        function LoadShowFarmers() {
            var obj = JSON.stringify({ Id: $('#ddlExtensionW').val(), Year: $('#ddlYear').val(), SeasonId: $('#ddlSeason').val() });
            ShowFarmers(obj);
        }
        function SumCAmount() {
            var total = 0;
            $('#tbl tbody tr').each(function () {
                var tr = $(this).closest('tr');
                var Amount = $(tr).find('span:eq(6)');
                total += parseFloat($(Amount).html());
            });
            if (total != '') {
                $("#divCAmount").html('');
                var markup2 = "<strong>Total Farmer Contribution Amount :" + total.toString() + "</strong>";
                $("#divCAmount").html(markup2);
            } else { $("#divCAmount").html(''); }
        }
        function SumTAmount() {
            var ktotal = 0;
            $('#tbl tbody tr').each(function () {
                var tr = $(this).closest('tr');
                var Amount = $(tr).find('span:eq(7)');
                ktotal += parseFloat($(Amount).html());
            });
            if (ktotal != '') {
                $("#divTAmount").html('');
                var markup2 = "<strong>Total Amount :" + ktotal.toString() + "</strong>";
                $("#divTAmount").html(markup2);
            } else { $("#divTAmount").html(''); }
        }
    </script>

    <%--<div class="widget-head">
        <i class="glyphicon glyphicon-th-list"></i>Farmer Preliminary Information
        <div style="float: right; cursor: pointer;">
            <button id="btnFromerDetails" class="btn-primary"><span class="glyphicon glyphicon-search">Details</span></button>
        </div>
    </div>--%>
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
                                <asp:DropDownList ID="ddlProvince" class="form-control province" runat="server">
                                </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator2" ControlToValidate="ddlProvince" ValueToCompare="-1" Operator="NotEqual" runat="server" ErrorMessage=""></asp:CompareValidator>
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

                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="ddlExtensionW">Extension Worker</label>
                                <select class="form-control " id="ddlExtensionW"></select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="ddlFarmer">Farmer</label>
                                <select class="form-control " id="ddlFarmer"></select>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="ddlActivity">Activity</label>
                                <select class="form-control " id="ddlActivity">
                                    <option value="-1">--Select-- </option>
                                    <option value="1">New Orchard</option>
                                    <option value="2">Tools</option>
                                    <option value="3">Trellising</option>
                                </select>
                            </div>

                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="ddlFruitTools">
                                    Fruit /
                                    Tools</label>
                                <select class="form-control " id="ddlFruitTools">
                                </select>
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
                    <legend>Orchard/Tools Details</legend>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtArea">
                                    No of Orchards(Gr)
                                    /Tools</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtArea" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="ddlFoodVariety">
                                    Fruit Variety</label>
                                   <select class="form-control " id="ddlFoodVariety"></select>
                            </div>
                        </div>

                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="txtDAPInKG">
                                    DAP in KG</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtDAPInKG" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="ddlInterCrop">InterCrops</label>
                                   <select class="form-control " id="ddlInterCrop"></select>
                            </div>
                        </div>
                         <div class="col-md-2">
                            <div class="form-group">
                                <label for="txtAmount">InterCrops in KG</label>
                                     <input type="text" class="form-control" placeholder="0.00" id="txtInterCropInKG" />
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
                    <legend>Orchard Coordinates Details</legend>
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
            <div class="col-md-12   ">
                <fieldset>
                    <legend>Contribution Details</legend>
                    <div class="row">

                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="txtPercentage">
                                    Contribution %</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtPercentage" />
                            </div>
                        </div>


                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtAmount">
                                    Amount per Package/Orchard(Gr)/Tools</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtAmount" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtTotalAmount">Farmer Contribution Amount</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtTotalAmount" disabled />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <br />
                            <button id="btnAdd" class="btn btn-sm btn-primary btn-squared btn-o">Add To List <i class="fa fa-plus"></i></button>

                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <hr />
                            <table id="tbl" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Select</th>
                                        <th>Fruit</th>
                                        <th>Percentage</th>
                                        <th>Year</th>
                                        <th>Season</th>
                                        <th>Area</th>
                                        <th>Amount/PKG</th>
                                        <th>C Amount</th>
                                        <th>Total Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <button type="button" id="btnRemove" class="btn btn-sm btn-danger btn-squared btn-o"  ><i class="fa fa-trash" aria-hidden="true"></i></button>
                           

                        </div>
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-4">
                        </div>
                        <div id="divCAmount" class="col-md-4">
                        </div>
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-4">
                        </div>
                        <div id="divTAmount" class="col-md-4">
                        </div>
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-4">
                        </div>
                        <div class="col-md-4">
                            <hr />

                            <div id="DivPayableDate"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 btn">
                            <hr />
                            <asp:LinkButton ID="btnSave" class="btn btn-sm btn-success btn-wide btn-squared btnSave" runat="server" ><i class="fa fa-save" aria-hidden="true"></i> Save</asp:LinkButton>
                            <asp:LinkButton ID="btnUpdate" class="btn btn-sm btn-info btn-wide btn-squared btnUpdate" runat="server"  ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Update</asp:LinkButton>

                        </div>
                    </div>
                </fieldset>
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
    <%--Former Details Modal--%>
    <div id="MdFormerDetail" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 id="H1">Former Details</h4>
                </div>
                <div class="modal-body">

                    <div id="dvFormerDetail">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn blue" aria-hidden="true" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
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
    <input type="hidden" id="hdnFarmerId" /><input type="hidden" id="hdnExtWIdFarmerId" />
    <script>
     
    </script>
</asp:Content>

