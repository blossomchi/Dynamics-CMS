<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewMinister.aspx.vb" Inherits="ViewMinister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>View Minister</title>
     <script src="jquery/chosen.jquery.js"></script>
    <link href="jquery/chosen.css" rel="stylesheet" />
    <script src="jquery/Jquery/jquery-1.7.1.min.js"></script>
    <script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>
    <script src="jquery/chosen.jquery.min.js"></script>
    <script src="jquery/chosen.proto.min.js"></script>
    <script src="jquery/chosen.proto.js"></script>
    <link href="css/style2.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
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
       
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
        
        <div class="clear-fix">   

             &nbsp;&nbsp;&nbsp;
                   &nbsp; <asp:Label ID="lblname0" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px">LOG IN AS :</asp:Label>
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
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add Minister" class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="40px" Width="140px" />
            &nbsp;&nbsp;<br />
            <br />
            </div>
        <div>
        <asp:DropDownList ID="DrpCriteria" class="chosen-select" runat="server" Height="30px" Width="200px" AutoPostBack="True">
                <asp:ListItem>Ascending</asp:ListItem>
                <asp:ListItem>Title</asp:ListItem>
                <asp:ListItem>Post</asp:ListItem>
            </asp:DropDownList>
                             &nbsp;<asp:DropDownList  class="chosen-select" ID="DrpCriteria2" runat="server"  Height="30px" Width="200px" Visible="False" AutoPostBack="True">
            </asp:DropDownList>  
            <asp:DropDownList  class="chosen-select" ID="DrpChurch" runat="server"  Height="30px" Width="200px" Visible="False" AutoPostBack="True">
            </asp:DropDownList>  
        </div>
           <div>
            &nbsp;
        </div>
        <div style="font-size: small; font-weight: 700">
            <asp:GridView ID="GVAllMinister" runat="server" Width="1150px" DataSourceID="SqlDataSource4" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small; " CellSpacing="1" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="PastorsTypes" HeaderText="Member /None member" SortExpression="PastorsTypes" />
                    <asp:BoundField DataField="Branch" HeaderText="Hierarchy" SortExpression="Branch" />
                    <asp:BoundField DataField="ChurchName" HeaderText="Church" SortExpression="ChurchName" />
                    <asp:BoundField DataField="Name" HeaderText="Pastors' Name" SortExpression="Name" />
                    <asp:BoundField DataField="PhoneNo" HeaderText="Phone" SortExpression="PhoneNo" />
                    <asp:BoundField DataField="DutyName" HeaderText="Duty" SortExpression="DutyName" />
                    <asp:BoundField DataField="Services" HeaderText="Services" SortExpression="Services" />
                    <asp:BoundField DataField="DateCreated" HeaderText="Date Created" SortExpression="DateCreated" />
               <asp:TemplateField ShowHeader="False">
                                  <ItemTemplate>
                                      <asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" 
                                          CommandName="Select" ImageUrl="~/Minister/Images/Edit.png" Text="Select" ToolTip="Edit"/>
                                  </ItemTemplate>
                         </asp:TemplateField>
                             <asp:TemplateField ShowHeader="False">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="false" 
                                  CommandName="DeleteMinstersID" ImageUrl="~/Minister/Images/Delete_icon.png" Text="Delete" Tooltip="Delete" CommandArgument='<%#Eval("SN")%>'/>
                             </ItemTemplate>
                         </asp:TemplateField>
                    </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MinisterTable.SN, ChurchDetailTable.ChurchName, ChurchDesignationTable.Branch, MinisterTable.Name, MinisterTable.PhoneNo, MinisterTable.Title, MinisterTable.Services, MinisterTable.DateCreated, MinisterTable.CreatedBy, MinisterTable.PastorsTypes, DutyTable.DutyName FROM MinisterTable INNER JOIN ChurchDetailTable ON MinisterTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID INNER JOIN ChurchDesignationTable ON ChurchDetailTable.ChurchDesgID = ChurchDesignationTable.ChurchDesgID INNER JOIN DutyTable ON MinisterTable.Post = DutyTable.Dutyid ORDER BY MinisterTable.SN">
            </asp:SqlDataSource>
            <asp:TextBox ID="TXTSN" runat="server" Visible="False" Width="20px"></asp:TextBox>
            <asp:GridView ID="GVTitle" runat="server" Width="1150px" DataSourceID="SqlDataSource5" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small" Visible="False" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="PastorsTypes" HeaderText="Members / None Members" SortExpression="PastorsTypes" />
                    <asp:BoundField DataField="Branch" HeaderText="Branch" SortExpression="Branch" />
                    <asp:BoundField DataField="ChurchName" HeaderText="Church" SortExpression="ChurchName" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" SortExpression="PhoneNo" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="DutyName" HeaderText="Duty" SortExpression="DutyName" />
                    <asp:BoundField DataField="Services" HeaderText="Services" SortExpression="Services" />
               <asp:TemplateField ShowHeader="False">
                                  <ItemTemplate>
                                      <asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" 
                                          CommandName="Select" ImageUrl="~/Minister/Images/Edit.png" Text="Select" ToolTip="Edit"/>
                                  </ItemTemplate>
                         </asp:TemplateField>
                             <asp:TemplateField ShowHeader="False">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="false" 
                                  CommandName="DeleteMinstersID" ImageUrl="~/Minister/Images/Delete_icon.png" Text="Delete" Tooltip="Delete" CommandArgument='<%#Eval("SN")%>'/>
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
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MinisterTable.SN, MinisterTable.PastorsTypes, ChurchDesignationTable.Branch, ChurchDetailTable.ChurchName, MinisterTable.Name, MinisterTable.PhoneNo, MinisterTable.Title, DutyTable.DutyName, MinisterTable.Services FROM MinisterTable INNER JOIN ChurchDetailTable ON MinisterTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID INNER JOIN ChurchDesignationTable ON ChurchDetailTable.ChurchDesgID = ChurchDesignationTable.ChurchDesgID INNER JOIN DutyTable ON MinisterTable.Post = DutyTable.Dutyid WHERE (MinisterTable.Title = @title) AND (ChurchDetailTable.ChurchDetailID = @chu) ORDER BY MinisterTable.SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DrpCriteria2" Name="title" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GVTitle0" runat="server" Width="1150px" DataSourceID="NewSearch" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small" Visible="False" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="PastorsTypes" HeaderText="Members / None Member" SortExpression="PastorsTypes" />
                    <asp:BoundField DataField="Branch" HeaderText="Hierarchy" SortExpression="Branch" />
                    <asp:BoundField DataField="ChurchName" HeaderText="ChurchName" SortExpression="ChurchName" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo" SortExpression="PhoneNo" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="DutyName" HeaderText="DutyName" SortExpression="DutyName" />
                    <asp:BoundField DataField="Services" HeaderText="Services" SortExpression="Services" />
               <asp:TemplateField ShowHeader="False">
                                  <ItemTemplate>
                                      <asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" 
                                          CommandName="Select" ImageUrl="~/Minister/Images/Edit.png" Text="Select" ToolTip="Edit"/>
                                  </ItemTemplate>
                         </asp:TemplateField>
                             <asp:TemplateField ShowHeader="False">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="false" 
                                  CommandName="DeleteMinstersID" ImageUrl="~/Minister/Images/Delete_icon.png" Text="Delete" Tooltip="Delete" CommandArgument='<%#Eval("SN")%>'/>
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
            <asp:SqlDataSource ID="NewSearch" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MinisterTable.SN, MinisterTable.PastorsTypes, ChurchDesignationTable.Branch, ChurchDetailTable.ChurchName, MinisterTable.Name, MinisterTable.PhoneNo, MinisterTable.Title, DutyTable.DutyName, MinisterTable.Services FROM MinisterTable INNER JOIN ChurchDetailTable ON MinisterTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID INNER JOIN ChurchDesignationTable ON ChurchDetailTable.ChurchDesgID = ChurchDesignationTable.ChurchDesgID INNER JOIN DutyTable ON MinisterTable.Post = DutyTable.Dutyid WHERE (MinisterTable.Title = @title) AND (ChurchDetailTable.ChurchName = @ChurchName) ORDER BY MinisterTable.SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DrpCriteria2" Name="title" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DrpChurch" Name="ChurchName" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GVPost" runat="server" Width="1150px" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small" Visible="False" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
