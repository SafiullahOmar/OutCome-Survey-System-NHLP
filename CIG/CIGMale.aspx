<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="CIGMale.aspx.cs" Inherits="CIG_CIGMale" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPageTitle" Runat="Server">
    CIG Male 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPgDescription" Runat="Server">
    Details for CIG Male are here..
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPgContent" Runat="Server">
    <script src="../Script/MaleCIG.js"></script>
    <script type="text/javascript">
        $(function () {

            $("#<%=btnUpdate.ClientID%>").hide();
            $("#<%=btnSave.ClientID%>").show();
            $('#txtAreaInGerib').attr("disabled","disabled");
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
                        url: "CIGMale.aspx/GetDistrict",
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
                        url: "CIGMale.aspx/GetExtensionW",
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
                        url: "CIGMale.aspx/GetFarmers",
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

                if ($('#txtNoOfTrees').val() == '') { $('#txtNoOfTrees').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#txtNoOfTrees').css('background-color', 'white'); }

                if ($('#txtEstablishedByProject').val() == '') { $('#txtEstablishedByProject').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#txtEstablishedByProject').css('background-color', 'white'); }

                if ( $('#txtEstablishedByFarmer').val() == '') { $('#txtEstablishedByFarmer').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#txtEstablishedByFarmer').css('background-color', 'white'); }

                if ($('#txtAreaInGerib').val() == '') { $('#txtAreaInGerib').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#txtAreaInGerib').css('background-color', 'white'); }

                if ($('#txtRehabilited').val() == '') { $('#txtRehabilited').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#txtRehabilited').css('background-color', 'white'); }

                
                if (flag) {

                    var fruitValue = $('#ddlFruitType').val();
                    var NoOfTrees = $('#txtNoOfTrees').val();
                    var ByProject = $('#txtEstablishedByProject').val();
                    var ByFarmer = $('#txtEstablishedByFarmer').val();
                    var Rehabilited = $('#txtRehabilited').val();
                    var season = $('#ddlSeason').find('option:selected').text();
                    var seasonValue = $('#ddlSeason').val();
                    var Year = $('#ddlYear').val();
                    var markup = "<tr><td><input type='checkbox' name='record'></td><td><span id='fruit' style='display:none'>" + fruitValue + "</span>" + fruit + "</td><td><span id='NoOfTrees'>" + NoOfTrees + "</span></td><td><span id='ByProject'>" + ByProject + "</span></td><td><span id='ByFarmer' style='dispaly:none'>" + ByFarmer + "</span></td><td><span id='Rehabilited'>" + Rehabilited + "</span></td><td><span>" + $('#txtAreaInGerib').val() + "</span><span id='Latitude' style='display:none'>" + $('#txtLatitude').val() + "</span><span id='Longtitude' style='display:none'>" + $('#txtLongtitude').val() + "</span></td></tr>";
                    $("#tbl tbody").append(markup);
                    SumTAmount();
                    // clear components
                    $('#txtNoOfTrees').val('');
                    $('#txtEstablishedByFarmer').val('');
                    $('#txtEstablishedByProject').val('');
                    $('#txtRehabilited').val('');
                    $('#txtLongtitude').val('');
                    $('#txtLatitude').val('');
                    $('#txtAreaInGerib').val('');
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

            var Ptotal = 0;
            $('#txtEstablishedByProject').keyup(function () {
                if ($(this).val() != "") {
                    Ptotal = parseFloat($(this).val()) +parseFloat($('#txtEstablishedByFarmer').val());
                    $('#txtAreaInGerib').val(Ptotal.toString());
                }
            });

            var Ftotal = 0;
            $('#txtEstablishedByFarmer').keyup(function () {
                if ($(this).val() != "") {
                    Ftotal = parseFloat($(this).val()) + parseFloat($('#txtEstablishedByProject').val()) ;
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
            var obj = JSON.stringify({ Id: $('#ddlExtensionW').val(), Year: $('#ddlYear').val(),SeasonId:$('#ddlSeason').val() });
            ShowFarmers(obj);
        }
        function SumTAmount() {
            var ktotal = 0;
            $('#tbl tbody tr').each(function () {
                var tr = $(this).closest('tr');
                var Amount = $(tr).find('span:eq(5)');
                ktotal += parseFloat($(Amount).html());
            });
            if (ktotal != '') {
                $("#divTAmount").html('');
                var markup2 = "<strong>Total Area :" + ktotal.toString() + "</strong>";
                $("#divTAmount").html(markup2);
            } else { $("#divTAmount").html(''); }
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
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                <fieldset>
                    <legend>Group Details</legend>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="ddlGroupPosition">
                                   Position in Group</label>
                                 <select class="form-control " id="ddlGroupPosition">
                                       <option value="-1">--Select--</option>
                                       <option value="1">Lead Farmer</option>
                                       <option value="2">Sub Lead Farmer</option>
                                      <option value="3">Redial Farmer</option>
                                   </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="ddlMembership">
                                    Group Membership</label>
                                 <select class="form-control " id="ddlMembership">
                                       <option value="-1">--Select--</option>
                                       <option value="1">Existing</option>
                                       <option value="2">New</option>
                                   </select>
                            </div>
                        </div>
                    </div>


                </fieldset>
            </div>
                <div class="col-md-3"></div>
            </div>
            <div class="col-md-1"></div>
        </div>
        <div class="row bg-light-grey">
            <div class="col-md-12">
                <fieldset>
                    <legend>Orchard Details</legend>
                    <div class="row">
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="ddlFruitType">
                                   Fruit Type</label>
                                <select class="form-control " id="ddlFruitType"></select>
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
                                <label for="txtEstablishedByProject">
                                     By Project</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtEstablishedByProject" />
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="form-group">
                                <label for="txtEstablishedByFarmer">
                                     By Farmer</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtEstablishedByFarmer" />
                            </div>
                        </div>
                            <div class="col-md-2">
                            <div class="form-group">
                                <label for="txtAreaInGerib">Total Area(Gerib)</label>
                                     <input type="text" class="form-control" placeholder="0.00" id="txtAreaInGerib" disabled />
                            </div>
                        </div>
                         <div class="col-md-2">
                            <div class="form-group">
                                <label for="txtRehabilited">Rehabilited</label>
                                     <input type="text" class="form-control" placeholder="0.00" id="txtRehabilited" />
                            </div>
                        </div>
                       

                    </div>
                    <div class="row">
                         <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtLongtitude">
                                   Longtitude</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtLongtitude" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtLatitude">
                                    Latitude</label>
                                <input type="text" class="form-control" placeholder="0.00" id="txtLatitude" />
                            </div>
                        </div>
                         <div class="col-md-2 pull-right">
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
                                        <th>#Trees</th>
                                        <th>By Project</th>
                                        <th>By Farmer</th>
                                        <th>Rehabilited</th>
                                        <th>Total Area</th>
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
                        <div id="divTAmount" class="col-md-4">
                        </div>
                        
                    </div>

                </fieldset>
            </div>
        </div>
        
        
          <div class="row">
                        <div class="col-md-12 btn">
                            <hr />
                            <asp:LinkButton ID="btnSave" class="btn btn-sm btn-success btn-wide btn-squared btnSave" runat="server" ><i class="fa fa-save" aria-hidden="true"></i> Save</asp:LinkButton>
                            <asp:LinkButton ID="btnUpdate" class="btn btn-sm btn-info btn-wide btn-squared btnUpdate" runat="server"  ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Update</asp:LinkButton>

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
    
    <input type="hidden" id="hdnFarmerId" /><input type="hidden" id="hdnExtWIdFarmerId" />
 
</asp:Content>

