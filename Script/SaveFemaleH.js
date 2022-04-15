function SaveForm(province, gender, hasOrchard) {
    //preliinary information
   

    var formDetail = {};
    formDetail.NameOfInterviewee = $('#txtNameOFInterviewee').val();
    formDetail.Year = $('#ddlYear').val();
    formDetail.SampleGroupType = $("input:radio[name='rdFormType']:checked").val();
    formDetail.NameOfVillage = $('#txtNameOfVillage').val();
    formDetail.District = $('#ddlDistrict').val();
    formDetail.Province = province;
    formDetail.InterviewDate = $('#txtInterviewDate').val();
    formDetail.StartTime = $("#txtStartTime").val();
    formDetail.EndTime = $('#txtEndTime').val();
    formDetail.Interviewer = $('#txtInterviewer').val();
    
    //Family Composition

    formDetail.NameOfFamilyHead = $("#txtNameOfFamilyHead").val();
    formDetail.FName = $('#txtFName').val();
    formDetail.Gender = gender;
    formDetail.TotalFamilyMembers = $('#txtFamilyMembers').val();
    formDetail.MaleFamilyMembers = $('#txtMaleMembers').val();
    formDetail.FemaleFamilyMembers = $('#txtFemaleMembers').val();

    //Genreal information

    formDetail.TotalFarmArea = $('#txtTotalFarmArea').val();
    formDetail.Irrigated = $('#txtIrrigated').val();
    formDetail.Rainfed = $('#txtRainfed').val();
    formDetail.HasOrchard = hasOrchard;
    formDetail.OrchardArea = $('#txtOrchardArea').val();
   
    //KG Production and Product Uses
    
    var KG = new Array();
    $('#tblKGProductUses tbody tr').each(function () {
        var detail = {};
        detail.SeedPlanted = $(this).find("input[id^='txtSeedPlanted']").val();
        detail.PlantedArea = $(this).find("input[id^='txtPlantedArea']").val();
        detail.YieldHarvest = $(this).find("input[id^='txtYieldHarvest']").val();
        detail.KGSold = $(this).find("input[id^='txtKGSold']").val();
        detail.SellingPrice = $(this).find("input[id^='txtPrice']").val();
        var tr = $(this).closest('tr');
        var cropId = $(tr).find('span:eq(0)');
        detail.CropsID = $(cropId).html();
        KG.push(detail);
    });

    formDetail.KGProductionAndProdUses = KG

    //Extension Suppport in Village

 
    formDetail.IsExtAssignedToV = $("input:radio[name='rdFourHASExtensionSInVillage']:checked").val();
    formDetail.NameOfNHLPExtStaff = $('#txtFourNameOFNHLPExtStaff').val();
    formDetail.FreqOfExtVisit = $("input:radio[name='rdFourFreqOFExtension']:checked").val();
    formDetail.IsLeadFarmAssigned = $("input:radio[name='rdFourHASLeadFarmerInVillage']:checked").val();
    formDetail.NameOfNHLPLeadFarmer = $('#txtFourNameOfLeadFarmer').val();
    formDetail.FreqOfLeadFarmVisits = $("input:radio[name='rdFourFreqOFLeadFarmer']:checked").val();

    //FFS Extension Training Program

 
    formDetail.HasParticipatedTraining = $("input:radio[name='rdFiveFamilyPartInTrainingProg']:checked").val();
    formDetail.ParticipatedMemberTraining = $("input:radio[name='rdFiveTrainingMember']:checked").val();
 
    var FFSTL = {};
    var FFST = new Array();
    $('#tblFFSExtTrainingProgram tbody tr').each(function () {
        var detail = {};
        detail.NameOfTrainingEvent = $(this).find("input[id^='txtFiveTrainingEvent']").val();
        detail.KeyLearning = $(this).find("input[id^='txtFiveKeyLearnings']").val();
        detail.TrainingResult = $(this).find("input:radio[name^='rdFiveTrainingResult']:checked").val();
        var tr = $(this).closest('tr');
        var Training = $(tr).find('span:eq(0)');
        detail.TrainingID = $(Training).html();
        FFST.push(detail);
      
    });
    FFSTL = FFST;
    formDetail.TrainingDetail = FFSTL;
   


    //Participatation in NHLP Producer Group

    
    formDetail.IsMemberOfPrdGroup = $("input:radio[name^=rdSixISMembrOfProdGroup]:checked").val();
    formDetail.JoinYearOfPrdGroup = $('#ddlSixJoinYear').val();
    if ($("input:checkbox[name='chkSixSolvPurpose1']").is(":checked")) { formDetail.SolvPurpose1 = $("input:checkbox[name='chkSixSolvPurpose1']:checked").val(); } else { formDetail.SolvPurpose1 = "False"; }
    if ($("input:checkbox[name='chkSixIncPurpose2']").is(":checked")) { formDetail.IncPurpose2 = $("input:checkbox[name='chkSixIncPurpose2']:checked").val(); } else { formDetail.IncPurpose2 = "False"; }
    if ($("input:checkbox[name='chkSixLearnPurpose3']").is(":checked")) { formDetail.LearnPurpose3 = $("input:checkbox[name='chkSixLearnPurpose3']:checked").val(); } else { formDetail.LearnPurpose3 = "False"; }
    if ($("input:checkbox[name='chkSixGetPurpose4']").is(":checked")) { formDetail.GetPurpose4 = $("input:checkbox[name='chkSixGetPurpose4']:checked").val(); } else { formDetail.GetPurpose4 = "False"; }
   

    //Adoption of Improved Kitchen Gardening Practice

   
    var ImprovedKGP = new Array();
    var ImprovedMP = new Array();
    $('#tblImprovedKitchenGP tbody tr').each(function () {
        var detail = {};
        if ($(this).find("input:radio[name^='rdSevenRecieved']").is(":checked")) { detail.Recieved = $(this).find("input:radio[name^='rdSevenRecieved']:checked").val(); } else { detail.Recieved = "False"; }
        if ($(this).find("input:radio[name^='rdSevenUnderstood']").is(":checked")) { detail.Understood = $(this).find("input:radio[name^='rdSevenUnderstood']:checked").val(); } else { detail.Understood = "False"; }
        if ($(this).find("input:radio[name^='rdSevenApplication']").is(":checked")) { detail.Application = $(this).find("input:radio[name^='rdSevenApplication']:checked").val(); } else { detail.Application = "5"; }
        if ($(this).find("input:radio[name^='rdSevenUsefullness']").is(":checked")) { detail.Usefullness = $(this).find("input:radio[name^='rdSevenUsefullness']:checked").val(); } else { detail.Usefullness = "4"; }

        var tr = $(this).closest('tr');
        var Practices = $(tr).find('span:eq(0)');
        detail.PracticesID = $(Practices).html();
        ImprovedKGP.push(detail);
    });
    $('#tblAdoptionOfImprovedMark tbody tr').each(function () {
        var detail = {};
        if ($(this).find("input:radio[name^='rdSevenRecievedM']").is(":checked")) { detail.Recieved = $(this).find("input:radio[name^='rdSevenRecievedM']:checked").val(); } else { detail.Recieved = "False"; }
        if ($(this).find("input:radio[name^='rdSevenUnderstoodM']").is(":checked")) { detail.Understood = $(this).find("input:radio[name^='rdSevenUnderstoodM']:checked").val(); } else { detail.Understood = "False"; }
        if ($(this).find("input:radio[name^='rdSevenApplicationM']").is(":checked")) { detail.Application = $(this).find("input:radio[name^='rdSevenApplicationM']:checked").val(); } else { detail.Application = "5"; }
        if ($(this).find("input:radio[name^='rdSevenUsefullnessM']").is(":checked")) { detail.Usefullness = $(this).find("input:radio[name^='rdSevenUsefullnessM']:checked").val(); } else { detail.Usefullness = "4"; }

        var tr = $(this).closest('tr');
        var Practices = $(tr).find('span:eq(0)');
        detail.PracticesID = $(Practices).html();
        ImprovedMP.push(detail);
    });
    formDetail.ImprovedKGPList = ImprovedKGP;
    formDetail.ImprovedMPList = ImprovedMP;

    //HouseHold Accessibilty to Marketing Srevice

    if ($("input:checkbox[name^='chkEightProdGroupFV']").is(":checked")) { formDetail.FreshProducerGroup = $("input:checkbox[name^='chkEightProdGroupFV']:checked").val(); } else { formDetail.FreshProducerGroup = "False"; }
    if ($("input:checkbox[name^='chkEightOtherProjFV']").is(":checked")) { formDetail.FreshOtherProject = $("input:checkbox[name^='chkEightOtherProjFV']:checked").val(); } else { formDetail.FreshOtherProject = "False"; }
    if ($("input:checkbox[name^='chkEightInputMyOwnFV']").is(":checked")) { formDetail.FreshMyOwn = $("input:checkbox[name^='chkEightInputMyOwnFV']:checked").val(); } else { formDetail.FreshMyOwn = "False"; }

    if ($("input:checkbox[name^='chkEightProdGroupDV']").is(":checked")) { formDetail.DryProducerGroup = $("input:checkbox[name^='chkEightProdGroupDV']:checked").val(); } else { formDetail.DryProducerGroup = "False"; }
    if ($("input:checkbox[name^='chkEightOtherProjDV']").is(":checked")) { formDetail.DryOtherProject = $("input:checkbox[name^='chkEightOtherProjDV']:checked").val(); } else { formDetail.DryOtherProject = "False"; }
    if ($("input:checkbox[name^='chkEightInputMyOwnDV']").is(":checked")) { formDetail.DryMyOwn = $("input:checkbox[name^='chkEightInputMyOwnDV']:checked").val(); } else { formDetail.FreshMyOwn = "False"; }

    if ($("input:radio[name^='rdEightWaterIrrigation']").is(":checked")) { formDetail.WaterIrrigation = $("input:radio[name^='rdEightWaterIrrigation']:checked").val(); } else { formDetail.WaterIrrigation = "4"; }
    if ($("input:radio[name^='rdEightWaterAccessibility']").is(":checked")) { formDetail.WaterAccessibility = $("input:radio[name^='rdEightWaterAccessibility']:checked").val(); } else { formDetail.WaterAccessibility = "4"; }

   
    //pest problem
    
    var PestProb = new Array();
    $('#tblStatusOfPestProblem tbody tr').each(function () {
        var detail = {};
        if ($(this).find("input:radio[name^='radioChangeInProblem']").is(":checked")) { detail.ChangeInProb = $(this).find("input:radio[name^='radioChangeInProblem']:checked").val(); } else { detail.ChangeInProb = "4"; }
        detail.localName = $(this).find("input[id^='txtLocalName']").val();

        var tr = $(this).closest('tr');
        var cropId = $(tr).find('span:eq(0)');
        detail.CropsID = $(cropId).html();
        PestProb.push(detail);
    });
    formDetail.PestProbList = PestProb;

    //Self Sustained Kitchen GP after NHLP

    
    formDetail.HasContinuedKG = $("input:radio[name^=rdTenContinuKG]:checked").val();
    formDetail.ReasonKG = $('#txtTenContinuKGReason').val();
    if ($("input:checkbox[name^='chkTenContinuKGW1']").is(":checked")) { formDetail.WayPurchasedKG = $("input:checkbox[name^='chkTenContinuKGW1']:checked").val(); } else { formDetail.WayPurchasedKG = "False"; }
    if ($("input:checkbox[name^='chkTenContinuKGW2']").is(":checked")) { formDetail.WayPrdByselfKG = $("input:checkbox[name^='chkTenContinuKGW2']:checked").val(); } else { formDetail.WayPrdByselfKG = "False"; }
    if ($("input:checkbox[name^='chkTenContinuKGW3']").is(":checked")) { formDetail.WayByProjKG = $("input:checkbox[name^='chkTenContinuKGW3']:checked").val(); } else { formDetail.WayByProjKG = "False"; }
    if ($("input:checkbox[name^='chkTenContinuKGW4']").is(":checked")) { formDetail.WayNHLPKG = $("input:checkbox[name^='chkTenContinuKGW4']:checked").val(); } else { formDetail.WayNHLPKG = "False"; }
    formDetail.OtherMethodKG = $('#txtTenContinuKGMethod').val();

    formDetail.HasContinuedGH = $("input:radio[name^=rdTenContinuMGH]:checked").val();
    formDetail.ReasonGH = $('#txtTenContinuMGHReason').val();
    if ($("input:checkbox[name^='chkTenContinuMGH1']").is(":checked")) { formDetail.WayPurchasedGH = $("input:checkbox[name^='chkTenContinuMGH1']:checked").val(); } else { formDetail.WayPurchasedGH = "False"; }
    if ($("input:checkbox[name^='chkTenContinuMGH2']").is(":checked")) { formDetail.WayPrdByselfGH = $("input:checkbox[name^='chkTenContinuMGH2']:checked").val(); } else { formDetail.WayPrdByselfGH = "False"; }
    if ($("input:checkbox[name^='chkTenContinuMGH3']").is(":checked")) { formDetail.WayByProjGH = $("input:checkbox[name^='chkTenContinuMGH3']:checked").val(); } else { formDetail.WayByProjGH = "False"; }
    if ($("input:checkbox[name^='chkTenContinuMGH4']").is(":checked")) { formDetail.WayNHLPGH = $("input:checkbox[name^='chkTenContinuMGH4']:checked").val(); } else { formDetail.WayNHLPGH = "False"; }
    formDetail.OtherMethodGH = $('#txtTenContinuMGHMethod').val();
    

    //NHLP Development Services

    
    var DvServiceList = new Array(); var humanAccident = new Array(); var AnimalAccident = new Array();
    $('#tblElevenDVServices tbody tr').each(function () {
        var detail = {};
        if ($(this).find("input:radio[name^='rdElevenRecieved']").is(":checked")) { detail.Recieved = $(this).find("input:radio[name^='rdElevenRecieved']:checked").val(); } else { detail.Recieved = "False"; }
        if ($(this).find("input:radio[name^='rdElevenSatisfication']").is(":checked")) { detail.SatisficationL = $(this).find("input:radio[name^='rdElevenSatisfication']:checked").val(); } else { detail.SatisficationL = "4"; }
        
        var tr = $(this).closest('tr');
        var Services = $(tr).find('span:eq(0)');
        detail.ServiceID = $(Services).html();
        DvServiceList.push(detail);
    });
    $('#tblElevenHAccident tbody tr').each(function () {
        var detail = {};
        detail.Discription = $(this).find("input:text[id^='txtElevenDescription']").val();
        detail.Injured = $(this).find("input:text[id^='txtElevenInjured']").val();
        detail.Sick = $(this).find("input:text[id^='txtElevenSick']").val();
        detail.Death = $(this).find("input:text[id^='txtElevenDeath']").val();
        var tr = $(this).closest('tr');
        var Gender = $(tr).find('span:eq(0)');
        detail.GenderID = $(Gender).html();
        humanAccident.push(detail);
    });
    $('#tblElevenLAccident tbody tr').each(function () {
        var detail = {};
        detail.Discription = $(this).find("input:text[id^='txtElevenDescription']").val();
        detail.Injured = $(this).find("input:text[id^='txtElevenInjured']").val();
        detail.Sick = $(this).find("input:text[id^='txtElevenSick']").val();
        detail.Death = $(this).find("input:text[id^='txtElevenDeath']").val();
        var tr = $(this).closest('tr');
        var Animal = $(tr).find('span:eq(0)');
        detail.AnimalID = $(Animal).html();
        AnimalAccident.push(detail);
    });

    formDetail.PestPlace = $('#txtElevenPestPlace').val();
    if ($("input:radio[name^='rdElevenPestContainer']").is("checked")) { formDetail.PestContainer = $("input:radio[name^='rdElevenPestContainer']:checked").val(); } else { formDetail.PestContainer = "5"; }
    formDetail.DVService = DvServiceList;
    formDetail.HumanAccident = humanAccident;
    formDetail.LiveStockAccident = AnimalAccident;

    //Social Problems

    formDetail.HasFacedSocialProb = $("input:radio[name^='rdTweleveSocialProb']:checked").val();
    formDetail.SufferedSocialConfMale = $('#txtTwelveMaleSuffered').val();
    formDetail.SufferedSocialConfFemale = $('#txtTwelveFemaleSuffered').val();
    formDetail.SufferedSocialChildren = $('#txtTwelveChildSuffered').val();
    var SocialProblem = new Array();
    $('#tblTwelveConflict tbody tr').each(function () {
        var detail = {};
        if ($(this).find("input:text[id^='txtTwelveConflict']").val() != '') { detail.Conflict = $(this).find("input:text[id^='txtTwelveConflict']").val(); }
        if ($(this).find("input:radio[name^='rdTweleveSocialProb']").is(":checked")) { detail.Resolved = $(this).find("input:radio[name^='rdTweleveSocialProb']:checked").val(); }
        if ($(this).find("input:checkbox[name^='chkTwelveConfRByCom']").is(":checked")) { detail.RosByCommunity = $(this).find("input:checkbox[name^='chkTwelveConfRByCom']:checked").val(); } else { detail.RosByCommunity = "False";}
        if ($(this).find("input:checkbox[name^='chkTwelveConfRByGRM']").is(":checked")) { detail.RosByGRM = $(this).find("input:checkbox[name^='chkTwelveConfRByGRM']:checked").val(); } else { detail.RosByGRM = "False"; }
        if ($(this).find("input:checkbox[name^='chkTwelveConfRByEW']").is(":checked")) { detail.RosByEW = $(this).find("input:checkbox[name^='chkTwelveConfRByEW']:checked").val(); } else { detail.RosByEW = "False"; }


        var tr = $(this).closest('tr');
        var Conflict = $(tr).find('span:eq(0)');
        detail.ConflictID = $(Conflict).html();
        SocialProblem.push(detail);
    });

    formDetail.SocialProblems = SocialProblem;
    formDetail.FarmerRemarks = $('#txtTwelveFarmersRemarks').val();
    formDetail.InterviewerRemarks = $('#txtTwelveInterviweeRemarks').val();

    var jsonObject = JSON.stringify({ formDetail: formDetail});

    $.ajax({
        type: "POST",
        url: "FemaleHorticulture.aspx/SaveFormDetail",
        data:jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
           

        },
        error: function (data) {
            alert("error found");
        }

    });
}

