function SaveFarmer(province, gender, EW) {
    var formDetails = {};
    formDetails.Name = $('#txtName').val();
    formDetails.ProvinceID = province;
    formDetails.DistrictID = $('#ddlDistrict').val();
    formDetails.Gender = gender;
    formDetails.FatherName = $('#txtFatherName').val();
    formDetails.ContactNo = $('#txtContactNo').val();
    formDetails.ExtId = EW;
    var jsonObject = JSON.stringify({ formDetails: formDetails });
    $.ajax({
        type: "POST",
        url: "frmFarmers.aspx/SaveFormDetail",
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
                content: '<strong><font style="color:white;">Extension Worker Information Has been Saved into System!</font></strong>'
            });


            //Clear components
            $('.btnUpdate').hide();
            $('.btnSave').show();
            ShowFarmers($('#ddlDistrict').val());
            ClearForm();
            $("input:radio[name=rdSex][value='True']").prop('checked', 'checked');
        },
        error: function (data) {
            alert("error found");
        }

    });
}
var row = null;
function ShowFarmers(DistrictId) {
    $.ajax({
        type: "POST",
        url: "frmFarmers.aspx/GetFarmersLists",
        data: '{DistrictId: ' + DistrictId + '}',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblfarmers'  width='100%' class='table table-striped table-bordered  table-hover'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Name</th><th style='text-align:center;'>Father Name</th><th style='text-align:center;'>Province</th><th style='text-align:center;'>District</th><th style='text-align:center;'>Contact No</th><th style='text-align:center;'>EW Name</th><th></th></tr></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "<span id='spanSeedPlantedId' style='display:none'>" + x.FarmerId + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Name + "  </span></td>" +
                   "<td style='text-align:center;'><span>" + x.FatherName + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Province + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.District + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.ContactNo + "</span></td>" +
                    "<td style='text-align:center;'><span>" + x.ExtensionWName + "</span></td>" +
                   (x.Edit == true ? "<td><a onclick='EditPCLeadFormerDetail(this)' class='btn-sm btn-danger edit' href='#'>Edit</a><span id='spID' style='display:none'>" + x.FarmerId + "</span></td>" : "<td></td>") +
                   "</tr>";
                $table += row;
                count++;
            });
            $('#FarmerW').html($table);
            $table += "</table>";
            $('#tblfarmers').DataTable({ "bPaginate": true, "bLengthChange": true, "bFilter": true, "bSort": true, "bInfo": true, "bAutoWidth": true, });
            $('#FarmerW').show();
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function formValidation(e) {
    var flag = true;
    if ($('.province').val() == '-1') {
        $('.province').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('.province').css('background-color', '#ffff'); }
    if ($('#ddlDistrict').val() == '-1') {
        $('#ddlDistrict').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlDistrict').css('background-color', '#ffff'); }
    if ($('#txtVillage').val() == '') {
        $('#txtVillage').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtVillage').css('background-color', '#ffff'); }
    if ($('#txtName').val() == '') {
        $('#txtName').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtName').css('background-color', '#ffff'); }
    if ($('.EW').val() == '-1') {
        $('.EW').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('.EW').css('background-color', '#ffff'); }
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

function ClearForm() {
    $('#txtName').val('');
    $('.EW').val('-1');
    $('#txtFatherName').val('');
    $('#txtContactNo').val('');
    $('#txtVillage').val('');
}

function EditPCLeadFormerDetail(obj) {
    var td = obj.parentNode;
    row = obj.parentNode.parentNode;
    var span = $(td).find('span');
    var FarmerId = span.html();
    $('#hdnFarmerId').val(FarmerId);
    var obj = JSON.stringify({ Id: FarmerId });
    $.ajax({
        type: "POST",
        url: "frmFarmers.aspx/GetLFarmerDetailByID",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (r) {
            $('#txtName').val(r.d.Name);
            $('#ddlDistrict').val(r.d.DistrictID);
            $('#txtFatherName').val(r.d.FatherName);
            $('#txtContactNo').val(r.d.ContactNo);
            $("input:radio[name^='rdSex'][value='" + r.d.GenderBL + "']").prop('checked', true);
            $('.province').val(r.d.ProvinceID);
            $('.EW').val(r.d.ExtId);

            $('.btnSave').hide();
            $('.btnUpdate').show();
            $.alert({
                icon: 'glyphicon glyphicon-saved',
                closeIcon: true,
                title: 'Alert',
                animation: 'news',
                closeAnimation: 'news',
                theme: 'light',
                type: 'green',
                typeAnimated: true,
                content: 'Note: Please fill the form correctly.'
            });
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function Update(province, gender, EW) {
    var formDetails = {};
    formDetails.Name = $('#txtName').val();
    formDetails.ProvinceID = province;
    formDetails.DistrictID = $('#ddlDistrict').val();
    formDetails.Gender = gender;
    formDetails.FatherName = $('#txtFatherName').val();
    formDetails.ContactNo = $('#txtContactNo').val();
    formDetails.ExtId = EW;
    formDetails.FarmerId = $('#hdnFarmerId').val();

    var jsonObject = JSON.stringify({ formDetails: formDetails });
    $.ajax({
        type: "POST",
        url: "frmFarmers.aspx/UpdateFormDetail",
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
                content: '<strong><font style="color:white;">Lead Farmer  Information Has been updated into System !</font></strong>'
            });

            //Clear components
            $('.btnUpdate').hide();
            $('.btnSave').show();
            ShowFarmers($('#ddlDistrict').val());
            ClearForm();
            $("input:radio[name=rdSex][value='True']").prop('checked', 'checked');
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function ShowControlsByRoles() {
    $.ajax({
        type: "POST",
        url: "frmExtensionW.aspx/GetUserRoles",
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