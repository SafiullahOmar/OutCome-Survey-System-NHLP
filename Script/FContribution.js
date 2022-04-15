function SaveFormerInfo() {
    var formDetail = {};
    formDetail.FarmerId = $('#ddlFarmer').val();
    formDetail.SeasonId = $('#ddlSeason').val();
    formDetail.Year = $('#ddlYear').val();
    var lst = new Array();
    $('#tbl tbody tr').each(function () {
        var detail = {};
        var tr = $(this).closest('tr');
        var FruitId = $(tr).find('span:eq(0)');
        var Percentage = $(tr).find('span:eq(1)');;
        var Area = $(tr).find('span:eq(4)');
        var AmountPerPKG = $(tr).find('span:eq(5)');
        var Amount = $(tr).find('span:eq(6)');

        detail.FruitId = $(FruitId).html();
        detail.Percentage = $(Percentage).html();
        detail.Area = $(Area).html();
        detail.Amount = $(Amount).html();
        detail.AmountPerPKG = $(AmountPerPKG).html();

        var FruitVariety = $(tr).find('span:eq(8)');
        var InterCrop = $(tr).find('span:eq(9)');
        var DAP = $(tr).find('span:eq(10)');
        var CropInKG = $(tr).find('span:eq(11)');
        var latude = $(tr).find('span:eq(12)');
        var longtude = $(tr).find('span:eq(13)');
        detail.Latitude = $(latude).html() == '' ? 'NULL' : $(latude).html();
        detail.Longtitude = $(longtude).html() == '' ? 'NULL' : $(longtude).html();

        detail.DAP = $(DAP).html() == '' ? 0 : $(DAP).html();
        detail.InterCropId = $(InterCrop).html() == '' ? 'NULL' : $(InterCrop).html();
        detail.FruitVarietyId = $(FruitVariety).html() == '' ? 'NULL' : $(FruitVariety).html();
        detail.InterCropInKG = $(CropInKG).html() == '' ? 0 : $(CropInKG).html();

        // alert(($(FruitVariety).html() != "null" || $(FruitVariety).html() != '') && ($(InterCrop).html() != "null" && $(InterCrop).html() != ''));
        //if (($(FruitVariety).html() != "null" || $(FruitVariety).html() != '') && ($(InterCrop).html() != "null" && $(InterCrop).html() != '')) {
        //    detail.DAP = $(DAP).html();
        //    detail.InterCropId = $(InterCrop).html();
        //    detail.FruitVarietyId = $(FruitVariety).html();
        //    detail.InterCropInKG = $(CropInKG).html();

        //} else {
        //    detail.DAP = 0;
        //    detail.InterCropId = "NULL";
        //    detail.FruitVarietyId = "NULL";
        //    detail.InterCropInKG = 0;

        //}
        lst.push(detail);
    });
    formDetail.FormerConList = lst;
    var jsonObject = JSON.stringify({ formDetail: formDetail });

    $.ajax({
        type: "POST",
        url: "frmFarmerContribution.aspx/SaveFormDetail",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $.alert({
                icon: 'glyphicon glyphicon-saved',
                closeIcon: true,
                title: 'Success Alert',
                animation: 'news',
                closeAnimation: 'news',
                theme: 'dark',
                type: 'green',
                typeAnimated: true,
                content: '<strong><font style="color:white;">Form is successfully saved !</font></strong>'
            });

            //Clear components
            $("#tbl tbody tr").remove();
            $("#divCAmount").html('');
            $("#divTAmount").html('');
            $('#DivPayableDate').html('');
            $('#txtFormerName').val('');
            $('#txtFatherName').val('');
            $('#txtLongtitude').val('');
            $('#txtLatitude').val('');
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
        url: "frmFarmerContribution.aspx/GetFarmerInfo",
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
    if ($('#ddlFarmer').val() == '-1' || $('#ddlFarmer').find('option:selected').text() == '') {
        $('#ddlFarmer').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlLeadFormer').css('background-color', '#ffff'); }
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
var row = null;
function ShowFarmers(obj) {

    $.ajax({
        type: "POST",
        url: "frmFarmerContribution.aspx/GetFarmerLists",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblFarmersContribution'  width='100%' class='table table-striped table-bordered  table-hover'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Name</th><th style='text-align:center;'>Father Name</th><th style='text-align:center;'>Amount</th><th style='text-align:center;'>Year</th><th style='text-align:center;'></th></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "</td>" +
                   "<td style='text-align:center;'><span>" + x.Name + "  </span></td>" +
                   "<td style='text-align:center;'><span>" + x.FName + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Amount + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Year + "</span></td>" +
                   (x.Edit == true ? "<td><a onclick='EditFormerDetail(this)' class='btn-sm btn-danger edit' href='#'>Edit</a><span id='spID' style='display:none'>" + x.FarmerId + "</span><span id='spID' style='display:none'>" + x.ExtId + "</span><span style='display:none'>" + x.Year + "</span><span style='display:none'>" + x.SeasonId + "</span></td>" : "<td></td>") +
                   "</tr>";
                $table += row;
                count++;
            });
            $('#DivFarmers').html($table);
            $table += "</table>";
            $('#tblFarmersContribution').DataTable({ "bPaginate": true, "bLengthChange": true, "bFilter": true, "bSort": true, "bInfo": true, "bAutoWidth": true, });
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
    var ExtWId = span2.html();
    var span3 = $(td).find('span:eq(2)');
    var Year = span3.html();
    var span4 = $(td).find('span:eq(3)');
    var SeasonId = span4.html();
    $('#hdnFarmerId').val(FormerId);
    $('#hdnExtWIdFarmerId').val(ExtWId);
    var obj = JSON.stringify({ FormerId: FormerId, ExtWId: ExtWId, Year: Year, SeasonId: SeasonId });
    $.ajax({
        type: "POST",
        url: "frmFarmerContribution.aspx/EditFarmerDetail",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (r) {
            $('#ddlSeason').val(r.d.SeasonId);
            $('#ddlYear').val(r.d.Year);
            $("#ddlFarmer").val(r.d.FarmerId);
            $("#tbl tbody tr").remove();
            $.each(r.d.FormerConList, function (i, x) {
                var markup = "<tr><td><input type='checkbox' name='record'></td><td><span id='fruit' style='display:none'>" + x.FruitId + "</span>" + x.Fruit + "</td><td><span id='percentage'>" + x.Percentage + "</span></td><td><span>" + r.d.Year + "</span></td><td><span id='season' style='display:none'>" + r.d.SeasonId + "</span>" + x.SeasonName + "</td><td><span id='area'>" + x.Area + "</span></td><td><span id='amntPerpKG' style='dispaly:none'>" + x.AmountPerPKG + "</span></td><td><span id='amount'>" + x.Amount + "</span></td><td><span>" + (parseFloat(x.AmountPerPKG) * parseFloat(x.Area)) + "</span><span id='Variety' style='display:none'>" + x.FruitVarietyId + "</span><span id='Crop' style='display:none'>" + x.InterCropId + "</span><span id='DAP' style='display:none'>" + x.DAP + "</span><span id='CropKG' style='display:none'>" + x.InterCropInKG + "</span><span id='Latitude' style='display:none'>" + x.Latitude + "</span><span id='Longtitude' style='display:none'>" + x.Longtitude + "</span></td></tr>";
                $("#tbl tbody").append(markup);
            });
            SumCAmount();
            SumTAmount();
            $('.btnSave').hide();
            $('.btnUpdate').show();
            $.alert({
                icon: 'glyphicon glyphicon-saved',
                closeIcon: true,
                title: ' Alert',
                animation: 'news',
                closeAnimation: 'news',
                theme: 'light',
                type: 'green',
                typeAnimated: true,
                content: 'Note: Please fill the form correctly. '
            });
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function Update() {

    var formDetail = {};
    formDetail.FarmerId = $('#hdnFarmerId').val();
    formDetail.SeasonId = $('#ddlSeason').val();
    formDetail.Year = $('#ddlYear').val();
    var lst = new Array();
    $('#tbl tbody tr').each(function () {
        var detail = {};
        var tr = $(this).closest('tr');
        var FruitId = $(tr).find('span:eq(0)');
        var Percentage = $(tr).find('span:eq(1)');;
        var Area = $(tr).find('span:eq(4)');
        var AmountPerPKG = $(tr).find('span:eq(5)');
        var Amount = $(tr).find('span:eq(6)');

        detail.FruitId = $(FruitId).html();
        detail.Percentage = $(Percentage).html();
        detail.Area = $(Area).html();
        detail.Amount = $(Amount).html();
        detail.AmountPerPKG = $(AmountPerPKG).html();

        var FruitVariety = $(tr).find('span:eq(8)');
        var InterCrop = $(tr).find('span:eq(9)');
        var DAP = $(tr).find('span:eq(10)');
        var CropInKG = $(tr).find('span:eq(11)');
        var latude = $(tr).find('span:eq(12)');
        var longtude = $(tr).find('span:eq(13)');
        detail.Latitude = $(latude).html() == '' ? 'NULL' : $(latude).html();
        detail.Longtitude = $(longtude).html() == '' ? 'NULL' : $(longtude).html();

        detail.DAP = $(DAP).html() == '' ? 0 : $(DAP).html();
        detail.InterCropId = $(InterCrop).html() == '' ? 'NULL' : $(InterCrop).html();
        detail.FruitVarietyId = $(FruitVariety).html() == '' ? 'NULL' : $(FruitVariety).html();
        detail.InterCropInKG = $(CropInKG).html() == '' ? 0 : $(CropInKG).html();

        //if (($(FruitVariety).html() != "null" || $(FruitVariety).html() != '') && ($(InterCrop).html() != "null" && $(InterCrop).html() != '')) {
        //    detail.DAP = $(DAP).html();
        //    detail.InterCropId = $(InterCrop).html();
        //    detail.FruitVarietyId = $(FruitVariety).html();
        //    detail.InterCropInKG = $(CropInKG).html();
        //} else {
        //    detail.DAP = 0;
        //    detail.InterCropId = "NULL";
        //    detail.FruitVarietyId = "NULL";
        //    detail.InterCropInKG = 0;

        //}
        //alert($(FruitVariety).html());
        lst.push(detail);
    });
    formDetail.FormerConList = lst;
    var jsonObject = JSON.stringify({ formDetail: formDetail });

    $.ajax({
        type: "POST",
        url: "frmFarmerContribution.aspx/UpdateDetail",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $.alert({
                icon: 'glyphicon glyphicon-saved',
                closeIcon: true,
                title: 'Form Updation Alert',
                animation: 'news',
                closeAnimation: 'news',
                theme: 'dark',
                type: 'green',
                typeAnimated: true,
                content: '<strong><font style="color:white;">Farmer and their contribution  Information Has been updated to the System!</font></strong>'
            });

            //Clear components
            $("#tbl tbody tr").remove();
            $("#divCAmount").html('');
            $("#divTAmount").html('');
            $('#DivPayableDate').html('');
            $('#txtLongtitude').val('');
            $('#txtLatitude').val('');
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