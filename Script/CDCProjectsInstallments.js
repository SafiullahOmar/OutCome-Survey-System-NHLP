function SaveInstallments() {
    var formDetail = {};
    formDetail.ProjectId = $('#ddlOwner').val();
    formDetail.CommunityId = $('#ddlCDCCode').val();
    formDetail.InstallmentId = $('#ddlInstallment').val();
    formDetail.Percentage = $('#ddlPercentage').val();
    formDetail.Tax = $('#txtTax').val();
    formDetail.BankFee = $('#txtBankTransfer').val();
    formDetail.NetInstallment = $('#txtNetInstallment').val();
    formDetail.Year = $('#ddlYear').val();
    formDetail.SeasonId = $('#ddlSeason').val();
    var jsonObject = JSON.stringify({ formDetail: formDetail });

    $.ajax({
        type: "POST",
        url: "CDCProjectsInstallments.aspx/SaveFormDetail",
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
                LoadShowProjectLists();;
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
                    content: 'Amount are more than Contracted amount! OR Installment number is save once '
                });

            }



        },
        error: function (data) {
            alert("error found");
        }

    });
}
var row = null;
function ShowInstallments(obj) {
    $.ajax({
        type: "POST",
        url: "CDCProjectsInstallments.aspx/GetProjectInstallments",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tbl'  width='100%' class='table table-striped table-bordered  table-hover'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Project Owner Name</th><th style='text-align:center;'>Project Type</th><th style='text-align:center;'>Installment #</th><th style='text-align:center;'>Net Installment Payment</th><th style='text-align:center;'></th></tr></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "</td>" +
                   "<td style='text-align:center;'><span>" + x.OwnerName + "  </span></td>" +
                   "<td style='text-align:center;'><span>" + x.ProjectType + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.NetInstallment + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.InstallmentId + "</span></td>" +
                   
                   (x.Edit == true ? "<td><a onclick='EditInstallmentDetail(this)' class='btn-sm btn-danger edit' href='#'>Edit</a><span  style='display:none'>" + x.ProjectId + "</span><span  style='display:none'>" + x.CommunityId + "</span></td>" : "<td></td>") +
                "</tr>";
                $table += row;
                count++;
            });
            $('#DivCDCProjectsDetail').html($table);
            $table += "</table>";
            $('#tbl').DataTable({ "bPaginate": true, "bLengthChange": true, "bFilter": true, "bSort": true, "bInfo": true, "bAutoWidth": true, });
            $('#DivCDCProjectsDetail').show();
        },
        error: function (data) {
            alert("error found");
        }

    });
}

function formValidation(e) {
    var flag = true;
    if ($('#ddlYear').val() == '-1') {
        $('#ddlYear').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlYear').css('background-color', '#ffff'); }
    if ($('#ddlSeason').val() == '-1') {
        $('#ddlSeason').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlSeason').css('background-color', '#ffff'); }

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

    if ($('#ddlExtensionW').val() == '-1') {
        $('#ddlExtensionW').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlExtensionW').css('background-color', '#ffff'); }

    if ($('#ddlCDCCode').val() == '-1') {
        $('#ddlCDCCode').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlCDCCode').css('background-color', '#ffff'); }

    if ($('#ddlOwner').val() == '-1') {
        $('#ddlOwner').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlOwner').css('background-color', '#ffff'); }

    if ($('#ddlInstallment').val() == '-1') {
        $('#ddlInstallment').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlInstallment').css('background-color', '#ffff'); }

    if ($('#ddlPercentage').val() == '-1') {
        $('#ddlPercentage').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlPercentage').css('background-color', '#ffff'); }



    if ($('#txtTax').val() == '') {
        $('#txtTax').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtTax').css('background-color', '#ffff'); }

    if ($('#txtBankTransfer').val() == '') {
        $('#txtBankTransfer').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtBankTransfer').css('background-color', '#ffff'); }

    if ($('#txtNetInstallment').val() == '') {
        $('#txtNetInstallment').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtNetInstallment').css('background-color', '#ffff'); }
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
    $('#txtNetInstallment').val('');
    $('#txtTax').val('');
    $('#ddlPercentage').val('-1');
    $('#ddlInstallment').val('-1');
    $('#txtBankTransfer').val('');
}

function EditInstallmentDetail(obj) {
    var td = obj.parentNode;
    row = obj.parentNode.parentNode;
    var span1 = $(td).find('span:eq(0)');
    var ProjectId = span1.html();
    var span2 = $(td).find('span:eq(1)');
    var CommunityId = span2.html();
    $('#hdnCommunityId').val(CommunityId);
    $('#hdnProjectId').val(ProjectId);
    var obj = JSON.stringify({ CommunityId: CommunityId,ProjectId:ProjectId });
    $.ajax({
        type: "POST",
        url: "CDCProjectsInstallments.aspx/EditCDCProjectsInstallments",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (r) {

            $('#ddlDistrict').val(r.d.DistrictId);
            $('#txtTax').val(r.d.Tax);

            $('#ddlOwner').val(ProjectId);

            $('#ddlPercentage').val(r.d.Percentage);
            $('#txtNetInstallment').val(r.d.NetInstallment);
            $('#ddlInstallment').val(r.d.InstallmentId);
            $('#txtBankTransfer').val(r.d.BankFee);
            $('#ddlExtensionW').val(r.d.ExtWId);
            $('.province').val(r.d.ProvinceId);
            $('#txtBankAccount').val(r.d.SeasonId);

            $('#ddlCDCCode').val(CommunityId);

            $('#ddlCDCCode').attr("disabled", "disabled");
            $('#ddlExtensionW').attr("disabled", "disabled");
            $('#ddlInstallment').attr("disabled", "disabled");
            $('#ddlOwner').attr("disabled", "disabled");
            $('#ddlDistrict').attr("disabled", "disabled");
            $('.province').attr("disabled", "disabled");

            $('.btnSave').hide();
            $('.btnUpdate').show();
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

function Update() {
    var formDetail = {};

    formDetail.ProjectId = $('#hdnProjectId').val();
    formDetail.CommunityId = $('#hdnCommunityId').val();

    formDetail.InstallmentId = $('#ddlInstallment').val();
    formDetail.Percentage = $('#ddlPercentage').val();
    formDetail.Tax = $('#txtTax').val();
    formDetail.BankFee = $('#txtBankTransfer').val();
    formDetail.NetInstallment = $('#txtNetInstallment').val();
    formDetail.Year = $('#ddlYear').val();
    formDetail.SeasonId = $('#ddlSeason').val();
    var jsonObject = JSON.stringify({ formDetail: formDetail });

    $.ajax({
        type: "POST",
        url: "CDCProjectsInstallments.aspx/UpdateDetail",
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
                    content: '<strong><font style="color:white;">Form is successfully updated !</font></strong>'
                });

                //Clear components
                ClearForm();
                //call function
                LoadShowProjectLists();
                $('#ddlCDCCode').attr("disabled", false);
                $('#ddlExtensionW').attr("disabled",false);
                $('#ddlInstallment').attr("disabled",false);
                $('#ddlOwner').attr("disabled",false);
                $('#ddlDistrict').attr("disabled", false);
                $('.province').attr("disabled",false);

                $('.btnSave').show();
                $('.btnUpdate').hide();
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
                    content: 'Amount are more than Contracted amount! '
                });

            }



        },
        error: function (data) {
            alert("error found");
        }

    });
}
