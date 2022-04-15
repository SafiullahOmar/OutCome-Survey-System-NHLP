<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="frmPCInfo.aspx.cs" Inherits="PCI_frmPCInfo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageTitle" runat="Server">
    Provincial Coordinator
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPgDescription" runat="Server">
    Details for PC here..
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPgContent" runat="Server">
    <style>
        .Red {
            color: red;
        }
    </style>
    <script src="../Script/PC.js"></script>
    <script type="text/javascript">

        $(function () {
            $("#<%=btnUpdate.ClientID%>").hide();
            $('#DivPc').hide();
            $("input:radio[name=rdSex][value='True']").prop('checked', 'checked');
            //ddl district

            $("#<%=ddlProvince.ClientID%>").change(function () {

                if ($(this).val() == "-1") {

                    $("#ddlDistrict").attr("disabled", "disabled");
                    $('#DivPc').hide();
                }
                else {

                    ShowPCs($('#<%=ddlProvince.ClientID%>').val());
                    $("#ddlDistrict").attr("disabled", false);
                    $.ajax({
                        type: "POST",
                        url: "frmExtensionWInfo.aspx/GetDistrict",
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


                }
            });

            //btn Save
            $("#<%=btnSave.ClientID%>").click(function (e) {
                e.preventDefault();
                if (formValidation(e)) {
                    var province = $("#<%=ddlProvince.ClientID%>").val();
                    var gender = $("input:radio[name^='rdSex']:checked").val();
                    SavePC(province, gender);
                }
            });


            //btn update
            $("#<%=btnUpdate.ClientID%>").click(function (e) {
                e.preventDefault();
                if (formValidation(e)) {
                    var province = $("#<%=ddlProvince.ClientID%>").val();
                    var gender = $("input:radio[name^='rdSex']:checked").val();
                    UpdatePC(province, gender);
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
                    <legend>PC Preliminary Information</legend>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlProvince">Province</label>
                                <asp:DropDownList ID="ddlProvince" CssClass="form-control province" runat="server">
                                </asp:DropDownList>
                            </div>

                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlDistrict">District</label>
                                <select class="form-control district" id="ddlDistrict"></select>

                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtVillage">Village</label>
                                <input type="text" class="form-control" placeholder="Village" id="txtVillage" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtName">Name of PC</label>
                                <input type="text" class="form-control" placeholder=" PC Name" id="txtName" />
                            </div>
                        </div>
                        <div class="col-md-6">

                            <span>Father Name</span>
                            <input type="text" class="form-control" placeholder="Father Name" id="txtFatherName" />

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
                                <span class="block">Sex</span>
                                <div class="clip-radio radio-primary">

                                    <input type="radio" id="Male" name="rdSex" class="radio-inline" value="True" /><label for="Male">
                                        Male
                                    </label>

                                    <input type="radio" id="Female" name="rdSex" class="radio-inline" value="False" /><label for="Female">Female</label>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 btn">
                            <br />
                            <asp:Button ID="btnUpdate" class="btn-sm btn-success update" runat="server" Text="Update" />
                            <asp:Button ID="btnSave" class="btn-sm btn-primary save" runat="server" Text="Save" />
                            <hr />
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="col-md-1">
            </div>
        </div>


        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <strong>PC Basic Information</strong>

                    </div>
                    <div class="panel-body">
                        <div id="DivPc">
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
                <div class="modal-body" style="height: 540px; max-height: 540px; width: 630px; max-width: 1100px;">

                    <div id="IdMessage">
                    </div>
                </div>
                <div class="modal-footer">
                    <button class="btn blue" aria-hidden="true" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="hdnPcId" />
</asp:Content>

