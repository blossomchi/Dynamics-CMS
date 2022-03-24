<%@ Page Language="VB" AutoEventWireup="false" CodeFile="GivingBoard.aspx.vb" Inherits="GivingBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Giving Board</title>
    <link href="css/style.css" rel="stylesheet" />
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
          <p class="church-watch">RolofDynamic Church Watch</p>
            <p class="church-mgt">Church Management Software</p>
        </div>
       
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
        <div class="clear-fix">
                    <br />
              &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblname0" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px">LOG IN AS :</asp:Label>
                   <asp:Label ID="AdminLabel" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname1" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbChurchName" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="Label1" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbLocation" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lbLocation0" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbState" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblFamid" runat="server" CssClass="label"></asp:Label>
                    <asp:Label ID="lblname" runat="server" CssClass="label"></asp:Label>
                    </div>
        <div class="linknav">  
             <a href="../../Mainboard.aspx">Home</a>
             <a  href="../../Login.aspx">LogOut</a>
        </div>
    </div>

    <div class="main">
        <h2>Giving</h2>
        <div class="mainbox">
             <div class="mainframe">
                <asp:ImageButton ID="ImageButton1"  CssClass="BoardImg" runat="server" ImageUrl="~/image/retrometricoffering.jpg" Height="130px" />
                <h2>Offering</h2>
            </div>
            <div class="mainframe">
                  <asp:ImageButton ID="ImageButton4" CssClass="BoardImg" runat="server" ImageUrl="~/image/tithing-giving-offerings.jpg" Height="130px" />
                  <h2>Members Tithe</h2>
            </div>
            <div class="mainframe">
                  <asp:ImageButton ID="ImageButton5" CssClass="BoardImg" runat="server" ImageUrl="~/image/tithing-giving-offerings.jpg" Height="130px" />
                  <h2>Pastor&#39;s Tithe</h2>
            </div>
            <div class="mainframe">
                  <asp:ImageButton ID="ImageButton6" CssClass="BoardImg" runat="server" ImageUrl="~/image/tithing-giving-offerings.jpg" Height="130px" />
                  <h2>Heirarchy Tithe</h2>
            </div>
             <div class="mainframe">
                  <asp:ImageButton ID="ImageButton7" CssClass="BoardImg" runat="server" ImageUrl="~/Giving/Images/icon=130x.png" Height="130px" />
                  <h2>Above Only</h2>
            </div>
             
              <div class="mainframe">
                  <asp:ImageButton ID="ImageButton2" CssClass="BoardImg" runat="server" ImageUrl="~/image/Pledge.png" Height="130px" Width="128px" />
                   <h2>Pledge</h2>
                 
            </div>       
             <div class="mainframe">
                  <asp:ImageButton ID="ImageButton3" CssClass="BoardImg" runat="server" ImageUrl="~/image/Welfare.png" Height="130px" Width="128px" />
                   <h2>Welfare</h2>
                 
            </div>       
        </div>

        <div class="clear-fix"></div> 
    </div> 




    <div class="footer">
          <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p>
    </div>
</div>
    </form>
</body>
</html>
