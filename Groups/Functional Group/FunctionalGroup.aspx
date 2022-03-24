<%@ Page Language="VB" AutoEventWireup="false" CodeFile="FunctionalGroup.aspx.vb" Inherits="FunctionalGroup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FuctionalGroup</title>
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
    <link href="css/menu.css" rel="stylesheet" />
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
          <div style="float:right">
        <asp:Image ID="Image1" runat="server" Height="100px" Width="138px" class="headerImg" ImageUrl="~/image/New.PNG" />
              </div>
        <div class="clear-fix">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:Label ID="lblname0" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px">LOG IN AS :</asp:Label>
                   <asp:Label ID="AdminLabel" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname1" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbChurchName" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbLocation" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lbLocation0" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbState" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    </div>
        <br />
<asp:Label ID="lblserviceid" runat="server" CssClass="label"></asp:Label>
                    
                   
    </div>
          
    <div class="main">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button4" runat="server" Text="View Functional Group " class="a_demo_one"  Width="180px" Height="40px" />
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
         <p>
             &nbsp;</p>
         

             <div class="formbox center">
            <div class="NewFrame">
                  <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Group Name" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DrpGroup" class="chosen-select" runat="server" DataSourceID="SqlDataSource1" DataTextField="GroupName" DataValueField="ID" AutoPostBack="True">
                    </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ID, GroupName FROM MembersGroup"></asp:SqlDataSource>
                </div>
                                <div class="form-group">
                      <asp:Label ID="Label2" runat="server" Text="Committe Name" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpCommitteA" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="Committe" DataTextField="ComName" DataValueField="ComId">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="Committe" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [ComId], [ComName] FROM [CommTable]"></asp:SqlDataSource>
                 </div>
                 <div class="form-group">
                      <asp:Label ID="Label3" runat="server" Text="Name" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="DrpName" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="CommName" DataTextField="FULLNAME" DataValueField="SN">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="CommName" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, MembershipTable.FamilyID, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS FULLNAME, ChurchDetailTable.ChurchDetailID FROM MembershipTable INNER JOIN ChurchDetailTable ON MembershipTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (ChurchDetailTable.ChurchDetailID = @chu) AND (MembershipTable.LastName &lt;&gt; N'UZOMA')">
                          <SelectParameters>
                              <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                 </div>
                 <div class="form-group">
                      <asp:Label ID="Label4" runat="server" Text="Phone" CssClass="label"></asp:Label>
                      <asp:TextBox ID="txtPhone" CssClass="input" runat="server" ReadOnly="True"></asp:TextBox>
                      <br />
                 </div>
                <div class="form-group">
                    &nbsp;&nbsp;
                    </div>
                <div class="form-group">

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" class="a_demo_one"  Text="Add" Width="100px" style="height: 40px" Height="60px" Visible="False" />
                      <asp:Button ID="btnSave" runat="server"  Text="Save" class="a_demo_one"  Width="100px" Height="40px"/>
                

                    </div>
                <div class="form-group">
                    <asp:TextBox ID="txtDes" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtname" runat="server" style="font-size: x-small" Visible="False" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtfulname" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                </div>
                </div>
          
                </div>
         <div class="clear-fix"></div> 

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
