<%@ Page Language="VB" AutoEventWireup="false" CodeFile="HomeCellZones.aspx.vb" Inherits="Serviceunit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Cell Zones</title>
     <link href="css/style.css" rel="stylesheet" />
       <link href="../css/menu.css" rel="stylesheet" />
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
        <div class="bg-header"></div>
        <div class="header-text">
            <p class="church-watch">RolofDynamic Church Watch</p>
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
         <h2>Add Home Cell Zones</h2>
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
         <p>
             &nbsp;</p>
            <div class="formbox">
            <div class="formframe">
                 <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Zones" CssClass="label"></asp:Label>
                    <asp:TextBox ID="Zones" runat="server" CssClass="input" placeholder="Enter Zones" Width="180px" ></asp:TextBox>
                </div>
                <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="NextBnt0" runat="server"  Text="New" Width="80px" Height="30px" ToolTip="Click to enter new zones"/>
              
                <asp:Button ID="NextBnt" runat="server"  Text="Next" Width="80px" Height="30px"/>
              
                <asp:Button ID="btnCancel0" runat="server" Text="Pastors" Width="96px" ToolTip="Click to enter only pastors" Height="30px" />

            </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Zones" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="CBZones" runat="server"  class="chosen-select" AutoPostBack="True" Width="190px" DataSourceID="ZonesDS" DataTextField="Zones" DataValueField="ZoneSN" Enabled="False">
                    </asp:DropDownList>
                </div>
                   <div class="form-group">
                    <asp:Label ID="Label15" runat="server" Text="Enter By:" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtenter" runat="server" CssClass="input" Width="180px" Enabled="False" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Pastor Type" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="PastorType" runat="server"  class="chosen-select" AutoPostBack="True" Width="190px" Enabled="False">
                        <asp:ListItem>ZONAL PASTOR</asp:ListItem>
                        <asp:ListItem>ASSISTANT ZONAL PASSTOR</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Pastor" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="input" placeholder="Enter Pastors" Width="180px" Enabled="False" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Phone" CssClass="label"></asp:Label>
                    <asp:TextBox ID="TxtPhones" runat="server" CssClass="input" placeholder="Enter Pastor Number" Width="180px" Enabled="False" ></asp:TextBox>
                </div>
                                  <div class="form-group">
                     <asp:TextBox ID="txtPendingServices" runat="server" Font-Size="XX-Small" Visible="False" Width="20px" Height="19px"></asp:TextBox>
                     <asp:TextBox ID="txtServicesId" runat="server" Font-Size="XX-Small" Visible="False" Width="20px" Height="19px"></asp:TextBox>
                       </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Save" Width="80px" Height="30px" Enabled="False"/>
                <asp:Button ID="btnCancel" runat="server" Text="Refresh" Width="80px" style="height: 30px" Enabled="False" />

            </div>
                </div>
                <div class="item-right">

                    <asp:GridView ID="GridUnit" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="100px" PageSize="6" style="font-size: medium" Width="500px" AllowPaging="True" AllowSorting="True" DataKeyNames="SN">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN">
                            </asp:BoundField>
                            <asp:BoundField DataField="Zones" HeaderText="Zones" SortExpression="Zones">
                            </asp:BoundField>
                            <asp:BoundField DataField="PastorType" HeaderText="Pastor Type" SortExpression="PastorType">
                            </asp:BoundField>
                             <asp:BoundField DataField="Pastor" HeaderText="Pastor" SortExpression="Pastor" />
                             <asp:BoundField DataField="PastorsNumber" HeaderText="Number" SortExpression="PastorsNumber" />
                             <asp:TemplateField>
                                          <ItemTemplate>
                                      <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" 
                                          CommandName="Select" ImageUrl="~/Account Info/Dash Board/Images/good.png" Text="Select" ToolTip="View"/>
                                  </ItemTemplate>
                                     </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImageButton14" runat="server" CausesValidation="false" 
                                  CommandName="DeleteBank" ImageUrl="~/Account Info/Dash Board/Images/del.png" Text="Delete" 
                                     Tooltip="Delete" CommandArgument='<%#Eval("SN")%>'/>
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT HomeCellZonesPastorsTable.SN, HomeCellZonesTable.Zones, HomeCellZonesPastorsTable.PastorType, HomeCellZonesPastorsTable.Pastor, HomeCellZonesPastorsTable.PastorsNumber FROM HomeCellZonesTable INNER JOIN HomeCellZonesPastorsTable ON HomeCellZonesTable.ZoneSN = HomeCellZonesPastorsTable.ZoneSN ORDER BY HomeCellZonesTable.Zones"></asp:SqlDataSource>

                    <asp:SqlDataSource ID="ZonesDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [ZoneSN], [Zones] FROM [HomeCellZonesTable]"></asp:SqlDataSource>

                    </div>
                </div>
         <div class="clear-fix"></div> 
        <div>

        </div>
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
