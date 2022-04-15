function SaveFormerInfo(LeadFormer) {
    var formDetail = {};
    formDetail.LeadFormerId = LeadFormer;
    formDetail.Name = $('#txtFormerName').val();
    formDetail.FName = $('#txtFatherName').val();
    var lst = new Array();
    $('#tbl tbody tr').each(function () {
        var detail = {};
        var tr = $(this).closest('tr');
        var FruitId = $(tr).find('span:eq(0)');
        var Percentage = $(tr).find('span:eq(1)');
        var Year = $(tr).find('span:eq(2)');
        var Season = $(tr).find('span:eq(3)');
        var Area = $(tr).find('span:eq(4)');
        var Amount = $(tr).find('span:eq(5)');
        detail.FruitId = $(FruitId).html();
        detail.Percentage = $(Percentage).html();
        detail.Area = $(Area).html();
        detail.Amount = $(Amount).html();
        detail.SeasonId = $(Season).html();
        detail.Year = $(Year).html();
        lst.push(detail);
    });
    formDetail.FormerConList = lst;
    var jsonObject = JSON.stringify({ formDetail: formDetail });

    $.ajax({
        type: "POST",
        url: "frmFormerInfo.aspx/SaveFormDetail",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $.alert({
                icon: 'glyphicon glyphicon-saved',
                closeIcon: true,
                title: 'Success Alert',
                content: 'Form is successfully saved !'
            });

            //Clear components
            $("#tbl tbody tr").remove();
            $("#divCAmount").html('');
            $("#divTAmount").html('');
            $('#txtFormerName').val('');
            $('#txtFatherName').val('');
            LoadShowFarmers();
        },
        error: function (data) {
            alert("error found");
        }

    });
}

function LoadFormerInformation(LeadFormer, LeadFormerText) {
    var obj = JSON.stringify({ Id: LeadFormer });
    debugger;
    $.ajax({
        type: "POST",
        url: "frmFormerInfo.aspx/GetFarmerInfo",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<p style='color:blue;'>Former Details for Lead Former:<strong> " + LeadFormerText + "</strong></p>";
            $table += "<table id='tblFormerDetail'  width='100%' class='table table-striped table-bordered  table-hover'>";

            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Name</th><th style='text-align:center;'>Total Amount</th><th style='text-align:center;'>Recieved Amount</th><th style='text-align:center;'>Balance</th>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "</td>" +
                   "<td style='text-align:center;'><span>" + x.Name + "  </span></td>" +
                   "<td style='text-align:center;'><span>" + x.Amount + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.RecievedAmount + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Balance + "</span></td>" +
                   "</tr>";
                $table += row;
                count++;
            });
            $('#dvFormerDetail').html($table);
            $table += "</table>";
            $('#MdFormerDetail').modal('show');
        },
        error: function (data) {
            alert("error found");
        }

    });
}

