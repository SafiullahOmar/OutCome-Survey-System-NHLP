<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="PlasticTunnel.aspx.cs" Inherits="CIG_PlasticTunnel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPageTitle" runat="Server">
   Plastic Tunneling
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPgDescription" runat="Server">
    Details for CIG Male are here..
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPgContent" runat="Server">
    <script src="../Script/PlasticTunnel.js"></script>
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
                        url: "PlasticTunnel.aspx/GetDistrict",
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
                        url: "PlasticTunnel.aspx/GetExtensionW",
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
                        url: "PlasticTunnel.aspx/GetFarmers",
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


            // btn Add
            $('#btnAdd').click(function (e) {
                e.preventDefault();
                var flag = true;
                var fruit = $('#ddlFruitType').find('option:selected').text();
                if (fruit == '' || $('#ddlFruitType').val() == '-1') { $('#ddlFruitType').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#ddlFruitType').css('background-color', 'white'); }

                if ($('#txtSeeds').val() == '') { $('#txtSeeds').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#txtSeeds').css('background-color', 'white'); }

                if ($('#txtArea').val() == '') { $('#txtArea').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#txtArea').css('background-color', 'white'); }


                if (flag) {

                    var fruitValue = $('#ddlFruitType').val();
                    var Seeds = $('#txtSeeds').val();
                    var Area = $('#txtArea').val();
                    var season = $('#ddlSeason').find('option:selected').text();
                    var seasonValue = $('#ddlSeason').val();
                    var Year = $('#ddlYear').val();
                    var markup = "<tr><td><input type='checkbox' name='record'></td><td><span id='fruit' style='display:none'>" + fruitValue + "</span>" + fruit + "</td><td><span id='Seeds'>" + Seeds + "</span></td><td><span id='Area'>" + Area + "</span></td></tr>";
                    $("#tbl tbody").append(markup);
                    SumTAmount();
                    SumTArea();
                    // clear components
                    $('#txtSeeds').val('');
                    $('#txtArea').val('');
                    $('#ddlFruitType').val('-1');
                }
                else { return false; }
            });

            // Find and remove selected table rows
            $("#btnRemove").click(function (e) {
                e.preventDefault();
                $("#tbl tbody").find('input[name="record"]').each(function () {
                    if ($(this).is(":checked")) {
                        $(this).parents("tr").remove();
                        SumTAmount();
                        SumTArea();
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


            var Atotal = 0;
            $('#txtSeeds').keyup(function () {
                if ($(this).val() != "") {
                    $('#txtArea').val('250');
                } else {
                    $('#txtArea').val('');
                }
            });



        });

        function LoadShowFarmers() {
            var obj = JSON.stringify({ Id: $('#ddlExtensionW').val(), Year: $('#ddlYear').val(), SeasonId: $('#ddlSeason').val() });
            ShowFarmers(obj);
        }
        function SumTAmount() {
            var Seedstotal = 0;
            $('#tbl tbody tr').each(function () {
                var tr = $(this).closest('tr');
                var Seeds = $(tr).find('span:eq(1)');
                Seedstotal += parseFloat($(Seeds).html());
            });
            if (Seedstotal != '') {
                $("#divTAmount").html('');
                var markup2 = "<strong>Total Seeds/gr :" + Seedstotal.toString() + "</strong>";
                $("#divTAmount").html(markup2);
            } else { $("#divTAmount").html(''); }
        }
        function SumTArea() {
            var TArea = 0;
            $('#tbl tbody tr').each(function () {
                var tr = $(this).closest('tr');
                var area = $(tr).find('span:eq(2)');
                TArea += parseFloat($(area).html());
            });
            if (TArea != '') {
                $("#DivTArea").html('');
                var markup3 = "<strong>Total Area/meter sqr :" + TArea.toString() + "</strong>";
                $("#DivTArea").html(markup3);
            } else { $("#DivTArea").html(''); }
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
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <fieldset>
                    <legend>Coordinate Details</legend>
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
        <div class="row bg-light-grey">
            <div class="col-md-12">
                <fieldset>
                    <legend>Orchard Details</legend>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlFruitType">
                                    Crop Type</label>
                                <select class="form-control " id="ddlFruitType"></select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtSeeds">
                                    Seeds/gr</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtSeeds" />
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="txtArea">Area(Meter Sqr)</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtArea" />
                            </div>
                        </div>

                        <div class="col-md-2 pull-right">
                            <br />
                            <button id="btnAdd" class="btn btn-sm btn-primary btn-squared btn-o">Add To List <i class="fa fa-plus"></i></button>

                        </div>
                    </div>

                    <div class="row ">
                        <div class="col-md-2"></div>
                        <div class="col-md-8">
                            <hr />
                            <table id="tbl" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Select</th>
                                        <th>Crop</th>
                                        <th>#Seeds/gr</th>
                                        <th>Area/m sqr</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <button type="button" id="btnRemove" class="btn btn-sm btn-danger btn-squared btn-o pull-left"><i class="fa fa-trash" aria-hidden="true"></i></button>


                        </div>
                        <div class="col-md-2"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-6"></div>
                        <div id="divTAmount" class="col-md-4">
                        </div>
                        <div class="col-md-6"></div>
                        <div id="DivTArea" class="col-md-4">
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
                        <div id="DivFarmers">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>

        </div>
    </div>

    <input type="hidden" id="hdnFarmerId" /><input type="hidden" id="hdnExtWIdFarmerId" /><input type="hidden" id="hdnFarmerActivityId" />



    <%--codes for plastic tunnel--%>
    
</asp:Content>

