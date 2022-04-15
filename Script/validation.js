
function Form2bValidation(e) {
    var flag = true;
    if ($('#txtNameOfVillage').val() == '') {
        $('#txtNameOfVillage').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtNameOfVillage').css('background-color', '#ffff'); }
    if ($('#txtNameOFInterviewee').val() == '') {
        $('#txtNameOFInterviewee').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtNameOFInterviewee').css('background-color', '#ffff'); }
    if ($('#ddlYear').val() == '') {
        $('#ddlYear').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlYear').css('background-color', '#ffff'); }
    if ($('.province').val() == '-1') {
        $('.province').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('.province').css('background-color', '#ffff'); }
    if ($('#ddlDistrict').val() == '') {
        $('#ddlDistrict').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#ddlDistrict').css('background-color', '#ffff'); }
    if ($('#txtInterviewDate').val() == '' || $('#txtInterviewDate').val() == '__.__.____') {
        $('#txtInterviewDate').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtInterviewDate').css('background-color', '#ffff'); }
    if ($('#txtStartTime').val() == '' || $('#txtStartTime').val() == '__:__') {
        $('#txtStartTime').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtStartTime').css('background-color', '#ffff'); }
    if ($('#txtEndTime').val() == '' || $('#txtEndTime').val() == '__:__') {
        $('#txtEndTime').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtEndTime').css('background-color', '#ffff'); }
    if ($('#txtInterviewer').val() == '') {
        $('#txtInterviewer').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtInterviewer').css('background-color', '#ffff'); }
    if ($('#txtNameOfFamilyHead').val() == '') {
        $('#txtNameOfFamilyHead').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtNameOfFamilyHead').css('background-color', '#ffff'); }
    if ($('#txtFName').val() == '') {
        $('#txtFName').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtFName').css('background-color', '#ffff'); }
    if ($('#txtFamilyMembers').val() == '') {
        $('#txtFamilyMembers').css('background-color', '#FFAAAA');
        flag = false;;
    }
    else { $('#txtFamilyMembers').css('background-color', '#ffff'); }
    if ($('#txtMaleMembers').val() == '') {
        $('#txtMaleMembers').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtMaleMembers').css('background-color', '#ffff'); }

    if ($('#txtFemaleMembers').val() == '') {
        $('#txtFemaleMembers').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtFemaleMembers').css('background-color', '#ffff'); }
    if ($('#txtIrrigated').val() == '') {
        $('#txtIrrigated').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtIrrigated').css('background-color', '#ffff'); }
    if ($('#txtRainfed').val() == '') {
        $('#txtRainfed').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtRainfed').css('background-color', '#ffff'); }
    if ($('#txtTotalFarmArea').val() == '') {
        $('#txtTotalFarmArea').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtTotalFarmArea').css('background-color', '#ffff'); }
    if ($('#txtTotalFarmArea').val() == '') {
        $('#txtTotalFarmArea').css('background-color', '#FFAAAA');
        flag = false;
    }
    else { $('#txtTotalFarmArea').css('background-color', '#ffff'); }
    //
    if ($("input:radio[name^='rdSex']:checked").length == 0) {
        $("input:radio[name^='rdSex']").parent().parent().css('background-color', '#FFAAAA');       
        flag = false;
    } else { $("input:radio[name^='rdSex']").parent().parent().css('background-color', 'white'); }

    if ($("input:radio[name^='rdHasOrchardVinyard']:checked").length == 0) {
        $("input:radio[name^='rdHasOrchardVinyard']").parent().parent().css('background-color', '#FFAAAA');

        flag = false;
    } else {
        $("input:radio[name^='rdHasOrchardVinyard']").parent().parent().css('background-color', 'white')
        if ($("input:radio[name^='rdHasOrchardVinyard']:checked").val() == 'True') {
            if ($('#txtOrchardArea').val() == '') {
                $('#txtOrchardArea').css('background-color', '#FFAAAA');
                flag = false;
            }
            else { $('#txtOrchardArea').css('background-color', '#ffff'); };
        } else { $('#txtOrchardArea').css('background-color', '#ffff'); };
       
    }
    // // self sustained
    if ($("input:radio[name^='rdTenContinuKG']:checked").length == 0) {
        $("input:radio[name^='rdTenContinuKG']").parent().parent().css('background-color', '#FFAAAA');
        flag = false;
    } else {
        if ($("input:radio[name^='rdTenContinuKG']:checked").val() == 'True') {
            var chk = 0;
            if ($("input:checkbox[name^='chkTenContinuKGW1']").is(":checked")) { chk += 1; }
            if ($("input:checkbox[name^='chkTenContinuKGW2']").is(":checked")) { chk += 1; }
            if ($("input:checkbox[name^='chkTenContinuKGW3']").is(":checked")) { chk += 1; }
            if ($("input:checkbox[name^='chkTenContinuKGW4']").is(":checked")) { chk += 1; }

            if (chk == 0) {
                flag = false;
                $("input:checkbox[name^='chkTenContinuKGW1']").parent().parent().parent().css('background-color', '#FFAAAA');
            } else { $("input:checkbox[name^='chkTenContinuKGW1']").parent().parent().parent().css('background-color', 'white'); }
        
        } else { $("input:checkbox[name^='chkTenContinuKGW1']").parent().parent().parent().css('background-color', 'white'); }

        $("input:radio[name^='rdTenContinuKG']").parent().parent().css('background-color', 'white');
    }

    if ($("input:radio[name^='rdTenContinuMGH']:checked").length == 0) {
        $("input:radio[name^='rdTenContinuMGH']").parent().parent().css('background-color', '#FFAAAA');
        flag = false;
    } else {
        if ($("input:radio[name^='rdTenContinuMGH']:checked").val() == 'True') {
            var chk = 0;
            if ($("input:checkbox[name^='chkTenContinuMGH1']").is(":checked")) { chk += 1; }
            if ($("input:checkbox[name^='chkTenContinuMGH2']").is(":checked")) { chk += 1; }
            if ($("input:checkbox[name^='chkTenContinuMGH3']").is(":checked")) { chk += 1; }
            if ($("input:checkbox[name^='chkTenContinuMGH4']").is(":checked")) { chk += 1; }

            if (chk == 0) {
                flag = false;
                $("input:checkbox[name^='chkTenContinuMGH1']").parent().parent().parent().css('background-color', '#FFAAAA');
            } else { $("input:checkbox[name^='chkTenContinuMGH1']").parent().parent().parent().css('background-color', 'white'); }

        } else { $("input:checkbox[name^='chkTenContinuMGH1']").parent().parent().parent().css('background-color', 'white'); }

        $("input:radio[name^='rdTenContinuMGH']").parent().parent().css('background-color', 'white');
    }

    /// /// KG
    var Tdata = "";
    $('#tblKGProductUses tbody tr').each(function () {
        var data1 = ""; var data2 = "";var data3="";var data4=""; var data5="";
        data1 = $(this).find("input[id^='txtSeedPlanted']").val();
        if (data1 != '') {
            Tdata = data1;
        }
        data2 = $(this).find("input[id^='txtPlantedArea']").val();
        if (data2 != '') {
            Tdata = data2;
        }
        data3 = $(this).find("input[id^='txtYieldHarvest']").val();
        if (data3 != '') {
            Tdata = data3;
        }
        data4 = $(this).find("input[id^='txtKGSold']").val();
        if (data4 != '') {
            Tdata = data4;
        }
        data5 = $(this).find("input[id^='txtPrice']").val();
        if (data5 != '') {
            Tdata = data5;
        }

    });
    if (Tdata == '') {
        flag = false;
        $('#tblKGProductUses').css('background-color', '#FFAAAA');
    } else { $('#tblKGProductUses').css('background-color', 'white'); }

    /// adopt
    var chkFlagKG = true;
    $('#tblImprovedKitchenGP tbody tr').each(function () {
        var rowFlag = "";
        if ($(this).find("input:radio[name^='rdSevenRecieved']:checked").length == 0) { if (chkFlagKG != false) { chkFlagKG = false; } $(this).find("input:radio[name^='rdSevenRecieved']").parent().parent().css('background-color', '#FFAAAA'); } else { $(this).find("input:radio[name^='rdSevenRecieved']").parent().parent().css('background-color', 'white'); }
        if ($(this).find("input:radio[name^='rdSevenUnderstood']:checked").length == 0) { if (chkFlagKG != false) { chkFlagKG = false; } $(this).find("input:radio[name^='rdSevenUnderstood']").parent().parent().css('background-color', '#FFAAAA'); } else { $(this).find("input:radio[name^='rdSevenUnderstood']").parent().parent().css('background-color', 'white'); }
        if ($(this).find("input:radio[name^='rdSevenApplication']:checked").length == 0) { if (chkFlagKG != false) { chkFlagKG = false; } $(this).find("input:radio[name^='rdSevenApplication']").parent().parent().css('background-color', '#FFAAAA'); } else { $(this).find("input:radio[name^='rdSevenApplication']").parent().parent().css('background-color', 'white'); }
        if ($(this).find("input:radio[name^='rdSevenUsefullness']:checked").length == 0) { if (chkFlagKG != false) { chkFlagKG = false; } $(this).find("input:radio[name^='rdSevenUsefullness']").parent().parent().css('background-color', '#FFAAAA'); } else { $(this).find("input:radio[name^='rdSevenUsefullness']").parent().parent().css('background-color', 'white'); }
    });
    if (chkFlagKG == false) { flag = false; }

    var chkFlagM = true;
    $('#tblAdoptionOfImprovedMark tbody tr').each(function () {
        var rowFlag = "";
        if ($(this).find("input:radio[name^='rdSevenRecievedM']:checked").length == 0) { if (chkFlagM != false) { chkFlagM = false; } $(this).find("input:radio[name^='rdSevenRecievedM']").parent().parent().css('background-color', '#FFAAAA'); } else { $(this).find("input:radio[name^='rdSevenRecievedM']").parent().parent().css('background-color', 'white'); }
        if ($(this).find("input:radio[name^='rdSevenUnderstoodM']:checked").length == 0) { if (chkFlagM != false) { chkFlagM = false; } $(this).find("input:radio[name^='rdSevenUnderstoodM']").parent().parent().css('background-color', '#FFAAAA'); } else { $(this).find("input:radio[name^='rdSevenUnderstoodM']").parent().parent().css('background-color', 'white'); }
        if ($(this).find("input:radio[name^='rdSevenApplicationM']:checked").length == 0) { if (chkFlagM != false) { chkFlagM = false; } $(this).find("input:radio[name^='rdSevenApplicationM']").parent().parent().css('background-color', '#FFAAAA'); } else { $(this).find("input:radio[name^='rdSevenApplicationM']").parent().parent().css('background-color', 'white'); }
        if ($(this).find("input:radio[name^='rdSevenUsefullnessM']:checked").length == 0) { if (chkFlagM != false) { chkFlagM = false; } $(this).find("input:radio[name^='rdSevenUsefullnessM']").parent().parent().css('background-color', '#FFAAAA'); } else { $(this).find("input:radio[name^='rdSevenUsefullnessM']").parent().parent().css('background-color', 'white'); }
    });
    if (chkFlagM == false) { flag = false; }

    // satisifaication

    var chkSat = true;
    $('#tblElevenDVServices tbody tr').each(function () {
       
        if ($(this).find("input:radio[name^='rdElevenRecieved']:checked").length == 0) { if (chkSat != false) { chkSat = false; } $(this).find("input:radio[name^='rdElevenRecieved']").parent().parent().css('background-color', '#FFAAAA'); } else { $(this).find("input:radio[name^='rdElevenRecieved']").parent().parent().css('background-color', 'white'); }
        if ($(this).find("input:radio[name^='rdElevenSatisfication']:checked").length == 0) { if (chkSat != false) { chkSat = false; } $(this).find("input:radio[name^='rdElevenSatisfication']").parent().parent().css('background-color', '#FFAAAA'); } else { $(this).find("input:radio[name^='rdElevenSatisfication']").parent().parent().css('background-color', 'white'); }

    });
    if (chkSat == false) { flag = false; }
    //
    
    if (flag) { return true } else {
        $('#IdH3Title').html('Form Validation!');
        $('#IdMessage').html('<strong><font style="color:red;">Please enter form information in red backgrounds!!</color></strong>');
        $('#MdAlert').modal('show');
        return false;
    }
}
function Form2bAutoCheck(e) {
    $("input:checkbox[name^='chkFormType2']").prop('checked', true);
    $('#tblElevenDVServices tbody tr').each(function () {
        var Tr = $(this);
        Tr.find("input:radio[name^='rdElevenRecieved']").click(function () {

            if ($(this).val() == 'False') { Tr.find("input:radio[name^='rdElevenSatisfication'][value='3']").prop('checked', true); }

        });
    });

    $('#tblImprovedKitchenGP tbody tr').each(function () {
        var Tr = $(this);
        Tr.find("input:radio[name^='rdSevenRecieved']").click(function(){
            if($(this).val()=='False'){ 
                Tr.find("input:radio[name^='rdSevenUnderstood'][value='False']").prop('checked',true);
                Tr.find("input:radio[name^='rdSevenApplication'][value='4']").prop('checked',true);
                Tr.find("input:radio[name^='rdSevenUsefullness'][value='3']").prop('checked',true);
            }
        }); 
    });
    $('#tblAdoptionOfImprovedMark tbody tr').each(function () {
        var Tr = $(this);
        Tr.find("input:radio[name^='rdSevenRecievedM']").click(function () {
            if ($(this).val() == 'False') {
                Tr.find("input:radio[name^='rdSevenUnderstoodM'][value='False']").prop('checked', true);
                Tr.find("input:radio[name^='rdSevenApplicationM'][value='4']").prop('checked', true);
                Tr.find("input:radio[name^='rdSevenUsefullnessM'][value='3']").prop('checked', true);
            }
        });
    });

}