function formValidation(e) {
    var flag = true;
    if ($('.province').val() == '-1') {
        $('.province').css('background-color', '#FFAAAA');;
        flag = false;
    }
    else { $('.province').css('background-color', '#ffff'); }
    if ($('#ddlDistrict').val() == '-1' || $('#ddlDistrict').find('option:selected').text() == '') {
        $('#ddlDistrict').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlDistrict').css('background-color', '#ffff'); }
    if ($('#ddlLeadFormer').val() == '-1' || $('#ddlLeadFormer').find('option:selected').text() == '') {
        $('#ddlLeadFormer').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlLeadFormer').css('background-color', '#ffff'); }
    if ($('#txtFormerName').val() == '') {
        $('#txtFormerName').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtFormerName').css('background-color', '#ffff'); }
    if ($('#txtFatherName').val() == '') {
        $('#txtFatherName').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtFatherName').css('background-color', '#ffff'); }
    if (flag) { return true } else {
        $.alert({
            icon: 'glyphicon glyphicon-info-sign',
            closeIcon: true,
            title: 'Form Validation Alert!',
            content: '<strong><font style="color:red;">Please enter form information in red backgrounds!!</color></strong>'
        });
        return false;
    }
}

var row = null;
function ShowFarmers(obj) {
    alert(obj);
    $.ajax({
        type: "POST",
        url: "frmFormerInfo.aspx/GetFarmerLists",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblFarmers'  width='100%' class='table table-striped table-bordered  table-hover'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Name</th><th style='text-align:center;'>Father Name</th><th style='text-align:center;'>Amount</th><th style='text-align:center;'>Year</th><th style='text-align:center;'></th></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "</td>" +
                   "<td style='text-align:center;'><span>" + x.Name + "  </span></td>" +
                   "<td style='text-align:center;'><span>" + x.FName + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Amount + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Year + "</span></td>" +                  
                   (x.Edit == true ? "<td><a onclick='EditFormerDetail(this)' class='btn-sm btn-danger edit' href='#'>Edit</a><span id='spID' style='display:none'>" + x.FarmerId + "</span><span id='spID' style='display:none'>" + x.LeadFormerId + "</span></td>" : "<td></td>") +
                   "</tr>";
                $table += row;
                count++;
            });
            $('#DivFarmers').html($table);
            $table += "</table>";
            $('#DivFarmers').show();
        },
        error: function (data) {
            alert("error found");
        }

    });
}

function EditFormerDetail(obj) {
    var td = obj.parentNode;
    row = obj.parentNode.parentNode;
    var span1 = $(td).find('span:eq(0)');
    var FormerId = span1.html();
    var span2 = $(td).find('span:eq(1)');
    var LeadFormerId = span2.html();
    $('#hdnFarmerId').val(FormerId);
    $('#hdnLeadFarmerId').val(LeadFormerId);
    var obj = JSON.stringify({ FormerId: FormerId, LeadFormerId: LeadFormerId });
    $.ajax({
        type: "POST",
        url: "frmFormerInfo.aspx/EditFarmerDetail",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (r) {
            $('#txtFormerName').val(r.d.Name);
            $('#txtFatherName').val(r.d.FName);

            $("#tbl tbody tr").remove();
            $.each(r.d.FormerConList, function (i, x) {
                var markup = "<tr><td><input type='checkbox' name='record'></td><td><span id='fruit' style='display:none'>" + x.FruitId + "</span>" + x.Fruit + "</td><td><span id='percentage'>" + x.Percentage + "</span></td><td><span>" + x.Year + "</span></td><td><span id='season' style='display:none'>" + x.SeasonId + "</span>" + x.SeasonName + "</td><td><span id='area'>" + x.Area + "</span></td><td><span id='amount'>" + x.Amount + "</span></td></tr>";
                $("#tbl tbody").append(markup);
            });
            SumCAmount();
            SumTAmount();
            $('.btnSave').hide();
            $('.btnUpdate').show();
            $('#IdH3Title').html('Lead Farmer Information Edit Activity !');
            $('#IdMessage').html('Note: Please fill the form correctly. ');
            $('#MdAlert').modal('show');
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function Update() {
    var formDetail = {};
    formDetail.FarmerId = $('#hdnFarmerId').val();
    formDetail.LeadFormerId = $('#hdnLeadFarmerId').val();
    formDetail.Name = $('#txtFormerName').val();
    formDetail.FName = $('#txtFatherName').val();
    var lst = new Array();
    $('#tbl tbody tr').each(function () {
        var detail = {};
        var tr = $(this).closest('tr');
        var FruitId = $(tr).find('span:eq(0)');
        var Percentage = $(tr).find('span:eq(1)');
        var Year = $(tr).find('span:eq(2)');
        var Season = $(tr).find('span:eq(3)');
        var Area = $(tr).find('span:eq(4)');
        var Amount = $(tr).find('span:eq(5)');
        detail.FruitId = $(FruitId).html();
        detail.Percentage = $(Percentage).html();
        detail.Area = $(Area).html();
        detail.Amount = $(Amount).html();
        detail.SeasonId = $(Season).html();
        detail.Year = $(Year).html();
        lst.push(detail);
    });
    formDetail.FormerConList = lst;
    var jsonObject = JSON.stringify({ formDetail: formDetail });

    $.ajax({
        type: "POST",
        url: "frmFormerInfo.aspx/UpdateDetail",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $.alert({
                icon: 'glyphicon glyphicon-saved',
                closeIcon: true,
                title: 'Form Updation Alert',
                content: 'Form is successfully saved !'
            });

            //Clear components
            $("#tbl tbody tr").remove();
            $('#txtFormerName').val('');
            $('#txtFatherName').val('');
            $("#divCAmount").html('');
            $("#divTAmount").html('');
            $('.btnSave').show();
            $('.btnUpdate').hide()
            LoadShowFarmers();
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function ShowControlsByRoles() {
    $.ajax({
        type: "POST",
        url: "frmFormerInfo.aspx/GetUserRoles",
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