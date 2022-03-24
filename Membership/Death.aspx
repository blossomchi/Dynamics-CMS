<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Death.aspx.vb" Inherits="Serviceunit" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Death</title>
    <link href="jquery/chosen.css" rel="stylesheet" />
    <script src="jquery/Jquery/jquery-1.7.1.min.js"></script>
    <script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>
    <script src="jquery/chosen.jquery.min.js"></script>
    <script src="jquery/chosen.proto.min.js"></script>
    <script src="jquery/chosen.proto.js"></script>
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
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
         <h2>Add Death</h2>
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
         <p>
             &nbsp;</p>
            <div class="formbox">
            <div class="formframe">
                 <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Select Member" CssClass="label"></asp:Label>
                     <asp:DropDownList ID="CBMember" runat="server" class="chosen-select"  Width="150px" AutoPostBack="True" DataSourceID="MemberDS" DataTextField="Member Name" DataValueField="SN">
                     </asp:DropDownList>
                     <asp:SqlDataSource ID="MemberDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, FirstName + ' ' + LastName AS [Member Name] FROM MembershipTable WHERE (Memberid &lt;&gt; N'MEB1')"></asp:SqlDataSource>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="OR " CssClass="label" Font-Bold="True"></asp:Label>
                     &nbsp;<asp:Label ID="Label16" runat="server" Font-Bold="True" Text="ENTER"></asp:Label>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Member Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtMemeber" runat="server" CssClass="input" Width="140px"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Phone Number" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="input" Width="140px"></asp:TextBox>
                </div>
                   <div class="form-group">
                    <asp:Label ID="Label15" runat="server" Text="Enter By:" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtenter" runat="server" CssClass="input" Width="140px"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Description" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtdesp" runat="server" CssClass="input" placeholder="Enter Group Discription" TextMode="MultiLine" Width="140px" ></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Date Of Death" CssClass="label"></asp:Label>
                     <telerik:RadDatePicker ID="DeathDate" Runat="server" Width="140px">
                     </telerik:RadDatePicker>
                </div>
                   <div class="form-group">
                       </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Save" Width="80px" Height="30px"/>
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="80px" style="height: 30px" />

            </div>
                </div>
                <div class="item-right">

                    <asp:GridView ID="GridUnit" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" PageSize="6" style="font-size: medium" Width="500px" DataKeyNames="Id" Font-Size="13px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="Id"></asp:BoundField>
                            <asp:BoundField DataField="MemeberName" HeaderText="Name" SortExpression="MemeberName"></asp:BoundField>
                            <asp:BoundField DataField="PhoneNumer" HeaderText="Phone Numer" SortExpression="PhoneNumer"></asp:BoundField>
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="DeathDate" HeaderText="Date Of Death" SortExpression="DeathDate" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Id, MemeberName, PhoneNumer, Description, DeathDate FROM MemberDeath"></asp:SqlDataSource>

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
