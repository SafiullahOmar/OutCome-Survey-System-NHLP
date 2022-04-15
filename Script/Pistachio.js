function CheckBoxCheckEvent() {
    //seeds
    $("input:checkbox[id='chkSeeds']").change(function () {
        if (!$(this).is(":checked")) {
            $('#txtSeedsArea').attr("disabled", "disabled");
            $('#txtSeeds').attr("disabled", "disabled");
            $('#txtSeeds').val('');
            $('#txtSeedsArea').val('');
        }
        else {
            $('#txtSeedsArea').attr("disabled", false);
            $('#txtSeeds').attr("disabled", false);
        }
    });
    //sapples
    $("input:checkbox[id='chkSapples']").change(function () {
        if (!$(this).is(":checked")) {
            $('#txtSapplesArea').attr("disabled", "disabled");
            $('#txtSapples').attr("disabled", "disabled");
            $('#txtSapples').val('');
            $('#txtSapplesArea').val('');
        } else {
            $('#txtSapplesArea').attr("disabled", false);
            $('#txtSapples').attr("disabled", false);
        }
    });
    //Hing
    $("input:checkbox[id='chkHing']").change(function () {
        if (!$(this).is(":checked")) {
            $('#txtHingArea').attr("disabled", "disabled");
            $('#txtHing').attr("disabled", "disabled");
            $('#txtHing').val('');
            $('#txtHingArea').val('');
        } else {
            $('#txtHingArea').attr("disabled", false);
            $('#txtHing').attr("disabled", false);
        }
    });
    //tanker
    $("input:checkbox[id='chkTanker']").change(function () {
        if (!$(this).is(":checked")) {
            $('#txtTanker').attr("disabled", "disabled");
            $('#txtTanker').val('');
        }
        else {
            $('#txtTanker').attr("disabled", false);
        }
    });
    //fence
    $("input:checkbox[id='chkFence']").change(function () {
        if (!$(this).is(":checked")) {
            $('#txtFence').attr("disabled", "disabled");
            $('#txtFence').val('');
        } else {
            $('#txtFence').attr("disabled", false);
        }
    });
}

