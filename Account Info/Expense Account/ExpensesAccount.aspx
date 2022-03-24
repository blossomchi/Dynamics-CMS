<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ExpensesAccount.aspx.vb" Inherits="CashBookView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Expense Account</title>
     <link href="css/style2.css" rel="stylesheet" />
       <link href="css/style.css" rel="stylesheet" />
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
        <asp:Button ID="Button3" runat="server" Text="Recieve Cash " class="a_demo_one"  Width="120px" Height="40px" Visible="False" />  &nbsp; &nbsp; &nbsp; &nbsp;<asp:Button ID="Button1" runat="server" Text="Disburse Cash" class="a_demo_one"  Width="120px" Height="40px" Visible="False" />
        <div>
                <br />
         </div>
        <div>
            <asp:GridView ID="GVAllMinister" runat="server" Width="1150px" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="15" ShowFooter="True" style="font-size: small; font-weight: 700;" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="TranscationDate" HeaderText="Trans_Date" SortExpression="TranscationDate" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="ExpensesName" HeaderText="Expenses" SortExpression="ExpensesName" />
                    <asp:BoundField DataField="AccountName" HeaderText="Account" SortExpression="AccountName" />
                    <asp:BoundField DataField="Accountdetails" HeaderText="Details" SortExpression="Accountdetails" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    <asp:BoundField DataField="Transcationtype" HeaderText="Transcation_Type" SortExpression="Transcationtype" />
                    <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" />
                    <asp:BoundField DataField="Enterby" HeaderText="Enter By" SortExpression="Enterby" ReadOnly="True" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ExpensesAccountTable.TranscationDate, ExpensesHeadTable.Name, ExpensesAccountTable.ExpensesName, ExpensesAccountTable.AccountName, ExpensesAccountTable.Accountdetails, ExpensesAccountTable.Amount, ExpensesAccountTable.Transcationtype, ExpensesAccountTable.Remark, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS Enterby, ExpensesAccountTable.Datecreated FROM ExpensesHeadTable INNER JOIN ExpensesAccountTable ON ExpensesHeadTable.Expensesid = ExpensesAccountTable.ExpensesHeadid INNER JOIN MembershipTable ON ExpensesAccountTable.createdby = MembershipTable.Memberid WHERE (MembershipTable.ChurchDetailID = @chu) ORDER BY ExpensesAccountTable.TranscationDate DESC">
                <SelectParameters>
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
                     <asp:TextBox ID="txtStaffID" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>
            <br />
        </div>


    </div>

           <div class="footer">
                <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p>  </div>
        </div>
    </form>
</body>
</html>
