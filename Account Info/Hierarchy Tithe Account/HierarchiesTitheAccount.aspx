<%@ Page Language="VB" AutoEventWireup="false" CodeFile="HierarchiesTitheAccount.aspx.vb" Inherits="Tithe_Account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Hierarchies Tithe Account</title>
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
                      &nbsp;<asp:DropDownList ID="DrpSorted" class="chosen-select" runat="server" Height="22px" Width="180px" AutoPostBack="True">
                <asp:ListItem>Ascending</asp:ListItem>
                <asp:ListItem>Transcation Date</asp:ListItem>
                <asp:ListItem>Date Created</asp:ListItem>
            </asp:DropDownList>
                             <asp:DropDownList ID="DrpDate" class="chosen-select" runat="server" Height="22px" Width="180px" AutoPostBack="True" Visible="False">
            </asp:DropDownList>

                    <asp:TextBox ID="txtSelectedDate" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                      <br />

                      <br />

        </div>
        <div>
            <asp:GridView ID="GridTithe" runat="server" Width="1150px" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="TranscationDate" HeaderText="Transcation Date" SortExpression="TranscationDate" />
                    <asp:BoundField DataField="Branch" HeaderText="Hierarchy" SortExpression="Branch" />
                    <asp:BoundField DataField="ChurchName" HeaderText="Churches" SortExpression="ChurchName" />
                    <asp:BoundField DataField="Income" HeaderText="Income" SortExpression="Income" />
                    <asp:BoundField DataField="AccountName" HeaderText="Account" SortExpression="AccountName" />
                    <asp:BoundField DataField="Accountdetails" HeaderText="Details" SortExpression="Accountdetails" />
                    <asp:BoundField DataField="Transcationtype" HeaderText="Transcation Type" SortExpression="Transcationtype" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" />
                    <asp:BoundField DataField="Entered By" HeaderText="Entered By" ReadOnly="True" SortExpression="Entered By" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT HierarcyAccountTable.TranscationDate, ChurchDesignationTable.Branch, ChurchDetailTable.ChurchName, IncomeTable.Income, HierarcyAccountTable.AccountName, HierarcyAccountTable.Accountdetails, HierarcyAccountTable.Transcationtype, HierarcyAccountTable.Amount, HierarcyAccountTable.Remark, HierarcyAccountTable.Datecreated, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS [Entered By] FROM HierarcyAccountTable INNER JOIN ChurchDesignationTable ON HierarcyAccountTable.HirerchyID = ChurchDesignationTable.ChurchDesgID INNER JOIN ChurchDetailTable ON HierarcyAccountTable.ChurchDetailsID = ChurchDetailTable.ChurchDetailID INNER JOIN IncomeTable ON HierarcyAccountTable.incomeid = IncomeTable.ID INNER JOIN MembershipTable ON HierarcyAccountTable.StaffId = MembershipTable.Memberid ORDER BY HierarcyAccountTable.TranscationDate DESC">
            </asp:SqlDataSource>
            <asp:GridView ID="gridDate" runat="server" Width="1150px" DataSourceID="SqlTitle" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="15" ShowFooter="True" style="font-size: small; font-weight: 700;" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="TranscationDate" HeaderText="Transcation Date" SortExpression="TranscationDate" />
                    <asp:BoundField DataField="Branch" HeaderText="Hierarchy" SortExpression="Branch" />
                    <asp:BoundField DataField="ChurchName" HeaderText="Churches" SortExpression="ChurchName" />
                    <asp:BoundField DataField="Income" HeaderText="Income" SortExpression="Income" />
                    <asp:BoundField DataField="AccountName" HeaderText="Account" SortExpression="AccountName" />
                    <asp:BoundField DataField="Accountdetails" HeaderText="Details" SortExpression="Accountdetails" />
                    <asp:BoundField DataField="Transcationtype" HeaderText="Transcation Type" SortExpression="Transcationtype" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" />
                    <asp:BoundField DataField="Entered By" HeaderText="Entered By" ReadOnly="True" SortExpression="Entered By" />
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
            <asp:SqlDataSource ID="SqlTitle" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT HierarcyAccountTable.TranscationDate, ChurchDesignationTable.Branch, ChurchDetailTable.ChurchName, IncomeTable.Income, HierarcyAccountTable.AccountName, HierarcyAccountTable.Accountdetails, HierarcyAccountTable.Transcationtype, HierarcyAccountTable.Amount, HierarcyAccountTable.Remark, HierarcyAccountTable.Datecreated, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS [Entered By] FROM HierarcyAccountTable INNER JOIN ChurchDesignationTable ON HierarcyAccountTable.HirerchyID = ChurchDesignationTable.ChurchDesgID INNER JOIN ChurchDetailTable ON HierarcyAccountTable.ChurchDetailsID = ChurchDetailTable.ChurchDetailID INNER JOIN IncomeTable ON HierarcyAccountTable.incomeid = IncomeTable.ID INNER JOIN MembershipTable ON HierarcyAccountTable.StaffId = MembershipTable.Memberid WHERE (HierarcyAccountTable.TranscationDate = @transdate) ORDER BY HierarcyAccountTable.TranscationDate DESC">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSelectedDate" Name="transdate" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="gridDate1" runat="server" Width="1150px" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="15" ShowFooter="True" style="font-size: small; font-weight: 700;" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="TranscationDate" HeaderText="Transcation Date" SortExpression="TranscationDate" />
                    <asp:BoundField DataField="Branch" HeaderText="Hierarchy" SortExpression="Branch" />
                    <asp:BoundField DataField="ChurchName" HeaderText="Churches" SortExpression="ChurchName" />
                    <asp:BoundField DataField="Income" HeaderText="Income" SortExpression="Income" />
                    <asp:BoundField DataField="AccountName" HeaderText="Account" SortExpression="AccountName" />
                    <asp:BoundField DataField="Accountdetails" HeaderText="Details" SortExpression="Accountdetails" />
                    <asp:BoundField DataField="Transcationtype" HeaderText="Transcation Type" SortExpression="Transcationtype" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" />
                    <asp:BoundField DataField="Entered By" HeaderText="Entered By" ReadOnly="True" SortExpression="Entered By" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT HierarcyAccountTable.TranscationDate, ChurchDesignationTable.Branch, ChurchDetailTable.ChurchName, IncomeTable.Income, HierarcyAccountTable.AccountName, HierarcyAccountTable.Accountdetails, HierarcyAccountTable.Transcationtype, HierarcyAccountTable.Amount, HierarcyAccountTable.Remark, HierarcyAccountTable.Datecreated, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS [Entered By] FROM HierarcyAccountTable INNER JOIN ChurchDesignationTable ON HierarcyAccountTable.HirerchyID = ChurchDesignationTable.ChurchDesgID INNER JOIN ChurchDetailTable ON HierarcyAccountTable.ChurchDetailsID = ChurchDetailTable.ChurchDetailID INNER JOIN IncomeTable ON HierarcyAccountTable.incomeid = IncomeTable.ID INNER JOIN MembershipTable ON HierarcyAccountTable.StaffId = MembershipTable.Memberid WHERE (HierarcyAccountTable.Datecreated = @transdate) ORDER BY HierarcyAccountTable.TranscationDate">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSelectedDate" Name="transdate" PropertyName="Text" />
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
               
         <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p>  </div>
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
