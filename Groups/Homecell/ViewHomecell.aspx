<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewHomecell.aspx.vb" Inherits="ViewHomecell" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>View Homecell</title>
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
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Enter House Fellowship" class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="40px" Width="190px" />
            &nbsp;&nbsp;<br />
            <br />
            </div>
        <div>
        
                &nbsp;<asp:DropDownList ID="DrpSorted" class="chosen-select" runat="server" Height="22px" Width="150px" AutoPostBack="True">
                <asp:ListItem>Ascending</asp:ListItem>
                <asp:ListItem>Area</asp:ListItem>
                <asp:ListItem>Leader</asp:ListItem>
            </asp:DropDownList>
                                        <asp:DropDownList ID="CBHomeCellArea" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="HomeCellArea" DataTextField="AreaName" DataValueField="AreaName" Visible="False" Width="150px">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="CBHomeCellMinister" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="MinDS" DataTextField="CellMinister" DataValueField="CellMinister" Visible="False" Width="150px">
                                        </asp:DropDownList>
                             &nbsp;<asp:TextBox ID="txtcriteria" runat="server"></asp:TextBox>
           &nbsp;<asp:Button ID="btnSearch" runat="server" class="a_demo_one" Text="Search" style="height: 33px" Width="70px" />          </div>
            <div>
            &nbsp;
        </div>
        <div>
            <asp:GridView ID="Gridhomecell" runat="server" Width="1150px" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="1" Height="50px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" SortExpression="SN" ReadOnly="True" />
                    <asp:BoundField DataField="Zones" HeaderText="Zones" SortExpression="Zones" />
                    <asp:BoundField DataField="Cell" HeaderText="Cell" SortExpression="Cell" />
                    <asp:BoundField DataField="Adress" HeaderText="Adress" SortExpression="Adress" />
                    <asp:BoundField DataField="CellMinister" HeaderText="Cell Minister" SortExpression="CellMinister" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                    <asp:BoundField DataField="AreaName" HeaderText="Area" SortExpression="AreaName" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" />
                    <asp:CommandField ShowSelectButton="True" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT HomecellTable.SN, HomeCellZonesTable.Zones, HomecellTable.Name AS Cell, HomecellTable.Adress, HomecellTable.CellMinister, HomecellTable.Phone, Location.Name AS Location, AreaTable.AreaName, HomecellTable.Datecreated FROM HomecellTable INNER JOIN AreaTable ON HomecellTable.AreaId = AreaTable.Areaid INNER JOIN Location ON AreaTable.Locationid = Location.Locationid INNER JOIN HomeCellZonesTable ON HomecellTable.ZoneSN = HomeCellZonesTable.ZoneSN"></asp:SqlDataSource>
            <asp:GridView ID="GridArea" runat="server" Width="1150px" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="15" ShowFooter="True" style="font-size: small; font-weight: 700;" Visible="False" DataKeyNames="ChurchDetailID" Height="50px" CellSpacing="1">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="AreaName" HeaderText="Area" SortExpression="AreaName" />
                    <asp:BoundField DataField="Adress" HeaderText="Adress" SortExpression="Adress" />
                    <asp:BoundField DataField="CellMinister" HeaderText="Cell Minister" SortExpression="CellMinister" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT HomecellTable.SN, HomecellTable.Name, HomecellTable.Adress, HomecellTable.CellMinister, HomecellTable.Phone, AreaTable.AreaName, ChurchDetailTable.ChurchDetailID FROM AreaTable INNER JOIN HomecellTable ON AreaTable.Areaid = HomecellTable.AreaId INNER JOIN ChurchDetailTable ON HomecellTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (ChurchDetailTable.ChurchDetailID = @chu) AND (AreaTable.AreaName = @area)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtcriteria" Name="area" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridLeader" runat="server" Width="1150px" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small; font-weight: 700;" Visible="False" Height="50px" CellSpacing="1">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Adress" HeaderText="Adress" SortExpression="Adress" />
                    <asp:BoundField DataField="CellMinister" HeaderText="Cell Minister" SortExpression="CellMinister" />
                    <asp:BoundField DataField="MinsterAdd" HeaderText="Minster Address" SortExpression="MinsterAdd" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT HomecellTable.SN, HomecellTable.Name, HomecellTable.Adress, HomecellTable.CellMinister, HomecellTable.MinsterAdd, HomecellTable.Phone FROM AreaTable INNER JOIN HomecellTable ON AreaTable.Areaid = HomecellTable.AreaId WHERE (HomecellTable.CellMinister = @min)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtcriteria" Name="min" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridName" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" style="font-size: small; font-weight: 700;" Width="1150px" ShowFooter="True" Height="50px" CellSpacing="1">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Adress" HeaderText="Adress" SortExpression="Adress" />
                    <asp:BoundField DataField="CellMinister" HeaderText="Cell Minister" SortExpression="CellMinister" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="AreaName" HeaderText="Area" SortExpression="AreaName" />
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
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT HomecellTable.SN, HomecellTable.Name, HomecellTable.Adress, HomecellTable.CellMinister, HomecellTable.Phone, AreaTable.AreaName FROM Location INNER JOIN AreaTable ON Location.Locationid = AreaTable.Locationid INNER JOIN HomecellTable ON AreaTable.Areaid = HomecellTable.AreaId WHERE (HomecellTable.Name = @name)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtcriteria" Name="name" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
                                        <asp:SqlDataSource ID="HomeCellArea" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Areaid], [AreaName] FROM [AreaTable]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="MinDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT CellMinister FROM HomecellTable GROUP BY CellMinister"></asp:SqlDataSource>
            <br />
            <asp:TextBox ID="txtCriteria2" runat="server" Visible="False" Width="18px"></asp:TextBox>
            <asp:TextBox ID="txtCriteria3" runat="server" Visible="False" Width="18px"></asp:TextBox>

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtLocation" runat="server" Visible="False" Width="16px"></asp:TextBox>

                       <asp:TextBox ID="txtSn" runat="server" Visible="False" Width="16px"></asp:TextBox>

                       <asp:TextBox ID="txtLocation1" runat="server" Visible="False" Width="16px"></asp:TextBox>

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
