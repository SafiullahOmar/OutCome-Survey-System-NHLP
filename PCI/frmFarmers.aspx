<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="frmFarmers.aspx.cs" Inherits="PCI_frmExtensionW" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageTitle" runat="Server">
    Farmers
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPgDescription" runat="Server">
    Details for Farmers here..
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPgContent" runat="Server">
    <style>
        .Red {
            color: red;
        }
    </style>
    <script src="../Script/Farmer.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#<%=btnUpdate.ClientID%>").hide();
            $("#<%=btnSave.ClientID%>").show();
            $('#FarmerW').hide();
            //ShowControlsByRoles();
            $("input:radio[name=rdSex][value='True']").prop('checked', 'checked');
            //ddl district

            $("#<%=ddlProvince.ClientID%>").change(function () {

                if ($(this).val() == "-1") {

                    $("#ddlDistrict").attr("disabled", "disabled");
                    $('#<%=ddlExt.ClientID%>').attr("disabled", "disabled");
                }
                else {

                    $("#ddlDistrict").attr("disabled", false);
                    $('#<%=ddlExt.ClientID%>').attr("disabled", false);
                    //ShowControlsByRoles();
                    $.ajax({
                        type: "POST",
                        url: "frmFarmers.aspx/GetDistrict",
                        data: '{ProvinceID: ' + $('#<%=ddlProvince.ClientID%>').val() + '}',
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('#ddlDistrict').empty();
                            $.each(data.d, function (key, value) {
                                $('#ddlDistrict').append($("<option></option>").val(value.DistrictId).html(value.DistrictName));
                            });
                            $('#ddlDistrict').prepend("<option value='-1' selected='true'>-Select-</option>");
                            $('#ddlDistrict option:first').attr("selected", "selected");
                        },
                        error: function (data) {
                            alert("error found");
                        }

                    });

                    // ddl District Change function
                    $("#ddlDistrict").change(function () {
                        if ($(this).val() == "-1") {
                            $('#FarmerW').html('');
                        }
                        else {

                            //Gridview List for Farmers
                            ShowFarmers($('#ddlDistrict').val());

                        }

                    });
                    //Ew Dropdown list
                    $.ajax({
                        type: "POST",
                        url: "frmFarmers.aspx/GetExtW",
                        data: '{ProvinceID: ' + $('#<%=ddlProvince.ClientID%>').val() + '}',
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            $('#<%=ddlExt.ClientID%>').empty();
                            $.each(data.d, function (key, value) {
                                $('#<%=ddlExt.ClientID%>').append($("<option></option>").val(value.ExtId).html(value.Name));
                            });
                            $('#<%=ddlExt.ClientID%>').prepend("<option value='-1' selected='true'>-Select-</option>");
                            $('#<%=ddlExt.ClientID%> option:first').attr("selected", "selected");
                        },
                        error: function (data) {
                            alert("error found");
                        }

                    });


                }
            });

            //btn Save
            $("#<%=btnSave.ClientID%>").click(function (e) {
                e.preventDefault();
                if (formValidation(e)) {
                    var province = $("#<%=ddlProvince.ClientID%>").val();
                    var gender = $("input:radio[name^='rdSex']:checked").val();
                    var EW = $("#<%=ddlExt.ClientID%>").val();
                    SaveFarmer(province, gender, EW);
                }
            });

            //btn Update
            $("#<%=btnUpdate.ClientID%>").click(function (e) {
                e.preventDefault();
                if (formValidation(e)) {
                    var province = $("#<%=ddlProvince.ClientID%>").val();
                    var gender = $("input:radio[name^='rdSex']:checked").val();
                    var EW = $("#<%=ddlExt.ClientID%>").val();
                    Update(province, gender, EW);
                }
            });

        });
    </script>
    <div class="container-fluid container-fullw bg-white">
        <div class="row">
            <div class="col-md-1">
            </div>
            <div class="col-md-10">
                <fieldset>
                    <legend>Farmers Preliminary Information</legend>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="ddlProvince">Province</label>
                                <asp:DropDownList ID="ddlProvince" CssClass="form-control province" runat="server">
                                </asp:DropDownList>
                                <asp:CompareValidator ID="CompareValidator3" ValueToCompare="-1" Operator="NotEqual" ControlToValidate="ddlProvince" runat="server" ErrorMessage=""></asp:CompareValidator>
                            </div>
                            
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="ddlDistrict">District</label>
                                <select class="form-control district" id="ddlDistrict"></select>

                            </div>
                        </div>
                    </div>                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtName">Name of Farmer</label>
                                <input type="text" class="form-control" placeholder=" Lead Former Name" id="txtName" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtFatherName">Father Name</label>
                                <input type="text" class="form-control" placeholder="Father Name" id="txtFatherName" />
                            </div>
                        </div>

                    </div>
                    <div class="row">

                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtContactNo">Contact No</label>
                                <input type="text" class="form-control" placeholder="Contact No" id="txtContactNo" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="ddlExt">Extension Worker</label>
                                <asp:DropDownList ID="ddlExt" CssClass="form-control EW" runat="server">
                                </asp:DropDownList>
                            </div>
                            <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="ddlExt" Operator="NotEqual" ValueToCompare="-1" ErrorMessage="***"></asp:CompareValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="rdSex" class="block">Sex</label>
                                <div class="clip-radio radio-primary">

                                    <input type="radio" name="rdSex" id="Male" class="radio-inline" value="True" />
                                    <label for="Male">Male</label>

                                    <input type="radio" name="rdSex" id="Female" class="radio-inline" value="False" />
                                    <label for="Female">Female</label>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 btn">
                            <br />
                            <asp:Button ID="btnUpdate" class="btn-sm btn-success btnUpdate" runat="server" Text="Update" />
                            <asp:Button ID="btnSave" class="btn-sm btn-primary btnSave" runat="server" Text="Save" />
                            <hr />
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="col-md-1">
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <strong>Farmers Basic Information</strong>

                    </div>
                    <div class="panel-body">
                        <div id="FarmerW">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>

        </div>
    </div>
    <%--Alert Modal--%>

    <div id="MdAlert" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 id="IdH3Title"></h4>
                </div>
                <div class="modal-body">

                    <div id="IdMessage">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn blue" aria-hidden="true" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdnFarmerId" />
</asp:Content>

