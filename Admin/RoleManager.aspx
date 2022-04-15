﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="RoleManager.aspx.cs" Inherits="Admin_RoleManager" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageTitle" runat="Server">
    Role Managment
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPgDescription" runat="Server">
    Details for PC here..
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPgContent" runat="Server">
    <script>
        $(function () {
            var tabName = $("#<%=TabName.ClientID%>").val() != "" ? $("#<%=TabName.ClientID%>").val() : "NewRole";
            $('#tabs a[href="#' + tabName + '"]').tab('show');
            $("#tabs a[data-toggle='tab']").click(function (e) {

                $("#<%=TabName.ClientID%>").val($(this).attr('href').replace('#', ''));

            });
        });
            $(function () {
                $('input[id*="chkAll"]').on('ifChecked', function () {
                    $('#<%=grdSubProgram.ClientID%> input[id*="chksubPro"]').iCheck('check');
                });
                $('input[id*="chkAll"]').on('ifUnchecked', function () {
                    $('#<%=grdSubProgram.ClientID%> input[id*="chksubPro"]').iCheck('uncheck');
                });
            });

    </script>
    <div class="container-fluid container-fullw bg-white">
        <div class="row">
            <div class="col-md-10">
                <div id="tabs" role="tabpanel">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="active"><a href="#NewRole" aria-controls="NewRole" role="tab" data-toggle="tab">Create Role
                        </a></li>
                        <li><a href="#AsignRole" aria-controls="AsignRole" role="tab" data-toggle="tab">Assign Role</a></li>
                        <li><a href="#PassReset" aria-controls="PassReset" role="tab" data-toggle="tab">Manage User </a></li>
                    </ul>
                </div>

                <div class="tab-content" style="padding-top: 20px">
                    <div role="tabpanel" class="tab-pane active" id="NewRole">
                        <table border="0" cellspacing="2">
                            <tr>

                                <td>
                                    <div class="input-group">
                                        <span class="input-group-addon">Role</span>
                                        <asp:TextBox ID="txtRoleName" ValidationGroup="insertrole" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:RequiredFieldValidator ValidationGroup="insertrole" ID="RequiredFieldValidator1" ControlToValidate="txtRoleName" runat="server" ErrorMessage="Enter Role Name">*</asp:RequiredFieldValidator>

                                </td>
                                <td>
                                    <asp:Button ID="BtnAddRole" ValidationGroup="insertrole" CssClass="btn btn-sm btn-primary" OnClick="BtnAddRole_Click" runat="server" Text="Save" /></td>
                            </tr>

                        </table>
                        <div style="width: 98%; margin: 0 auto;">
                            <asp:GridView ID="GrdRoles" CssClass="table table-bordered"
                                runat="server" AutoGenerateColumns="False" EnableModelValidation="True"
                                GridLines="None" Width="98%" OnRowDataBound="GrdRoles_RowDataBound" HeaderStyle-BackColor="White">
                                <Columns>
                                    <asp:BoundField DataField="RoleID" HeaderText="Role ID" />
                                    <asp:BoundField DataField="RoleName" HeaderText="Role Name" />
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <li style="width: 17px; height: 16px; padding: 3px; list-style-type: none;" class="ui-state-default ui-corner-all">
                                                <asp:LinkButton CssClass="label label-danger" ID="lnkDelete" runat="server" OnCommand="imgDelete_Command"
                                                    CommandArgument='<%# Eval("RoleID") %>' OnClientClick="javascript:return confirm('do you want to delete this role');"><i class="glyphicon glyphicon-remove"></i></asp:LinkButton>
                                                <%-- <asp:ImageButton CausesValidation="false" AlternateText='<%#Eval("RoleID") %>' CommandArgument='<%# Eval("RoleID") %>' OnClientClick="javascript:return deleteItem(this.name,this.alt,'Do you want to Delete this Record!');"
                                            CssClass="ui-icon ui-icon-closethick" ID="imgDelete" runat="server" OnCommand="imgDelete_Command" />--%>
                                            </li>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                            </asp:GridView>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="AsignRole">
                        <asp:Panel runat="server" ID="pnlUsers">
                            <table border="0" cellspacing="2">
                                <tr>
                                    <td>User Name</td>
                                    <td>
                                        <asp:TextBox ID="txtSearchuserName" ValidationGroup="assignroles" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ControlToValidate="txtSearchuserName" ValidationGroup="assignroles" Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnSearchUser" ValidationGroup="assignroles" runat="server" CssClass="btn btn-sm btn-primary"
                                            Text="Search User" OnClick="btnSearchUser_Click" /></td>
                                </tr>
                            </table>

                            <div style="width: 98%; margin: 0 auto; margin-top: 20px;">
                                <asp:GridView ID="grdUser" CssClass="table table-bordered" AutoGenerateColumns="False" runat="server" EnableModelValidation="True"
                                    OnSelectedIndexChanging="grdUser_SelectedIndexChanging" Width="100%"
                                    AllowPaging="True" OnPageIndexChanging="grdUser_PageIndexChanging">
                                    <Columns>
                                        <asp:BoundField DataField="UserName" HeaderText="User Name" />
                                        <asp:BoundField DataField="Email" HeaderText="Email" />
                                        <%-- <asp:BoundField DataField="ApplicationName" HeaderText="Application" />--%>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkAssingRoles"
                                                    CssClass="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only "
                                                    CausesValidation="False" CommandArgument='<%# Eval("UserID") %>' runat="server"
                                                    OnCommand="lnkAssingRoles_Command"><span class="label label-info "><i class="glyphicon glyphicon-cog"></i>Assign Role</span></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>
                            </div>
                        </asp:Panel>

                        <asp:Panel runat="server" Visible="false" HorizontalAlign="Center" ID="pnlroles">
                            <div class="alert alert-success">
                                <i class="glyphicon glyphicon-info-sign"></i>&nbsp;&nbsp;
                        <asp:Label ID="lblUserInfo" runat="server" Text="" CssClass="ui-button-text"></asp:Label>
                            </div>
                            <div style="width: 98%; margin: 0 auto;">
                                <asp:GridView ID="GrdUserRoles" CssClass="table table-bordered" AutoGenerateColumns="False" runat="server"
                                    EnableModelValidation="True" Width="100%"
                                    OnRowDataBound="GrdUserRoles_RowDataBound">
                                    <Columns>

                                        <asp:TemplateField HeaderText="Role ID">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRoleID" runat="server" Text='<%# Bind("RoleID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="RoleName" HeaderText="Role Name" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkAssign" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </asp:GridView>
                            </div>
                            <br />

                            <div class="alert alert-success">
                                <i class="glyphicon glyphicon-info-sign"></i>&nbsp;&nbsp;
                        <asp:Label ID="Label2" runat="server" Text="Assigning Province" CssClass="ui-button-text"></asp:Label>
                            </div>

                            <div style="height: 300px; overflow-y: scroll;">


                                <asp:GridView Width="70%" CssClass="table table-bordered"
                                    AutoGenerateColumns="False" ID="grdSubProgram" runat="server"
                                    EnableModelValidation="True" AllowPaging="false"
                                    OnRowDataBound="grdSubProgram_RowDataBound" HeaderStyle-HorizontalAlign="Center">

                                    <Columns>
                                        <asp:TemplateField HeaderText="SR">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSubProgramID" runat="server" Text='<%#Bind("ProvinceID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ProvinceEngName" HeaderText="Province" />

                                        <asp:TemplateField HeaderStyle-Width="100px" ItemStyle-Width="100px">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="chkAll" runat="server" Text="All" />
                                            </HeaderTemplate>
                                            <ItemTemplate>

                                                <asp:CheckBox ID="chksubPro" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>

                            </div>
                            <br />
                            <hr />

                            <asp:Button ID="AssignRoles" runat="server" Text="Assign Role" CssClass="btn btn-sm btn-primary" OnClick="AssignRoles_Click" />
                            <asp:Button ID="btnBack" runat="server" CssClass="btn btn-sm btn-primary" Text="back" OnClick="btnBack_Click" />
                        </asp:Panel>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="PassReset">
                        <table border="0" cellspacing="2">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label></td>
                                <td>
                                    <asp:TextBox ValidationGroup="ManageUsers" ID="txtSearchManageUser" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ValidationGroup="ManageUsers" ControlToValidate="txtSearchManageUser" ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:Button ID="btnSearchManageUser" ValidationGroup="ManageUsers" CssClass="btn btn-sm btn-primary"
                                        runat="server" Text="Search" OnClick="btnSearchManageUser_Click" /></td>
                            </tr>
                        </table>
                        <div style="width: 98%">
                            <asp:GridView ID="grdManageUsers" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False"
                                EnableModelValidation="True" Width="100%" AllowPaging="True"
                                OnPageIndexChanging="grdManageUsers_PageIndexChanging">
                                <Columns>
                                    <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserId") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UserName" HeaderText="User Name" />
                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                    <%--  <asp:BoundField DataField="ApplicationName" HeaderText="Application Name" />--%>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkLock" CausesValidation="false"
                                                CssClass="label label-danger" Style="padding: 0.4em 1em; line-height: 1.4;"
                                                runat="server" CommandArgument='<%#Eval("UserId") %>' OnClientClick="return confirm('Do You Want to perform this Action')" Text='<%#Eval("IsLockedOut").ToString()=="False"?"Lock":" Unlock"%>' OnCommand="lnkLock_Command">
                                       
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkResetPassword" CausesValidation="false" OnClientClick="return confirm('Do you want to Reset Password To (abc)')" CommandArgument='<%#Eval("UserId") %>'
                                                CssClass="label label-warning"
                                                runat="server" OnCommand="lnkResetPassword_Command"><span class="ui-button-text">Reset Password</span></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <%-- <span class="ui-button-text">"+--%>
                            <%--"--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:HiddenField ID="TabName" runat="server" />
    <asp:HiddenField ID="hdUserID" Value="0" runat="server" />
</asp:Content>