<asp:BoundField DataField="PastorsTypes" HeaderText="Members / None Members" SortExpression="PastorsTypes"></asp:BoundField>
                    <asp:BoundField DataField="Branch" HeaderText="Hierarchy" SortExpression="Branch" />
                    <asp:BoundField DataField="ChurchName" HeaderText="Church" SortExpression="ChurchName" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="PhoneNo" HeaderText="Phone" SortExpression="PhoneNo" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="DutyName" HeaderText="Duty" SortExpression="DutyName" />
                    <asp:BoundField DataField="Services" HeaderText="Services" SortExpression="Services" />
               <asp:TemplateField ShowHeader="False">
                                  <ItemTemplate>
                                      <asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" 
                                          CommandName="Select" ImageUrl="~/Minister/Images/Edit.png" Text="Select" ToolTip="Edit"/>
                                  </ItemTemplate>
                         </asp:TemplateField>
                             <asp:TemplateField ShowHeader="False">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="false" 
                                  CommandName="DeleteMinstersID" ImageUrl="~/Minister/Images/Delete_icon.png" Text="Delete" Tooltip="Delete" CommandArgument='<%#Eval("SN")%>'/>
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MinisterTable.SN, MinisterTable.PastorsTypes, ChurchDesignationTable.Branch, ChurchDetailTable.ChurchName, MinisterTable.Name, MinisterTable.PhoneNo, MinisterTable.Title, DutyTable.DutyName, MinisterTable.Services FROM MinisterTable INNER JOIN ChurchDetailTable ON MinisterTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID INNER JOIN ChurchDesignationTable ON ChurchDetailTable.ChurchDesgID = ChurchDesignationTable.ChurchDesgID INNER JOIN DutyTable ON MinisterTable.Post = DutyTable.Dutyid WHERE (ChurchDetailTable.ChurchDetailID = @chu) AND (DutyTable.DutyName = @Post) ORDER BY MinisterTable.SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    <asp:ControlParameter ControlID="DrpCriteria2" Name="Post" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
           
            <br />
            <asp:TextBox ID="txtCriteria2" runat="server" Visible="False" Width="18px"></asp:TextBox>
            <asp:TextBox ID="txtCriteria3" runat="server" Visible="False" Width="18px"></asp:TextBox>

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtLocation" runat="server" Visible="False" Width="16px"></asp:TextBox>

                       <asp:TextBox ID="txtChurchDetailID" runat="server" Visible="False" Width="16px"></asp:TextBox>

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
