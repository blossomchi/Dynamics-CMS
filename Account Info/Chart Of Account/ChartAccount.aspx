<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ChartAccount.aspx.vb" Inherits="ChartAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Chart of Account</title>
      <link href="css/Style.css" rel="stylesheet" />
    <link href="css/style2.css" rel="stylesheet" />
     <script src="jquery/chosen.jquery.js"></script>
    <link href="jquery/chosen.css" rel="stylesheet" />
    <script src="jquery/Jquery/jquery-1.7.1.min.js"></script>
    <script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>
    <script src="jquery/chosen.jquery.min.js"></script>
    <script src="jquery/chosen.proto.min.js"></script>
    <script src="jquery/chosen.proto.js"></script>
      <link href="../css/menu.css" rel="stylesheet" />
       <link href="css/style.css" rel="stylesheet" />
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
            <p class="church-watch">Church Watch</p>
            <p class="church-mgt">Church Management Software</p>
        </div>
       
        <asp:Image ID="Image1" runat="server" Height="118px" Width="198px" class="headerImg" ImageUrl="~/image/New.PNG" />
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
                    <asp:Label ID="lblserviceid" runat="server" CssClass="label"></asp:Label>
                    </div>
        <br />
    </div>

    <div class="main">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button3" runat="server" Text="View Chart of Account " class="a_demo_one"  Width="180px" Height="40px" />
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
           <div class="formbox center">
          <div class="NewFrame">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Account Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtaccount" CssClass="input" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Assets/Liability" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpAssets" runat="server" CssClass="drop-down" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Name], [id] FROM [Asset_liabilityTable]"></asp:SqlDataSource>
                </div>
                  <div class="form-group">
                      <asp:Label ID="Label3" runat="server" Text="Current/Non Current" CssClass="label" ></asp:Label>
                      <asp:DropDownList ID="drpCurrent" runat="server" CssClass="drop-down" DataSourceID="SqlDataSource2" DataTextField="Current_nonCurrent" DataValueField="Id">
                    </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Id], [Current_nonCurrent] FROM [Current_nonCurrentTable]"></asp:SqlDataSource>
                </div>
                <div>  &nbsp;</div>
                  <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Income/Expeenditure" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpExpenses" runat="server" CssClass="drop-down" DataSourceID="SqlDataSource3" DataTextField="Income_Expenditure" DataValueField="id">
                    </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [id], [Income_Expenditure] FROM [Income_ExpenditureTable]"></asp:SqlDataSource>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Cash/Bank" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpCash" runat="server" CssClass="drop-down" DataSourceID="SqlDataSource4" DataTextField="Cash_bankrelationship" DataValueField="Id">
                    </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Id], [Cash_bankrelationship] FROM [Cash_bankrelationshipTable]"></asp:SqlDataSource>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Report Type" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpReport" runat="server" CssClass="drop-down" DataSourceID="SqlDataSource5" DataTextField="Report_type" DataValueField="Id">
                    </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Id], [Report_type] FROM [Report_typeTable]"></asp:SqlDataSource>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Description" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtDesp" runat="server" CssClass="input" placeholder="Little Description" TextMode="MultiLine" ></asp:TextBox>
                </div>
                   <div class="form-group">

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Save" class="a_demo_one"  Width="100px" Height="40px"/>
                <asp:Button ID="btnCancel" runat="server" class="a_demo_one"  Text="Cancel" Width="100px" style="height: 40px" Height="60px" />

            </div>
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
