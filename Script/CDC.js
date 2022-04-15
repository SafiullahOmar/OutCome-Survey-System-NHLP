function SaveCDC(province) {
    var formDetails = {};
    formDetails.Id = $('#txtCode').val();
    formDetails.CDCName = $('#txtCDCName').val();
    formDetails.ChairmanName = $('#txtChairmanName').val();
    formDetails.Code = $('#txtCode').val();
    formDetails.ProvinceID =province;
    formDetails.DistrictID = $('#ddlDistrict').val();
    formDetails.ChairmanContactNo = $('#txtContactNo').val();
    formDetails.BankAccountNo = $('#txtBankAccount').val();
    formDetails.ExtWId = $('#ddlExtensionW').val();
    var jsonObject = JSON.stringify({ formDetails: formDetails });

    $.ajax({
        type: "POST",
        url: "CDC.aspx/SaveFormDetail",
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
                ClearForm();
                //call function
                ShowCDC(province);
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
var row = null;
function ShowCDC(Province) {
    $.ajax({
        type: "POST",
        url: "CDC.aspx/GetCDCLists",
        data: '{Province: ' + Province + '}',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tbl'  width='100%' class='table table-striped table-bordered  table-hover'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>CDC Name</th><th style='text-align:center;'>Code</th><th style='text-align:center;'>Chairman</th><th style='text-align:center;'>Province</th><th style='text-align:center;'>District</th><th style='text-align:center;'></th></tr></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "</td>" +
                   "<td style='text-align:center;'><span>" + x.CDCName + "  </span></td>" +
                   "<td style='text-align:center;'><span>" + x.Code + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.ChairmanName + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Province + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.District + "</span></td>" +
                   (x.Edit==true?"<td><a onclick='EditCDCDetail(this)' class='btn-sm btn-danger edit' href='#'>Edit</a><span  style='display:none'>" + x.Id + "</span></td>":"<td></td>")+
                "</tr>";
                $table += row;
                count++;
            });
            $('#DivCDC').html($table);
            $table += "</table>";
            $('#tbl').DataTable({ "bPaginate": true, "bLengthChange": true, "bFilter": true, "bSort": true, "bInfo": true, "bAutoWidth": true, });
            $('#DivCDC').show();
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
    if ($('#txtCode').val() == '') {
        $('#txtCode').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtCode').css('background-color', '#ffff'); }
    if ($('#txtCDCName').val() == '') {
        $('#txtCDCName').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtCDCName').css('background-color', '#ffff'); }

    if ($('#txtChairmanName').val() == '') {
        $('#txtChairmanName').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtChairmanName').css('background-color', '#ffff'); }

    if ($('#txtBankAccount').val() == '') {
        $('#txtBankAccount').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtBankAccount').css('background-color', '#ffff'); }
    if (flag) { return true } else {
        $.alert({
            icon: 'glyphicon glyphicon-info-sign',
            closeIcon: true,
            title: 'Form Validation Alert!',
            theme: 'supervan' ,
            content: '<strong><font style="color:red;">Please enter form information in red backgrounds!!</color></strong>'
        });
        return false;
    }
}

function ClearForm() {
    $('#txtCDCName').val('');
    $('#txtBankAccount').val('');
    $('#txtContactNo').val('');
    $('#txtChairmanName').val('');
    $('#txtCode').val('');
    $('#ddlExtensionW').val('-1');
}

function EditCDCDetail(obj) {
    var td = obj.parentNode;
    row = obj.parentNode.parentNode;
    var span = $(td).find('span');
    var CDCID = span.html();
    $('#hdnCDCId').val(CDCID);
    var obj = JSON.stringify({ CDCID: CDCID });
    $.ajax({
        type: "POST",
        url: "CDC.aspx/GetCDCDetailByID",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (r) {
            $('#txtCode').val(r.d.Code);
            $('#ddlDistrict').val(r.d.DistrictID);
            $('#txtCDCName').val(r.d.CDCName);
            $('#txtChairmanName').val(r.d.ChairmanName);
            $('#txtContactNo').val(r.d.ChairmanContactNo);
            $('#txtBankAccount').val(r.d.BankAccountNo);
            $('#ddlExtensionW').val(r.d.ExtWId);
            $('#txtCode').attr("disabled","disabled");
            $('#ddlDistrict').attr("disabled", "disabled");
            $('.province').attr("disabled", "disabled");
            $('.save').hide();
            $('.update').show();
            $.alert({
                icon: 'glyphicon glyphicon-saved',
                closeIcon: true,
                title: 'Alert!',
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

function UpdateCDC(province) {
    var formDetails = {};
    formDetails.Id = $('#hdnCDCId').val();
    formDetails.CDCName = $('#txtCDCName').val();
    formDetails.ChairmanName = $('#txtChairmanName').val();
    formDetails.Code = $('#txtCode').val();
    formDetails.ProvinceID = province;
    formDetails.DistrictID = $('#ddlDistrict').val();
    formDetails.ChairmanContactNo = $('#txtContactNo').val();
    formDetails.BankAccountNo = $('#txtBankAccount').val();
    formDetails.ExtWId = $('#ddlExtensionW').val();
    var jsonObject = JSON.stringify({ formDetails: formDetails });

    $.ajax({
        type: "POST",
        url: "CDC.aspx/UpdateFormDetail",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $('#btnSave').show();
            $('#btnUpdate').hide();
            $.alert({
                icon: 'glyphicon glyphicon-saved',
                closeIcon: true,
                title: 'Form Updation Alert!',
                animation: 'news',
                closeAnimation: 'news',
                theme: 'dark',
                type: 'green',
                typeAnimated: true,
                content: '<strong><font style="color:white;">CDC  Information Has been updated to the System!</font></strong>'
            });

            //Clear components
            ClearForm();
            // call function
            ShowCDC(province);
            $('#txtCode').attr("disabled", false);
            $('#ddlDistrict').attr("disabled", false);
            $('.province').attr("disabled", false);
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function ShowControlsByRoles() {
    $.ajax({
        type: "POST",
        url: "frmPCInfo.aspx/GetUserRoles",
        data: '',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            debugger;
            var Roles = [];
            $.each(data.d, function (i, x) {
                Roles.push(x.role);
            });
            if ($.inArray('Admin', Roles) != -1) {
                $('.update').removeAttr('disabled');
                $('.edit').removeAttr('disabled');
            } else {
                $('.update').attr("disabled", "disabled");
                $('.edit').hide();
            }
        },
        error: function (data) {
            alert("error found");
        }

    });
}
