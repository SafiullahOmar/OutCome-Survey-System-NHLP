var row = null;
// section 3 Over all Kitchen Gardening Producer
function ShowOKGProductUses() {
    $.ajax({
        type: "POST",
        url: "FemaleHorticulture.aspx/GetKGProductUsesList",
        data: '',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblKGProductUses'  width='100%' class='table table-striped table-bordered  table-hover'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Crops</th><th style='text-align:center;'>Unit</th><th style='text-align:center;'>Seed Planed<br/>No of Unit</th><th style='text-align:center;'>Planted Area<br/>Square Meter</th><th style='text-align:center;'>Unit</th><th style='text-align:center;'>Yield Harvest<br/>No of Unit</th><th style='text-align:center;'>KG Sold <br/> No of Unit</th><th style='text-align:center;'>Selling Price<br/>Afs/Unit</th></tr></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "<span id='spanSeedPlantedId' style='display:none'>" + x.ID + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.ProductName + "  </span></td>" +
                   "<td style='text-align:center;'><span>Grams</span></td>" +
                   "<td style='text-align:center;'><input type='text' class='form-control' title='numbers'  id='txtSeedPlanted" + x.ID + "'  ></td>" +
                   "<td style='text-align:center;'><input type='text' class='form-control' title='numbers' id='txtPlantedArea" + x.ID + "'  ></td>" +
                   "<td style='text-align:center;'><span>KG</span></td>" +
                   "<td style='text-align:center;'><input type='text' class='form-control' title='numbers'  id='txtYieldHarvest" + x.ID + "'  ></td>" +
                   "<td style='text-align:center;'><input type='text' class='form-control' title='numbers' id='txtKGSold" + x.ID + "'  ></td>" +
                   "<td style='text-align:center;'><input type='text' class='form-control' title='numbers' id='txtPrice" + x.ID + "'  ></td>" +
                   "</tr>";
                $table += row;
                count++;
            });
            $('#divKGProductUses').html($table);
            $table += "</table>";
        },
        error: function (data) {
            alert("error found");
        }

    });
}

//Status Of Pest Problem
function ShowTblStatusOfProblem() {
    $.ajax({
        type: "POST",
        url: "FemaleHorticulture.aspx/GetKGProductUsesList",
        data: '',
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            var $table = "<table id='tblStatusOfPestProblem'  width='100%' class='table table-striped table-bordered  table-hover'>";
            var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Crops</th><th style='text-align:center;'>Local Name Of Common Pest</th><th style='text-align:center;'>Change in Pest Problems</th></tr></thead>";
            $table += header;
            var count = 1;
            $.each(data.d, function (i, x) {
                var row = "<tr ><td style='text-align:center;'>" + count + "<span id='CropId' style='display:none'>" + x.ID + "</span></td>" +
                   "<td style='text-align:center;'><span>" + x.ProductName + "  </span></td>" +
                   "<td style='text-align:center;'><input type='text' class='form-control'  id='txtLocalName" + x.ID + "'  ></td>" +
                   "<td style='text-align:center;'><div class='form-control'><label><input type='radio' name='radioChangeInProblem" + x.ID + "' class='radio-inline'  value='1' />Decreased </label>" +
                   "<label><input type='radio' name='radioChangeInProblem" + x.ID + "' class='radio-inline' value='2' />Increased</label>" +
                   "<label> <input type='radio' name='radioChangeInProblem" + x.ID + "' class='radio-inline' value='3' />No Change</label></div></td></tr>";
                $table += row;
                count++;
            });
            $('#divStatusOfPestProblem').html($table);
            $table += "</table>";
        },
        error: function (data) {
            alert("error found");
        }

    });
}

//FemalHorticulture Female 2b 