function formValidation(e) {

    var flag = true;
    if ($('#ddlYear').val() == '-1' || $('#ddlYear').find('option:selected').text() == '') {
        $('#ddlYear').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlYear').css('background-color', '#ffff'); }
    //season
    if ($('#ddlSeason').val() == '-1' || $('#ddlSeason').find('option:selected').text() == '') {
        $('#ddlSeason').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlSeason').css('background-color', '#ffff'); }
    //province
    if ($('.province').val() == '-1') {
        $('.province').css('background-color', '#FFAAAA');;
        flag = false;
    }
    else { $('.province').css('background-color', '#ffff'); }
    //district
    if ($('#ddlDistrict').val() == '-1' || $('#ddlDistrict').find('option:selected').text() == '') {
        $('#ddlDistrict').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlDistrict').css('background-color', '#ffff'); }
    //farmer
    if ($('#ddlFarmer').val() == '-1' || $('#ddlFarmer').find('option:selected').text() == '') {
        $('#ddlFarmer').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlFarmer').css('background-color', '#ffff'); }
    //extension worker
    if ($('#ddlExtensionW').val() == '-1' || $('#ddlExtensionW').find('option:selected').text() == '') {
        $('#ddlExtensionW').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlExtensionW').css('background-color', '#ffff'); }


    if ($('#txtNutrient').val() == '') {
        $('#txtNutrient').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtNutrient').css('background-color', '#ffff'); }

    if ($('#txtArea').val() == '') {
        $('#txtArea').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtArea').css('background-color', '#ffff'); }

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
function SaveFormerInfo() {
    var formDetail = {};
    formDetail.FarmerId = $('#ddlFarmer').val();
    formDetail.SeasonId = $('#ddlSeason').val();
    formDetail.ExtId = $('#ddlExtensionW').val();
    formDetail.Longtitude = $('#txtLongtitude').val() == '' ? "NULL" : $('#txtLongtitude').val();
    formDetail.Latitude = $('#txtLatitude').val() == '' ? "NULL" : $('#txtLatitude').val();
    formDetail.Year = $('#ddlYear').val();
    if ($("#txtSeedsArea").val() != '') { formDetail.SeedsArea = $("#txtSeedsArea").val(); } else { formDetail.SeedsArea = "NULL"; }
    if ($("#txtSeeds").val() != '') { formDetail.Seeds = $("#txtSeeds").val(); } else { formDetail.Seeds = "NULL"; }
    if ($("#txtSapples").val() != '') { formDetail.Sapples = $("#txtSapples").val(); } else { formDetail.Sapples = "NULL"; }
    if ($("#txtSapplesArea").val() != '') { formDetail.SapplesArea = $("#txtSapplesArea").val(); } else { formDetail.SapplesArea = "NULL"; }
    if ($("#txtHing").val() != '') { formDetail.Hing = $("#txtHing").val(); } else { formDetail.Hing = "NULL"; }
    if ($("#txtHingArea").val() != '') { formDetail.HingArea = $("#txtHingArea").val(); } else { formDetail.HingArea = "NULL"; }
    if ($("#txtTanker").val() != '') { formDetail.WaterTank = $("#txtTanker").val(); } else { formDetail.WaterTank = "NULL"; }
    if ($("#txtFence").val() != '') { formDetail.Fence = $("#txtFence").val(); } else { formDetail.Fence = "NULL"; }

    if ($("input:checkbox[id='chkSeeds']").is(":checked")) { formDetail.checkSeeds = "True"; } else { formDetail.checkSeeds = "False"; }
    if ($("input:checkbox[id='chkSapples']").is(":checked")) { formDetail.checkSapples = "True"; } else { formDetail.checkSapples = "False"; }
    if ($("input:checkbox[id='chkHing']").is(":checked")) { formDetail.checkHing = "True"; } else { formDetail.checkHing = "False"; }
    if ($("input:checkbox[id='chkTanker']").is(":checked")) { formDetail.checkWaterTank = "True"; } else { formDetail.checkWaterTank = "False"; }
    if ($("input:checkbox[id='chkFence']").is(":checked")) { formDetail.checkFence = "True"; } else { formDetail.checkFence = "False"; }
    var jsonObject = JSON.stringify({ formDetail: formDetail });

    $.ajax({
        type: "POST",
        url: "Pistachio.aspx/SaveFormDetail",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d == false) {
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
                Clear();
                LoadShowFarmers();
            } else {
                $.alert({
                    icon: 'glyphicon glyphicon-saved',
                    closeIcon: true,
                    title: ' Warning',
                    animation: 'news',
                    closeAnimation: 'news',
                    theme: 'light',
                    type: 'green',
                    typeAnimated: true,
                    content: 'Record Has Already Exist ! '
                });

            }
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function ShowFarmers(obj) {
    $.ajax({
        type: "POST",
        url: "Pistachio.aspx/GetFarmerLists",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblFarmersDetail'  width='100%' class='table table-striped table-bordered  table-hover'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Name</th><th style='text-align:center;'>Father Name</th><th style='text-align:center;'>Year</th><th style='text-align:center;'></th></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "</td>" +
                   "<td style='text-align:center;'><span>" + x.Name + "  </span></td>" +
                   "<td style='text-align:center;'><span>" + x.FName + "</span></td>" + 
                   "<td style='text-align:center;'><span>" + x.Year + "</span></td>" +
                   (x.Edit == true ? "<td><a onclick='EditFarmerDetail(this)' class='btn-sm btn-danger edit' href='#'>Edit</a><span id='spID' style='display:none'>" + x.FarmerId + "</span><span id='spID' style='display:none'>" + x.ExtWId + "</span><span style='display:none'>" + x.Year + "</span><span style='display:none'>" + x.SeasonId + "</span><span style='display:none'>" + x.FarmerActivityId + "</span></td>" : "<td></td>") +
                   "</tr>";
                $table += row;
                count++;
            });
            $('#DivFarmers').html($table);
            $table += "</table>";
            $('#tblFarmersDetail').DataTable({ "bPaginate": true, "bLengthChange": true, "bFilter": true, "bSort": true, "bInfo": true, "bAutoWidth": true, });
            $('#DivFarmers').show();
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function EditFarmerDetail(obj) {
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
    var span5 = $(td).find('span:eq(4)');
    var FarmerActivityId = span5.html();
    $('#hdnFarmerId').val(FormerId);
    $('#hdnExtWIdFarmerId').val(ExtWId);
    $('#hdnFarmerActivityId').val(FarmerActivityId);
    var obj = JSON.stringify({ FormerId: FormerId, ExtWId: ExtWId, Year: Year, SeasonId: SeasonId, ActivityId: "7", FarmerActivityId: FarmerActivityId });
    $.ajax({
        type: "POST",
        url: "Pistachio.aspx/EditFarmerDetail",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (r) {
            debugger
            $('#ddlDistrict').val(r.d.DistrictId);
            $('.province').val(r.d.ProvinceId);
            $('#ddlFarmer').val(r.d.FarmerId);
            $('#ddlSeason').val(r.d.SeasonId);
            $('#ddlExtensionW').val(r.d.ExtId);
            $('#txtLongtitude').val(r.d.Longtitude);
            $('#txtLatitude').val(r.d.Latitude);
            $('#ddlYear').val(r.d.Year);
            $('#ddlYear').attr("disabled", "disabled");
            $('#ddlSeason').attr("disabled", "disabled");            
            if (r.d.checkSeeds == true) {
                $('#chkSeeds').prop('checked', true).trigger('change');
                $('#txtSeedsArea').val(r.d.SeedsArea);
                $('#txtSeeds').val(r.d.Seeds);
                
            }
            if (r.d.checkSapples == true) {

                $('#chkSapples').prop('checked', true).trigger('change');
                $('#txtSapplesArea').val(r.d.SapplesArea);
                $('#txtSapples').val(r.d.Sapples);
            }   
            if (r.d.checkHing == true) {

                $('#chkHing').prop('checked', true).trigger('change');
                $('#txtHingArea').val(r.d.HingArea);
                $('#txtHing').val(r.d.Hing);
            }
            if (r.d.checkFence == true) {

                $('#chkFence').prop('checked', true).trigger('change');
                $('#txtFence').val(r.d.Fence);
            }
            if (r.d.checkWaterTank == true) {

                $('#chkTanker').prop('checked', true).trigger('change');
                $('#txtTanker').val(r.d.WaterTank);
            }
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
    formDetail.FarmerActivityId = $('#hdnFarmerActivityId').val();
    formDetail.FarmerId = $('#hdnFarmerId').val();
    formDetail.SeasonId = $('#ddlSeason').val();
    formDetail.ExtId = $('#hdnExtWIdFarmerId').val();
    formDetail.Longtitude = $('#txtLongtitude').val() == '' ? "NULL" : $('#txtLongtitude').val();
    formDetail.Latitude = $('#txtLatitude').val() == '' ? "NULL" : $('#txtLatitude').val();
    formDetail.Year = $('#ddlYear').val();
    if ($("#txtSeedsArea").val() != '') { formDetail.SeedsArea = $("#txtSeedsArea").val(); } else { formDetail.SeedsArea = "NULL"; }
    if ($("#txtSeeds").val() != '') { formDetail.Seeds = $("#txtSeeds").val(); } else { formDetail.Seeds = "NULL"; }
    if ($("#txtSapples").val() != '') { formDetail.Sapples = $("#txtSapples").val(); } else { formDetail.Sapples = "NULL"; }
    if ($("#txtSapplesArea").val() != '') { formDetail.SapplesArea = $("#txtSapplesArea").val(); } else { formDetail.SapplesArea = "NULL"; }
    if ($("#txtHing").val() != '') { formDetail.Hing = $("#txtHing").val(); } else { formDetail.Hing = "NULL"; }
    if ($("#txtHingArea").val() != '') { formDetail.HingArea = $("#txtHingArea").val(); } else { formDetail.HingArea = "NULL"; }
    if ($("#txtTanker").val() != '') { formDetail.WaterTank = $("#txtTanker").val(); } else { formDetail.WaterTank = "NULL"; }
    if ($("#txtFence").val() != '') { formDetail.Fence = $("#txtFence").val(); } else { formDetail.Fence = "NULL"; }

    if ($("input:checkbox[id='chkSeeds']").is(":checked")) { formDetail.checkSeeds = "True"; } else { formDetail.checkSeeds = "False"; }
    if ($("input:checkbox[id='chkSapples']").is(":checked")) { formDetail.checkSapples = "True"; } else { formDetail.checkSapples = "False"; }
    if ($("input:checkbox[id='chkHing']").is(":checked")) { formDetail.checkHing = "True"; } else { formDetail.checkHing = "False"; }
    if ($("input:checkbox[id='chkTanker']").is(":checked")) { formDetail.checkWaterTank = "True"; } else { formDetail.checkWaterTank = "False"; }
    if ($("input:checkbox[id='chkFence']").is(":checked")) { formDetail.checkFence = "True"; } else { formDetail.checkFence = "False"; }

    var jsonObject = JSON.stringify({ formDetail: formDetail });

    $.ajax({
        type: "POST",
        url: "Pistachio.aspx/UpdateDetail",
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
                content: '<strong><font style="color:white;">Farmer Information Has been updated to the System!</font></strong>'
            });

            //Clear components
            $('#ddlYear').attr("disabled", false);
            $('#ddlSeason').attr("disabled", false);
            $('#hdnExtWIdFarmerId').val('');
            $('#hdnFarmerId').val('');
            $('#hdnFarmerActivityId').val('');
            Clear();
            $('.btnSave').show();
            $('.btnUpdate').hide()
            LoadShowFarmers();
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function Clear() {

    $('#txtLongtitude').val('');
    $('#txtLatitude').val('');
    $('#ddlFarmer').val('-1');
    $('#chkSeeds').attr('checked', false).trigger('change');
    $('#chkSapples').attr('checked', false).trigger('change');
    $('#chkTanker').attr('checked', false).trigger('change');
    $('#chkFence').attr('checked', false).trigger('change');
    $('#chkHing').attr('checked', false).trigger('change');
}