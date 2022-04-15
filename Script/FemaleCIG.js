
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
    
    //group
    if ($('#ddlGroupPosition').val() == '-1' || $('#ddlGroupPosition').find('option:selected').text() == '') {
        $('#ddlGroupPosition').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlGroupPosition').css('background-color', '#ffff'); }
    //membership
    if ($('#ddlMembership').val() == '-1' || $('#ddlMembership').find('option:selected').text() == '') {
        $('#ddlMembership').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlMembership').css('background-color', '#ffff'); }
    //extabslidhment type
    if ($('#txtEstablishedByFarmer').val() == '') {
        $('#txtEstablishedByFarmer').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtEstablishedByFarmer').css('background-color', '#ffff'); }
    if ($('#txtEstablishedByProject').val() == '') {
        $('#txtEstablishedByProject').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtEstablishedByProject').css('background-color', '#ffff'); }

   
    //area
    if ($('#txtAreaInGerib').val() == '') {
        $('#txtAreaInGerib').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtAreaInGerib').css('background-color', '#ffff'); }
 
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
    formDetail.Area = $('#txtAreaInGerib').val();
    formDetail.EstablishedByFarmer = $('#txtEstablishedByFarmer').val();
    formDetail.EstablishedByProject = $('#txtEstablishedByProject').val();
    formDetail.Longtitude = $('#txtLongtitude').val() == '' ? "" : $('#txtLongtitude').val();
    formDetail.Latitude = $('#txtLatitude').val() == '' ? "" : $('#txtLatitude').val();
    formDetail.GroupPositionId = $('#ddlGroupPosition').val();
    formDetail.GroupMembershipId = $('#ddlMembership').val();
    formDetail.Year = $('#ddlYear').val();
    var jsonObject = JSON.stringify({ formDetail: formDetail });

    $.ajax({
        type: "POST",
        url: "CIGFemale.aspx/SaveFormDetail",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            if (data.d ==false) {
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
                    content: 'Record Already Exists '
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
        url: "CIGFemale.aspx/GetFarmerLists",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblFarmersDetail'  width='100%' class='table table-striped table-bordered  table-hover'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Name</th><th style='text-align:center;'>Father Name</th><th style='text-align:center;'>Year</th><th style='text-align:center;'>Area</th><th style='text-align:center;'></th></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "</td>" +
                   "<td style='text-align:center;'><span>" + x.Name + "  </span></td>" +
                   "<td style='text-align:center;'><span>" + x.FName + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Area + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.Year + "</span></td>" +
                   (x.Edit == true ? "<td><a onclick='EditFarmerDetail(this)' class='btn-sm btn-danger edit' href='#'>Edit</a><span id='spID' style='display:none'>" + x.FarmerId + "</span><span id='spID' style='display:none'>" + x.ExtWId + "</span><span style='display:none'>" + x.Year + "</span><span style='display:none'>" + x.SeasonId + "</span></td>" : "<td></td>") +
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
    $('#hdnFarmerId').val(FormerId);
    $('#hdnExtWIdFarmerId').val(ExtWId);
    var obj = JSON.stringify({ FormerId: FormerId, ExtWId: ExtWId, Year: Year,SeasonId:SeasonId });
    $.ajax({
        type: "POST",
        url: "CIGFemale.aspx/EditFarmerDetail",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (r) {
            $('#ddlFarmer').val(r.d.FarmerId);
            $('#ddlSeason').val(r.d.SeasonId);
            $('#ddlExtensionW').val(r.d.ExtId);
            $('#txtAreaInGerib').val(r.d.Area);
            $('#txtLongtitude').val(r.d.Longtitude);
            $('#txtEstablishedByProject').val(r.d.EstablishedByProject);
            $('#txtEstablishedByFarmer').val(r.d.EstablishedByFarmer);
            $('#txtLatitude').val(r.d.Latitude);
            $('#ddlGroupPosition').val(r.d.GroupPositionId);
            $('#ddlMembership').val(r.d.GroupMembershipId);
            $('#ddlYear').val(r.d.Year);
            $('#ddlYear').attr("disabled", "disabled");
            $('#ddlSeason').attr("disabled", "disabled");
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
    formDetail.ExtId = $('#hdnExtWIdFarmerId').val();
    formDetail.Area = $('#txtAreaInGerib').val();
    formDetail.EstablishedByFarmer = $('#txtEstablishedByFarmer').val();
    formDetail.EstablishedByProject = $('#txtEstablishedByProject').val();
    formDetail.Longtitude = $('#txtLongtitude').val() == '' ? "" : $('#txtLongtitude').val();
    formDetail.Latitude = $('#txtLatitude').val() == '' ? "" : $('#txtLatitude').val();
    formDetail.GroupPositionId = $('#ddlGroupPosition').val();
    formDetail.GroupMembershipId = $('#ddlMembership').val();
    formDetail.Year = $('#ddlYear').val();
    var jsonObject = JSON.stringify({ formDetail: formDetail });

    $.ajax({
        type: "POST",
        url: "CIGFemale.aspx/UpdateDetail",
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
            $('#ddlYear').attr("disabled",false);
            $('#ddlSeason').attr("disabled", false);
            $('#hdnExtWIdFarmerId').val('');
            $('#hdnFarmerId').val('');
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

    $('#txtAreaInGerib').val('');
    $('#txtLongtitude').val('');
    $('#txtLatitude').val('');
    $('#ddlGroupPosition').val('-1');
    $('#ddlMembership').val('-1');
    $('#txtEstablishedByFarmer').val('');
    $('#txtEstablishedByProject').val('');
    $('#ddlFarmer').val('-1');
}