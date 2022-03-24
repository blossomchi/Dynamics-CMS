<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Authetication</title>
    <link href="css/Style.css" rel="stylesheet" />
    <link href="css/style2.css" rel="stylesheet" />
      <link href="../css/menu.css" rel="stylesheet" />
    <script src="jquery/chosen.jquery.min.js"></script>
    <script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>


   <%-- <script src="jquery/chosen.jquery.js"></script>
    <link href="jquery/chosen.css" rel="stylesheet" />
    <script src="jquery/Jquery/jquery-1.7.1.min.js"></script>
    <script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>
    <script src="jquery/chosen.jquery.min.js"></script><script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>
    <script src="jquery/chosen.proto.min.js"></script><script src="jquery/chosen.jquery.min.js"></script>
    <script src="jquery/chosen.proto.js"></script>--%>
    <style type="text/css">
        #form1 {
            height: 667px;
        }
        .auto-style1 {
            width: 260px;
        }
        .auto-style2 {
            width: 189px;
        }
        .auto-style3 {
            height: 33px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper">
    <div class="header">
        <div class="bg-header"></div>
        <div class="header-text">
           <p class="church-watch">RolofDynamics Church Watch</p>
            <p class="church-mgt">Church Management Software</p>
        </div>
       <div style="float:right">
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
           </div>
        
        <div class="clear-fix">
                    <asp:Label ID="lblserviceid" runat="server" CssClass="label"></asp:Label>
                    </div>
        <div class="linknav">  
             <a href="#" target="blank">Home</a>
             <a  href="#">Exit</a>
        </div>
    </div>

    <div class="main">
         <h2>Login</h2>
        <div>
        <div class="loginform">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/image/main_img4.png" />
        </div>

             <div class="loginpage">
            <div class="loginpage1">
                    <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Reminder.aspx" MembershipProvider="AspNetSqlMembershipProvider" Width="383px" Height="140px">
                        <LayoutTemplate>
                            <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                                <tr>
                                    <td>
                                        <table cellpadding="0">
                                            <tr>
                                                <td align="center" colspan="2">Log In</td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="auto-style2">
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                                </td>
                                                <td class="auto-style1">
                                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" class="auto-style2">
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                </td>
                                                <td class="auto-style1">
                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." Visible="False" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color: Red;">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2" class="auto-style3">
                                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="button" Text="Log In" ValidationGroup="Login1" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:Login>
                                                    <asp:Button ID="btnreset" runat="server" CssClass="button"  Text="Forget Password" Width="123px" />
                                                    <asp:Button ID="btnExit" runat="server" CssClass="button" Text="Exit" Visible="False" />
       
                <div class="clear-fix">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="textbox" Visible="False"></asp:TextBox>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="textbox" TextMode="Password" Visible="False"></asp:TextBox>
       
                    <asp:TextBox ID="lblid" runat="server" CssClass="textbox" TextMode="Password" Visible="False"></asp:TextBox>
       
                </div>
                    <div>
                        
                    </div>
             </div>
             </div>
        




      <div class="clear-fix"></div>
            </div> 
        <div>
            <br>
        </div>
        <div></div>
        <div></div>
    <div class="footer">
        <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p>
    </div>
    </div>
 </div>
    </form>
</body>
</html>
