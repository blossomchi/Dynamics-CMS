<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewSupplier.aspx.vb" Inherits="ViewSupplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Supplier</title>
       <link href="css/style.css" rel="stylesheet" />
       <link href="../../css/menu.css" rel="stylesheet" />
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
            &nbsp;<asp:Button ID="Button1" runat="server" class="a_demo_one" Text="Record New Suppliers" style="font-style: italic; font-weight: 700;" Height="30px" Width="192px" BackColor="#eeeeee" />
            <br />
            <br />
&nbsp;<asp:DropDownList ID="DrpCriteria" runat="server" class="chosen-select"  Height="22px" Width="200px" AutoPostBack="True">
                <asp:ListItem>Ascending</asp:ListItem>
                <asp:ListItem>Company&#39;s Name</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<asp:DropDownList  class="chosen-select" ID="DrpCriteria2" runat="server"  Height="15px" Width="200px" Visible="False" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="CompanyName" DataValueField="CompanyName">
            </asp:DropDownList>
            <br />
            <br />
            </div>
        <div>
            <asp:GridView ID="GVAllMinister" runat="server" Width="1150px" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Supplerid" HeaderText="Suppler Id" InsertVisible="False" ReadOnly="True" SortExpression="Supplerid" />
                    <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
                    <asp:BoundField DataField="Address1" HeaderText="Address" SortExpression="Address1" />
                    <asp:BoundField DataField="Phone1" HeaderText="Phone" SortExpression="Phone1" />
                    <asp:BoundField DataField="Bankname" HeaderText="Bank" SortExpression="Bankname" />
                    <asp:BoundField DataField="AccountNo" HeaderText="Account No" SortExpression="AccountNo" />
                    <asp:BoundField DataField="AccountName" HeaderText="Account Name" SortExpression="AccountName" />
                    <asp:BoundField DataField="Supply" HeaderText="Supply" SortExpression="Supply" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" />
                    <asp:BoundField DataField="Updatedby" HeaderText="Updated By" SortExpression="Updatedby" />
                      <asp:TemplateField ShowHeader="False">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" 
                                  CommandName="DeleteItem" ImageUrl="~/Images/Delete_icon.png" Text="Delete" Tooltip="Delete"  CommandArgument='<%#Eval("Supplerid") %>'/>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT CompanyName, Address1, Phone1, Bankname, AccountNo, AccountName, Supply, Datecreated, Updatedby, Supplerid FROM SupplierTable WHERE (churchid = @chu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GVTitle" runat="server" Width="1150px" DataSourceID="SqlTitle" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="15" ShowFooter="True" style="font-size: small" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="CompanyName" HeaderText="Company's Name" SortExpression="CompanyName" />
                    <asp:BoundField DataField="Address1" HeaderText="Address" SortExpression="Address1" />
                    <asp:BoundField DataField="Phone1" HeaderText="Phone" SortExpression="Phone1" />
                    <asp:BoundField DataField="Bankname" HeaderText="Bank" SortExpression="Bankname" />
                    <asp:BoundField DataField="AccountNo" HeaderText="Account No" SortExpression="AccountNo" />
                    <asp:BoundField DataField="AccountName" HeaderText="Account Name" SortExpression="AccountName" />
                    <asp:BoundField DataField="Supply" HeaderText="Supply" SortExpression="Supply" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Date Created" SortExpression="Datecreated" />
                    <asp:BoundField DataField="Updatedby" HeaderText="Updated By" SortExpression="Updatedby" />
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
            <asp:SqlDataSource ID="SqlTitle" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT CompanyName, Address1, Phone1, Bankname, AccountNo, AccountName, Supply, Datecreated, Updatedby FROM SupplierTable WHERE (CompanyName = @name)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DrpCriteria2" Name="name" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [CompanyName], [Supplerid] FROM [SupplierTable]"></asp:SqlDataSource>
            <br />
            <asp:TextBox ID="txtAssigned" runat="server" Visible="False" Width="16px"></asp:TextBox>
            <asp:TextBox ID="txtAssignedID" runat="server" Visible="False" Width="10px"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtCriteria2" runat="server" Visible="False" Width="18px"></asp:TextBox>
            <asp:TextBox ID="txtCriteria3" runat="server" Visible="False" Width="18px"></asp:TextBox>
                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
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
