<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Homecell.aspx.vb" Inherits="Homecell" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Home Cell</title>
    
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
        </div >
       
       <div style="float:right">
        <asp:Image ID="Image1" runat="server" Height="100px" Width="138px" class="headerImg" ImageUrl="~/image/New.PNG" />
              </div>
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
                    </div>
            <asp:Label ID="lblserviceid" runat="server" CssClass="label"></asp:Label>
                    </div>
  
    <div class="main">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" Text="View House Fellowship" class="a_demo_one"  Width="180px" Height="40px" />
         <p>
             <asp:Label ID="lblhm" runat="server" style="font-size: small" Visible="False"></asp:Label>
         </p>
      
   
          <div class="formbox center">
           <div class="NewFrame">
                 <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Select Zones" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="CBZones" class="chosen-select" runat="server" DataSourceID="SqlDataSource4" DataTextField="Zones" DataValueField="ZoneSN" AutoPostBack="True" Width="285px">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [ZoneSN], [Zones] FROM [HomeCellZonesTable]"></asp:SqlDataSource>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Locationid], [Name] FROM [Location]"></asp:SqlDataSource>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Town" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpTown" class="chosen-select" runat="server" DataSourceID="SqlDataSource8" DataTextField="Name" DataValueField="Locationid" AutoPostBack="True" Width="285px">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Locationid], [Name] FROM [Location]"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Area" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpArea" class="chosen-select" runat="server" DataSourceID="SqlDataSource3" DataTextField="AreaName" DataValueField="Areaid" AutoPostBack="True" Width="285px">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT DISTINCT AreaTable.AreaName, AreaTable.Areaid, AreaTable.Locationid FROM AreaTable INNER JOIN Location ON AreaTable.Locationid = Location.Locationid WHERE (AreaTable.Locationid = @loc)">
                          <SelectParameters>
                              <asp:ControlParameter ControlID="drpTown" Name="loc" PropertyName="SelectedValue" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Home Fellowship" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtHomecell" runat="server" CssClass="input"></asp:TextBox>
                </div>
  <div class="form-group">
                    <asp:Label ID="Label15" runat="server" Text="Cell Address" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtCelladdress" runat="server" TextMode="MultiLine" CssClass="msg"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Cell Leader" CssClass="label"></asp:Label>
                     <asp:DropDownList ID="drpLeader" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="FULLNAME" DataValueField="SN" Width="285px">
                     </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.FirstName + ' ' + MembershipTable.LastName AS FULLNAME, MembershipTable.SN, ChurchDetailTable.ChurchDetailID FROM MembershipTable INNER JOIN ChurchDetailTable ON MembershipTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (ChurchDetailTable.ChurchDetailID = @chu) AND (MembershipTable.Memberid &lt;&gt; N'MEB1')">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Leaders Address" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtMinisterAdd" runat="server" TextMode="MultiLine" CssClass="msg"></asp:TextBox>
                </div>
                   <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Phone" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtphone1" runat="server" CssClass="input"></asp:TextBox>
                </div>
                
                  <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Description" CssClass="label" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtdesp" runat="server" CssClass="msg" placeholder="Enter Home Address" TextMode="MultiLine" Visible="False" ></asp:TextBox>
                </div>
                  <div class="form-group">

                      <asp:TextBox ID="txtDes" runat="server" Visible="False" Width="20px"></asp:TextBox>
                      <asp:TextBox ID="txtst" runat="server" Visible="False" Width="20px"></asp:TextBox>

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                    <asp:TextBox ID="txtfulname" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtLocation" runat="server" Visible="False" Width="16px"></asp:TextBox>

                       </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"   Text="Save" class="a_demo_one"  Width="100px" Height="40px"/>

            </div>
                </div>
                </div>
        
         <div class="clear-fix"></div> 
        <div>

        </div>
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
