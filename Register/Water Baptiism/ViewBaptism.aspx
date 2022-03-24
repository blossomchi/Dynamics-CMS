<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewBaptism.aspx.vb" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Baptism Record</title>
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
            &nbsp;&nbsp;&nbsp;<br />
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Record New Baptism" class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="40px" Width="170px" />
            &nbsp;&nbsp;<asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtchurchid" runat="server" Visible="False" Width="18px"></asp:TextBox>
                <br />
            <br />
            </div>
        <p style="font-size: large">


                &nbsp;Criteria
                <asp:DropDownList ID="DrpSorted"  class="chosen-select"  runat="server" Height="22px" Width="186px" AutoPostBack="True">
                    <asp:ListItem>Ascending</asp:ListItem>
                    <asp:ListItem>FirstName</asp:ListItem>
                       <asp:ListItem>Surname</asp:ListItem>
                    <asp:ListItem>Phone Number</asp:ListItem>
                     <asp:ListItem>Gender</asp:ListItem>
                   
                </asp:DropDownList> &nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<asp:TextBox ID="txtcriteria" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Search" class="a_demo_one" Width="63px" Height="33px" Font-Size="12px" />
                <asp:TextBox ID="stateID" runat="server" Visible="False" Width="5px"></asp:TextBox>
                &nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</p>
        <div>
            <asp:GridView ID="GrdAscending" runat="server" Width="1150px" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" SortExpression="PhoneNo" />
                    <asp:BoundField DataField="DOB" HeaderText="Date of Birth" SortExpression="DOB" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="BaptismDate" HeaderText="BaptismDate" SortExpression="BaptismDate" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="ResidentAddress" HeaderText="ResidentAddress" SortExpression="ResidentAddress" />
                    <asp:BoundField DataField="Parents" HeaderText="Parents" SortExpression="Parents" />
                    <asp:BoundField DataField="DateCreation" DataFormatString="{0:dd/MM/yyyy}" HeaderText="DateCreation" SortExpression="DateCreation" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, FirstName, LastName, Gender, PhoneNo, BaptismDate, DateCreation, ResidentAddress, Parents, DOB FROM BaptismTable WHERE (Churchid = @chub2)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchid" Name="chub2" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GrdvFirstname" runat="server" Width="1150px" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: medium; font-weight: 700;" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Surname" SortExpression="LastName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="PhoneNo" HeaderText="Phone No" SortExpression="PhoneNo" />
                    <asp:BoundField DataField="DOB" HeaderText="Date of Birth" SortExpression="DOB" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="ResidentAddress" HeaderText="ResidentAddress" SortExpression="ResidentAddress" />
                    <asp:BoundField DataField="Parents" HeaderText="Parents" SortExpression="Parents" />
                    <asp:BoundField DataField="BaptismDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="BaptismDate" SortExpression="BaptismDate" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT FirstName, LastName, Gender, PhoneNo, DOB, BaptismDate, ResidentAddress, Parents, DateCreation FROM BaptismTable WHERE (FirstName = @firstname) AND (Churchid = @chu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtcriteria" Name="firstname" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtchurchid" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GrdvSurname" runat="server" Width="1150px" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: medium" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" SortExpression="PhoneNo" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="ResidentAddress" HeaderText="ResidentAddress" SortExpression="ResidentAddress" />
                    <asp:BoundField DataField="BaptismDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="BaptismDate" SortExpression="BaptismDate" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT FirstName, LastName, Gender, PhoneNo, DOB, BaptismDate, ResidentAddress, DateCreation, Churchid FROM BaptismTable WHERE (LastName = @last) AND (Churchid = @chu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtcriteria" Name="last" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtchurchid" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GrdvPhn" runat="server" Width="1150px" DataSourceID="SqlDataSource4" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: medium" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" SortExpression="PhoneNo" />
                    <asp:BoundField DataField="BaptismDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Baptism Date" SortExpression="BaptismDate" />
                    <asp:BoundField DataField="DOB" HeaderText="Date of Birth" SortExpression="DOB" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="ResidentAddress" HeaderText="ResidentAddress" SortExpression="ResidentAddress" />
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
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT FirstName, LastName, Gender, PhoneNo, DOB, ResidentAddress, BaptismDate FROM BaptismTable WHERE (PhoneNo = @phone) AND (Churchid = @chu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtcriteria" Name="phone" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtchurchid" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GrdGender" runat="server" Width="1150px" DataSourceID="SqlDataSource5" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: medium" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" SortExpression="PhoneNo" />
                    <asp:BoundField DataField="BaptismDate" HeaderText="BaptismDate" SortExpression="BaptismDate" />
                    <asp:BoundField DataField="ResidentAddress" HeaderText="ResidentAddress" SortExpression="ResidentAddress" />
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
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT FirstName, LastName, Gender, PhoneNo, BaptismDate, ResidentAddress FROM BaptismTable WHERE (Churchid = @chu) AND (Gender = @gender)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchid" Name="chu" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtcriteria" Name="gender" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:TextBox ID="txtAssigned" runat="server" Visible="False" Width="16px"></asp:TextBox>
            <asp:TextBox ID="txtAssignedID" runat="server" Visible="False" Width="10px"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtCriteria2" runat="server" Visible="False" Width="18px"></asp:TextBox>
            <asp:TextBox ID="txtCriteria3" runat="server" Visible="False" Width="18px"></asp:TextBox>
            <br />
        </div>


    </div>

           <div class="footer">
               
         <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p> </div>
        </div>
          <script type="text/javascript">
              var config = {
                  '.chosen-select': {}
              }
              for (var selector in config) {
                  $(selector).chosen(config[selector]);
              }
      </script>
    </form>
</body>
</html>