function EditFemaleH02bForm(Id) {
    $.ajax({
        type: "POST",
        url: "FemaleHortToolset02b.aspx/EditFormDetail",
        data: '{formId:"' + Id + '"}',
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            console.log(data);
            $.each(data.d, function (i, x) {
                $('#txtNameOFInterviewee').val(x.NameOfInterviewee);
                $('#ddlYear').val(x.Year);
                var f = false;
                $("input:checkbox[name^='chkFormType1']").prop('checked', x.SampleGroupType1);
                $("input:checkbox[name^='chkFormType2']").prop('checked', x.SampleGroupType2);
                $('#txtNameOfVillage').val(x.NameOfVillage);

                //province
                $('.province').val(x.Province);

                $.ajax({
                    type: "POST",
                    url: "FemaleHortToolset02b.aspx/GetDistrict",
                    data: '{ProvinceID: ' + x.Province + '}',
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        $('#ddlDistrict').empty();
                        $.each(data.d, function (key, value) {
                            $('#ddlDistrict').append($("<option></option>").val(value.DistrictId).html(value.DistrictName));
                        });

                        $('#ddlDistrict option[value=' + x.District+ ']').attr('selected', 'selected');

                    },
                    error: function (data) {
                        alert("error found");
                    }

                });

                $('#txtInterviewDate').val(x.InterviewDate);
                $("#txtStartTime").val(x.StartTime);
                $('#txtEndTime').val(x.EndTime);
                $('#txtInterviewer').val(x.Interviewer);
                $("#txtNameOfFamilyHead").val(x.NameOfFamilyHead);
                $('#txtFName').val(x.FName);
                //gender
                $("input:radio[name^='rdSex'][value='" + x.Gender + "']").prop('checked', true);

                $('#txtFamilyMembers').val(x.TotalFamilyMembers);
                $('#txtMaleMembers').val(x.MaleFamilyMembers);
                $('#txtFemaleMembers').val(x.FemaleFamilyMembers);
                $('#txtTotalFarmArea').val(x.TotalFarmArea);
                $('#txtIrrigated').val(x.Irrigated);
                $('#txtRainfed').val(x.Rainfed);
                //orchard
                $("input:radio[name^='rdHasOrchardVinyard'][value='" + x.HasOrchard + "']").prop('checked', true);
                $('#txtOrchardArea').val(x.OrchardArea);

                //KG
                var $table = "<table id='tblKGProductUses'  width='100%' class='table table-striped table-bordered  table-hover'>";
                var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Crops</th><th style='text-align:center;'>Unit</th><th style='text-align:center;'>Seed Planed<br/>No of Unit</th><th style='text-align:center;'>Planted Area<br/>Square Meter</th><th style='text-align:center;'>Unit</th><th style='text-align:center;'>Yield Harvest<br/>No of Unit</th><th style='text-align:center;'>KG Sold <br/> No of Unit</th><th style='text-align:center;'>Selling Price<br/>Afs/Unit</th></tr></thead>";
                $table += header;
                $('#divKGProductUses').html('');
                var count = 1;
                $.each(x.KGProductionAndProdUses, function (i, y) {
                    var row = "<tr ><td style='text-align:center;'>" + count + "<span id='spanSeedPlantedId' style='display:none'>" + y.CropsID + "</span></td>" +
                    "<td style='text-align:center;'><span>" + y.ProductName + "  </span></td>" +
                    "<td style='text-align:center;'><span>Grams</span></td>" +
                    "<td style='text-align:center;'><input type='text' class='form-control'   id='txtSeedPlanted" + y.CropsID + "'  value=" + y.SeedPlanted + "></td>" +
                    "<td style='text-align:center;'><input type='text' class='form-control'  id='txtPlantedArea" + y.CropsID + "' value=" + y.PlantedArea + " ></td>" +
                    "<td style='text-align:center;'><span>KG</span></td>" +
                    "<td style='text-align:center;'><input type='text' class='form-control'  id='txtYieldHarvest" + y.CropsID + "' value=" + y.YieldHarvest + " ></td>" +
                    "<td style='text-align:center;'><input type='text' class='form-control'  id='txtKGSold" + y.CropsID + "' value=" + y.KGSold + " ></td>" +
                    "<td style='text-align:center;'><input type='text' class='form-control'  id='txtPrice" + y.CropsID + "' value=" + y.SellingPrice + " ></td>" +
                    "</tr>";
                    $table += row;
                    count++;

                });
                $('#divKGProductUses').html($table);
                $table += "</table>";

                //Improved KG

                $('#tblImprovedKitchenGP tbody tr').each(function () {
                    var tblTr = $(this);
                    var tr = $(this).closest('tr');
                    var Practices = $(tr).find('span:eq(0)');
                    var PracticesID = $(Practices).html();
                    $.each(x.ImprovedKGPList, function (i, y) {

                        if (PracticesID == y.PracticesID) {
                            tblTr.find("input:radio[name^='rdSevenRecieved'][value='" + y.Recieved + "']").prop('checked', true);
                            tblTr.find("input:radio[name^='rdSevenUnderstood'][value='" + y.Understood + "']").prop('checked', true);
                            tblTr.find("input:radio[name^='rdSevenApplication'][value='" + y.Application + "']").prop('checked', true);
                            tblTr.find("input:radio[name^='rdSevenUsefullness'][value='" + y.Usefullness + "']").prop('checked', true);
                        }
                    });
                });

                //Improved MK

                $('#tblAdoptionOfImprovedMark tbody tr').each(function () {
                    var tblTr = $(this);
                    var tr = $(this).closest('tr');
                    var Practices = $(tr).find('span:eq(0)');
                    var PracticesID = $(Practices).html();
                    $.each(x.ImprovedMPList, function (i, y) {
                        if (PracticesID == y.PracticesID) {
                            tblTr.find("input:radio[name^='rdSevenRecievedM'][value='" + y.Recieved + "']").prop('checked', true);
                            console.log(y.Understood);
                            tblTr.find("input:radio[name^='rdSevenUnderstoodM'][value='" + y.Understood + "']").prop('checked', true);
                            tblTr.find("input:radio[name^='rdSevenApplicationM'][value='" + y.Application + "']").prop('checked', true);
                            tblTr.find("input:radio[name^='rdSevenUsefullnessM'][value='" + y.Usefullness + "']").prop('checked', true);
                        }
                    });
                });

                //self Sustained KG
                $("input:radio[name^=rdTenContinuKG][value='" + x.HasContinuedKG + "']").prop('checked', true);
                $('#txtTenContinuKGReason').val(x.ReasonKG);
                $("input:checkbox[name^='chkTenContinuKGW1']").prop('checked', x.WayPurchasedKG);
                $("input:checkbox[name^='chkTenContinuKGW2']").prop('checked', x.WayPrdByselfKG);
                $("input:checkbox[name^='chkTenContinuKGW3']").prop('checked', x.WayByProjKG);
                $("input:checkbox[name^='chkTenContinuKGW4']").prop('checked', x.WayNHLPKG);
                $('#txtTenContinuKGMethod').val(x.OtherMethodKG);

                //self Sustained Mp

                $("input:radio[name^=rdTenContinuMGH][value='" + x.HasContinuedGH + "']").prop('checked', true);
                $('#txtTenContinuMGHReason').val(x.ReasonGH);
                $("input:checkbox[name^='chkTenContinuMGH1']").prop('checked', x.WayPurchasedGH);
                $("input:checkbox[name^='chkTenContinuMGH2']").prop('checked', x.WayPrdByselfGH);
                $("input:checkbox[name^='chkTenContinuMGH3']").prop('checked', x.WayByProjGH);
                $("input:checkbox[name^='chkTenContinuMGH4']").prop('checked', x.WayNHLPG);
                $('#txtTenContinuMGHMethod').val(x.OtherMethodGH);

                //Devlopment Services
                $('#tblElevenDVServices tbody tr').each(function () {
                    var tblTr = $(this);
                    var tr = $(this).closest('tr');
                    var Services = $(tr).find('span:eq(0)');
                    var ServiceID = $(Services).html();
                    $.each(x.DVService, function (i, y) {
                        if (ServiceID == y.ServiceID) {
                            tblTr.find("input:radio[name^='rdElevenRecieved'][value='" + y.Recieved + "']").prop('checked', true);
                            tblTr.find("input:radio[name^='rdElevenSatisfication'][value='" + y.SatisficationL + "']").prop('checked', true);
                        }
                    });
                });

                //Remarks
                $('#txtTwelveFarmersRemarks').val(x.FarmerRemarks);
                $('#txtTwelveInterviweeRemarks').val(x.InterviewerRemarks);
            });

            $('#MdSearch').modal('hide');
            $('#btnSave').hide();
            $('#btnUpdate').show();
        },
        error: function (data) {
            alert("error found");
        }

    });
}

