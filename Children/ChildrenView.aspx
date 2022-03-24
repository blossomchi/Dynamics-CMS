<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ChildrenView.aspx.vb" Inherits="ChildrenView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Children</title>
     <link href="css/style.css" rel="stylesheet" />
    <link href="css/style2.css" rel="stylesheet" />
      <link href="../css/menu.css" rel="stylesheet" />
    <script src="jquery/chosen.jquery.js"></script>
    <link href="jquery/chosen.css" rel="stylesheet" />
    <script src="jquery/Jquery/jquery-1.7.1.min.js"></script>
    <script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>
    <script src="jquery/chosen.jquery.min.js"></script>
    <script src="jquery/chosen.proto.min.js"></script>
    <script src="jquery/chosen.proto.js"></script>
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
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Record Children"  class="a_demo_one" style="font-weight: 700;" Height="40px" Width="180px" />
            <br />
      <br />
    <p style="font-size: large">
                <asp:DropDownList ID="DrpSorted" class="chosen-select" runat="server" Height="22px" Width="186px" AutoPostBack="True">
                    <asp:ListItem>Ascending</asp:ListItem>
                    <asp:ListItem>FamilyName</asp:ListItem>
                    <asp:ListItem>FirstName</asp:ListItem>
                    <asp:ListItem>Phone Number</asp:ListItem>
                    <asp:ListItem>Functional Group</asp:ListItem>
                    <asp:ListItem>Gender</asp:ListItem>
                </asp:DropDownList> &nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<asp:TextBox ID="txtcriteria" runat="server"></asp:TextBox>
                                        <asp:DropDownList ID="CBFamilyname" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="FamilyDS" DataTextField="Family Name" DataValueField="Familyid" Visible="False" Width="150px">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="CBFunctionalGroup" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="FunctionalDS" DataTextField="GroupName" DataValueField="GroupName" Visible="False" Width="150px">
                                        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Search" class="a_demo_one" Width="63px" Height="33px" Font-Size="12px" />
                <asp:TextBox ID="stateID" runat="server" Visible="False" Width="5px"></asp:TextBox>
                &nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</p>

            <br />
            </div>
        <div>
            <asp:GridView ID="GrdAscending" runat="server" Width="1150px" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" SortExpression="SN" />
                    <asp:BoundField DataField="Firstname" HeaderText="First Name" SortExpression="Firstname" />
                    <asp:BoundField DataField="Lastname" HeaderText="Last Name" SortExpression="Lastname" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="GroupName" HeaderText="Group Name" SortExpression="GroupName" Visible="False" />
                    <asp:BoundField DataField="Parents" HeaderText="Parent" SortExpression="Parents" />
                    <asp:BoundField DataField="ParentNo" HeaderText="Parent NO." SortExpression="ParentNo" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" />
                 <asp:CommandField ButtonType="Button" ShowCancelButton="False" ShowSelectButton="True" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChildrenTable.SN, ChildrenTable.Firstname, ChildrenTable.Lastname, ChildrenTable.Gender, MembersGroup.GroupName, ChildrenTable.Parents, ChildrenTable.DOB, ChildrenTable.Address, ChildrenTable.Phone, ChildrenTable.ParentNo, ChildrenTable.Datecreated FROM ChildrenTable INNER JOIN MembersGroup ON ChildrenTable.FunctiongroupID = MembersGroup.ID WHERE (ChildrenTable.Churchid = @chu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GrdFamilyName" runat="server" Width="1150px" DataSourceID="Familyname" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="15" ShowFooter="True" style="font-size: medium" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Firstname" HeaderText="First Name" SortExpression="Firstname" />
                    <asp:BoundField DataField="Lastname" HeaderText="Last Name" SortExpression="Lastname" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="GroupName" HeaderText="Group Name" SortExpression="GroupName" />
                    <asp:BoundField DataField="Parents" HeaderText="Parents" SortExpression="Parents" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="ParentNo" HeaderText="Parent" SortExpression="ParentNo" />
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
            <asp:SqlDataSource ID="Familyname" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChildrenTable.Firstname, ChildrenTable.Lastname, ChildrenTable.Gender, MembersGroup.GroupName, ChildrenTable.Parents, ChildrenTable.DOB, ChildrenTable.Address, ChildrenTable.Phone, ChildrenTable.ParentNo, ChildrenTable.Datecreated FROM ChildrenTable INNER JOIN MembersGroup ON ChildrenTable.FunctiongroupID = MembersGroup.ID WHERE (ChildrenTable.Churchid = @chu) AND (ChildrenTable.Familyname = @familyname)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtcriteria" Name="familyname" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GrdvFirstname" runat="server" Width="1150px" DataSourceID="Firstname" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="15" ShowFooter="True" style="font-size: medium" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Firstname" HeaderText="First Name" SortExpression="Firstname" />
                    <asp:BoundField DataField="Lastname" HeaderText="Last Name" SortExpression="Lastname" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="GroupName" HeaderText="Group Name" SortExpression="GroupName" />
                    <asp:BoundField DataField="Parents" HeaderText="Parents" SortExpression="Parents" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="ParentNo" HeaderText="Parent No" SortExpression="ParentNo" />
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
            <asp:SqlDataSource ID="Firstname" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChildrenTable.Firstname, ChildrenTable.Lastname, ChildrenTable.Gender, MembersGroup.GroupName, ChildrenTable.Parents, ChildrenTable.DOB, ChildrenTable.Address, ChildrenTable.Phone, ChildrenTable.ParentNo, ChildrenTable.Datecreated FROM ChildrenTable INNER JOIN MembersGroup ON ChildrenTable.FunctiongroupID = MembersGroup.ID WHERE (ChildrenTable.Churchid = @chu) AND (ChildrenTable.Firstname = @fistname)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtcriteria" Name="fistname" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GrdvPhn" runat="server" Width="1150px" DataSourceID="PhoneNumber" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="15" ShowFooter="True" style="font-size: medium" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Firstname" HeaderText="First Name" SortExpression="Firstname" />
                    <asp:BoundField DataField="Lastname" HeaderText="Last Name" SortExpression="Lastname" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="GroupName" HeaderText="Group Name" SortExpression="GroupName" />
                    <asp:BoundField DataField="Parents" HeaderText="Parents" SortExpression="Parents" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="ParentNo" HeaderText="Parent No" SortExpression="ParentNo" />
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
            <asp:SqlDataSource ID="PhoneNumber" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChildrenTable.Firstname, ChildrenTable.Lastname, ChildrenTable.Gender, MembersGroup.GroupName, ChildrenTable.Parents, ChildrenTable.DOB, ChildrenTable.Address, ChildrenTable.Phone, ChildrenTable.ParentNo, ChildrenTable.Datecreated FROM ChildrenTable INNER JOIN MembersGroup ON ChildrenTable.FunctiongroupID = MembersGroup.ID WHERE (ChildrenTable.Churchid = @chu) AND (ChildrenTable.Phone = @phone)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtcriteria" Name="phone" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="OtherDetailsGV" runat="server" Width="1150px" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="15" ShowFooter="True" style="font-size: medium" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Firstname" HeaderText="First Name" SortExpression="Firstname" />
                    <asp:BoundField DataField="Lastname" HeaderText="Last Name" SortExpression="Lastname" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="GroupName" HeaderText="Group Name" SortExpression="GroupName" />
                    <asp:BoundField DataField="Parents" HeaderText="Parents" SortExpression="Parents" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="ParentNo" HeaderText="Parent No" SortExpression="ParentNo" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChildrenTable.Firstname, ChildrenTable.Lastname, ChildrenTable.Gender, MembersGroup.GroupName, ChildrenTable.Parents, ChildrenTable.DOB, ChildrenTable.Address, ChildrenTable.Phone, ChildrenTable.ParentNo, ChildrenTable.Datecreated FROM ChildrenTable INNER JOIN MembersGroup ON ChildrenTable.FunctiongroupID = MembersGroup.ID WHERE (ChildrenTable.Churchid = @chu) AND (MembersGroup.GroupName = @Fungroup)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtcriteria" Name="Fungroup" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GrdGender" runat="server" Width="1150px" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="15" ShowFooter="True" style="font-size: medium" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Firstname" HeaderText="First Name" SortExpression="Firstname" />
                    <asp:BoundField DataField="Lastname" HeaderText="Last Name" SortExpression="Lastname" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="GroupName" HeaderText="Group Name" SortExpression="GroupName" />
                    <asp:BoundField DataField="Parents" HeaderText="Parents" SortExpression="Parents" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="ParentNo" HeaderText="Parent Number" SortExpression="ParentNo" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChildrenTable.Firstname, ChildrenTable.Lastname, ChildrenTable.Gender, MembersGroup.GroupName, ChildrenTable.Parents, ChildrenTable.DOB, ChildrenTable.Address, ChildrenTable.Phone, ChildrenTable.ParentNo, ChildrenTable.Datecreated FROM ChildrenTable INNER JOIN MembersGroup ON ChildrenTable.FunctiongroupID = MembersGroup.ID WHERE (ChildrenTable.Churchid = @chu) AND (ChildrenTable.Gender = @Gender)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtcriteria" Name="Gender" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="FunctionalDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ID, GroupName FROM MembersGroup WHERE (GroupName = N'KINGDOM BUILDERS')"></asp:SqlDataSource>
            <asp:SqlDataSource ID="FamilyDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Familyid, FamilyName + ' ' + FamilyFirstName AS [Family Name] FROM FamilyTable WHERE (Familyid &lt;&gt; N'FAM1')"></asp:SqlDataSource>
            <br />
            <asp:TextBox ID="txtAssigned" runat="server" Visible="False" Width="16px"></asp:TextBox>
            <asp:TextBox ID="txtAssignedID" runat="server" Visible="False" Width="10px"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtCriteria2" runat="server" Visible="False" Width="18px"></asp:TextBox>
            <asp:TextBox ID="txtCriteria3" runat="server" Visible="False" Width="18px"></asp:TextBox>
                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                     <asp:TextBox ID="txtStaffID" runat="server" Font-Size="XX-Small" Visible="False" Width="20px" Height="19px"></asp:TextBox>
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
