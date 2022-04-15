<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="frmFormerInfo.aspx.cs" Inherits="PCI_frmLeadFormerInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="../Script/Former.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#<%=btnUpdate.ClientID%>").hide();
            $("#<%=btnSave.ClientID%>").show();
            $("#<%=ddlYear.ClientID%>").attr('disabled', 'disabled');
            $("#<%=ddlAttempt.ClientID%>").attr('disabled', 'disabled');
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
                        url: "frmFormerInfo.aspx/GetDistrict",
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

            //ddl Lead Farmer

            $("#ddlDistrict").change(function () {

                if ($(this).val() == "-1") {

                    $("#ddlLeadFarmer").attr("disabled", "disabled");
                }
                else {

                    $("#ddlLeadFormer").attr("disabled", false);
                    $.ajax({
                        type: "POST",
                        url: "frmFormerInfo.aspx/GetLeadFarmer",
                        data: '{DistrictID: ' + $('#ddlDistrict').val() + '}',
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('#ddlLeadFormer').empty();
                            var count = 1;
                            $.each(data.d, function (key, value) {
                                $('#ddlLeadFormer').append($("<option></option>").val(value.LeadFarmerId).html(value.Name));
                            });

                            $('#ddlLeadFormer').prepend("<option value='-1' selected='true'>-Select-</option>");
                            $('#ddlLeadFormer option:first').attr("selected", "selected");
                        },
                        error: function (data) {
                            alert("error found");
                        }

                    });


                }
            });

            $("#ddlLeadFormer").change(function () {

                if ($(this).val() == "-1") {

                    $("#<%=ddlFruit.ClientID%>").attr("disabled", "disabled");
                }
                else {
                    $("#<%=ddlFruit.ClientID%>").attr("disabled", false);

                    var obj = JSON.stringify({ Id: $('#ddlLeadFormer').val() });

                    $.ajax({
                        type: "POST",
                        url: "frmFormerInfo.aspx/GetFruit",
                        data: obj,
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (r) {
                            $("#<%=ddlFruit.ClientID%>").empty();
                            $('#<%=ddlYear.ClientID%>').val('-1');
                            $('#<%=ddlAttempt.ClientID%>').val('-1');
                            $.each(r.d.Detail, function (key, value) {
                                $("#<%=ddlFruit.ClientID%>").append($("<option></option>").val(value.FruitId).html(value.FruitName));
                            });
                            $("#<%=ddlFruit.ClientID%>").prepend("<option value='-1' selected='true'>-Select-</option>");
                            $("#<%=ddlFruit.ClientID%> option:first").attr("selected", "selected");
                            if (r.d.Year != '') {
                                $('#<%=ddlYear.ClientID%>').val(r.d.Year);
                            } else { $('#<%=ddlYear.ClientID%>').val('-1'); }
                            if (r.d.Percentage != '') {
                                $('#<%=ddlAttempt.ClientID%>').val(r.d.Percentage);
                            } else { $('#<%=ddlAttempt.ClientID%>').val('-1'); }
                        },
                        error: function (data) {
                            alert("error found");
                        }

                    });

                    // show Function

                    ShowFarmers(obj);
                    //ShowControlsByRoles();
                }
            });

            //ddl Fruit
            $("#<%=ddlFruit.ClientID%>").change(function () {

                if ($(this).val() == "-1") {

                    $("#txtAmount").attr("disabled", "disabled");
                }
                else {
                    $("#txtAmount").attr("disabled", false);
                    $.ajax({
                        type: "POST",
                        url: "frmFormerInfo.aspx/GetAmount",
                        data: '{FruitID: ' + $('#<%=ddlFruit.ClientID%>').val() + '}',
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (d) {
                            $("#txtAmount").empty(); $("#txtAmount").val(d.d);
                            //$.each(data.d, function (key, value) {
                            //    alert(value.Amount);
                            //    //$("#txtAmount").val(value.Amount);
                            //});

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
                if ($(this).val() != "" && $('#<%=ddlAttempt.ClientID%>').val()!='-1') {
                    mtotal = parseFloat($(this).val()) * parseFloat($('#txtArea').val()) * parseFloat($('#<%=ddlAttempt.ClientID%>').val()) / 100;
                    $('#txtTotalAmount').val(mtotal.toString());
                }
            });

            var m2total = 0;
            $('#txtArea').keyup(function () {
                if ($(this).val() != "" && $('#<%=ddlAttempt.ClientID%>').val() != '-1') {
                    mtotal = parseFloat($(this).val()) * parseFloat($('#txtAmount').val()) * parseFloat($('#<%=ddlAttempt.ClientID%>').val()) / 100;
                    $('#txtTotalAmount').val(m2total.toString());
                }
            });

            // btn Add
            $('#btnAdd').click(function (e) {
                e.preventDefault();
                var flag = true;
                var fruit = $('#<%=ddlFruit.ClientID%>').find('option:selected').text();
                if (fruit == '' || $('#<%=ddlFruit.ClientID%>').val() == '-1') { $('#<%=ddlFruit.ClientID%>').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#<%=ddlFruit.ClientID%>').css('background-color', '#FFAAAA'); }
                if ($('#<%=ddlAttempt.ClientID%>').val() == "-1" || $('#<%=ddlAttempt.ClientID%>').val() == '') { $('#<%=ddlAttempt.ClientID%>').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#<%=ddlAttempt.ClientID%>').css('background-color', '#FFAAAA'); }
                if ($('#<%=ddlSeason.ClientID%>').val() == "-1" || $('#<%=ddlSeason.ClientID%>').val() == '') { $('#<%=ddlSeason.ClientID%>').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#<%=ddlSeason.ClientID%>').css('background-color', '#FFAAAA'); }
                if ($('#<%=ddlYear.ClientID%>').val() == "-1" || $('#<%=ddlYear.ClientID%>').val() == '') { $('#<%=ddlYear.ClientID%>').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#<%=ddlYear.ClientID%>').css('background-color', '#FFAAAA'); }
                if ($('#txtArea').val() == '') { $('#txtArea').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#txtArea').css('background-color', '#FFAAAA'); }
                if ($('#txtAmount').val() == '') { $('#txtAmount').css('background-color', '#FFAAAA'); flag = false; }
                else { $('#txtAmount').css('background-color', '#FFAAAA'); }
                if (flag) {

                    var fruitValue = $('#<%=ddlFruit.ClientID%>').val();
                    var percentage = $('#<%=ddlAttempt.ClientID%>').val();
                    var Area = $('#txtArea').val();
                    var amount = $('#txtTotalAmount').val();
                    var season = $('#<%=ddlSeason.ClientID%>').find('option:selected').text();
                    var seasonValue = $('#<%=ddlSeason.ClientID%>').val();
                    var Year = $('#<%=ddlYear.ClientID%>').val();
                    var markup = "<tr><td><input type='checkbox' name='record'></td><td><span id='fruit' style='display:none'>" + fruitValue + "</span>" + fruit + "</td><td><span id='percentage'>" + percentage + "</span></td><td><span>" + Year + "</span></td><td><span id='season' style='display:none'>" + seasonValue + "</span>" + season + "</td><td><span id='area'>" + Area + "</span></td><td><span id='amount'>" + amount + "</span></td><td><span>" + (parseFloat($('#txtAmount').val()) * parseFloat($('#txtArea').val())) + "</span></td></tr>";
                    $("#tbl tbody").append(markup);
                    SumCAmount();
                    SumTAmount();
                    // clear components
                    $('#txtArea').val('');
                    $('#txtAmount').val('');
                    $('#txtTotalAmount').val('');
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
                    var LeadFormer = $('#ddlLeadFormer').val();
                    SaveFormerInfo(LeadFormer);
                }
            });

            //update Form information

            $('#<%=btnUpdate.ClientID%>').click(function (e) {
                e.preventDefault();
                if (formValidation(e)) {
                    var LeadFormer = $('#ddlLeadFormer').val();
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
            var obj = JSON.stringify({ Id: $('#ddlLeadFormer').val() });
            ShowFarmers(obj);
        }
        function SumCAmount() {
            var total = 0;
            $('#tbl tbody tr').each(function () {
                var tr = $(this).closest('tr');
                var Amount = $(tr).find('span:eq(5)');
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
                var Amount = $(tr).find('span:eq(6)');
                ktotal += parseFloat($(Amount).html());
            });
            if (ktotal != '') {
                $("#divTAmount").html('');
                var markup2 = "<strong>Total Amount :" + ktotal.toString() + "</strong>";
                $("#divTAmount").html(markup2);
            } else { $("#divTAmount").html(''); }
        }
    </script>
    <div class="widget-head">
        <i class="glyphicon glyphicon-th-list"></i>Farmer Preliminary Information
        <div style="float: right; cursor: pointer;">
            <button id="btnFromerDetails" class="btn-primary"><span class="glyphicon glyphicon-search">Details</span></button>
        </div>
    </div>

    <div class="row" >
        <div class="col-lg-1"></div>
        <div class="col-lg-10   ">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <strong>Preliminary Information</strong>
                </div>
                <div class="panel-body">

                    <div class="row">

                        <div class="col-lg-4">
                            <span style="font-weight: bold">Province</span>
                            <asp:DropDownList ID="ddlProvince" class="form-control province" runat="server">
                            </asp:DropDownList>
                            <asp:CompareValidator ID="CompareValidator2" ControlToValidate="ddlProvince" ValueToCompare="-1" Operator="NotEqual" runat="server" ErrorMessage="***"></asp:CompareValidator>
                        </div>

                        <div class="col-lg-4">
                            <span style="font-weight: bold">District</span>
                            <select class="form-control " id="ddlDistrict"></select>


                        </div>

                        <div class="col-lg-4">
                            <span style="font-weight: bold">Lead Farmer</span>
                            <select class="form-control " id="ddlLeadFormer"></select>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="input-group">
                                <span class="input-group-addon">Farmer Name</span>
                                <input type="text" class="form-control" placeholder="Farmer Name" id="txtFormerName" />
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="input-group">
                                <span class="input-group-addon">Father Name</span>
                                <input type="text" class="form-control" placeholder="Father Name" id="txtFatherName" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-1"></div>
    </div>
    <div class="row" >
        <div class="col-lg-12   ">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <strong>Farmer Contribution Details</strong>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-1">

                            <span style="">Fruit/<br />
                                Tools</span>
                            <asp:DropDownList ID="ddlFruit" CssClass="form-control fruit" runat="server">
                            </asp:DropDownList>

                        </div>
                        <div class="col-lg-1">

                            <span>Contribution/<br />
                                Percentage</span>
                            <asp:DropDownList ID="ddlAttempt" CssClass="form-control province" runat="server">
                                <asp:ListItem Text="---" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="25%" Value="25"></asp:ListItem>
                                <asp:ListItem Text="35%" Value="35"></asp:ListItem>
                                <asp:ListItem Text="50%" Value="50"></asp:ListItem>
                                <asp:ListItem Text="100%" Value="100"></asp:ListItem>
                            </asp:DropDownList>

                        </div>
                        <div class="col-lg-1">

                            <span>Year<br />
                                /</span>
                            <asp:DropDownList ID="ddlYear" CssClass="form-control year" runat="server">
                            </asp:DropDownList>

                        </div>
                        <div class="col-lg-1">

                            <span style="">Season<br />
                                /</span>
                            <asp:DropDownList ID="ddlSeason" CssClass="form-control season" runat="server">
                                <asp:ListItem Text="---" Value="-1"></asp:ListItem>
                                <asp:ListItem Text="Fall" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Spring" Value="2"></asp:ListItem>
                            </asp:DropDownList>

                        </div>

                        <div class="col-lg-2">

                            <span style="">No of Area(jerib)<br />
                                /Package/Tools</span>
                            <input type="text" class="form-control" placeholder="0.00" id="txtArea" />

                        </div>
                        <div class="col-lg-2">

                            <span style="">Amount per Package/<br />
                                Tools/Jerib</span>
                            <input type="text" class="form-control" placeholder="0.00" id="txtAmount" />

                        </div>
                        <div class="col-lg-2">

                            <span style="font-weight: bold">Farmer Contribution Amount</span>
                            <input type="text" class="form-control" placeholder="0.00" id="txtTotalAmount" disabled />

                        </div>
                        <div class="col-lg-2">
                            <br />
                            <br />
                            <button id="btnAdd" class="btn-sm btn-info">Add To List</button>

                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-12">
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
                                        <th>C Amount</th>
                                        <th>Total Amount</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                            <input type="button" id="btnRemove" class="btn-sm btn-danger" value="Remove" />
                        </div>
                        <div class="col-lg-4">
                        </div>
                        <div class="col-lg-4">
                        </div>
                        <div id="divCAmount" class="col-lg-4">
                        </div>
                        <div class="col-lg-4">
                        </div>
                        <div class="col-lg-4">
                        </div>
                        <div id="divTAmount" class="col-lg-4">
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-lg-12 btn">
                            <hr />
                            <asp:Button ID="btnSave" class="btn-sm btn-primary btnSave" runat="server" Text="Save" />
                            <asp:Button ID="btnUpdate" class="btn-sm btn-success btnUpdate" runat="server" Text="Update" />

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><hr />
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10">
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
        <div class="col-lg-1"></div>

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
    <input type="hidden" id="hdnFarmerId" /><input type="hidden" id="hdnLeadFarmerId" />
</asp:Content>

