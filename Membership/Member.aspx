<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Member.aspx.vb" Inherits="Member" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Church of God Mission</title>
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
    <style type="text/css">
        #form1 {
            height: 667px;
        }
        .drop-down {}
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 103px;
        }
        .auto-style5 {
            left: 1px;
            top: 0px;
        }
    </style>
  
</head>
<body>
    <form id="form1" runat="server">
   <div class="wrapper">
    <div class="header">
        <div class="bg-header"></div>
        <div class="header-text">
              <p class="church-watch">RolofDynamics Church Watch</p>
             <p class="church-mgt">Church Management Software</p>
        </div>
       
<div style="float:right">
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
    </div>
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
        <h2>Membership</h2>
        <p>&nbsp;</p>
        <p>
            <asp:Label ID="lblid" runat="server" Text="Label" Visible="False"></asp:Label>
        </p>
        <div style="font-size: medium">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<div class="formbox">
                    <div class="NewFrameeBloss">
                        <div class="form-groupBloss">
                            <table class="auto-style1">
                                <tr>
                                    <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="Select Family" CssClass="label" style="font-weight: bold"></asp:Label>
                                    </td>
                                    <td colspan="2">
            <asp:DropDownList ID="dropFamily" class="chosen-select" runat="server" Height="30px" Width="222px" DataSourceID="SqlDataSource1" DataTextField="Father Name" DataValueField="Familyid" AutoPostBack="True">
            </asp:DropDownList>
            <asp:Button ID="btnAddperson" runat="server" class="a_demo_one" Text="Add Person" Width="93px" Height="33px" Font-Size="12px" />
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">
                    <asp:Label ID="Label24" runat="server" Text="Family Name" CssClass="label" style="font-weight: bold"></asp:Label>
                                    </td>
                                    <td>
                      <asp:TextBox ID="txtFamilyname" runat="server" placeholder="Enter Family Name" Width="220px"></asp:TextBox>
                                    &nbsp;<asp:ImageButton ID="ImageButton20" runat="server" Height="16px" ImageUrl="~/Membership/Images/PLUSign.png" ToolTip="Click to select existing family name" Width="16px" />
            <asp:DropDownList ID="dropEditFamily" class="chosen-select" runat="server" Height="30px" Width="222px" DataSourceID="SqlDataSource1" DataTextField="Father Name" DataValueField="Familyid" AutoPostBack="True" Visible="False">
            </asp:DropDownList>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="First Name" CssClass="label" style="font-weight: bold"></asp:Label>
                                    </td>
                                    <td>
                    <asp:TextBox ID="TXTFamilyFirst" runat="server" placeholder="Enter Family First Name" CssClass="input" Width="220px"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="Middle Name" CssClass="label" style="font-weight: bold"></asp:Label>
                                    </td>
                                    <td>
                    <asp:TextBox ID="familyMiddle" runat="server"  placeholder="Enter Family Middle Name" CssClass="input" Width="220px"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2">&nbsp;</td>
                                    <td><asp:Button ID="btnAddFamily"  runat="server" Text="Add Family" class="a_demo_one" Width="93px" Height="33px" Font-Size="12px" />


                                        <asp:Button ID="BtnEdit" runat="server" class="a_demo_one" Text="Edit Name" Width="93px" Height="33px" Font-Size="12px" />
                                    </td>
                                    <td>
                <asp:TextBox ID="stateID0" runat="server" Visible="False" Width="5px"></asp:TextBox>


                <asp:TextBox ID="stateID" runat="server" Visible="False" Width="5px"></asp:TextBox>
                                        <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2"><strong>Criteria</strong> </td>
                                    <td colspan="3">
                <asp:DropDownList ID="DrpSorted" class="chosen-select" runat="server" Height="22px" Width="222px" AutoPostBack="True">
                    <asp:ListItem>Ascending</asp:ListItem>
                    <asp:ListItem>FamilyName</asp:ListItem>
                    <asp:ListItem>FirstName</asp:ListItem>
                    <asp:ListItem>Phone Number</asp:ListItem>
                    <asp:ListItem>Title</asp:ListItem>
                    <asp:ListItem>Gender</asp:ListItem>
                    <asp:ListItem>Authority</asp:ListItem>
                    <asp:ListItem>Homecell</asp:ListItem>
                    <asp:ListItem>SeviceUnit</asp:ListItem>
                    <asp:ListItem>State</asp:ListItem>
                    <asp:ListItem>Marital Status</asp:ListItem>
                    <asp:ListItem>Members Group</asp:ListItem>
                    <asp:ListItem>Month</asp:ListItem>
                    <asp:ListItem Value="All Family"></asp:ListItem>
                </asp:DropDownList> <asp:TextBox ID="txtcriteria" runat="server"></asp:TextBox>
                                        <asp:DropDownList ID="CBMembersGroups" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="MembersDS" DataTextField="GroupName" DataValueField="GroupName" Visible="False" Width="150px">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="CBMonth" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="MonthDS" DataTextField="Month" DataValueField="Monthvalue" Visible="False" Width="150px">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="CBServiceUnit" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="ServiceDS" DataTextField="ServiceName" DataValueField="ServiceName" Visible="False" Width="150px">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="CBState" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="StateDS" DataTextField="State" DataValueField="State" Visible="False" Width="150px">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="CBHomeCell" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="HomeCellArea" DataTextField="AreaName" DataValueField="AreaName" Visible="False" Width="150px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="HomeCellArea" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Areaid], [AreaName] FROM [AreaTable]"></asp:SqlDataSource>
                                        <asp:DropDownList ID="CBFamily" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="AllFamDS" DataTextField="FAMILY" DataValueField="Familyid" Visible="False" Width="150px">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="AllFamDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Familyid, FamilyName + ' ' + FamilyFirstName AS FAMILY FROM FamilyTable WHERE (Familyid &lt;&gt; N'FAM1')"></asp:SqlDataSource>
            <asp:Button ID="Button1" runat="server" Text="Search" class="a_demo_one" Width="63px" Font-Size="12px" Height="33px"   />
                                        <strong>
                                        <asp:Button ID="DownloadButton" runat="server" class="a_demo_one" Text="Download" ToolTip="Download to excel" Width="195px" Height="38px" Visible="False" />
                                        </strong>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                </div>

                 </div>
                   </div>
           <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />



            <div id="GV" style="overflow: auto">
                <asp:GridView ID="GrdAscending" runat="server" Width="1015px"  AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" Font-Size="Medium" ForeColor="#333333" GridLines="None"  ScrollBars="Both"  DataKeyNames="SN" AllowPaging="True" CellSpacing="2" BorderStyle="Solid" style="font-size: small; ">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="father Name" HeaderText="Father Name" SortExpression="father Name" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Sur Name" SortExpression="LastName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Authority" HeaderText="Authority" SortExpression="Authority" />
                    <asp:BoundField DataField="Phone1" HeaderText="PhoneNo" SortExpression="Phone1" />
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
                <asp:GridView ID="OtherDetailsGV" runat="server" Width="1015px" AutoGenerateColumns="False" CellPadding="4" DataSourceID="DetailDS" Font-Size="Medium" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="2" Visible="False" BorderStyle="Solid" style="font-size: small; ">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ChurchName" HeaderText="Church" SortExpression="ChurchName" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="StateofOrgin" HeaderText="State Of Orgin" SortExpression="StateofOrgin" />
                    <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
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
                <asp:SqlDataSource ID="DetailDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChurchDetailTable.ChurchName, MembershipTable.FirstName, MembershipTable.LastName, MembershipTable.DOB, MembershipTable.Address, MembershipTable.StateofOrgin FROM MembershipTable INNER JOIN ChurchDetailTable ON MembershipTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (MembershipTable.SN = @GetID) AND (MembershipTable.Memberid &lt;&gt; N'MEB1')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Txtselect" Name="GetID" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, FamilyTable.FamilyName + ' ' + FamilyTable.FamilyFirstName AS [father Name], MembershipTable.FirstName, MembershipTable.LastName, MembershipTable.Gender, MembershipTable.Authority, MembershipTable.Phone1, ChurchDetailTable.ChurchDetailID FROM ChurchDetailTable INNER JOIN MembershipTable ON ChurchDetailTable.ChurchDetailID = MembershipTable.ChurchDetailID INNER JOIN FamilyTable ON MembershipTable.FamilyID = FamilyTable.Familyid WHERE (ChurchDetailTable.ChurchDetailID = @chu) AND (MembershipTable.Memberid &lt;&gt; N'MEB1') ORDER BY FamilyTable.FamilyName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>


           

                <asp:GridView ID="GrdvSurname" runat="server" Width="1015px" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource13" Font-Size="Medium" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="2" BorderStyle="Solid" style="font-size: small; ">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Surname" SortExpression="LastName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Phone1" HeaderText="Phone Number" SortExpression="Phone1" />
                    <asp:BoundField DataField="MartialStatus" HeaderText="MartialStatus" SortExpression="MartialStatus" />
                    <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, FamilyTable.FamilyName, MembershipTable.FirstName, MembershipTable.Gender, MembershipTable.Phone1, MembershipTable.MartialStatus, MembershipTable.LastName FROM FamilyTable INNER JOIN MembershipTable ON FamilyTable.Familyid = MembershipTable.FamilyID INNER JOIN ChurchDetailTable ON MembershipTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (FamilyTable.FamilyName = @family) AND (ChurchDetailTable.ChurchDetailID = @chu) AND (MembershipTable.Memberid &lt;&gt; N'MEB1')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtcriteria" Name="family" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    </SelectParameters>
            </asp:SqlDataSource>
                <asp:GridView ID="GrdvFirstname" runat="server" Width="1015px" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" Font-Size="Medium" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="2" BorderStyle="Solid" style="font-size: small">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Phone1" HeaderText="Phone1" SortExpression="Phone1" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, FirstName, LastName, Gender, Phone1, Address FROM MembershipTable WHERE (ChurchDetailID = @chu) AND (FirstName = @first) AND (MembershipTable.Memberid &lt;&gt; N'MEB1')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtcriteria" Name="first" PropertyName="Text" />
                    </SelectParameters>
            </asp:SqlDataSource>
                <asp:GridView ID="GrdvPhn" runat="server" Width="1015px" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource5" Font-Size="Medium" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="2" BorderStyle="Solid" style="font-size: small; ">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Phone1" HeaderText="Phone" SortExpression="Phone1" />
                    <asp:BoundField DataField="MartialStatus" HeaderText="Martial Status" SortExpression="MartialStatus" />
                    <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, FamilyTable.FamilyName, MembershipTable.FirstName, MembershipTable.Gender, MembershipTable.Phone1, MembershipTable.MartialStatus, MembershipTable.LastName FROM MembershipTable INNER JOIN FamilyTable ON MembershipTable.FamilyID = FamilyTable.Familyid INNER JOIN ChurchDetailTable ON MembershipTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (MembershipTable.Phone1 = @phone) AND (ChurchDetailTable.ChurchDetailID = @chu) AND (MembershipTable.Memberid &lt;&gt; N'MEB1')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtcriteria" Name="phone" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    </SelectParameters>
            </asp:SqlDataSource>
                <asp:GridView ID="GrdTitle" runat="server" Width="1015px" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource6" Font-Size="Medium" ForeColor="#333333" GridLines="None" DataKeyNames="SN" AllowPaging="True" CellSpacing="2" BorderStyle="Solid" style="font-size: small; ">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="FamilyName" HeaderText="Family Name" SortExpression="FamilyName" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Phone1" HeaderText="Phone" SortExpression="Phone1" />
                    <asp:BoundField DataField="MartialStatus" HeaderText="Martial Status" SortExpression="MartialStatus" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
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
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, FamilyTable.FamilyName, MembershipTable.FirstName, MembershipTable.Gender, MembershipTable.Phone1, MembershipTable.MartialStatus, MembershipTable.Title, ChurchDetailTable.ChurchName FROM ChurchDetailTable INNER JOIN MembershipTable ON ChurchDetailTable.ChurchDetailID = MembershipTable.ChurchDetailID INNER JOIN FamilyTable ON MembershipTable.FamilyID = FamilyTable.Familyid WHERE (MembershipTable.Title = @title) AND (MembershipTable.Memberid &lt;&gt; N'MEB1') ORDER BY FamilyTable.FamilyName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtcriteria" Name="title" PropertyName="Text" />
                    </SelectParameters>
            </asp:SqlDataSource>


           

                <asp:GridView ID="GrdGender" runat="server" Width="1015px" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource7" Font-Size="Medium" ForeColor="#333333" GridLines="None" DataKeyNames="SN" AllowPaging="True" CellSpacing="2" BorderStyle="Solid" style="font-size: small; ">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="FamilyName" HeaderText="Family Name" SortExpression="FamilyName" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Phone1" HeaderText="Phone" SortExpression="Phone1" />
                    <asp:BoundField DataField="Authority" HeaderText="Authority" SortExpression="Authority" />
                    <asp:BoundField DataField="ChurchName" HeaderText="Church" SortExpression="ChurchName" />
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
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, FamilyTable.FamilyName, MembershipTable.FirstName, MembershipTable.Gender, MembershipTable.Phone1, MembershipTable.Authority, ChurchDetailTable.ChurchName FROM ChurchDetailTable INNER JOIN MembershipTable ON ChurchDetailTable.ChurchDetailID = MembershipTable.ChurchDetailID INNER JOIN FamilyTable ON MembershipTable.FamilyID = FamilyTable.Familyid WHERE (MembershipTable.Gender = @Gender) AND (MembershipTable.Memberid &lt;&gt; N'MEB1') ORDER BY FamilyTable.FamilyName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtcriteria" Name="Gender" PropertyName="Text" />
                    </SelectParameters>
            </asp:SqlDataSource>


           

                <asp:GridView ID="GrdAuthority" runat="server" Width="1015px" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource8" Font-Size="Medium" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="2" BorderStyle="Solid" style="font-size: small; ">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="FamilyName" HeaderText="Family Name" SortExpression="FamilyName" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Phone1" HeaderText="Phone" SortExpression="Phone1" />
                    <asp:BoundField DataField="Authority" HeaderText="Authority" SortExpression="Authority" />
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
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, FamilyTable.FamilyName, MembershipTable.FirstName, MembershipTable.LastName, MembershipTable.Gender, MembershipTable.Phone1, MembershipTable.Authority FROM MembershipTable INNER JOIN ChurchDetailTable ON MembershipTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID INNER JOIN FamilyTable ON MembershipTable.FamilyID = FamilyTable.Familyid WHERE (MembershipTable.Authority = @Auth) AND (ChurchDetailTable.ChurchDetailID = @chu) AND (MembershipTable.Memberid &lt;&gt; N'MEB1') ORDER BY FamilyTable.FamilyName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtcriteria" Name="Auth" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    </SelectParameters>
            </asp:SqlDataSource>


           

                <asp:GridView ID="GrdHomecell" runat="server" Width="1015px" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource9" Font-Size="Medium" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="2" BorderStyle="Solid" style="font-size: small; ">
                <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                        <asp:BoundField DataField="AreaName" HeaderText="Area" SortExpression="AreaName" />
                        <asp:BoundField DataField="HomeCellAddress" HeaderText="Home Cell Address" SortExpression="HomeCellAddress" />
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
                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, MembershipTable.FirstName, MembershipTable.LastName, MembershipTable.Gender, MembershipTable.Address, MembershipTable.Phone1 AS Phone, AreaTable.AreaName, MembershipTable.HomeCellAddress FROM MembershipTable INNER JOIN AreaTable ON MembershipTable.Area = AreaTable.Areaid WHERE (MembershipTable.ChurchDetailID = @chu) AND (MembershipTable.Memberid &lt;&gt; N'MEB1') AND (AreaTable.AreaName = @area)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtcriteria" Name="area" PropertyName="Text" />
                    </SelectParameters>
            </asp:SqlDataSource>


           

                <asp:GridView ID="GrdService" runat="server" Width="1015px" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource10" Font-Size="Medium" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="2" BorderStyle="Solid" style="font-size: small; ">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="ServiceName" HeaderText="Service" SortExpression="ServiceName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Phone1" HeaderText="Phone" SortExpression="Phone1" />
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
                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, UnitTable.ServiceName, MembershipTable.LastName, MembershipTable.FirstName, MembershipTable.Gender, MembershipTable.Phone1 FROM ChurchDetailTable INNER JOIN MembershipTable ON ChurchDetailTable.ChurchDetailID = MembershipTable.ChurchDetailID INNER JOIN MembersUnit ON MembershipTable.Memberid = MembersUnit.Memberid INNER JOIN UnitTable ON MembersUnit.ServiceUnitID = UnitTable.ServiceId WHERE (ChurchDetailTable.ChurchDetailID = @chu) AND (MembershipTable.Memberid &lt;&gt; N'MEB1') AND (UnitTable.ServiceName = @ser)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtcriteria" Name="ser" PropertyName="Text" />
                    </SelectParameters>
            </asp:SqlDataSource>


           

                <asp:GridView ID="GrdState" runat="server" Width="1015px" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource12" Font-Size="Medium" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="2" BorderStyle="Solid" style="font-size: small; ">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Phone1" HeaderText="Phone" SortExpression="Phone1" />
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
                <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, MembershipTable.LastName, MembershipTable.FirstName, MembershipTable.Gender, StateTable.State, MembershipTable.Phone1 FROM MembershipTable INNER JOIN ChurchDetailTable ON MembershipTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID INNER JOIN StateTable ON MembershipTable.StateofOrgin = StateTable.Stateid WHERE (MembershipTable.StateofOrgin = @state) AND (ChurchDetailTable.ChurchDetailID = @chu) AND (MembershipTable.Memberid &lt;&gt; N'MEB1')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="stateID" Name="state" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    </SelectParameters>
            </asp:SqlDataSource>


           

                <asp:GridView ID="GrdStatus" runat="server" Width="1015px" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" Font-Size="Medium" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="2" BorderStyle="Solid" style="font-size: small; ">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Phone1" HeaderText="Phone" SortExpression="Phone1" />
                    <asp:BoundField DataField="MartialStatus" HeaderText="Martial Status" SortExpression="MartialStatus" />
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
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, FirstName, LastName, Gender, Address, Phone1, MartialStatus FROM MembershipTable WHERE (Memberid &lt;&gt; N'MEB1') AND (MartialStatus = @Single)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtcriteria" Name="Single" PropertyName="Text" />
                    </SelectParameters>
            </asp:SqlDataSource>


           

                <asp:GridView ID="GrdMembersGroups" runat="server" Width="1015px" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource11" Font-Size="Medium" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="2" BorderStyle="Solid" style="font-size: small; ">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Phone1" HeaderText="Phone" SortExpression="Phone1" />
                    <asp:BoundField DataField="GroupName" HeaderText="Groups" SortExpression="GroupName" />
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
                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, MembershipTable.FirstName, MembershipTable.LastName, MembershipTable.Gender, MembershipTable.Address, MembershipTable.Phone1, MembershipTable.MartialStatus, MembersGroup.GroupName FROM MembershipTable INNER JOIN MembersGroup ON MembershipTable.MemberssGroup = MembersGroup.ID WHERE (MembershipTable.Memberid &lt;&gt; N'MEB1') AND (MembersGroup.GroupName = @Group )">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtcriteria" Name="Group" PropertyName="Text" />
                    </SelectParameters>
            </asp:SqlDataSource>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Familyid, FamilyName + ' ' + FamilyFirstName AS [Father Name] FROM FamilyTable WHERE (Familyid &lt;&gt; N'FAM1')"></asp:SqlDataSource>


                                        <asp:SqlDataSource ID="MembersDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [ID], [GroupName] FROM [MembersGroup]"></asp:SqlDataSource>


           

                <asp:GridView ID="GrdMonth" runat="server" Width="1015px" AutoGenerateColumns="False" CellPadding="4" DataSourceID="DOBDS4" Font-Size="Medium" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="2" BorderStyle="Solid" style="font-size: small; " DataKeyNames="Memberid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" ReadOnly="True" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Phone1" HeaderText="Phone" SortExpression="Phone1" />
                    <asp:BoundField DataField="Occupation" HeaderText="Occupation" SortExpression="Occupation" />
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


           

                <asp:GridView ID="GrdAllFamily" runat="server" Width="1015px" AutoGenerateColumns="False" CellPadding="4" DataSourceID="AllFamiDS" Font-Size="Medium" ForeColor="#333333" GridLines="None" AllowPaging="True" CellSpacing="2" BorderStyle="Solid" style="font-size: small; " PageSize="6">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="FamilyID" HeaderText="FamilyID" SortExpression="FamilyID" Visible="False" />
                    <asp:BoundField DataField="FamilyName" HeaderText="Family Name" SortExpression="FamilyName" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FullName" HeaderText="Full Name" SortExpression="FullName" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
               <asp:TemplateField HeaderText="Image">
        <ItemTemplate>
        <asp:Image ID="Image1" runat="server" Width="200px" Height="200px" 
                   ImageUrl='<%# "Handler2.ashx?ID=" + Convert.ToString(Eval("ID"))%>'/>
        </ItemTemplate>
                   <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
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
                <asp:SqlDataSource ID="AllFamiDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT FamilyImageTable.ID, FamilyImageTable.FamilyID, FamilyTable.FamilyName, FamilyImageTable.FullName FROM FamilyImageTable INNER JOIN FamilyTable ON FamilyImageTable.FamilyID = FamilyTable.Familyid WHERE (FamilyImageTable.FamilyID = @FamilID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtcriteria" Name="FamilID" PropertyName="Text" />
                    </SelectParameters>
            </asp:SqlDataSource>
                <asp:SqlDataSource ID="DOBDS4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, Memberid, LastName, FirstName, Gender, DOB, MONTH(DOB) AS Month, Address, Phone1, Occupation FROM MembershipTable WHERE (Memberid &lt;&gt; N'MEB1') AND (MONTH(DOB) = @MonthSS)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtcriteria" Name="MonthSS" PropertyName="Text" />
                    </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="MonthDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [SN], [Monthvalue], [Month] FROM [MonthTable]"></asp:SqlDataSource>
                                        <asp:SqlDataSource ID="ServiceDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [ServiceId], [ServiceName] FROM [UnitTable]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="StateDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [SN], [Stateid], [State] FROM [StateTable]"></asp:SqlDataSource>
                                        <asp:TextBox ID="txtcriteria0" runat="server" Visible="False"></asp:TextBox>


            <asp:TextBox ID="Txtselect" runat="server" Visible="False"></asp:TextBox>
                                        <asp:TextBox ID="txtDownloadFamily" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
            <br />
            <br />


           

            </div>
    </div>

   
    <div class="footer">
        <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p>
    </div>
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
