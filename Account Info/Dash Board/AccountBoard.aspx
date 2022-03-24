<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccountBoard.aspx.vb" Inherits="AccountBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Account Board</title>
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
       <div style="float:right">
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
           </div>
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
        <h2>Account</h2>
        <div class="mainbox">
            <div class="mainframe">
                <asp:ImageButton ID="ImageButton3"  CssClass="BoardImg" runat="server" ImageUrl="~/image/ChartofAccount.jpg" Height="130px" />
                <h2>Charts of Accounts</h2>
            </div>
            <div class="mainframe">
                <asp:ImageButton ID="ImageButton5"  CssClass="BoardImg" runat="server" ImageUrl="~/image/AccountRecievable.jpg" Height="130px" />
                <h2>Account Recievable</h2>
            </div>
             <div class="mainframe">
                <asp:ImageButton ID="ImageButton1"  CssClass="BoardImg" runat="server" ImageUrl="~/image/Cashbook.jpg" Height="130px" />
                <h2>Cash Book</h2>
            </div>
             <div class="mainframe">
                <asp:ImageButton ID="ImageButton7"  CssClass="BoardImg" runat="server" ImageUrl="~/image/Otherincome.jpg" Height="130px" />
                <h2>Other Income</h2>
            </div>
           
            <div class="mainframe">
                  <asp:ImageButton ID="ImageButton4" CssClass="BoardImg" runat="server" ImageUrl="~/image/tithing-giving-offerings.jpg" Height="130px" />
                  <h2>Members Tithe Accounts</h2>
            </div>
            <div class="mainframe">
                  <asp:ImageButton ID="ImageButton14" CssClass="BoardImg" runat="server" ImageUrl="~/image/tithing-giving-offerings.jpg" Height="130px" />
                  <h2>Pastors Tithe Accounts</h2>
            </div>
            <div class="mainframe">
                  <asp:ImageButton ID="ImageButton15" CssClass="BoardImg" runat="server" ImageUrl="~/image/tithing-giving-offerings.jpg" Height="130px" />
                  <h2>Church Tithe Accounts</h2>
            </div>
             <div class="mainframe">
                  <asp:ImageButton ID="ImageButton19" CssClass="BoardImg" runat="server" ImageUrl="~/Giving/Images/pension_pay_gap_2015-1.jpg" Height="130px" />
                  <h2>Pension</h2>
            </div>
             <div class="mainframe">
                  <asp:ImageButton ID="ImageButton16" CssClass="BoardImg" runat="server" ImageUrl="~/Giving/Images/pension-bill.gif" Height="130px" />
                  <h2>Pension Accounts</h2>
            </div>
             <div class="mainframe">
                  <asp:ImageButton ID="ImageButton17" CssClass="BoardImg" runat="server" ImageUrl="~/Giving/Images/icon=130x.png" Height="130px" />
                  <h2>Above Only Accounts</h2>
            </div>
              <div class="mainframe">
                  <asp:ImageButton ID="ImageButton2" CssClass="BoardImg" runat="server" ImageUrl="~/image/Pledge.png" Height="130px" Width="128px" />
                   <h2>Pledge Accounts</h2>
                 
            </div> 
             <div class="mainframe">
                <asp:ImageButton ID="ImageButton6"  CssClass="BoardImg" runat="server" ImageUrl="~/image/BasicIncome.jpg" Height="130px" />
                <h2>Income Accounts</h2>
            </div>
             <div class="mainframe">
                  <asp:ImageButton ID="ImageButton10" CssClass="BoardImg" runat="server" ImageUrl="~/image/Welfare.png" Height="130px" Width="128px" />
                   <h2>Welfare Accounts</h2>
                 
            </div>       
             <div class="mainframe">
                <asp:ImageButton ID="ImageButton8"  CssClass="BoardImg" runat="server" ImageUrl="~/image/Expenses-i.jpg" Height="130px" />
                <h2>Expenses</h2>
            </div>

            <div class="mainframe">
                <asp:ImageButton ID="ImageButton12"  CssClass="BoardImg" runat="server" ImageUrl="~/image/RaiseEx.jpg" Height="130px" />
                <h2>Raise Expenses</h2>
            </div>

            <div class="mainframe">
                <asp:ImageButton ID="ImageButton18"  CssClass="BoardImg" runat="server" ImageUrl="~/image/RaiseEx.jpg" Height="130px" />
                <h2>Expense Account</h2>
            </div>

             <div class="mainframe">
                <asp:ImageButton ID="ImageButton11"  CssClass="BoardImg" runat="server" ImageUrl="~/image/Loan.jpg" Height="130px" ToolTip="Loan" />
                <h2>Loan</h2>
            </div> 
            <div class="mainframe">
                <asp:ImageButton ID="ImageButton13"  CssClass="BoardImg" runat="server" ImageUrl="~/image/report.jpg" Height="130px" ToolTip="Loan" />
                <h2>Report</h2>
            </div> 
             <div class="mainframe">
                <asp:ImageButton ID="ImageButton9"  CssClass="BoardImg" runat="server" ImageUrl="~/image/other-services.png" Height="130px" />
                <h2>Other Settings</h2>
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
