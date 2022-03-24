<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewVisitor.aspx.vb" Inherits="ViewVisitor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>View Vistor</title>
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
            <br />
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Add visitor" class="a_demo_one"  Height="40px" Width="100px" />
            &nbsp;&nbsp;<br />
            <br />
            </div>
   
 <div>
                    &nbsp;<asp:DropDownList ID="DrpSorted" runat="server" Height="25px" Width="180px" AutoPostBack="True">
                        <asp:ListItem>Ascending</asp:ListItem>
                    <asp:ListItem>Surname</asp:ListItem>
                    <asp:ListItem>Firstname</asp:ListItem>
                    <asp:ListItem>Phone Number</asp:ListItem>
                    </asp:DropDownList>
                  
                    &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtcriteria" runat="server" Font-Size="Medium" Height="19px" Width="180px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;<asp:Button ID="Button3" class="a_demo_one" Height="40px" Width="80px"  runat="server" Text="Search" Font-Size="10pt" />
                    <br />
                  
                </div>           <div>
            &nbsp;
        </div>
        <div>
            <asp:GridView ID="GrdVisitor" runat="server" Width="1150px" DataSourceID="SqlDataSource5" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" Height="50px" BorderStyle="Solid" DataKeyNames="SN" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Visitor" HeaderText="Visitor" SortExpression="Visitor" />
                    <asp:BoundField DataField="Firstname" HeaderText="First Name" SortExpression="Firstname" />
                    <asp:BoundField DataField="Lastname" HeaderText="Surname" SortExpression="Lastname" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Respond" HeaderText="Respond" SortExpression="Respond" />
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
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT AddvisitorTable.SN, AddvisitorTable.Firstname, AddvisitorTable.Lastname, AddvisitorTable.Gender, AddvisitorTable.Phone, AddvisitorTable.Address, AddvisitorTable.Status, AddvisitorTable.Email, AddvisitorTable.Respond, AddvisitorTable.Visitor FROM AddvisitorTable INNER JOIN ChurchDetailTable ON AddvisitorTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (ChurchDetailTable.ChurchDetailID = @chu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GrdvSurname" runat="server" Width="1150px" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: medium" Visible="False" DataKeyNames="SN" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Visitor" HeaderText="Visitor" SortExpression="Visitor" />
                    <asp:BoundField DataField="Firstname" HeaderText="First Name" SortExpression="Firstname" />
                    <asp:BoundField DataField="Lastname" HeaderText="Surname" SortExpression="Lastname" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Respond" HeaderText="Respond" SortExpression="Respond" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT AddvisitorTable.SN, AddvisitorTable.Firstname, AddvisitorTable.Lastname, AddvisitorTable.Gender, AddvisitorTable.Phone, AddvisitorTable.Address, AddvisitorTable.Respond, AddvisitorTable.Status, AddvisitorTable.Email, AddvisitorTable.Visitor FROM AddvisitorTable INNER JOIN ChurchDetailTable ON AddvisitorTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (AddvisitorTable.Lastname = @lastn) AND (ChurchDetailTable.ChurchDetailID = @chu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtcriteria" Name="lastn" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GrdvFirstname" runat="server" Width="1150px" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: medium" Visible="False" Height="50px" BorderStyle="Solid" DataKeyNames="SN" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
<asp:BoundField DataField="Visitor" HeaderText="Visitor" SortExpression="Visitor"></asp:BoundField>
                    <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                    <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
<asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                    <asp:BoundField DataField="Respond" HeaderText="Respond" SortExpression="Respond" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT AddvisitorTable.SN, AddvisitorTable.Lastname, AddvisitorTable.Gender, AddvisitorTable.Phone, AddvisitorTable.Address, AddvisitorTable.Respond, AddvisitorTable.Firstname, AddvisitorTable.Visitor, AddvisitorTable.Status FROM AddvisitorTable INNER JOIN ChurchDetailTable ON AddvisitorTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (AddvisitorTable.Firstname = @first) AND (ChurchDetailTable.ChurchDetailID = @chu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtcriteria" Name="first" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GrdvPhn" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" style="font-size: medium" Width="1150px" ShowFooter="True" Height="50px" BorderStyle="Solid" DataKeyNames="SN" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Visitor" HeaderText="Visitor" SortExpression="Visitor" />
                    <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
                    <asp:BoundField DataField="Lastname" HeaderText="Surname" SortExpression="Lastname" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Respond" HeaderText="Respond" SortExpression="Respond" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT AddvisitorTable.SN, AddvisitorTable.Lastname, AddvisitorTable.Firstname, AddvisitorTable.Gender, AddvisitorTable.Phone, AddvisitorTable.Address, AddvisitorTable.Respond, AddvisitorTable.Visitor, AddvisitorTable.Status FROM AddvisitorTable INNER JOIN ChurchDetailTable ON AddvisitorTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (AddvisitorTable.Phone = @phone) AND (ChurchDetailTable.ChurchDetailID = @chu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtcriteria" Name="phone" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
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
                  '.chosen-select': {}
              }
              for (var selector in config) {
                  $(selector).chosen(config[selector]);
              }
      </script>
    </form>
</body>
</html>
