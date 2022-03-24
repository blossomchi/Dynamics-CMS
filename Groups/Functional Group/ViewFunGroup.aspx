<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewFunGroup.aspx.vb" Inherits="ViewFunGroup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> View Functional Group</title>
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
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Add Functional Group"  class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="40px" Width="180px" />
            &nbsp;&nbsp;<br />
            <br />
            </div>
 <div>

                &nbsp;<asp:DropDownList ID="DrpCriteria" class="chosen-select" runat="server" Width="180px" AutoPostBack="True">
                        <asp:ListItem>Ascending</asp:ListItem>
                        <asp:ListItem>Functional Group</asp:ListItem>
                        <asp:ListItem>Committees</asp:ListItem>
                    </asp:DropDownList>

                    <asp:DropDownList ID="DrpCriteria2" class="chosen-select"  runat="server" Width="180px" AutoPostBack="True">
                    </asp:DropDownList>

                <br />

                </div>     
        <div>
            <asp:GridView ID="gridGroup" runat="server" Width="1150px" DataSourceID="SqlDataSource4" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="GroupName" HeaderText="Group Name" SortExpression="GroupName" />
                    <asp:BoundField DataField="ComName" HeaderText="Commitee Name" SortExpression="ComName" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="ChurchName" HeaderText="Church" SortExpression="ChurchName" />
                    <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated" />
                 <asp:TemplateField ShowHeader="False">
                                  <ItemTemplate>
                                      <asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" 
                                          CommandName="Select" ImageUrl="~/Groups/Functional Group/Images/Edit.png" Text="Select" ToolTip="Edit"/>
                                  </ItemTemplate>
                         </asp:TemplateField>
                             <asp:TemplateField ShowHeader="False">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="false" 
                                  CommandName="DeleteMinstersID" ImageUrl="~/Groups/Functional Group/Images/Delete_icon.png" Text="Delete" Tooltip="Delete" CommandArgument='<%#Eval("SN")%>'/>
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
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT FunctionalGroupTable.SN, MembersGroup.GroupName, CommTable.ComName, FunctionalGroupTable.Name, FunctionalGroupTable.PhoneNumber, ChurchDetailTable.ChurchName, FunctionalGroupTable.DateCreated FROM FunctionalGroupTable INNER JOIN CommTable ON FunctionalGroupTable.ComId = CommTable.ComId INNER JOIN ChurchDetailTable ON FunctionalGroupTable.Churchid = ChurchDetailTable.ChurchDetailID INNER JOIN MembersGroup ON FunctionalGroupTable.MemberGroupID = MembersGroup.ID WHERE (ChurchDetailTable.ChurchDetailID = @chu) ORDER BY FunctionalGroupTable.SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridCommitees" runat="server" Width="1150px" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small; font-weight: 700;" Visible="False" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="GroupName" HeaderText="Group Name" SortExpression="GroupName" />
                    <asp:BoundField DataField="ComName" HeaderText=" Commitee " SortExpression="ComName" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembersGroup.GroupName, CommTable.ComName, FunctionalGroupTable.Name, FunctionalGroupTable.PhoneNumber, FunctionalGroupTable.DateCreated FROM FunctionalGroupTable INNER JOIN CommTable ON FunctionalGroupTable.ComId = CommTable.ComId INNER JOIN MembersGroup ON FunctionalGroupTable.MemberGroupID = MembersGroup.ID WHERE (CommTable.ComName = @com) AND (FunctionalGroupTable.Churchid = @chuch)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearch" Name="com" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtchurchID" Name="chuch" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridFungroup" runat="server" Width="1150px" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small; font-weight: 700;" Visible="False" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
<asp:BoundField DataField="GroupName" HeaderText="Group Name" SortExpression="GroupName"></asp:BoundField>
                    <asp:BoundField DataField="ComName" HeaderText="Commitee Name" SortExpression="ComName" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT FunctionalGroupTable.SN, MembersGroup.GroupName, CommTable.ComName, FunctionalGroupTable.Name, FunctionalGroupTable.PhoneNumber, FunctionalGroupTable.DateCreated FROM FunctionalGroupTable INNER JOIN CommTable ON FunctionalGroupTable.ComId = CommTable.ComId INNER JOIN MembersGroup ON FunctionalGroupTable.MemberGroupID = MembersGroup.ID WHERE (FunctionalGroupTable.Churchid = @church) AND (MembersGroup.GroupName = @group ) ORDER BY FunctionalGroupTable.SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="church" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtSearch" Name="group" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <br />
            <asp:TextBox ID="txtCriteria2" runat="server" Visible="False" Width="18px"></asp:TextBox>
            <asp:TextBox ID="txtCriteria3" runat="server" Visible="False" Width="18px"></asp:TextBox>

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtLocation" runat="server" Visible="False" Width="16px"></asp:TextBox>

                       <asp:TextBox ID="txtSearch" runat="server" Visible="False" Width="16px"></asp:TextBox>

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
