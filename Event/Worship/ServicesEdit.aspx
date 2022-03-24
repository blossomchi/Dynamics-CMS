<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ServicesEdit.aspx.vb" Inherits="ServicesEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
          <title>Order of Services</title>
     <link href="css/Style.css" rel="stylesheet" />
    <link href="css/style2.css" rel="stylesheet" />
      <link href="../css/menu.css" rel="stylesheet" />
    <script src="jquery/chosen.jquery.js"></script>
    <link href="jquery/chosen.css" rel="stylesheet" />
    <script src="jquery/Jquery/jquery-1.7.1.min.js"></script>
    <script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>
    <script src="jquery/chosen.jquery.min.js"></script>
    <script src="jquery/chosen.proto.min.js"></script>
    <script src="jquery/chosen.proto.js"></script>


      <link href="../css/menu.css" rel="stylesheet" />
    <style type="text/css">
        #form1 {
            height: 667px;
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
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
        <div class="clear-fix">
                &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblname0" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px">LOG IN AS :</asp:Label>
                   <asp:Label ID="AdminLabel" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname1" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbChurchName" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbLocation" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lbLocation0" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbState" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
             </div>
        <br />
<asp:Label ID="lblserviceid" runat="server" CssClass="label"></asp:Label>
            
                    
                    </div>
    <div class="main">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button3" runat="server" Text="View Services " class="a_demo_one"  Width="160px" Height="40px" />
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
             <div class="formbox center">
           <div class="NewFrame">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Service Program" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Period" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpPeriod" CssClass="drop-down" runat="server" AutoPostBack="True">
                          <asp:ListItem>Mid Week Service</asp:ListItem>
                          <asp:ListItem>All Night</asp:ListItem>
                          <asp:ListItem>First Service</asp:ListItem>
                          <asp:ListItem>Second Service</asp:ListItem>
                          <asp:ListItem>Third Services</asp:ListItem>
                          <asp:ListItem>Fourth Services</asp:ListItem>
                      </asp:DropDownList>
                </div>
                <div class="form-group">
                    &nbsp;
                       </div>
                <div class="form-group" style="font-style: italic; font-weight: 600">
                   
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="Label8" runat="server" Text="Time of First Occurrence"></asp:Label>
                </div>
                <div class="form-group">
                    &nbsp;
                       </div>
                  <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="From" CssClass="label"></asp:Label>
                    <asp:TextBox runat="server" placeholder="hh:mm:AM/PM" CssClass="input" ID="txtfrom"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="To" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtTo" placeholder="hh:mm:AM/PM"  runat="server" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Program" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtprogram" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Moderator" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtModerator" runat="server" CssClass="input"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Date" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtDate" placeholder="DD/MM/YYYY" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                     &nbsp;
                       </div>
                   <div class="form-group">
                       <asp:TextBox ID="txtControl" runat="server" Visible="False" Width="18px"></asp:TextBox>
                       <asp:TextBox ID="txtst" runat="server" Visible="False" Width="18px"></asp:TextBox>

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                    <asp:TextBox ID="txtSelectedDate" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                     <asp:TextBox ID="txtStaffID" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtMemID" runat="server" Visible="False" Width="16px"></asp:TextBox>

                       </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

              <asp:Button ID="btnSave" runat="server"  Text="Edit"  class="a_demo_one"  Width="100px" Height="40px" />

            </div>
                </div>
            
                </div>
         <div class="clear-fix"></div> 

           </div>
        
        <div class="clear-fix"></div> 

    <div class="footer">
      <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p>
</div>
    </form>
</body>
</html>
