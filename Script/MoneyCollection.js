function CreateFarmerMoneyDepositTable(Season,Year) {
    var obj = JSON.stringify({ ExtWorkerId: $('#ddlExtWorker').val(),Year: Year,Season:Season });
    $.ajax({
        type: "POST",
        url: "frmMoneyDeposit.aspx/GetFarmerMoneyDeposits",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblMoneyDeposit'  width='100%' class='table table-striped table-bordered  table-hover' style=direction:ltr;>";
            var header = "<thead><tr ><th style='text-align:center;width:30px;'>edit</th><th style='text-align:center;width:30px;'> All<br/><input type='checkbox' name='checkAll' onclick='javascript:SelectAllCheckboxes(this);'/></th><th>SN</th><th style='text-align:center;'>Farmer Name</th><th style='text-align:center;'>Farmer Contribution</th><th style='text-align:center;'>Paid Amount</th><th style='text-align:center;'>Balance</th><th style='text-align:center;'>Current Transaction</th><th>Remarks</th></tr></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {

                var row = "<tr >" +
                   (x.Edit == true ? " <td><a onclick='EditFormerAmountDetail(this)' class='btn-sm btn-danger edit' href='#'>Edit</a></td>" : "<td></td>") +
                   "<td style='text-align:center;width:30px;'><input type='checkbox' name='check' onclick='javascript:AssignBalance(this);'/></td><td style='text-align:center;width:50px;'>" + count + "<span id='spanFarmerId' style='display:none'>" + x.FarmerId + "</span></td>" +
                   "<td style='text-align:center;width:100px;'><span>" + x.Name + "  </span></td>" +
                   "<td style='text-align:center;width:100px;'><span>" + x.TotalAmount + "</span></td>" +
                   "<td style='text-align:center;width:100px;'><span>" + x.RecievedAmount + "</span></td>" +
                    "<td style='text-align:center;width:100px;'><span>" + x.Balance + "</span></td>" +
                   "<td style='text-align:center;width:100px;'><input type='text' onchange='TotalSummary()' class='form-control input-sm' title='numbers' placeholder='0.00' id='txtMoney" + x.FarmerId + "'  disabled='true'></td>" +
                    "<td style='text-align:center;'><input type='textarea' rows='2'  class='form-control'  id='txtRemarks" + x.FarmerId + "' ></td>" +
                        "</tr>";
                $table += row;
                count++;
            });
            $('#DivMoneyDeposit').html($table);
            $table += "</table>";
            $('#tblMoneyDeposit').DataTable({ "bPaginate": true, "bLengthChange": true, "bFilter": true, "bSort": true, "bInfo": true, "bAutoWidth": true, });
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function SaveForm(Year) {
    var formDetail = {};
    formDetail.ExtWorkerId = $('#ddlExtWorker').val();
    formDetail.ExtWorkerName = $('#ddlExtWorker').find('option:selected').text();
    formDetail.InvoiceNo = $('#txtInvoiceNumber').val();
    formDetail.Date = $('#txtDate').val();
    formDetail.Year = Year;
    formDetail.SeasonId = $('#ddlSeason').val();
    var lst = new Array();
    $('#tblMoneyDeposit tbody tr').each(function () {
        var detail = {};
        if (detail.CurrentRMoney = $(this).find("input[id^='txtMoney']").val() != '')
            detail.CurrentRMoney = $(this).find("input[id^='txtMoney']").val();
        else
            detail.CurrentRMoney = "0";
        detail.Remarks = $(this).find("input[id^='txtRemarks']").val();
        var tr = $(this).closest('tr');
        var Id = $(tr).find('span:eq(0)');
        var Name = $(tr).find('span:eq(1)');
        detail.FarmerId = $(Id).html();
        detail.Name = $(Name).html();
        lst.push(detail);
    });
    formDetail.FarmerList = lst;
    var jsonObject = JSON.stringify({ formDetail: formDetail });

    $.ajax({
        type: "POST",
        url: "frmMoneyDeposit.aspx/SaveFormDetail",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            //Clear components
            clearComponents();
            $body.removeClass("loading");
            $.alert({
                icon: 'glyphicon glyphicon-saved',
                closeIcon: true,
                title: 'Success Alert',
                animation: 'news',
                closeAnimation: 'news',
                theme: 'dark',
                type: 'green',
                typeAnimated: true,
                content: '<strong><font style="color:white;">Transaction has been successfully saved to the system!</font></strong>'
            });
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function formValidation(e) {
    var flag = true;
    if ($('#txtDate').val() == '') {
        $('#txtDate').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtDate').css('background-color', '#ffff'); }
    if ($('#txtInvoiceNumber').val() == '') {
        $('#txtInvoiceNumber').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtInvoiceNumber').css('background-color', '#ffff'); }
    if ($('#ddlDistrict').val() == '-1' || $('#ddlDistrict').find('option:selected').text() == '') {
        $('#ddlDistrict').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlDistrict').css('background-color', '#ffff'); }
    if ($('#ddlExtWorker').val() == '-1' || $('#ddlExtWorker').find('option:selected').text() == '') {
        $('#ddlExtWorker').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlExtWorker').css('background-color', '#ffff'); }
    if ($('.year').val() == '-1' || $('.year').find('option:selected').text() == '') {
        $('.year').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('.year').css('background-color', '#ffff'); }
    if (flag) { return true } else {
        $.alert({
            icon: 'glyphicon glyphicon-info-sign',
            closeIcon: true,
            title: 'Form Validation Alert!',
            theme: 'supervan',
            content: '<strong><font style="color:red;">Please enter form information in red backgrounds!!</color></strong>'
        });
        return false;
    }

}
function clearComponents() {
    $('#txtInvoiceNumber').val('');
    $('#txtDate').val('');
    $('.year').val('-1');
    $('#DivMoneyDeposit').html('');
    $('#spSummaryTotalAmount').html('');
}
function EditFormerAmountDetail(obj) {
    var row = obj.parentNode.parentNode;
    var span1 = $(row).find('span:eq(0)');
    var FormerId = span1.html();
    $('#hdnFarmerId').val(FormerId);
    $('#hdnYear').val($('#ddlYear').val());
    $('#hdnSeasonId').val($('#ddlSeason').val());
    var obj = JSON.stringify({ FarmerId: FormerId, Year: $('#ddlYear').val(), SeasonId: $('#ddlSeason').val(), ExtWorkerId: $('#ddlExtWorker').val() });
    $.ajax({
        type: "POST",
        url: "frmMoneyDeposit.aspx/EditFarmerAmountDetail",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblAmounEdit'  width='100%' class='table table-striped table-bordered  table-hover' style=direction:ltr;>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Farmer Name</th><th style='text-align:center;'>Year</th><th style='text-align:center;'>Paid Amount/Updated Amount</th><th style='text-align:center;'>System Entry Date</th><th style='text-align:center;'>Entered By</th></tr></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;width:50px;'>" + count + "<span id='spanFarmerId' style='display:none'>" + x.FarmerId + "</span><span id='spanFarmerId' style='display:none'>" + x.EnteredByBefore + "</span></td>" +
                   "<td style='text-align:center;width:100px;'><span>" + x.FarmerName + "  </span></td>" +
                   "<td style='text-align:center;width:100px;'><span>" + x.Year + "</span></td>" +
                   "<td style='text-align:center;width:100px;'><input type='text' class='form-control input-sm' id='txtUpdatedRecievedAmount' title='numbers' value=" + x.Amount + "><span id='spanPrevAmount' style='display:none'>" + x.Amount + "</span></td>" +
                    "<td style='text-align:center;width:100px;'><span>" + x.EntryDate + "</span></td>" +
                    "<td style='text-align:center;width:100px;'><span>" + x.UserName + "</span></td>" +
                        "</tr>";
                $table += row;
                count++;
            });
            $('#DivAmountEdit').html($table);
            $table += "</table>";

            $('#MdAmountEdit').modal('show');
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function UpdateFormerAmountDetail() {
    var fDetail = {};
    fDetail.ExWorkerId = $('#ddlExtWorker').val();
    fDetail.Year = $('#hdnYear').val();
    fDetail.FarmerId = $('#hdnFarmerId').val();
    fDetail.SeasonId = $('#hdnSeasonId').val();
    var lst = new Array();
    $('#tblAmounEdit tbody tr').each(function () {
        var detail = {};
        var tr = $(this).closest('tr');
        var EnteredByBfre = $(tr).find('span:eq(1)');
        var EnteryDateBfre = $(tr).find('span:eq(5)');
        var PrevAmount = $(tr).find('span:eq(4)');
        detail.EnteredByBefore = $(EnteredByBfre).html();
        detail.PreviousAmount = $(PrevAmount).html();
        detail.EntryDate = $(EnteryDateBfre).html();
        detail.Amount = $(this).find("input[id^='txtUpdatedRecievedAmount']").val();
        lst.push(detail);
    });
    fDetail.FarmerAmntList = lst;
    var jsonObject = JSON.stringify({ fDetail: fDetail });

    $.ajax({
        type: "POST",
        url: "frmMoneyDeposit.aspx/UpdateFarmerAmount",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {

            $('#MdAmountEdit').modal('hide');
            $.alert({
                icon: 'glyphicon glyphicon-saved',
                closeIcon: true,
                title: 'Success Alert', animation: 'news',
                closeAnimation: 'news',
                theme: 'dark',
                type: 'green',
                typeAnimated: true,
                content: '<strong><font style="color:white;">Record has been successfully updated into the system!</font></strong>'
            });

            //Clear components
            $("#tblAmounEdit tbody tr").remove();
            CreateFarmerMoneyDepositTable($('#hdnSeasonId').val(), $('#hdnYear').val());
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function getUserRoles() {
    $.ajax({
        type: "POST",
        url: "frmMoneyDeposit.aspx/GetUserRoles",
        data: '',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var Roles = [];
            $.each(data.d, function (i, x) {
                Roles.push(x.role);
            });
            if ($.inArray('Admin', Roles) != -1) {
                $('.btnUpdate').removeAttr('disabled');
                $('.edit').removeAttr('disabled');
            } else {
                $('.btnUpdate').attr('disabled', 'disabled');
                $('.edit').hide();
            }
        },
        error: function (data) {
            alert("error found");
        }

    });
}