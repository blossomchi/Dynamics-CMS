<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewAccountchart.aspx.vb" Inherits="ViewAccountchart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Chart Of Account</title>
         <link href="css/Style.css" rel="stylesheet" />
    <link href="css/style2.css" rel="stylesheet" />
         <script src="jquery/chosen.jquery.js"></script>
    <link href="jquery/chosen.css" rel="stylesheet" />
    <script src="jquery/Jquery/jquery-1.7.1.min.js"></script>
    <script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>
    <script src="jquery/chosen.jquery.min.js"></script>
    <script src="jquery/chosen.proto.min.js"></script>
    <script src="jquery/chosen.proto.js"></script>
         <link href="../../css/menu.css" rel="stylesheet" />
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
        <div class="bg-header">
        </div>
        <div class="header-text">
              <p class="church-watch">RolofDynamic Church Watch</p>
            <p class="church-mgt">Church Management Software</p>
        </div>
       <div style="float:right">
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
        </div>
        <div class="clear-fix"> 

              &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblname0" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px">LOG IN AS :</asp:Label>
                   <asp:Label ID="AdminLabel" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname1" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbChurchName" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbLocation" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lbLocation0" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbState" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
        </div><br />
         <div>
<asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="false" />
<asp:Menu ID="Menu" runat="server" DataSourceID="SiteMapDataSource1" Orientation="Horizontal"
    OnMenuItemDataBound="OnMenuItemDataBound">
    <LevelMenuItemStyles>
        <asp:MenuItemStyle CssClass="main_menu" />
        <asp:MenuItemStyle CssClass="level_menu" />
    </LevelMenuItemStyles>
</asp:Menu>
    </div>
    </div>
       
    <div class="main">

        <div>
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Chart of Account" class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="40px" Width="180px" />
            <br />
            <br />
&nbsp;<asp:DropDownList ID="DrpCriteria" runat="server" Height="22px" Width="200px" AutoPostBack="True" Visible="False">
                <asp:ListItem>Ascending</asp:ListItem>
                <asp:ListItem>Family Name</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<asp:DropDownList  class="chosen-select" ID="DrpCriteria2" runat="server"  Height="15px" Width="200px" Visible="False" AutoPostBack="True">
            </asp:DropDownList>
            <br />
            <br />
            </div>
        <div>
            <asp:GridView ID="GVAllMinister" runat="server" Width="1150px" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid" DataKeyNames="Accountid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Accountid" HeaderText="Accountid" SortExpression="Accountid" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Accountname" HeaderText="Accountname" SortExpression="Accountname" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Current_nonCurrent" HeaderText="Current_nonCurrent" SortExpression="Current_nonCurrent" />
                    <asp:BoundField DataField="Income_Expenditure" HeaderText="Income_Expenditure" SortExpression="Income_Expenditure" />
                    <asp:BoundField DataField="Cash_bankrelationship" HeaderText="Cash_bankrelationship" SortExpression="Cash_bankrelationship" />
                    <asp:BoundField DataField="Report_type" HeaderText="Report_type" SortExpression="Report_type" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="CreateDate" HeaderText="CreateDate" SortExpression="CreateDate" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChartAccountTable.Createdby, ChartAccountTable.Accountid, ChartAccountTable.Accountname, Asset_liabilityTable.Name, Current_nonCurrentTable.Current_nonCurrent, Income_ExpenditureTable.Income_Expenditure, Cash_bankrelationshipTable.Cash_bankrelationship, Report_typeTable.Report_type, ChartAccountTable.Description, ChartAccountTable.CreateDate FROM ChartAccountTable INNER JOIN Asset_liabilityTable ON ChartAccountTable.Asset_Liabilityid = Asset_liabilityTable.id INNER JOIN Cash_bankrelationshipTable ON ChartAccountTable.cash_bank_relationshipid = Cash_bankrelationshipTable.Id INNER JOIN Current_nonCurrentTable ON ChartAccountTable.Current_noncurrentid = Current_nonCurrentTable.Id INNER JOIN Income_ExpenditureTable ON ChartAccountTable.Income_expenditureid = Income_ExpenditureTable.id INNER JOIN Report_typeTable ON ChartAccountTable.Reportid = Report_typeTable.Id CROSS JOIN ChurchDetailTable WHERE (ChurchDetailTable.ChurchDetailID = @chu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GVTitle" runat="server" Width="1150px" DataSourceID="SqlTitle" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="15" ShowFooter="True" style="font-size: medium" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Post" HeaderText="Post" SortExpression="Post" />
                    <asp:BoundField DataField="ChurchName" HeaderText="ChurchName" SortExpression="ChurchName" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlTitle" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MinisterTable.SN, MinisterTable.Title, MinisterTable.Name, MinisterTable.Post, ChurchDetailTable.ChurchName FROM MinisterTable INNER JOIN ChurchDetailTable ON MinisterTable.ChurchName = ChurchDetailTable.ChurchDetailID WHERE (MinisterTable.Title = @title)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DrpCriteria2" Name="title" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:TextBox ID="txtAssigned" runat="server" Visible="False" Width="16px"></asp:TextBox>
            <asp:TextBox ID="txtAssignedID" runat="server" Visible="False" Width="10px"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtCriteria2" runat="server" Visible="False" Width="18px"></asp:TextBox>
            <asp:TextBox ID="txtCriteria3" runat="server" Visible="False" Width="18px"></asp:TextBox>
                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
            <br />
        </div>


    </div>

           <div class="footer">
               
        <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p> </div>
        </div>
    </form>
</body>
</html>
