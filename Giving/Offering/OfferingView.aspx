<%@ Page Language="VB" AutoEventWireup="false" CodeFile="OfferingView.aspx.vb" Inherits="OfferingView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Offering Record</title>
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
            <p class="church-watch">RolofDynamics Church Watch</p>
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
                    <asp:Label ID="lblid" runat="server" CssClass="label" Visible="False"></asp:Label>
                    <br />

        </div>
        <br />
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
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Enter Offering"  class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="40px" Width="160px" />
            &nbsp;&nbsp;<br />
            <br />
            </div>
<div>
                      &nbsp;<asp:DropDownList ID="DrpSorted" class="chosen-select" runat="server" Height="22px" Width="180px" AutoPostBack="True">
                <asp:ListItem>Ascending</asp:ListItem>
                <asp:ListItem>Event Date</asp:ListItem>
                <asp:ListItem>Period</asp:ListItem>
                <asp:ListItem>Income</asp:ListItem>
            </asp:DropDownList>
                             <asp:DropDownList ID="DrpDate" class="chosen-select" runat="server" Height="22px" Width="180px" AutoPostBack="True" Visible="False">
            </asp:DropDownList>

                    <asp:TextBox ID="txtSelectedDate" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                      <br />

                      <br />

        </div>        
        <div>
            <asp:GridView ID="GrdOffering" runat="server" Width="1150px" DataSourceID="SqlDataSource4" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" Height="50px" BorderStyle="Solid" PageSize="15">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Income" HeaderText="Income" SortExpression="Income" />
                    <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Topic" HeaderText="Topic" SortExpression="Topic" />
                    <asp:BoundField DataField="Minister" HeaderText="Minister" SortExpression="Minister" />
                    <asp:BoundField DataField="Period" HeaderText="Period" SortExpression="Period" />
                    <asp:BoundField DataField="Amountword" HeaderText="Amountword" SortExpression="Amountword" />
                    <asp:BoundField DataField="Datecreated" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Datecreated" SortExpression="Datecreated" />
                    <asp:BoundField DataField="Enterby" HeaderText="Enterby" ReadOnly="True" SortExpression="Enterby" />
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
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT IncomeOffTable.SN, IncomeTable.Income, IncomeOffTable.EventDate, IncomeOffTable.Topic, IncomeOffTable.Minister, IncomeOffTable.Period, IncomeOffTable.Name, IncomeOffTable.Amountword, IncomeOffTable.Datecreated, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS Enterby FROM IncomeOffTable INNER JOIN IncomeTable ON IncomeOffTable.incomeid = IncomeTable.ID INNER JOIN MembershipTable ON IncomeOffTable.Staffid = MembershipTable.Memberid ORDER BY IncomeOffTable.SN"></asp:SqlDataSource>
            <asp:GridView ID="gridincome" runat="server" Width="1150px" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small; font-weight: 700;" Visible="False" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Income" HeaderText="Income" SortExpression="Income" />
                    <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Topic" HeaderText="Topic" SortExpression="Topic" />
                    <asp:BoundField DataField="Minister" HeaderText="Minister" SortExpression="Minister" />
                    <asp:BoundField DataField="Period" HeaderText="Period" SortExpression="Period" />
                    <asp:BoundField DataField="Amountword" HeaderText="Amountword" SortExpression="Amountword" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Datecreated" SortExpression="Datecreated" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Enterby" HeaderText="Enterby" ReadOnly="True" SortExpression="Enterby" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT IncomeOffTable.SN, IncomeTable.Income, IncomeOffTable.EventDate, IncomeOffTable.Topic, IncomeOffTable.Minister, IncomeOffTable.Period, IncomeOffTable.Name, IncomeOffTable.Amountword, IncomeOffTable.Datecreated, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS Enterby FROM IncomeOffTable INNER JOIN IncomeTable ON IncomeOffTable.incomeid = IncomeTable.ID INNER JOIN MembershipTable ON IncomeOffTable.Staffid = MembershipTable.Memberid WHERE (IncomeTable.Income = @income) AND (MembershipTable.ChurchDetailID = @chu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DrpDate" Name="income" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GrdPeriod" runat="server" Width="1150px" DataSourceID="SqlDataSource5" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small; font-weight: 700;" Visible="False" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
<asp:BoundField DataField="Income" HeaderText="Income" SortExpression="Income"></asp:BoundField>
                    <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Topic" HeaderText="Topic" SortExpression="Topic" />
                    <asp:BoundField DataField="Minister" HeaderText="Minister" SortExpression="Minister" />
                    <asp:BoundField DataField="Period" HeaderText="Period" SortExpression="Period" />
<asp:BoundField DataField="Amountword" HeaderText="Amountword" SortExpression="Amountword"></asp:BoundField>
                    <asp:BoundField DataField="Datecreated" HeaderText="Datecreated" SortExpression="Datecreated" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Enterby" HeaderText="Enterby" ReadOnly="True" SortExpression="Enterby" />
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
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT IncomeOffTable.SN, IncomeTable.Income, IncomeOffTable.EventDate, IncomeOffTable.Topic, IncomeOffTable.Minister, IncomeOffTable.Period, IncomeOffTable.Name, IncomeOffTable.Amountword, IncomeOffTable.Datecreated, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS Enterby FROM IncomeOffTable INNER JOIN IncomeTable ON IncomeOffTable.incomeid = IncomeTable.ID INNER JOIN MembershipTable ON IncomeOffTable.Staffid = MembershipTable.Memberid WHERE (MembershipTable.ChurchDetailID = @chu) AND (IncomeOffTable.Period = @Period)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DrpDate" Name="Period" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="gridDate" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" style="font-size: small; font-weight: 700;" Width="1150px" ShowFooter="True" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Income" HeaderText="Income" SortExpression="Income" />
                    <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Topic" HeaderText="Topic" SortExpression="Topic" />
                    <asp:BoundField DataField="Minister" HeaderText="Minister" SortExpression="Minister" />
                    <asp:BoundField DataField="Period" HeaderText="Period" SortExpression="Period" />
                    <asp:BoundField DataField="Amountword" HeaderText="Amountword" SortExpression="Amountword" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Datecreated" SortExpression="Datecreated" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Enterby" HeaderText="Enterby" ReadOnly="True" SortExpression="Enterby" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT IncomeOffTable.SN, IncomeTable.Income, IncomeOffTable.EventDate, IncomeOffTable.Topic, IncomeOffTable.Minister, IncomeOffTable.Period, IncomeOffTable.Name, IncomeOffTable.Amountword, IncomeOffTable.Datecreated, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS Enterby FROM IncomeOffTable INNER JOIN IncomeTable ON IncomeOffTable.incomeid = IncomeTable.ID INNER JOIN MembershipTable ON IncomeOffTable.Staffid = MembershipTable.Memberid WHERE (MembershipTable.ChurchDetailID = @chu) AND (IncomeOffTable.EventDate = @Event)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtSelectedDate" Name="Event" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:TextBox ID="txtCriteria2" runat="server" Visible="False" Width="18px"></asp:TextBox>
            <asp:TextBox ID="txtCriteria3" runat="server" Visible="False" Width="18px"></asp:TextBox>

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtLocation" runat="server" Visible="False" Width="16px"></asp:TextBox>

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
