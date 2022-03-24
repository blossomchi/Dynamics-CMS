<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Mainboard.aspx.vb" Inherits="Mainboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link href="css/style.css" rel="stylesheet" />
       <link href="css/style2.css" rel="stylesheet" />
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
       <div style="float:right">
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
           </div>
        <div class="clear-fix">
                    <br />
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
        <div class="linknav">  
             <a href="Mainboard.aspx" target="blank">Home</a>
             <a  href="Login.aspx">LogOut</a>
        </div>
    </div>

    <div class="main">
        <h2>DashBoard</h2>
        <div class="mainbox">
            <div class="mainframe">
                <asp:ImageButton ID="ImageButton1"  CssClass="BoardImg" runat="server" ImageUrl="~/image/Membership.jpg" />
                <h2>Membership</h2>
            </div>
              <div class="mainframe">
                  <asp:ImageButton ID="ImageButton3" CssClass="BoardImg" runat="server" ImageUrl="~/image/th.jpg" />
                  <h2>Visitor</h2>
            </div>
            <div class="mainframe">
                  <asp:ImageButton ID="ImageButton4" CssClass="BoardImg" runat="server" ImageUrl="~/image/pastor.png" />
                  <h2>Ministers</h2>
            </div>
            <div class="mainframe">
                  <asp:ImageButton ID="ImageButton8" CssClass="BoardImg" runat="server" ImageUrl="~/image/images (1).jpg" />
                  <h2>Groups</h2>
            </div>
             <div class="mainframe">
                  <asp:ImageButton ID="ImageButton5" CssClass="BoardImg" runat="server" ImageUrl="~/image/jbrregistration.jpg" />
                  <h2>Registers</h2>
            </div>
             <div class="mainframe">
                  <asp:ImageButton ID="ImageButton6" CssClass="BoardImg" runat="server" ImageUrl="~/image/schedule.jpg" />
                  <h2>Schedule</h2>
            </div>
             <div class="mainframe">
                  <asp:ImageButton ID="ImageButton7" CssClass="BoardImg" runat="server" ImageUrl="~/image/jof-sermon-series-facebook-icon.jpg" />
                  <h2>Sermon</h2>
            </div>
                <div class="mainframe">
                  <asp:ImageButton ID="ImageButton9" CssClass="BoardImg" Height="100px" Width="130px" runat="server" ImageUrl="~/image/TithesOffering.jpg" />
                     <div>&nbsp;</div>
                   <h2>Giving</h2>
            </div>
            <div class="mainframe">
                  <asp:ImageButton ID="ImageButton10" CssClass="BoardImg" runat="server" ImageUrl="~/image/child1.jpg" />
                  <h2>Children</h2>
            </div>
             <div class="mainframe">
                  <asp:ImageButton ID="ImageButton13" CssClass="BoardImg" runat="server" ImageUrl="~/image/unnamed.png" />
                  <h2>Account</h2>
            </div>
              <div class="mainframe">
                  <asp:ImageButton ID="ImageButton2" CssClass="BoardImg" runat="server" ImageUrl="~/image/images.jpg" />           
                   <h2>Church Locations</h2>
            </div>
             <div class="mainframe">
                  <asp:ImageButton ID="ImageButton12" CssClass="BoardImg" runat="server" ImageUrl="~/image/images (2).jpg" />
                  <h2>User Define</h2>
            </div>
             
          <div class="mainframe">
                  <asp:ImageButton ID="ImageButton11" CssClass="BoardImg" runat="server" ImageUrl="~/image/other-services.png" />
                  <h2>Other Services</h2>
            </div>

           
        </div>

        <div class="Main-right">

            <div>
               &nbsp; 
            </div>
             <div>
               &nbsp; 
            </div>
             <div>
               &nbsp; 
            </div>
              <p>
         <asp:Label ID="Label13" runat="server" Text="Total Number of Members :" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>    <asp:Label ID="Label14" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>
        </p>
             <div>
               &nbsp; 
            </div>
            <p>
         <asp:Label ID="Label2" runat="server" Text="Total Number of Adult :" Font-Bold="True" Font-Size="Medium"></asp:Label>    <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </p>
              <p>
         <asp:Label ID="Label5" runat="server" Text="Male :" Font-Bold="True" Font-Size="Medium"></asp:Label>    <asp:Label ID="Label6" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </p>
                   <p>
         <asp:Label ID="Label7" runat="server" Text="Female :" Font-Bold="True" Font-Size="Medium"></asp:Label>    <asp:Label ID="Label8" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </p>
             <div>
               &nbsp; 
            </div>
            <p>
         <asp:Label ID="Label3" runat="server" Text="Total Number of Children :" Font-Bold="True" Font-Size="Medium"></asp:Label>    <asp:Label ID="Label4" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </p>
                <p>
         <asp:Label ID="Label9" runat="server" Text="Male:" Font-Bold="True" Font-Size="Medium"></asp:Label>    <asp:Label ID="Label10" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </p>
                <p>
         <asp:Label ID="Label11" runat="server" Text="Female :" Font-Bold="True" Font-Size="Medium"></asp:Label>    <asp:Label ID="Label12" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </p>
    </div> 
        <div class="clear-fix"></div> 



    <div class="footer">
       <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p>
    </div>
</div>
        </div>
    </form>
</body>
</html>
