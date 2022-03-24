<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewAttendance.aspx.vb" Inherits="ViewAttendance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Attendance View</title>
      <link href="css/Style.css" rel="stylesheet" />
    <link href="css/style2.css" rel="stylesheet" />
      <link href="../css/menu.css" rel="stylesheet" />
    <script src="jquery/chosen.jquery.js"></script>
    <link href="jquery/chosen.css" rel="stylesheet" />
    <script src="jquery/Jquery/jquery-1.7.1.min.js"></script>
    <script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>
    <script src="jquery/chosen.jquery.min.js"></script>
    <script src="jquery/chosen.proto.min.js"></script>
    <script src="jquery/chosen.proto.js"></script>
      <link href="../css/menu.css" rel="stylesheet" />
     <script src="jquery/Jquery/numtoword.js"></script>
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
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Enter Attendance"  class="a_demo_one" style="font-style: italic; font-weight: 700; top: -1px; left: 0px;" Height="40px" Width="180px" />
            <br />
            <br />
          <div>
                      &nbsp;<asp:DropDownList ID="DrpSorted" class="chosen-select" runat="server" Height="22px" Width="150px" AutoPostBack="True">
                <asp:ListItem>Ascending</asp:ListItem>
                <asp:ListItem>Month</asp:ListItem>
                <asp:ListItem>Date</asp:ListItem>
        
            </asp:DropDownList>
                             <asp:DropDownList ID="DrpDate" class="chosen-select" runat="server" Height="22px" Width="180px" AutoPostBack="True" Visible="False">
            </asp:DropDownList>

                    <asp:TextBox ID="txtSelectedDate" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                    <asp:TextBox ID="TXTSN" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

        </div>
            <br />
            </div>
        <div>
            <asp:GridView ID="GVAllAttendance" runat="server" Width="1150px" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid" DataKeyNames="Attendanceid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Attendanceid" HeaderText="ID" SortExpression="Attendanceid" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
                    <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="TotalAdult" HeaderText="Total Adult" SortExpression="TotalAdult" />
                    <asp:BoundField DataField="TotalTeen" HeaderText="Total Teenager" SortExpression="TotalTeen" />
                    <asp:BoundField DataField="TotalChildren" HeaderText="Total Children" SortExpression="TotalChildren" />
                    <asp:BoundField DataField="TotalVisitors" HeaderText="Total Visitors" SortExpression="TotalVisitors" />
                    <asp:BoundField DataField="Total" HeaderText="Grand Total" SortExpression="Total" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Enterby" HeaderText="Enter By" SortExpression="Enterby" ReadOnly="True" />
                  <asp:TemplateField ShowHeader="False">
                                  <ItemTemplate>
                                      <asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" 
                                          CommandName="Select" ImageUrl="~/Minister/Images/Edit.png" Text="Select" ToolTip="Edit"/>
                                  </ItemTemplate>
                         </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" CommandName="DeleteM" CommandArgument='<%#Eval("Attendanceid")%>'  ImageUrl="~/Images/Delete_icon.png" Text="Button" />
                        </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT AttendanceTable.Week, AttendanceTable.Day, AttendanceTable.Date, AttendanceTable.Attendanceid, AttendanceTotalTable.TotalAdult, AttendanceTotalTable.TotalTeen, AttendanceTotalTable.TotalChildren, AttendanceTotalTable.TotalVisitors, AttendanceTable.Total, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS Enterby, AttendanceTable.Datecreated FROM AttendanceTable INNER JOIN MembershipTable ON AttendanceTable.Createdby = MembershipTable.Memberid INNER JOIN AttendanceTotalTable ON AttendanceTable.Attendanceid = AttendanceTotalTable.Attendanceid WHERE (AttendanceTable.Churchid = @chu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="gridDate" runat="server" Width="1150px" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="15" ShowFooter="True" style="font-size: small; font-weight: 700;" Visible="False" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
                    <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:BoundField DataField="TotalAdult" HeaderText="Total Adult" SortExpression="TotalAdult" />
                    <asp:BoundField DataField="TotalTeen" HeaderText="Total Teenager" SortExpression="TotalTeen" />
                    <asp:BoundField DataField="TotalChildren" HeaderText="Total Children" SortExpression="TotalChildren" />
                    <asp:BoundField DataField="TotalVisitors" HeaderText="Total Visitors" SortExpression="TotalVisitors" />
                    <asp:BoundField DataField="Total" HeaderText="Grand Total" SortExpression="Total" />
                    <asp:BoundField DataField="Enterby" HeaderText="Enter by" ReadOnly="True" SortExpression="Enterby" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT AttendanceTable.Week, AttendanceTable.Day, AttendanceTable.Date, AttendanceTotalTable.TotalAdult, AttendanceTotalTable.TotalTeen, AttendanceTotalTable.TotalChildren, AttendanceTotalTable.TotalVisitors, AttendanceTable.Total, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS Enterby, AttendanceTable.Datecreated FROM AttendanceTable INNER JOIN MembershipTable ON AttendanceTable.Createdby = MembershipTable.Memberid INNER JOIN AttendanceTotalTable ON AttendanceTable.Attendanceid = AttendanceTotalTable.Attendanceid WHERE (AttendanceTable.Churchid = @chu) AND (AttendanceTable.Date = @date)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtSelectedDate" Name="date" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="dridMonth" runat="server" Width="1150px" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="15" ShowFooter="True" style="font-size: small; font-weight: 700;" Visible="False" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
                    <asp:BoundField DataField="Day" HeaderText="Day" SortExpression="Day" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:BoundField DataField="TotalAdult" HeaderText="Total Adult" SortExpression="TotalAdult" />
                    <asp:BoundField DataField="TotalTeen" HeaderText="Total Teen" SortExpression="TotalTeen" />
                    <asp:BoundField DataField="TotalChildren" HeaderText="Total Children" SortExpression="TotalChildren" />
                    <asp:BoundField DataField="TotalVisitors" HeaderText="Total Visitors" SortExpression="TotalVisitors" />
                    <asp:BoundField DataField="Total" HeaderText="Grand Total" SortExpression="Total" />
                    <asp:BoundField DataField="Enterby" HeaderText="Enter By" ReadOnly="True" SortExpression="Enterby" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT AttendanceTable.Week, AttendanceTable.Day, AttendanceTable.Date, AttendanceTotalTable.TotalAdult, AttendanceTotalTable.TotalTeen, AttendanceTotalTable.TotalChildren, AttendanceTotalTable.TotalVisitors, AttendanceTable.Total, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS Enterby, AttendanceTable.Datecreated FROM AttendanceTable INNER JOIN MembershipTable ON AttendanceTable.Createdby = MembershipTable.Memberid INNER JOIN AttendanceTotalTable ON AttendanceTable.Attendanceid = AttendanceTotalTable.Attendanceid WHERE (AttendanceTable.Churchid = @chu)">
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
