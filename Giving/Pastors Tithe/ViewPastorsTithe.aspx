﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewPastorsTithe.aspx.vb" Inherits="ViewTithe" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pastors Tithe View</title>
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
            &nbsp;<asp:Button ID="Button2" runat="server" Text="Enter Pastors Tithe"  class="a_demo_one" style="font-style: italic; font-weight: 700; width: 217px;" Height="40px" />
            &nbsp;&nbsp;<br />
            <br />
            </div>

    <div>
                      &nbsp;<asp:DropDownList ID="DrpSorted" class="chosen-select" runat="server" Height="22px" Width="180px" AutoPostBack="True">
                <asp:ListItem>Ascending</asp:ListItem>
                <asp:ListItem>Date Created</asp:ListItem>
                <asp:ListItem>Month</asp:ListItem>
                <asp:ListItem>Week</asp:ListItem>
                <asp:ListItem>Pastors Name</asp:ListItem>
                <asp:ListItem>Phone Number</asp:ListItem>
                <asp:ListItem Value=" Tithe No">Tithe No</asp:ListItem>
            </asp:DropDownList>
                             <asp:DropDownList ID="DrpDate" class="chosen-select" runat="server" Height="22px" Width="180px" AutoPostBack="True" Visible="False">
            </asp:DropDownList>
                      <asp:TextBox ID="txtcriteria" runat="server" Visible="False"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Search" class="a_demo_one" Width="63px" Height="33px" Font-Size="12px" Visible="False" />
                <asp:TextBox ID="stateID" runat="server" Visible="False" Width="5px"></asp:TextBox>
                &nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                    &nbsp;&nbsp;<asp:TextBox ID="txtSelectedDate" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                      &nbsp;&nbsp; &nbsp;
                      <br />
        <div>
             &nbsp;
        </div>
        </div>  
        <div>
            <asp:GridView ID="gridAscending" runat="server" Width="1150px" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Pastorsname" HeaderText="Pastor's Name" SortExpression="Pastorsname" />
                    <asp:BoundField DataField="Income" HeaderText="Income" SortExpression="Income" />
                    <asp:BoundField DataField="TitheNo" HeaderText="Tithe No" SortExpression="TitheNo" />
                    <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                    <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
                    <asp:BoundField DataField="Amountword" HeaderText="Amount In words" SortExpression="Amountword" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" />
                    <asp:BoundField DataField="Enter by" HeaderText="Enter by" ReadOnly="True" SortExpression="Enter by" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT PastorsTitheTable.SN, PastorsTitheTable.Pastorsname, IncomeTable.Income, PastorsTitheTable.TitheNo, PastorsTitheTable.Month, PastorsTitheTable.Week, PastorsTitheTable.Amountword, PastorsTitheTable.Datecreated, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS [Enter by] FROM IncomeTable INNER JOIN PastorsTitheTable ON IncomeTable.ID = PastorsTitheTable.Incomeid INNER JOIN MembershipTable ON PastorsTitheTable.Staffid = MembershipTable.Memberid ORDER BY PastorsTitheTable.SN">
            </asp:SqlDataSource>
           
            <asp:GridView ID="gridDate" runat="server" Width="1150px" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Pastorsname" HeaderText="Pastor's Name" SortExpression="Pastorsname" />
                    <asp:BoundField DataField="Income" HeaderText="Income" SortExpression="Income" />
                    <asp:BoundField DataField="TitheNo" HeaderText="Tithe No" SortExpression="TitheNo" />
                    <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                    <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
                    <asp:BoundField DataField="Amountword" HeaderText="Amount In Words" SortExpression="Amountword" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" />
                    <asp:BoundField DataField="Enter by" HeaderText="Enter by" ReadOnly="True" SortExpression="Enter by" />
                    <asp:BoundField DataField="Churchid" HeaderText="Churchid" SortExpression="Churchid" Visible="False" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT PastorsTitheTable.SN, PastorsTitheTable.Pastorsname, IncomeTable.Income, PastorsTitheTable.TitheNo, PastorsTitheTable.Month, PastorsTitheTable.Week, PastorsTitheTable.Amountword, PastorsTitheTable.Datecreated, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS [Enter by], PastorsTitheTable.Churchid FROM IncomeTable INNER JOIN PastorsTitheTable ON IncomeTable.ID = PastorsTitheTable.Incomeid INNER JOIN MembershipTable ON PastorsTitheTable.Staffid = MembershipTable.Memberid WHERE (PastorsTitheTable.Datecreated = @date) AND (PastorsTitheTable.Churchid = @chu) ORDER BY PastorsTitheTable.SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSelectedDate" Name="date" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridMonth" runat="server" Width="1150px" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Pastorsname" HeaderText="Pastor's Name" SortExpression="Pastorsname" />
                    <asp:BoundField DataField="Income" HeaderText="Income" SortExpression="Income" />
                    <asp:BoundField DataField="TitheNo" HeaderText="Tithe No" SortExpression="TitheNo" />
                    <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                    <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
                    <asp:BoundField DataField="Amountword" HeaderText="Amount In Words" SortExpression="Amountword" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" />
                    <asp:BoundField DataField="Enter by" HeaderText="Enter by" ReadOnly="True" SortExpression="Enter by" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT PastorsTitheTable.SN, PastorsTitheTable.Pastorsname, IncomeTable.Income, PastorsTitheTable.TitheNo, PastorsTitheTable.Month, PastorsTitheTable.Week, PastorsTitheTable.Amountword, PastorsTitheTable.Datecreated, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS [Enter by] FROM IncomeTable INNER JOIN PastorsTitheTable ON IncomeTable.ID = PastorsTitheTable.Incomeid INNER JOIN MembershipTable ON PastorsTitheTable.Staffid = MembershipTable.Memberid WHERE (PastorsTitheTable.Month = @Month) AND (PastorsTitheTable.Churchid = @chu) ORDER BY PastorsTitheTable.SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DrpDate" Name="Month" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridWeek" runat="server" Width="1150px" DataSourceID="SqlDataSource4" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Pastorsname" HeaderText="Pastor's Name" SortExpression="Pastorsname" />
                    <asp:BoundField DataField="Income" HeaderText="Income" SortExpression="Income" />
                    <asp:BoundField DataField="TitheNo" HeaderText="Tithe No" SortExpression="TitheNo" />
                    <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                    <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
                    <asp:BoundField DataField="Amountword" HeaderText="Amount In Word" SortExpression="Amountword" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" />
                    <asp:BoundField DataField="Enter by" HeaderText="Enter by" ReadOnly="True" SortExpression="Enter by" />
                    <asp:BoundField DataField="Churchid" HeaderText="Churchid" SortExpression="Churchid" Visible="False" />
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
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT PastorsTitheTable.SN, PastorsTitheTable.Pastorsname, IncomeTable.Income, PastorsTitheTable.TitheNo, PastorsTitheTable.Month, PastorsTitheTable.Week, PastorsTitheTable.Amountword, PastorsTitheTable.Datecreated, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS [Enter by], PastorsTitheTable.Churchid FROM IncomeTable INNER JOIN PastorsTitheTable ON IncomeTable.ID = PastorsTitheTable.Incomeid INNER JOIN MembershipTable ON PastorsTitheTable.Staffid = MembershipTable.Memberid WHERE (PastorsTitheTable.Week = @week) AND (PastorsTitheTable.Churchid = @chu) ORDER BY PastorsTitheTable.SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DrpDate" Name="week" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridMember" runat="server" Width="1150px" DataSourceID="SqlDataSource5" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Pastorsname" HeaderText="Pastor's Name" SortExpression="Pastorsname" />
                    <asp:BoundField DataField="Income" HeaderText="Income" SortExpression="Income" />
                    <asp:BoundField DataField="TitheNo" HeaderText="Tithe No" SortExpression="TitheNo" />
                    <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                    <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
                    <asp:BoundField DataField="Amountword" HeaderText="Amount In Words" SortExpression="Amountword" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" />
                    <asp:BoundField DataField="Enter by" HeaderText="Enter by" ReadOnly="True" SortExpression="Enter by" />
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
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT PastorsTitheTable.SN, PastorsTitheTable.Pastorsname, IncomeTable.Income, PastorsTitheTable.TitheNo, PastorsTitheTable.Month, PastorsTitheTable.Week, PastorsTitheTable.Amountword, PastorsTitheTable.Datecreated, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS [Enter by] FROM IncomeTable INNER JOIN PastorsTitheTable ON IncomeTable.ID = PastorsTitheTable.Incomeid INNER JOIN MembershipTable ON PastorsTitheTable.Staffid = MembershipTable.Memberid WHERE (PastorsTitheTable.Pastorsname = @member) AND (PastorsTitheTable.Churchid = @chu) ORDER BY PastorsTitheTable.SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtcriteria" Name="member" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridPhone" runat="server" Width="1150px" DataSourceID="SqlDataSource7" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Pastorsname" HeaderText="Pastor's Name" SortExpression="Pastorsname" />
                    <asp:BoundField DataField="Income" HeaderText="Income" SortExpression="Income" />
                    <asp:BoundField DataField="TitheNo" HeaderText="Tithe No" SortExpression="TitheNo" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                    <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
                    <asp:BoundField DataField="Amountword" HeaderText="Amount In Word" SortExpression="Amountword" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" />
                    <asp:BoundField DataField="Enter by" HeaderText="Enter by" ReadOnly="True" SortExpression="Enter by" />
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
           
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT PastorsTitheTable.SN, PastorsTitheTable.Pastorsname, IncomeTable.Income, PastorsTitheTable.TitheNo, PastorsTitheTable.PhoneNumber, PastorsTitheTable.Month, PastorsTitheTable.Week, PastorsTitheTable.Amountword, PastorsTitheTable.Datecreated, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS [Enter by] FROM IncomeTable INNER JOIN PastorsTitheTable ON IncomeTable.ID = PastorsTitheTable.Incomeid INNER JOIN MembershipTable ON PastorsTitheTable.Staffid = MembershipTable.Memberid WHERE (PastorsTitheTable.PhoneNumber = @phone) AND (PastorsTitheTable.Churchid = @chu) ORDER BY PastorsTitheTable.SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtcriteria" Name="phone" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
           
            <asp:GridView ID="GridTitheNo" runat="server" Width="1150px" DataSourceID="SqlDataSource6" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Pastorsname" HeaderText="Pastor's Name" SortExpression="Pastorsname" />
                    <asp:BoundField DataField="Income" HeaderText="Income" SortExpression="Income" />
                    <asp:BoundField DataField="TitheNo" HeaderText="Tithe No" SortExpression="TitheNo" />
                    <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                    <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
                    <asp:BoundField DataField="Amountword" HeaderText="Amount In Words" SortExpression="Amountword" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" />
                    <asp:BoundField DataField="Enter by" HeaderText="Enter by" ReadOnly="True" SortExpression="Enter by" />
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
           
            
           
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT PastorsTitheTable.SN, PastorsTitheTable.Pastorsname, IncomeTable.Income, PastorsTitheTable.TitheNo, PastorsTitheTable.Month, PastorsTitheTable.Week, PastorsTitheTable.Amountword, PastorsTitheTable.Datecreated, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS [Enter by] FROM IncomeTable INNER JOIN PastorsTitheTable ON IncomeTable.ID = PastorsTitheTable.Incomeid INNER JOIN MembershipTable ON PastorsTitheTable.Staffid = MembershipTable.Memberid WHERE (PastorsTitheTable.TitheNo = @tithe) AND (PastorsTitheTable.Churchid = @chu) ORDER BY PastorsTitheTable.SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtcriteria" Name="tithe" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
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
         <script type="text/javascript">
              var config = {
                  '.chosen-select': {},
                  '.chosen-select-deselect': { allow_single_deselect: true },
                  '.chosen-select-no-single': { disable_search_threshold: 10 },
                  '.chosen-select-no-results': { no_results_text: 'Oops, nothing found!' },
                  '.chosen-select-width': { width: "95%" }
              }
              for (var selector in config) {
                  $(selector).chosen(config[selector]);
              }
        </script>
    </form>
</body>
</html>
