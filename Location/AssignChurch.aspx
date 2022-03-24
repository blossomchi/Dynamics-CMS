<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AssignChurch.aspx.vb" Inherits="AssignChurch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Assign Church</title>
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
        <div class="bg-header"></div>
        <div class="header-text">
              <p class="church-watch">RolofDynamics Church Watch</p>
             <p class="church-mgt">Church Management Software</p>
        </div>
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
        <div class="clear-fix">
               &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblname0" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px">LOG IN AS :</asp:Label>
                   <asp:Label ID="AdminLabel" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname1" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbChurchName" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbLocation" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lbLocation0" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbState" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblserviceid" runat="server" CssClass="label"></asp:Label>
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
         <h2>Assign to a Church  </h2>
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
            <div class="formbox center">
           <div class="NewFrame">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Selected" CssClass="label" Height="16px"></asp:Label>
                    <asp:TextBox ID="txtSelected" runat="server" CssClass="input" ReadOnly="True"></asp:TextBox>
                    
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Assigned" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="drpselected" class="chosen-select" runat="server" DataSourceID="AssignDS" DataTextField="ChurchName" DataValueField="ChurchDetailID" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="AssignDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChurchDetailTable.SN, ChurchDesignationTable.Branch, ChurchDetailTable.ChurchDetailID, ChurchDetailTable.ChurchName FROM ChurchDetailTable INNER JOIN ChurchDesignationTable ON ChurchDetailTable.ChurchDesgID = ChurchDesignationTable.ChurchDesgID WHERE (ChurchDetailTable.ChurchName &lt;&gt; @Name)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtSelected" Name="Name" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                   <div class="form-group">
                       <asp:Label ID="LBID" runat="server" Visible="False"></asp:Label>
                       <asp:Label ID="lbl12" runat="server"></asp:Label>
                       <asp:Label ID="lbCDetails" runat="server" Visible="False"></asp:Label>

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Assign" class="a_demo_one"  Width="75px" Height="40px"/>

            </div>
                </div>
                </div>
         <div class="clear-fix"></div> 
          </div>

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