//Clear Female H 2b form

function ClearFormComponents() {
    $('#txtNameOFInterviewee').val('');
    $('#ddlYear').val('');
    $("input:checkbox[name^='chkFormType1']").removeAttr('checked');
    $("input:checkbox[name^='chkFormType2']").removeAttr('checked');
    $('#txtNameOfVillage').val('');


    $('#ddlDistrict').val('');

    $('#txtInterviewDate').val('');
    $("#txtStartTime").val('');
    $('#txtEndTime').val('');
    $('#txtInterviewer').val('');
    $("#txtNameOfFamilyHead").val('');
    $('#txtFName').val('');
    //gender
    $("input:radio[name^='rdSex']").removeAttr('checked');

    $('#txtFamilyMembers').val('');
    $('#txtMaleMembers').val('');
    $('#txtFemaleMembers').val('');
    $('#txtTotalFarmArea').val('');
    $('#txtIrrigated').val('');
    $('#txtRainfed').val('');
    //orchard
    $("input:radio[name^='rdHasOrchardVinyard']").removeAttr('checked');
    $('#txtOrchardArea').val('');

    //KG
    $('#divKGProductUses').html('');
    ShowOKGProductUses();

    //Improved KG

    $('#tblImprovedKitchenGP tbody tr').each(function () {
        var tblTr = $(this);
        tblTr.find("input:radio[name^='rdSevenRecieved']").removeAttr('checked');
        tblTr.find("input:radio[name^='rdSevenUnderstood']").removeAttr('checked');
        tblTr.find("input:radio[name^='rdSevenApplication']").removeAttr('checked');
        tblTr.find("input:radio[name^='rdSevenUsefullness']").removeAttr('checked');
    });

    //Improved MK

    $('#tblAdoptionOfImprovedMark tbody tr').each(function () {
        var tblTr = $(this);
        tblTr.find("input:radio[name^='rdSevenRecievedM']").removeAttr('checked');
        tblTr.find("input:radio[name^='rdSevenUnderstoodM']").removeAttr('checked');
        tblTr.find("input:radio[name^='rdSevenApplicationM']").removeAttr('checked');
        tblTr.find("input:radio[name^='rdSevenUsefullnessM']").removeAttr('checked');

    });

    //self Sustained KG
    $("input:radio[name^=rdTenContinuKG]").removeAttr('checked');
    $('#txtTenContinuKGReason').val('');
    $("input:checkbox[name^='chkTenContinuKGW1']").prop('checked', false);
    $("input:checkbox[name^='chkTenContinuKGW2']").prop('checked', false);
    $("input:checkbox[name^='chkTenContinuKGW3']").prop('checked', false);
    $("input:checkbox[name^='chkTenContinuKGW4']").prop('checked', false);
    $('#txtTenContinuKGMethod').val('');

    //self Sustained Mp

    $("input:radio[name^=rdTenContinuMGH]").removeAttr('checked');
    $('#txtTenContinuMGHReason').val('');
    $("input:checkbox[name^='chkTenContinuMGH1']").prop('checked', false);
    $("input:checkbox[name^='chkTenContinuMGH2']").prop('checked', false);
    $("input:checkbox[name^='chkTenContinuMGH3']").prop('checked', false);
    $("input:checkbox[name^='chkTenContinuMGH4']").prop('checked', false);
    $('#txtTenContinuMGHMethod').val('');

    //Devlopment Services
    $('#tblElevenDVServices tbody tr').each(function () {
        var tblTr = $(this);
        tblTr.find("input:radio[name^='rdElevenRecieved']").removeAttr('checked');
        tblTr.find("input:radio[name^='rdElevenSatisfication']").removeAttr('checked');


    });

    //Remarks
    $('#txtTwelveFarmersRemarks').val('');
    $('#txtTwelveInterviweeRemarks').val('');

}