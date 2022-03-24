<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DefineUser.aspx.vb" Inherits="DefineUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
           <title>Define Users</title>
   <link href="css/Style.css" rel="stylesheet" />
    <link href="css/style2.css" rel="stylesheet" />
    <link href="../css/menu.css" rel="stylesheet" />
    <%--  <link href="../css/menu.css" rel="stylesheet" />--%>
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
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblname0" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px">LOG IN AS :</asp:Label>
                   <asp:Label ID="AdminLabel" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname1" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbChurchName" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbLocation" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lbLocation0" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbState" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
            <asp:Label ID="Label7" runat="server" CssClass="label"></asp:Label>
<asp:Label ID="lblserviceid" runat="server" CssClass="label"></asp:Label>
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
         <p>
         <asp:Button ID="Button1" runat="server" Text="Add Non Member" class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="40px" Width="160px" />
             &nbsp;<asp:Button ID="AccessCon" runat="server" Text="Access Control" class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="40px" Width="160px" />
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
         <p>
             &nbsp;</p>
            <div class="formbox">
            <div class="formframe">
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Member" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="drpMember" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="FULLNAME" DataValueField="Memberid" Width="210px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, MembershipTable.Memberid, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS FULLNAME FROM MembershipTable INNER JOIN FamilyTable ON MembershipTable.FamilyID = FamilyTable.Familyid WHERE (FamilyTable.FamilyName &lt;&gt; N'UZOMA') ORDER BY FULLNAME"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Designation" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="drpDesignation" class="chosen-select" runat="server" DataSourceID="SqlDataSource3" DataTextField="Role" DataValueField="Roleid" Width="210px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Roleid], [Role] FROM [RoleTable]"></asp:SqlDataSource>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Username" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Password" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Minimum Character 6" CssClass="input" TextMode="Password"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Question1" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DrpQuestion" CssClass="drop-down" runat="server" DataSourceID="SqlDataSource6" DataTextField="Question" DataValueField="Question">
                    </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Question] FROM [QuestionTable]"></asp:SqlDataSource>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label15" runat="server" Text="Answer" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAns" runat="server" CssClass="input"></asp:TextBox>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label13" runat="server" Text="Question2" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DrpQuestion2" CssClass="drop-down" runat="server" DataSourceID="SqlDataSource4" DataTextField="Question" DataValueField="Question">
                    </asp:DropDownList>
                          <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Question] FROM [QuestionTable]"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Answer" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAns2" runat="server" CssClass="input"></asp:TextBox>
                </div>
                   <div class="form-group">

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtLocation" runat="server" Visible="False" Width="16px"></asp:TextBox>

                       <asp:TextBox ID="txtMeID" runat="server" Visible="False" Width="16px"></asp:TextBox>

                       <asp:TextBox ID="txtIDD" runat="server" Visible="False" Width="16px"></asp:TextBox>

                       </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Save" Width="80px" Height="30px"/>
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="80px" style="height: 30px" />

            </div>
                </div>
            <div class="item-right">

            <asp:GridView ID="gridLocation" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" Font-Size="Medium" Height="30px" Width="700px" AllowPaging="True" AllowSorting="True" ForeColor="#333333" GridLines="None" PageSize="6" DataKeyNames="SN" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" ReadOnly="True" SortExpression="SN" InsertVisible="False" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="True" />
                    <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                    <asp:BoundField DataField="Phone1" HeaderText="Phone1" SortExpression="Phone1" />
                    <asp:BoundField DataField="MartialStatus" HeaderText="MartialStatus" SortExpression="MartialStatus" />
                    <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated" DataFormatString="{0:dd/MM/yyyy}" />
                     <asp:TemplateField ShowHeader="False">
                                  <ItemTemplate>
                                      <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" 
                                          CommandName="Select" ImageUrl="~/Groups/Group/Images/Edit.png" Text="Select" ToolTip="View"/>
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
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT UserTable.SN, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS Name, RoleTable.Role, MembershipTable.Phone1, MembershipTable.MartialStatus, UserTable.DateCreated FROM UserTable INNER JOIN MembershipTable ON UserTable.Memberid = MembershipTable.Memberid INNER JOIN RoleTable ON UserTable.RoleID = RoleTable.Roleid WHERE (MembershipTable.LastName &lt;&gt; N'UZOMA')"></asp:SqlDataSource>

        </div>
                </div>
         <div class="clear-fix"></div> 

           </div>
        
        <div class="clear-fix"></div> 

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
