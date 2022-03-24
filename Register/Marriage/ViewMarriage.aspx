<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewMarriage.aspx.vb" Inherits="ViewMarriage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Marriage Record</title>
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
            <p class="church-watch">&nbsp;&nbsp;RolofDynamics Church Watch</p>
               <p class="church-mgt">&nbsp;&nbsp;&nbsp;&nbsp; Church Management Software</p>
        </div>   
   <div style="float:right">
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
           </div>
        
        <div class="clear-fix">   

             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
            <br />&nbsp;<asp:Button ID="Button1" runat="server" Text="Record New Marriage"  class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="40px" Width="180px" />
            &nbsp;&nbsp;<br />
            <br />
            </div>
   <div>
                      &nbsp;<asp:DropDownList ID="DrpSorted" class="chosen-select" runat="server" Height="22px" Width="180px" AutoPostBack="True">
                <asp:ListItem>Ascending</asp:ListItem>
                <asp:ListItem>Month</asp:ListItem>
            </asp:DropDownList>
                             <asp:DropDownList ID="DrpDate" class="chosen-select" runat="server" Height="22px" Width="180px" AutoPostBack="True" Visible="False">
            </asp:DropDownList>

                    <asp:TextBox ID="txtSelectedDate" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                      <br />

                      <br />

        </div>   
        <div style="font-weight: 700">
            <asp:GridView ID="gridAscending" runat="server" Width="1150px" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="1" DataKeyNames="SN" Height="50px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="HUSBAND" HeaderText="HUSBAND" SortExpression="HUSBAND" ReadOnly="True" />
                    <asp:BoundField DataField="WIFE" HeaderText="WIFE" SortExpression="WIFE" ReadOnly="True" />
                    <asp:BoundField DataField="Pastor" HeaderText="Pastor" SortExpression="Pastor" />
                    <asp:BoundField DataField="Sponsor" HeaderText="Sponsor" SortExpression="Sponsor" />
                    <asp:BoundField DataField="MarriageDate" HeaderText="MarriageDate" SortExpression="MarriageDate" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="ResidentAddress" HeaderText="ResidentAddress" SortExpression="ResidentAddress" />
                    <asp:BoundField DataField="Datecreated" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Datecreated" SortExpression="Datecreated" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MarriageTable.SN, MarriageTable.Hfirstname + ' ' + MarriageTable.Hlastname AS HUSBAND, MarriageTable.Hparents, MarriageTable.Wfirstname + ' ' + MarriageTable.Wlastnamae AS WIFE, MarriageTable.Pastor, MarriageTable.Sponsor, MarriageTable.MarriageDate, MarriageTable.ResidentAddress, MarriageTable.Datecreated FROM MarriageTable CROSS JOIN ChurchDetailTable WHERE (ChurchDetailTable.ChurchDetailID = @chu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridMonth" runat="server" Width="1150px" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" PageSize="20" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="1" DataKeyNames="SN" Height="50px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="HUSBAND" HeaderText="HUSBAND" SortExpression="HUSBAND" ReadOnly="True" />
                    <asp:BoundField DataField="WIFE" HeaderText="WIFE" SortExpression="WIFE" ReadOnly="True" />
                    <asp:BoundField DataField="MarriageDate" HeaderText="MarriageDate" SortExpression="MarriageDate" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                    <asp:BoundField DataField="ResidentAddress" HeaderText="ResidentAddress" SortExpression="ResidentAddress" />
                    <asp:BoundField DataField="Pastor" HeaderText="Pastor" SortExpression="Pastor" />
                    <asp:BoundField DataField="Sponsor" HeaderText="Sponsor" SortExpression="Sponsor" />
                    <asp:BoundField DataField="Datecreated" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Datecreated" SortExpression="Datecreated" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, Hfirstname + ' ' + Hlastname AS HUSBAND, Hparents, Wfirstname + ' ' + Wlastnamae AS WIFE, Pastor, Sponsor, MarriageDate, ResidentAddress, Datecreated, Month FROM MarriageTable WHERE (Month = @month) AND (Churchid = @chu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DrpDate" Name="month" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:TextBox ID="txtAssigned" runat="server" Visible="False" Width="16px"></asp:TextBox>
            <asp:TextBox ID="txtAssignedID" runat="server" Visible="False" Width="10px"></asp:TextBox>
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
