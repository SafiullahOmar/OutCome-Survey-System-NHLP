<%@ Page Title="SMIS:Error" Language="C#" MasterPageFile="~/OuterSiteMaster2.master" AutoEventWireup="true" CodeFile="ShowError.aspx.cs" Inherits="ShowError" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageTitle" runat="Server">
    Error Page
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPgDescription" runat="Server">
    Details for Eror here..
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPgContent" Runat="Server">

 <script type="text/javascript">
     jQuery(document).ready(function ($) {
         $('#tabs').tab();
     });
</script> 


 
   
<!-------->
<div id="content">
<ul id="Ul1" class="nav nav-tabs" data-tabs="tabs">
<li class="active "><a href="#red" data-toggle="tab">Message</a></li>
<li><a href="#orange" data-toggle="tab">Source</a></li>
<li><a href="#yellow" data-toggle="tab">Stack Trace</a></li>
<li><a href="#green" data-toggle="tab">Inner Exception</a></li>

</ul>
<div id="my-tab-content" class="tab-content">
<div class="tab-pane active" id="red">
    <h2>Message</h2>
 <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>

</div>
<div class="tab-pane " id="orange">
<h2>Source</h2>
<asp:Label ID="lblSource" runat="server" Text=""></asp:Label>
</div>
<div class="tab-pane" id="yellow">
<h2>Stack Trace</h2>
 <asp:Label ID="lblStackTrace" runat="server" Text=""></asp:Label>
</div>
<div class="tab-pane" id="green">
<h2>Inner Exception</h2>
     <asp:Label ID="lblInnerException" runat="server" Text=""></asp:Label>
</div>

</div>
</div> 

    


 <asp:HiddenField ID="hidLastTab" Value="0" runat="server" />
</asp:Content>