//

function SaveForm2b(province, gender,hasOrchard) {
    //preliinary information

   

    var formDetail = {};
    formDetail.NameOfInterviewee = $('#txtNameOFInterviewee').val();
    formDetail.Year = $('#ddlYear').val();
    if ($("input:checkbox[name^='chkFormType1']").is(":checked")) { formDetail.SampleGroupType1 = $("input:checkbox[name^='chkFormType1']:checked").val(); } else { formDetail.SampleGroupType1 = "False"; }
    if ($("input:checkbox[name^='chkFormType2']").is(":checked")) { formDetail.SampleGroupType2 = $("input:checkbox[name^='chkFormType2']:checked").val(); } else { formDetail.SampleGroupType2 = "False"; }
    
    formDetail.NameOfVillage = $('#txtNameOfVillage').val();
    formDetail.District = $('#ddlDistrict').val();
    formDetail.Province = province;
    formDetail.InterviewDate = $('#txtInterviewDate').val();
    formDetail.StartTime = $("#txtStartTime").val();
    formDetail.EndTime = $('#txtEndTime').val();
    formDetail.Interviewer = $('#txtInterviewer').val();

    //Family Composition

    formDetail.NameOfFamilyHead = $("#txtNameOfFamilyHead").val();
    formDetail.FName = $('#txtFName').val();
    formDetail.Gender = gender;
    formDetail.TotalFamilyMembers = $('#txtFamilyMembers').val();
    formDetail.MaleFamilyMembers = $('#txtMaleMembers').val();
    formDetail.FemaleFamilyMembers = $('#txtFemaleMembers').val();

    //Genreal information

    formDetail.TotalFarmArea = $('#txtTotalFarmArea').val();
    formDetail.Irrigated = $('#txtIrrigated').val();
    formDetail.Rainfed = $('#txtRainfed').val();
    formDetail.HasOrchard =hasOrchard;
    formDetail.OrchardArea = $('#txtOrchardArea').val();

    //KG Production and Product Uses

    var KG = new Array();
    $('#tblKGProductUses tbody tr').each(function () {
        var detail = {};
        detail.SeedPlanted = $(this).find("input[id^='txtSeedPlanted']").val();
        detail.PlantedArea = $(this).find("input[id^='txtPlantedArea']").val();
        detail.YieldHarvest = $(this).find("input[id^='txtYieldHarvest']").val();
        detail.KGSold = $(this).find("input[id^='txtKGSold']").val();
        detail.SellingPrice = $(this).find("input[id^='txtPrice']").val();
        var tr = $(this).closest('tr');
        var cropId = $(tr).find('span:eq(0)');
        detail.CropsID = $(cropId).html();
        KG.push(detail);
    });

    formDetail.KGProductionAndProdUses = KG

   
    //Adoption of Improved Kitchen Gardening Practice


    var ImprovedKGP = new Array();
    var ImprovedMP = new Array();
    $('#tblImprovedKitchenGP tbody tr').each(function () {
        var detail = {};
        if ($(this).find("input:radio[name^='rdSevenRecieved']").is(":checked")) { detail.Recieved = $(this).find("input:radio[name^='rdSevenRecieved']:checked").val(); } else { detail.Recieved = "False"; }
        if ($(this).find("input:radio[name^='rdSevenUnderstood']").is(":checked")) { detail.Understood = $(this).find("input:radio[name^='rdSevenUnderstood']:checked").val(); } else { detail.Understood = "False"; }
        if ($(this).find("input:radio[name^='rdSevenApplication']").is(":checked")) { detail.Application = $(this).find("input:radio[name^='rdSevenApplication']:checked").val(); } else { detail.Application = "5"; }
        if ($(this).find("input:radio[name^='rdSevenUsefullness']").is(":checked")) { detail.Usefullness = $(this).find("input:radio[name^='rdSevenUsefullness']:checked").val(); } else { detail.Usefullness = "4"; }

        var tr = $(this).closest('tr');
        var Practices = $(tr).find('span:eq(0)');
        detail.PracticesID = $(Practices).html();
        ImprovedKGP.push(detail);
    });
    $('#tblAdoptionOfImprovedMark tbody tr').each(function () {
        var detail = {};
        if ($(this).find("input:radio[name^='rdSevenRecievedM']").is(":checked")) { detail.Recieved = $(this).find("input:radio[name^='rdSevenRecievedM']:checked").val(); } else { detail.Recieved = "False"; }
        if ($(this).find("input:radio[name^='rdSevenUnderstoodM']").is(":checked")) { detail.Understood = $(this).find("input:radio[name^='rdSevenUnderstoodM']:checked").val(); } else { detail.Understood = "False"; }
        if ($(this).find("input:radio[name^='rdSevenApplicationM']").is(":checked")) { detail.Application = $(this).find("input:radio[name^='rdSevenApplicationM']:checked").val(); } else { detail.Application = "5"; }
        if ($(this).find("input:radio[name^='rdSevenUsefullnessM']").is(":checked")) { detail.Usefullness = $(this).find("input:radio[name^='rdSevenUsefullnessM']:checked").val(); } else { detail.Usefullness = "4"; }

        var tr = $(this).closest('tr');
        var Practices = $(tr).find('span:eq(0)');
        detail.PracticesID = $(Practices).html();
        ImprovedMP.push(detail);
    });
    formDetail.ImprovedKGPList = ImprovedKGP;
    formDetail.ImprovedMPList = ImprovedMP;

   
    //Self Sustained Kitchen GP after NHLP


    formDetail.HasContinuedKG = $("input:radio[name^=rdTenContinuKG]:checked").val();
    formDetail.ReasonKG = $('#txtTenContinuKGReason').val();
    if ($("input:checkbox[name^='chkTenContinuKGW1']").is(":checked")) { formDetail.WayPurchasedKG = $("input:checkbox[name^='chkTenContinuKGW1']:checked").val(); } else { formDetail.WayPurchasedKG = "False"; }
    if ($("input:checkbox[name^='chkTenContinuKGW2']").is(":checked")) { formDetail.WayPrdByselfKG = $("input:checkbox[name^='chkTenContinuKGW2']:checked").val(); } else { formDetail.WayPrdByselfKG = "False"; }
    if ($("input:checkbox[name^='chkTenContinuKGW3']").is(":checked")) { formDetail.WayByProjKG = $("input:checkbox[name^='chkTenContinuKGW3']:checked").val(); } else { formDetail.WayByProjKG = "False"; }
    if ($("input:checkbox[name^='chkTenContinuKGW4']").is(":checked")) { formDetail.WayNHLPKG = $("input:checkbox[name^='chkTenContinuKGW4']:checked").val(); } else { formDetail.WayNHLPKG = "False"; }
    formDetail.OtherMethodKG = $('#txtTenContinuKGMethod').val();

    formDetail.HasContinuedGH = $("input:radio[name^=rdTenContinuMGH]:checked").val();
    formDetail.ReasonGH = $('#txtTenContinuMGHReason').val();
    if ($("input:checkbox[name^='chkTenContinuMGH1']").is(":checked")) { formDetail.WayPurchasedGH = $("input:checkbox[name^='chkTenContinuMGH1']:checked").val(); } else { formDetail.WayPurchasedGH = "False"; }
    if ($("input:checkbox[name^='chkTenContinuMGH2']").is(":checked")) { formDetail.WayPrdByselfGH = $("input:checkbox[name^='chkTenContinuMGH2']:checked").val(); } else { formDetail.WayPrdByselfGH = "False"; }
    if ($("input:checkbox[name^='chkTenContinuMGH3']").is(":checked")) { formDetail.WayByProjGH = $("input:checkbox[name^='chkTenContinuMGH3']:checked").val(); } else { formDetail.WayByProjGH = "False"; }
    if ($("input:checkbox[name^='chkTenContinuMGH4']").is(":checked")) { formDetail.WayNHLPGH = $("input:checkbox[name^='chkTenContinuMGH4']:checked").val(); } else { formDetail.WayNHLPGH = "False"; }
    formDetail.OtherMethodGH = $('#txtTenContinuMGHMethod').val();


    //NHLP Development Services


    var DvServiceList = new Array();
    $('#tblElevenDVServices tbody tr').each(function () {
        var detail = {};
        if ($(this).find("input:radio[name^='rdElevenRecieved']").is(":checked")) { detail.Recieved = $(this).find("input:radio[name^='rdElevenRecieved']:checked").val(); } else { detail.Recieved = "False"; }
        if ($(this).find("input:radio[name^='rdElevenSatisfication']").is(":checked")) { detail.SatisficationL = $(this).find("input:radio[name^='rdElevenSatisfication']:checked").val(); } else { detail.SatisficationL = "4"; }

        var tr = $(this).closest('tr');
        var Services = $(tr).find('span:eq(0)');
        detail.ServiceID = $(Services).html();
        DvServiceList.push(detail);
    });
   
    formDetail.DVService = DvServiceList;
    //Remarks


   
    formDetail.FarmerRemarks = $('#txtTwelveFarmersRemarks').val();
    formDetail.InterviewerRemarks = $('#txtTwelveInterviweeRemarks').val();

    var jsonObject = JSON.stringify({ formDetail: formDetail });

    $.ajax({
        type: "POST",
        url: "FemaleHortToolset02b.aspx/SaveFormDetail",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $('#IdH3Title').html('Form is successfully saved !');
            $('#IdMessage').html('The  Female Horticulture 2013 02b form has been entered into system with serial #  <h4 style="color:blue;"><strong> ( ' + data.d + ' ) </strong></h4> </br>Note: Please write it down above generated serial number on the entered form. ');
            $('#MdAlert').modal('show');

            ClearFormComponents();
        },
        error: function (data) {
            alert("error found");
        }

    });
}
function UpdateForm2b(province, gender, hasOrchard,Id) {
    //preliinary information


    var formDetail = {};
    formDetail.FormID = Id;
    formDetail.NameOfInterviewee = $('#txtNameOFInterviewee').val();
    formDetail.Year = $('#ddlYear').val();
    if ($("input:checkbox[name^='chkFormType1']").is(":checked")) { formDetail.SampleGroupType1 = $("input:checkbox[name^='chkFormType1']:checked").val(); } else { formDetail.SampleGroupType1 = "False"; }
    if ($("input:checkbox[name^='chkFormType2']").is(":checked")) { formDetail.SampleGroupType2 = $("input:checkbox[name^='chkFormType2']:checked").val(); } else { formDetail.SampleGroupType2 = "False"; }

    formDetail.NameOfVillage = $('#txtNameOfVillage').val();
    formDetail.District = $('#ddlDistrict').val();
    formDetail.Province = province;
    formDetail.InterviewDate = $('#txtInterviewDate').val();
    formDetail.StartTime = $("#txtStartTime").val();
    formDetail.EndTime = $('#txtEndTime').val();
    formDetail.Interviewer = $('#txtInterviewer').val();

    //Family Composition

    formDetail.NameOfFamilyHead = $("#txtNameOfFamilyHead").val();
    formDetail.FName = $('#txtFName').val();
    formDetail.Gender = gender;
    formDetail.TotalFamilyMembers = $('#txtFamilyMembers').val();
    formDetail.MaleFamilyMembers = $('#txtMaleMembers').val();
    formDetail.FemaleFamilyMembers = $('#txtFemaleMembers').val();

    //Genreal information

    formDetail.TotalFarmArea = $('#txtTotalFarmArea').val();
    formDetail.Irrigated = $('#txtIrrigated').val();
    formDetail.Rainfed = $('#txtRainfed').val();
    formDetail.HasOrchard = hasOrchard;
    formDetail.OrchardArea = $('#txtOrchardArea').val();

    //KG Production and Product Uses

    var KG = new Array();
    $('#tblKGProductUses tbody tr').each(function () {
        var detail = {};
        detail.SeedPlanted = $(this).find("input[id^='txtSeedPlanted']").val();
        detail.PlantedArea = $(this).find("input[id^='txtPlantedArea']").val();
        detail.YieldHarvest = $(this).find("input[id^='txtYieldHarvest']").val();
        detail.KGSold = $(this).find("input[id^='txtKGSold']").val();
        detail.SellingPrice = $(this).find("input[id^='txtPrice']").val();
        var tr = $(this).closest('tr');
        var cropId = $(tr).find('span:eq(0)');
        detail.CropsID = $(cropId).html();
        KG.push(detail);
    });

    formDetail.KGProductionAndProdUses = KG


    //Adoption of Improved Kitchen Gardening Practice


    var ImprovedKGP = new Array();
    var ImprovedMP = new Array();
    $('#tblImprovedKitchenGP tbody tr').each(function () {
        var detail = {};
        if ($(this).find("input:radio[name^='rdSevenRecieved']").is(":checked")) { detail.Recieved = $(this).find("input:radio[name^='rdSevenRecieved']:checked").val(); } else { detail.Recieved = "False"; }
        if ($(this).find("input:radio[name^='rdSevenUnderstood']").is(":checked")) { detail.Understood = $(this).find("input:radio[name^='rdSevenUnderstood']:checked").val(); } else { detail.Understood = "False"; }
        if ($(this).find("input:radio[name^='rdSevenApplication']").is(":checked")) { detail.Application = $(this).find("input:radio[name^='rdSevenApplication']:checked").val(); } else { detail.Application = "5"; }
        if ($(this).find("input:radio[name^='rdSevenUsefullness']").is(":checked")) { detail.Usefullness = $(this).find("input:radio[name^='rdSevenUsefullness']:checked").val(); } else { detail.Usefullness = "4"; }

        var tr = $(this).closest('tr');
        var Practices = $(tr).find('span:eq(0)');
        detail.PracticesID = $(Practices).html();
        ImprovedKGP.push(detail);
    });
    $('#tblAdoptionOfImprovedMark tbody tr').each(function () {
        var detail = {};
        if ($(this).find("input:radio[name^='rdSevenRecievedM']").is(":checked")) { detail.Recieved = $(this).find("input:radio[name^='rdSevenRecievedM']:checked").val(); } else { detail.Recieved = "False"; }
        if ($(this).find("input:radio[name^='rdSevenUnderstoodM']").is(":checked")) { detail.Understood = $(this).find("input:radio[name^='rdSevenUnderstoodM']:checked").val(); } else { detail.Understood = "False"; }
        if ($(this).find("input:radio[name^='rdSevenApplicationM']").is(":checked")) { detail.Application = $(this).find("input:radio[name^='rdSevenApplicationM']:checked").val(); } else { detail.Application = "5"; }
        if ($(this).find("input:radio[name^='rdSevenUsefullnessM']").is(":checked")) { detail.Usefullness = $(this).find("input:radio[name^='rdSevenUsefullnessM']:checked").val(); } else { detail.Usefullness = "4"; }

        var tr = $(this).closest('tr');
        var Practices = $(tr).find('span:eq(0)');
        detail.PracticesID = $(Practices).html();
        ImprovedMP.push(detail);
    });
    formDetail.ImprovedKGPList = ImprovedKGP;
    formDetail.ImprovedMPList = ImprovedMP;


    //Self Sustained Kitchen GP after NHLP


    formDetail.HasContinuedKG = $("input:radio[name^=rdTenContinuKG]:checked").val();
    formDetail.ReasonKG = $('#txtTenContinuKGReason').val();
    if ($("input:checkbox[name^='chkTenContinuKGW1']").is(":checked")) { formDetail.WayPurchasedKG = $("input:checkbox[name^='chkTenContinuKGW1']:checked").val(); } else { formDetail.WayPurchasedKG = "False"; }
    if ($("input:checkbox[name^='chkTenContinuKGW2']").is(":checked")) { formDetail.WayPrdByselfKG = $("input:checkbox[name^='chkTenContinuKGW2']:checked").val(); } else { formDetail.WayPrdByselfKG = "False"; }
    if ($("input:checkbox[name^='chkTenContinuKGW3']").is(":checked")) { formDetail.WayByProjKG = $("input:checkbox[name^='chkTenContinuKGW3']:checked").val(); } else { formDetail.WayByProjKG = "False"; }
    if ($("input:checkbox[name^='chkTenContinuKGW4']").is(":checked")) { formDetail.WayNHLPKG = $("input:checkbox[name^='chkTenContinuKGW4']:checked").val(); } else { formDetail.WayNHLPKG = "False"; }
    formDetail.OtherMethodKG = $('#txtTenContinuKGMethod').val();

    formDetail.HasContinuedGH = $("input:radio[name^=rdTenContinuMGH]:checked").val();
    formDetail.ReasonGH = $('#txtTenContinuMGHReason').val();
    if ($("input:checkbox[name^='chkTenContinuMGH1']").is(":checked")) { formDetail.WayPurchasedGH = $("input:checkbox[name^='chkTenContinuMGH1']:checked").val(); } else { formDetail.WayPurchasedGH = "False"; }
    if ($("input:checkbox[name^='chkTenContinuMGH2']").is(":checked")) { formDetail.WayPrdByselfGH = $("input:checkbox[name^='chkTenContinuMGH2']:checked").val(); } else { formDetail.WayPrdByselfGH = "False"; }
    if ($("input:checkbox[name^='chkTenContinuMGH3']").is(":checked")) { formDetail.WayByProjGH = $("input:checkbox[name^='chkTenContinuMGH3']:checked").val(); } else { formDetail.WayByProjGH = "False"; }
    if ($("input:checkbox[name^='chkTenContinuMGH4']").is(":checked")) { formDetail.WayNHLPGH = $("input:checkbox[name^='chkTenContinuMGH4']:checked").val(); } else { formDetail.WayNHLPGH = "False"; }
    formDetail.OtherMethodGH = $('#txtTenContinuMGHMethod').val();


    //NHLP Development Services


    var DvServiceList = new Array();
    $('#tblElevenDVServices tbody tr').each(function () {
        var detail = {};
        if ($(this).find("input:radio[name^='rdElevenRecieved']").is(":checked")) { detail.Recieved = $(this).find("input:radio[name^='rdElevenRecieved']:checked").val(); } else { detail.Recieved = "False"; }
        if ($(this).find("input:radio[name^='rdElevenSatisfication']").is(":checked")) { detail.SatisficationL = $(this).find("input:radio[name^='rdElevenSatisfication']:checked").val(); } else { detail.SatisficationL = "4"; }

        var tr = $(this).closest('tr');
        var Services = $(tr).find('span:eq(0)');
        detail.ServiceID = $(Services).html();
        DvServiceList.push(detail);
    });

    formDetail.DVService = DvServiceList;
    //Remarks



    formDetail.FarmerRemarks = $('#txtTwelveFarmersRemarks').val();
    formDetail.InterviewerRemarks = $('#txtTwelveInterviweeRemarks').val();

    var jsonObject = JSON.stringify({ formDetail: formDetail });

    $.ajax({
        type: "POST",
        url: "FemaleHortToolset02b.aspx/UpdateForm",
        data: jsonObject,
        dataType: "json",
        async: false,
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            
            if (data.d == true) {
                $('#IdH3Title').html('Form is successfully Updated !');
                $('#IdMessage').html('<strong>The  Female Horticulture 2013 02b form has been sucessfully updated</strong>');

                $('#MdAlert').modal('show');
                $('#btnSave').show();
                $('#btnUpdate').hide();
                ClearFormComponents();
            }else {
                $('#IdH3Title').html('Some Going Wrong!');
                $('#IdMessage').html('<strong><font style="color:red;">you are not Admin or You have not access to update the form..!!!</color></strong>');

                $('#MdAlert').modal('show');
            }
        },
        error: function (data) {
            alert("error found");
        }

    });
}