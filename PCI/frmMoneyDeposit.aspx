<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="frmMoneyDeposit.aspx.cs" Inherits="PCI_frmMoneyDeposit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageTitle" runat="Server">
    Contribution Collection
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPgDescription" runat="Server">
    Details for MC here..
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPgContent" runat="Server">
    <script src="../Script/MoneyCollection.js"></script>
    <script type="text/javascript">

        $(function () {

            $('#txtDate').datetimepicker({ timepicker: false, closeOnDateSelect: false, format: 'Y/m/d', maxDate: new Date });
            //getUserRoles();
            //ddl district

            $("#<%=ddlProvince.ClientID%>").change(function () {

                if ($(this).val() == "-1") {

                    $("#ddlDistrict").attr("disabled", "disabled");
                }
                else {

                    $("#ddlDistrict").attr("disabled", false);
                    $.ajax({
                        type: "POST",
                        url: "frmMoneyDeposit.aspx/GetDistrict",
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

                    $("#ddlExtWorker").attr("disabled", "disabled");
                }
                else {

                    $("#ddlExtWorker").attr("disabled", false);
                    $.ajax({
                        type: "POST",
                        url: "frmMoneyDeposit.aspx/GetExtWorkers",
                        data: '{DistrictID: ' + $('#ddlDistrict').val() + '}',
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('#ddlExtWorker').empty();
                            var count = 1;
                            $.each(data.d, function (key, value) {
                                $('#ddlExtWorker').append($("<option></option>").val(value.ExtId).html(value.Name));
                            });

                            $('#ddlExtWorker').prepend("<option value='-1' selected='true'>-Select-</option>");
                            $('#ddlExtWorker option:first').attr("selected", "selected");
                        },
                        error: function (data) {
                            alert("error found");
                        }

                    });


                }
            });

            //ddlSeason
            $("#ddlSeason").change(function () {

                if ($(this).val() == "-1") {
                    $('#DivMoneyDeposit').html('');
                }
                else {

                    CreateFarmerMoneyDepositTable($("#ddlSeason").val(), $("#ddlYear").val());
                }
            });

            //ddl Farmer

            $("#ddlExtWorker").change(function () {

                if ($(this).val() == "-1") {

                    $("#ddlSeason").attr("disabled", "disabled");
                    $("#ddlYear").attr("disabled", "disabled");
                }
                else {

                    $("#ddlSeason").attr("disabled", false);
                    $("#ddlYear").attr("disabled", false);

                }
            });

            /// save form btn save

            $('#<%=btnSave.ClientID%>').click(function (e) {
                e.preventDefault();
                if (formValidation(e)) {
                    $.confirm({
                        title: 'Transaction Confirmation Box!',
                        icon: 'glyphicon glyphicon-info',
                        animation: 'news',
                        closeAnimation: 'news',
                        theme: 'dark',
                        type: 'green',
                        typeAnimated: true,
                        content: '<strong><font style="color:white;">Are you sure you want to submit <font style="color:red;"> ' + $('#spSummaryTotalAmount').text() + ' </font>in this Transaction to the System ?</color></strong>',
                        buttons: {
                            confirm: {
                                text: 'I Confirm',
                                btnClass: 'btn-green',
                                keys: ['enter', 'c'],
                                action: function () {
                                    $body = $('body');
                                    $body.addClass("loading");
                                    this.$content.html('').html('<font style="color:green;">It will take time to collect it into the system. please be patient.</color>');
                                    this.buttons.confirm.hide();
                                    this.buttons.close.hide();
                                    this.$icon.hide();
                                    this.$title.html('').html('<strong><font style="color:white;">Please Waite...</color></strong>');
                                    SaveForm($("#ddlYear").val());
                                }

                            },
                            close: function () {

                            }
                        },
                        cancel: function () {

                        }
                    });


                }
            });

            $('#btnUpdate').click(function (e) {
                e.preventDefault();
                UpdateFormerAmountDetail();
            });


        });


        //check All checkox
        function SelectAllCheckboxes(chk) {
            $('#tblMoneyDeposit').find("input:checkbox").each(function () {
                if (this != chk) {
                    this.checked = chk.checked;
                    AssignBalance(this);
                }
            });
        }
        function AssignBalance(chk) {
            var tr = $(chk).closest('tr');
            var balance = $(tr).find('span:eq(4)');
            if (parseFloat(balance.html()) > 0) { $(tr).find("input[id^='txtMoney']").removeAttr("disabled"); } else { $(tr).find("input[id^='txtMoney']").attr("disabled", "disabled"); }
            if (chk.checked) {
                $(tr).find("input[id^='txtMoney']").val(balance.html());
                $(tr).find("input[id^='txtMoney']").blur(function () {
                    if (parseFloat($(this).val()) > parseFloat(balance.html())) {
                        $(this).val('');
                        $.alert({
                            icon: 'glyphicon glyphicon-saved',
                            closeIcon: true,
                            title: 'Alert',
                            content: 'Amount Should not be <strong>MORE</strong> than balance!'
                        });
                    }
                    if (parseFloat($(this).val()) < 0) {
                        $(this).val('');
                        $.alert({
                            icon: 'glyphicon glyphicon-saved',
                            closeIcon: true,
                            title: 'Alert',
                            content: 'Amount Should not be less than <strong>ZERO</strong> !'
                        });
                    }
                });
                $(tr).find("input[id^='txtMoney']").trigger("change");

            } else {
                $(tr).find("input[id^='txtMoney']").val('0.00');
                $(tr).find("input[id^='txtMoney']").attr("disabled", "disabled");
                $(tr).find("input[id^='txtMoney']").removeAttr("max");
                $(tr).find("input[id^='txtMoney']").trigger("change");
            }
        }

        //Total Amount in Current Transaction

        function TotalSummary() {
            var total = 0;
            $('#tblMoneyDeposit').find("input[id^='txtMoney']").each(function () {
                if ($(this).val()) {
                    total += parseFloat($(this).val());
                }
            });
            $('#spSummaryTotalAmount').html(total.toString());
        }

    </script>

    <div class="container-fluid container-fullw bg-white">
        <div class="row">

            <div class="col-md-3">
                <fieldset>
                    <legend>Farmer Information</legend>
                    <div class="row">
                        <asp:CompareValidator ID="CompareValidator1" ControlToValidate="ddlProvince" ValueToCompare="-1" Operator="NotEqual" runat="server" ErrorMessage="***"></asp:CompareValidator>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="ddlProvince">Province</label>
                                <asp:DropDownList ID="ddlProvince" class="form-control province" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="ddlDistrict">District</label>
                                <select class="form-control " id="ddlDistrict"></select>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="ddlExtWorker">Extension Worker</label>
                                <select class="form-control " id="ddlExtWorker"></select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="ddlYear">Year</label>
                                <select class="form-control year" id="ddlYear">
                                    <option value="-1">--Select-- </option>
                                    <option value="2016">2016 </option>
                                    <option value="2017">2017</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="ddlSeason">Season</label>
                                <select class="form-control season" id="ddlSeason">
                                    <option value="-1">--Select-- </option>
                                    <option value="1">Fall</option>
                                    <option value="2">Spring</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <div class="panel panel-danger">
                    <div class="panel-body">
                        <div class="col-md-11">
                            <strong>Total Amount in this Transaction:</strong><span id="spSummaryTotalAmount" style="font-size: large; color: blue; font-style: normal; font-weight: bold;"></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <fieldset>
                    <legend>Farmer Contribution Information</legend>
                    <div id=""  style="overflow-x: scroll; overflow-y: scroll; overflow-wrap: inherit;">
                        <div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label for="txtInvoiceNumber">Voucher Code</label>
                                    <input type="text" class="form-control" placeholder="voucher Code" id="txtInvoiceNumber" />
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label for="txtDate">Date of Voucher Code</label>
                                    <input type="text" class="form-control" placeholder="Date" id="txtDate" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <hr />
                                <div id="DivMoneyDeposit" style="width: 1000px; height: 310px; overflow-y: scroll; direction: rtl;">
                                </div>
                                <hr />
                                <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-wide btn-success btn-squared" />
                            </div>
                        </div>
                    </div>
               </fieldset>
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
    <%--Farmer Amount Edit box--%>
    <div id="MdAmountEdit" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 id="H1">Amount Edit</h4>
                </div>
                <div class="modal-body">

                    <div id="DivAmountEdit">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn-sm btn-danger" aria-hidden="true" data-dismiss="modal">Cancel</button>
                    <button class="btn-sm btn-success btnUpdate" id="btnUpdate">Update</button>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdnFarmerId" />
    <input type="hidden" id="hdnYear" />
    <input type="hidden" id="hdnSeasonId" />
</asp:Content>

