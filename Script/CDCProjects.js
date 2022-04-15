
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
    
    //extension worker
    if ($('#ddlExtensionW').val() == '-1' || $('#ddlExtensionW').find('option:selected').text() == '') {
        $('#ddlExtensionW').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlExtensionW').css('background-color', '#ffff'); }
    //Community
    if ($('#ddlCDCCode').val() == '-1' || $('#ddlExtensionW').find('option:selected').text() == '') {
        $('#ddlCDCCode').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlCDCCode').css('background-color', '#ffff'); }

    //Project TYpe
    if ($('#ddlProject').val() == '-1' || $('#ddlExtensionW').find('option:selected').text() == '') {
        $('#ddlProject').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlProject').css('background-color', '#ffff'); }

    //total price
    if ($('#txtContractCost').val() == '') {
        $('#txtContractCost').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtContractCost').css('background-color', '#ffff'); }
    //nhlp
    if ($('#txtNhlpCost').val() == '') {
        $('#txtNhlpCost').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtNhlpCost').css('background-color', '#ffff'); }

    //owner Name
    if ($('#txtOwnerName').val() == '') {
        $('#txtOwnerName').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtOwnerName').css('background-color', '#ffff'); }

    //contact NO
    if ($('#txtOwnerContactNo').val() == '') {
        $('#txtOwnerContactNo').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtOwnerContactNo').css('background-color', '#ffff'); }
    //Members
    if ($('#txtNoOfMembers').val() == '') {
        $('#txtNoOfMembers').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtNoOfMembers').css('background-color', '#ffff'); }

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
function SaveInfo() {
    var formDetail = {};
    formDetail.CommunityId = $('#ddlCDCCode').val();
    formDetail.Year = $('#ddlYear').val();
    formDetail.SeasonId = $('#ddlSeason').val();
    formDetail.ProjectTypeId = $('#ddlProject').val();
    formDetail.ContractCost = $('#txtContractCost').val();
    formDetail.NHLPCost = $('#txtNhlpCost').val();
    formDetail.OwnerName = $('#txtOwnerName').val();

    formDetail.OwnerContactNo = $('#txtOwnerContactNo').val();
    formDetail.NoOfMembers = $('#txtNoOfMembers').val();
    formDetail.Latitude = $('#txtLatitude	').val();
    formDetail.Longtitude = $('#txtLongtitude').val();
    var jsonObject = JSON.stringify({ formDetail: formDetail });

    $.ajax({
        type: "POST",
        url: "CDCProjects.aspx/SaveFormDetail",
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
                LoadShowProjectLists();
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
function ShowProjectLists(obj) {

    $.ajax({
        type: "POST",
        url: "CDCProjects.aspx/GetProjectLists",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblFarmersDetail'  width='100%' class='table table-striped table-bordered  table-hover'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Owner Name</th><th style='text-align:center;'>Project Type</th><th style='text-align:center;'>Community Code</th><th style='text-align:center;'></th></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "</td>" +
                   "<td style='text-align:center;'><span>" + x.OwnerName + "  </span></td>" +
                   "<td style='text-align:center;'><span>" + x.ProjectType + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.CDCCode + "</span></td>" +
                   (x.Edit == true ? "<td><a onclick='EditFarmerDetail(this)' class='btn-sm btn-danger edit' href='#'>Edit</a><span id='spID' style='display:none'>" + x.CDCCode + "</span><span id='spID' style='display:none'>" + x.ExtWId + "</span><span style='display:none'>" + x.Year + "</span><span style='display:none'>" + x.SeasonId + "</span><span style='display:none'>" + x.ProjectId + "</span></td>" : "<td></td>") +
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
    var CommunityId = span1.html();
    var span2 = $(td).find('span:eq(1)');
    var ExtWId = span2.html();
    var span3 = $(td).find('span:eq(2)');
    var Year = span3.html();
    var span4 = $(td).find('span:eq(3)');
    var SeasonId = span4.html();
    var span5 = $(td).find('span:eq(4)');
    var ProjectId = span5.html();
    $('#hdnCommunityId').val(CommunityId);
    $('#hdnExtWIdFarmerId').val(ExtWId);
    $('#hdnProjectId').val(ProjectId);
    var obj = JSON.stringify({  ExtWId: ExtWId, Year: Year, SeasonId: SeasonId, CommunityId: CommunityId, ProjectId: ProjectId });
    $.ajax({
        type: "POST",
        url: "CDCProjects.aspx/EditCDCProjectDetail",
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (r) {
            
            $('#ddlDistrict').val(r.d.DistrictId);
            $('.province').val(r.d.ProvinceId);
            $('#txtContractCost').val(r.d.ContractCost);
            $('#ddlSeason').val(r.d.SeasonId);
            $('#ddlExtensionW').val(r.d.ExtId);
            $('#txtNhlpCost').val(r.d.NHLPCost);
            $('#txtNoOfMembers').val(r.d.NoOfMembers);
            $('#txtLongtitude').val(r.d.Longtitude);
            $('#txtLatitude	').val(r.d.Latitude);
            $('#ddlYear').val(r.d.Year);

            $('#txtOwnerContactNo').val(r.d.OwnerContactNo);
            $('#txtOwnerName').val(r.d.OwnerName);
            $('#ddlProject').val(r.d.ProjectTypeId);
            $('#ddlCDCCode').val(r.d.CommunityId);

            $('#ddlYear').attr("disabled", "disabled");
            $('#ddlSeason').attr("disabled", "disabled");
            $('#ddlCDCCode').attr("disabled", "disabled");
            $('#ddlExtensionW').attr("disabled", "disabled");


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
    formDetail.CommunityId = $('#hdnCommunityId').val();
    formDetail.Year = $('#ddlYear').val();
    formDetail.SeasonId = $('#ddlSeason').val();
    formDetail.ProjectTypeId = $('#ddlProject').val();
    formDetail.ContractCost = $('#txtContractCost').val();
    formDetail.NHLPCost = $('#txtNhlpCost').val();
    formDetail.OwnerName = $('#txtOwnerName').val();

    formDetail.OwnerContactNo = $('#txtOwnerContactNo').val();
    formDetail.NoOfMembers = $('#txtNoOfMembers').val();
    formDetail.Latitude = $('#txtLatitude	').val();
    formDetail.Longtitude = $('#txtLongtitude').val();
    formDetail.ProjectId = $('#hdnProjectId').val();
    var jsonObject = JSON.stringify({ formDetail: formDetail });

    $.ajax({
        type: "POST",
        url: "CDCProjects.aspx/UpdateDetail",
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
            $('#ddlCDCCode').attr("disabled",false);
            $('#ddlExtensionW').attr("disabled",false);

            $('#hdnCommunityId').val('');
            $('#hdnExtWIdFarmerId').val('');
            $('#hdnProjectId').val('');
             Clear();
            $('.btnSave').show();
            $('.btnUpdate').hide()
            LoadShowProjectLists();
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function Clear() {


    //Project TYpe
    $('#ddlProject').val('-1');

    //total price
    $('#txtContractCost').val('');
    //nhlp
    $('#txtNhlpCost').val('') ;

    //owner Name
    $('#txtOwnerName').val('');

    //contact NO
    $('#txtOwnerContactNo').val('');
    //Members
   $('#txtNoOfMembers').val('');
}