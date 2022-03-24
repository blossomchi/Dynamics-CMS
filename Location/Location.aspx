<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Location.aspx.vb" Inherits="Location" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        
        <div class="clear-fix">   </div>
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
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Font-Size="Large" Text="Category"></asp:Label>
&nbsp;<asp:DropDownList ID="DrpCriteria" runat="server" Height="22px" Width="200px" AutoPostBack="True">
                <asp:ListItem>State</asp:ListItem>
                <asp:ListItem>Town</asp:ListItem>
                <asp:ListItem>Church Assign</asp:ListItem>
                <asp:ListItem>Church Unassigned</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<asp:DropDownList ID="DrpCriteria2" runat="server" Height="22px" Width="200px" Visible="False" AutoPostBack="True">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="BtnSearch" runat="server" Text="Search" Visible="False" />
            <br />
            <br />
        </div>
        <div>
            <asp:GridView ID="GVAllChurch" runat="server" Width="923px" DataSourceID="searchDS" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: medium" CellSpacing="2">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Branch" HeaderText="Church Hierarchy" SortExpression="Branch" />
                    <asp:BoundField DataField="ChurchName" HeaderText="Churches" SortExpression="ChurchName" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:CheckBoxField DataField="Assign" HeaderText="Assign" SortExpression="Assign" />
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
            <asp:GridView ID="GVUnsigned" runat="server" Width="923px" DataSourceID="UnsignedDS" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="15" ShowFooter="True" style="font-size: medium" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Branch" HeaderText="Church Hierarchy" SortExpression="Branch" />
                    <asp:BoundField DataField="ChurchName" HeaderText="Churches" SortExpression="ChurchName" />
                    <asp:CheckBoxField DataField="Assign" HeaderText="Assign" SortExpression="Assign" />
                    <asp:CommandField SelectText="Assign" ShowSelectButton="True" />
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
            <asp:GridView ID="GVSigned" runat="server" Width="923px" DataSourceID="UnsignedDS" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="15" ShowFooter="True" style="font-size: medium" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Branch" HeaderText="Church Hierarchy" SortExpression="Branch" />
                    <asp:BoundField DataField="ChurchName" HeaderText="Churches" SortExpression="ChurchName" />
                    <asp:CheckBoxField DataField="Assign" HeaderText="Assign" SortExpression="Assign" />
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
            <asp:SqlDataSource ID="UnsignedDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChurchDetailTable.SN, ChurchDesignationTable.Branch, ChurchDetailTable.ChurchName, ChurchDetailTable.Assign FROM ChurchDetailTable INNER JOIN ChurchDesignationTable ON ChurchDetailTable.ChurchDesgID = ChurchDesignationTable.ChurchDesgID WHERE (ChurchDetailTable.Assign = @Assigned) ORDER BY ChurchDetailTable.SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtAssigned" Name="Assigned" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="searchDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChurchDetailTable.SN, ChurchDesignationTable.Branch, ChurchDetailTable.ChurchName, ChurchDetailTable.Assign, ChurchDetailTable.Address FROM ChurchDetailTable INNER JOIN ChurchDesignationTable ON ChurchDetailTable.ChurchDesgID = ChurchDesignationTable.ChurchDesgID ORDER BY ChurchDetailTable.SN"></asp:SqlDataSource>
            <asp:GridView ID="GVState" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataState" ForeColor="#333333" GridLines="None" PageSize="15" style="font-size: medium" Width="923px" ShowFooter="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Branch" HeaderText="Church Hierarchy" SortExpression="Branch" />
                    <asp:BoundField DataField="ChurchName" HeaderText="Churches" SortExpression="ChurchName" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
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
            <asp:SqlDataSource ID="SqlDataState" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChurchDetailTable.SN, ChurchDesignationTable.Branch, ChurchDetailTable.ChurchName, StateTable.State, ChurchDetailTable.Address FROM ChurchDetailTable INNER JOIN ChurchDesignationTable ON ChurchDetailTable.ChurchDesgID = ChurchDesignationTable.ChurchDesgID INNER JOIN StateTable ON ChurchDetailTable.Stateid = StateTable.Stateid ORDER BY ChurchDetailTable.SN"></asp:SqlDataSource>
            <asp:GridView ID="GVTown" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataTown" ForeColor="#333333" GridLines="None" PageSize="15" style="font-size: medium" Width="923px" ShowFooter="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Branch" HeaderText="Church Hierarchy" SortExpression="Branch" />
                    <asp:BoundField DataField="ChurchName" HeaderText="Churches" SortExpression="ChurchName" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                    <asp:BoundField DataField="Name" HeaderText="Town" SortExpression="Name" />
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
            <asp:SqlDataSource ID="SqlDataTown" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChurchDetailTable.SN, ChurchDesignationTable.Branch, ChurchDetailTable.ChurchName, StateTable.State, Location.Name FROM ChurchDesignationTable INNER JOIN ChurchDetailTable ON ChurchDesignationTable.ChurchDesgID = ChurchDetailTable.ChurchDesgID INNER JOIN StateTable ON ChurchDetailTable.Stateid = StateTable.Stateid INNER JOIN Location ON ChurchDetailTable.Locationid = Location.Locationid ORDER BY ChurchDetailTable.SN"></asp:SqlDataSource>
           
            <asp:GridView ID="GVCriteria2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: medium" Width="923px" AllowPaging="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="ChurchName" HeaderText="Churches" SortExpression="ChurchName" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChurchDetailTable.SN, ChurchDetailTable.ChurchName, StateTable.State, ChurchDetailTable.Address FROM ChurchDetailTable INNER JOIN StateTable ON ChurchDetailTable.Stateid = StateTable.Stateid WHERE (ChurchDetailTable.Stateid = @state) ORDER BY ChurchDetailTable.SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCriteria2" Name="state" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GVCriteria3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: medium" Width="923px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="ChurchName" HeaderText="Churches" SortExpression="ChurchName" />
                    <asp:BoundField DataField="Name" HeaderText="Location Name" SortExpression="Name" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChurchDetailTable.SN, ChurchDetailTable.ChurchName, ChurchDetailTable.Locationid, Location.Name, ChurchDetailTable.Address FROM ChurchDetailTable INNER JOIN Location ON ChurchDetailTable.Locationid = Location.Locationid WHERE (ChurchDetailTable.Locationid = @location) ORDER BY ChurchDetailTable.SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCriteria3" Name="location" PropertyName="Text" />
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
               
         <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p>  </div>
        </div>
          </form>
</body>
</html>
