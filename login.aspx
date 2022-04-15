<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Clip-Two - Responsive Admin Template</title>
    <!-- start: META -->
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta content="" name="description" />
    <meta content="" name="author" />
    <!-- end: META -->
    <!-- start: GOOGLE FONTS -->
    <%--<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />--%>
    <!-- end: GOOGLE FONTS -->
    <!-- start: MAIN CSS -->
    <link rel="stylesheet" href="CNT/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="CNT/vendor/fontawesome/css/font-awesome.min.css">
    <!-- end: MAIN CSS -->
    <!-- start: CLIP-TWO CSS -->
    <link rel="stylesheet" href="CNT/assets/css/styles.css">
    <!-- end: CLIP-TWO CSS -->
    <!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
    <!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
    <style>
        body {
    background-color: rgba(255, 255, 255, 0) !important;
    background-image: url('images/23.jpg') !important;
    background-color: #f6f6f6 !important;
}
    </style>
</head>

<body class="login">
    <form id="form1" runat="server">
        <!-- start: LOGIN -->
        <div class="row">
            <div class="main-login col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
                <div class="logo margin-top-30">
                    <img src="assets/images/logo.png" alt="NHLP Farmer Contribution MIS" />
                </div>
                <!-- start: LOGIN BOX -->
                <div class="box-login">
                    <div class="form-login">
                        <p class="text-extra-large  text-dark text-bold margin-bottom-30">NHLP Farmer Contribution MIS</p>
                        <fieldset>
                            <legend>Sign in to your account
                            </legend>
                            <p>
                                Please enter your name and password to log in.
                            </p>
                            <asp:Login ID="Login1" FailureTextStyle-ForeColor="Red" runat="server" Width="100%">
                                <LayoutTemplate>

                                    <asp:Label ID="FailureText" runat="server" Font-Size="13.5px" CssClass="label label-danger" EnableViewState="false"></asp:Label>

                                    <br />
                                    <div class="form-group">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName"></asp:Label>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"  ToolTip="User Name is required." ValidationGroup="Login1"></asp:RequiredFieldValidator>
                                        <span class="input-icon">
                                            <asp:TextBox ID="UserName" CssClass="form-control" runat="server"></asp:TextBox>
                                            <i class="fa fa-user"></i></span>

                                    </div>
                                    <div class="form-group ">
                                        
                                        <span class="input-icon">
                                            <asp:TextBox ID="Password" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox><i class="fa fa-lock"></i></span>

                                    </div>
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password"></asp:Label>
                                    <asp:RequiredFieldValidator Display="Static" ID="PasswordRequired" runat="server" ControlToValidate="Password"  ToolTip="Password is required." ValidationGroup="Login1"></asp:RequiredFieldValidator>
                                    <div class="checkbox clip-check check-primary">
                                        <input type="checkbox" id="remember" value="1">
                                        <label for="remember">
                                            Keep me signed in
                                        </label>
                                    </div>
                                    <asp:LinkButton ID="LoginButton" ValidationGroup="Login1" CssClass="btn btn-primary pull-right" CommandName="Login" runat="server"> Login <i class="fa fa-arrow-circle-right"></i> </asp:LinkButton>

                                </LayoutTemplate>
                            </asp:Login>
                        </fieldset>
                    </div>
                    <!-- start: COPYRIGHT -->
                    <div class="copyright">
                        &copy; <span class="current-year"></span><span class="text-bold text-uppercase"> NHLP MIS</span>. <span>All rights reserved</span>
                    </div>
                    <!-- end: COPYRIGHT -->
                </div>
                <!-- end: LOGIN BOX -->
            </div>
        </div>
    </form>
    <!-- start: MAIN JAVASCRIPTS -->
    <script src="CNT/vendor/jquery/jquery.min.js"></script>
    <script src="CNT/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="CNT/vendor/jquery-cookie/jquery.cookie.js"></script>
    <!-- end: MAIN JAVASCRIPTS -->
    <!-- end: JavaScript Event Handlers for this page -->
    <!-- end: CLIP-TWO JAVASCRIPTS -->
</body>
</html>
