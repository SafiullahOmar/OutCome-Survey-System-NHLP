function SaveExtensionWorker(province, gender, year, activity, PC,Percentage) {
    var formDetails = {};
    formDetails.Name = $('#txtName').val();
    formDetails.ProvinceID = province;
    formDetails.DistrictID = $('#ddlDistrict').val();
    formDetails.Gender = gender;
    formDetails.FatherName = $('#txtFatherName').val();
    formDetails.ContactNo = $('#txtContactNo').val();

    formDetails.village = $('#txtVillage').val();
    formDetails.Year = year
    formDetails.ActivityId = activity;
    formDetails.PCId = PC;
    formDetails.Percentage = Percentage;
    formDetails.ExtensionWorker = $('#txtExtWorkerName').val();

    var jsonObject = JSON.stringify({ formDetails: formDetails });
    $.ajax({
        type: "POST",
        url: "frmExtensionWInfo.aspx/SaveFormDetail",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $.alert({
                icon: 'glyphicon glyphicon-saved',
                closeIcon: true,
                title: 'Success Alert',
                content: 'Extension Worker Information Has been Saved into System!'
            });

           
            //Clear components
            $('.btnUpdate').hide();
            $('.btnSave').show();
            ClearForm();
            $("input:radio[name=rdSex][value='True']").prop('checked', 'checked');
        },
        error: function (data) {
            alert("error found");
        }

    });
}
var row = null;
function ShowExtensionWorkers(Province) {
    $.ajax({
        type: "POST",
        url: "frmExtensionWInfo.aspx/GetExtensionWLists",
        data: '{Province: ' + Province + '}',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblExtenW'  width='100%' class='table table-striped table-bordered  table-hover'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Name</th><th style='text-align:center;'>Father Name</th><th style='text-align:center;'>Province</th><th style='text-align:center;'>District</th><th style='text-align:center;'>Contact No</th><th style='text-align:center;'>Extension Worker</th><th style='text-align:center;'>PC Name</th><th style='text-align:center;'>Year</th><th style='text-align:center;'>C %</th></tr></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "<span id='spanSeedPlantedId' style='display:none'>" + x.ID + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Name + "  </span></td>" +
                   "<td style='text-align:center;'><span>" + x.FatherName + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Province + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.District + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.ContactNo + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.ExtensionWorker + "</span></td>" +
                    "<td style='text-align:center;'><span>" + x.PCName + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Year + "</span></td>" +
                    "<td style='text-align:center;'><span>" + x.Percentage + "</span></td>" +
                   (x.Edit==true?"<td><a onclick='EditPCLeadFormerDetail(this)' class='btn-sm btn-danger edit' href='#'>Edit</a><span id='spID' style='display:none'>" + x.LeadFormerId + "</span></td>":"<td></td>")+
                   "</tr>";
                $table += row;
                count++;
            });
            $('#ExtW').html($table);
            $table += "</table>";
            $('#ExtW').show();
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
    if ($('.year').val() == '-1') {
        $('.year').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('.year').css('background-color', '#ffff'); }
    if ($('.activity').val() == '-1') {
        $('.activity').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('.activity').css('background-color', '#ffff'); }
    if ($('.PC').val() == '-1') {
        $('.PC').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('.PC').css('background-color', '#ffff'); }
    if ($('#txtExtWorkerName').val() == '') {
        $('#txtExtWorkerName').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtExtWorkerName').css('background-color', '#ffff'); }
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

function ClearForm() {
    $('#txtName').val('');
    $('.year').val('-1');
    $('.activity').val('-1');
    $('.PC').val('-1');
    $('#ddlDistrict').val('-1');
    $('#txtFatherName').val('');
    $('#txtContactNo').val('');
    $('#txtVillage').val('');
    $('#txtExtWorkerName').val('');
}

function EditPCLeadFormerDetail(obj) {
    var td = obj.parentNode;
    row = obj.parentNode.parentNode;
    var span = $(td).find('span');
    var LeadFormerID = span.html();
    $('#hdnLeadFId').val(LeadFormerID);
    var obj = JSON.stringify({ LeadFormerID: LeadFormerID });
    $.ajax({
        type: "POST",
        url: "frmExtensionWInfo.aspx/GetLFarmerDetailByID",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (r) {
            $('#txtName').val(r.d.Name);
            $('#ddlDistrict').val(r.d.DistrictID);
            $('#txtFatherName').val(r.d.FatherName);
            $('#txtContactNo').val(r.d.ContactNo);
            $('#txtVillage').val(r.d.village);
            $("input:radio[name^='rdSex'][value='" + r.d.GenderBL + "']").prop('checked', true);
            $('#txtExtWorkerName').val(r.d.ExtensionWorker);
            $('.province').val(r.d.ProvinceID);
            $('.year').val(r.d.Year);
            $('.activity').val(r.d.ActivityId);
            $('.PC').val(r.d.PCId);
            $('.Percentage').val(r.d.Percentage);

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
function Update(province, gender, year, activity, PC, Percentage) {
    var formDetails = {};
    formDetails.Name = $('#txtName').val();
    formDetails.ProvinceID = province;
    formDetails.DistrictID = $('#ddlDistrict').val();
    formDetails.Gender = gender;
    formDetails.FatherName = $('#txtFatherName').val();
    formDetails.ContactNo = $('#txtContactNo').val();

    formDetails.village = $('#txtVillage').val();
    formDetails.Year = year
    formDetails.ActivityId = activity;
    formDetails.PCId = PC;
    formDetails.Percentage = Percentage;
    formDetails.ExtensionWorker = $('#txtExtWorkerName').val();
    formDetails.LeadFormerId = $('#hdnLeadFId').val();

    var jsonObject = JSON.stringify({ formDetails: formDetails });
    $.ajax({
        type: "POST",
        url: "frmExtensionWInfo.aspx/UpdateFormDetail",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $.alert({
                icon: 'glyphicon glyphicon-saved',
                closeIcon: true,
                title: 'Form Updation Alert',
                content: 'Lead Farmer  Information Has been updated into System !'
            });

            //Clear components
            $('.btnUpdate').hide();
            $('.btnSave').show();
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
        url: "frmExtensionWInfo.aspx/GetUserRoles",
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