<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Opening.aspx.cs" Inherits="Opening" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
   <title></title>
     
      
    <script type="text/javascript">
        function count() {
            $('#temp').hide();
            $('.ss').hide();
            $('.par').text('LAUNCHING...');
            var url = "Dashboard.aspx";
            $('#counter_2').countdown({
                startTime: '20',
                format: 'hh:mm:ss',
                digitImages: 6,
                digitWidth: 53,
                digitHeight: 77,
                timerEnd: function () { $(location).attr('href', url); },
                image: 'tempJs/digits.png'
            });

        }
    </script>
    <style type="text/css">
      br { clear: both; }
        body, html 
        {
            min-height:100%;
        }
        body 
        {
             background:-webkit-linear-gradient(top,#3b5999 25%,white 35% );
             background:-moz-linear-gradient(top,#3b5999 25%,white 35% );  
               background:-ms-linear-gradient(top,#3b5999 25%,white 35% );
                background:-o-linear-gradient(top,#3b5999 25%,white 35% );           
        }
        .cntSeparator {
            font-size: 54px;
            margin: 10px 7px;
            color: #000;
        }
      .desc { margin: 7px 3px; }
      .desc div {
        float: left;
        font-family: Arial;
        width: 70px;
        margin-right: 65px;
        font-size: 13px;
        font-weight: bold;
        color: #000;
      }
        h2 {
            font-size:25px;
            font-family:'Times New Roman';
            text-align:center;
            text-shadow:5px 5px 10px black;
            color:#efe2e2;
        }
        span {
            font-size:45px;
        }
        .op {
            font-size:45px;
        }
        .box {
            background:white;
            width:600px;
            height:100px;
            text-align:center;
            border-radius:100px;
            line-height:200px;
            margin:0 auto;
          
        }
        #counter_2{
            margin-left:500px;
        }
        #temp {
            margin-left:500px;
        }
        
       
    </style>
  </head>
<body>
    <form id="Form1" runat="server">         
            <div style=" width:80%; margin:0 auto;">
                <table width="100%">
                    <tr>
                        <td style="width:31%;">
                            <img src="tempImages/fist.jpg" width="140" height="80" /></td><td style="width:31%;">
                                <h2><span>e</span>-Farmer Contribution Management Information System <br /><span class=".op">Opening</span></h2>
                                                                               </td><td style="width:31%;">
                                <img src="tempImages/Moe.png"  width="80" height="80" style="float:right;" /></td>
                    </tr>
                </table>
            </div>      
            <div style="width:80%; margin: 0 auto;height:400px;">            
             <div class="box"> </div><br /><br />
                <table width="100%">
                    <tr><td >
                                 <div id="temp">
                                    <img src="tempImages/second.png" />
                                 </div>
                        </td></tr>
                    <tr><td >
                        <div id="counter_2" ></div>
                        </td></tr>
                </table>
               
               
              <br />
              <br />
                    <div style=" margin-left:450px; height:200px;"><br /><br /><br /><br />
                        <asp:Button ID="Button2" class="ss" runat="server" SkinID="none"  Width="220px" Height="50px" BackColor="#3b5999"  Font-Size="14px" Font-Bold="true" ForeColor="White" Text="LAUNCH" OnClientClick="javascript:count(); return false;"  />
                        <p class="par" style="margin-left:50px; font-size:21px;"></p>

                    </div>
            </div>            
        </form>
    <script src="tempJs/jquery-1.9.1.js" type="text/javascript"></script>
      <script src="tempJs/jquery.countdown.js" type="text/javascript"></script>
</body>
</html>
