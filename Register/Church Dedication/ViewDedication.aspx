<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewDedication.aspx.vb" Inherits="ViewDedication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Marriage Record</title>
    <link href="css/Style.css" rel="stylesheet" />
    <link href="css/style2.css" rel="stylesheet" />
   <%-- <link href="css/menu.css" rel="stylesheet" />--%>
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
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Enter Dedication"  class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="40px" Width="160px" />
            &nbsp;&nbsp;<br />
            <br />
            </div>
    <div>
                      &nbsp;<asp:DropDownList ID="DrpSorted" class="chosen-select" runat="server" Height="22px" Width="180px" AutoPostBack="True">
                <asp:ListItem>Ascending</asp:ListItem>
                <asp:ListItem>Month</asp:ListItem>
            </asp:DropDownList>
                             <asp:DropDownList ID="DrpDate" class="chosen-select" runat="server" Height="22px" Width="180px" AutoPostBack="True" Visible="False">
            </asp:DropDownList>

                    <asp:TextBox ID="txtSelectedDate" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                      <br />

                      <br />

        </div>   
        <div>
            <asp:GridView ID="GridAscending" runat="server" Width="1150px" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" ReadOnly="True" SortExpression="SN" InsertVisible="False" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="DateDedication" HeaderText="Date Dedication" SortExpression="DateDedication" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="FatherName" HeaderText="FatherName" SortExpression="FatherName" ReadOnly="True" />
                    <asp:BoundField DataField="MotherName" HeaderText="MotherName" SortExpression="MotherName" ReadOnly="True" />
                    <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                    <asp:BoundField DataField="datecreated" HeaderText="date created" SortExpression="datecreated" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="CreatedBy" HeaderText="Created By" ReadOnly="True" SortExpression="CreatedBy" />
                    <asp:CommandField SelectText="View" ShowSelectButton="True" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT DedicationTable.SN, DedicationTable.BFirstname + '  ' + DedicationTable.BLastname AS Name, DedicationTable.Gender, DedicationTable.FFirstname + '  ' + DedicationTable.Flastname AS FatherName, DedicationTable.MFirstname + '  ' + DedicationTable.Mlastname AS MotherName, DedicationTable.DOB, DedicationTable.DateDedication, DedicationTable.Month, DedicationTable.datecreated, MembershipTable.FirstName + '  ' + MembershipTable.LastName AS CreatedBy FROM DedicationTable INNER JOIN MembershipTable ON DedicationTable.Createdby = MembershipTable.Memberid WHERE (DedicationTable.Churchid = @church)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="church" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
           
            <asp:GridView ID="GridMonth" runat="server" Width="1150px" DataSourceID="SqlDataSource4" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="DateDedication" HeaderText="Date Dedication" SortExpression="DateDedication" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="FatherName" HeaderText="Father Name" SortExpression="FatherName" ReadOnly="True" />
                    <asp:BoundField DataField="MotherName" HeaderText="Mother Name" SortExpression="MotherName" ReadOnly="True" />
                    <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                    <asp:BoundField DataField="datecreated" HeaderText="date created" SortExpression="datecreated" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" ReadOnly="True" />
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
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT DedicationTable.BFirstname + '  ' + DedicationTable.BLastname AS Name, DedicationTable.Gender, DedicationTable.FFirstname + '  ' + DedicationTable.Flastname AS FatherName, DedicationTable.MFirstname + '  ' + DedicationTable.Mlastname AS MotherName, DedicationTable.DOB, DedicationTable.DateDedication, DedicationTable.Month, DedicationTable.datecreated, MembershipTable.FirstName + '  ' + MembershipTable.LastName AS CreatedBy FROM DedicationTable INNER JOIN MembershipTable ON DedicationTable.Createdby = MembershipTable.Memberid WHERE (DedicationTable.Churchid = @church) AND (DedicationTable.Month = @month)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="church" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DrpDate" Name="month" PropertyName="SelectedValue" />
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
