<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddMinisters.aspx.vb" Inherits="AddMinisters" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Minister</title>
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
       
        <asp:Image ID="Image3" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
        <br />
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
        <br />
   </div>
<asp:Label ID="Label24" runat="server" CssClass="label"></asp:Label>
    <div class="main">
          &nbsp;
          <asp:Button ID="Button1" runat="server" Text="View Ministers" class="a_demo_one"  Width="130px" Height="40px"  />
            &nbsp;&nbsp;<br />
         <p>
             <asp:Label ID="lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
            <div class="formbox center">
                <br />
             <div class="NewFrame">
                 <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Select Type" CssClass="label"></asp:Label>
                   <asp:DropDownList ID="CBType" CssClass="drop-down" runat="server" AutoPostBack="True">
                       <asp:ListItem>Church Member</asp:ListItem>
                       <asp:ListItem>None Church Member</asp:ListItem>
                    </asp:DropDownList>
                </div>
                 <asp:Panel ID="ChurchMember" runat="server" Visible="False">
                     <div class="form-group">
                    <asp:Label ID="Label30" runat="server" Text="Title" CssClass="label"></asp:Label>
                   <asp:DropDownList ID="drpTitle" CssClass="drop-down" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Title" DataValueField="Title">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT DISTINCT MembershipTable.Title, MembershipTable.ChurchDetailID FROM MembershipTable INNER JOIN ChurchDetailTable ON MembershipTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (MembershipTable.ChurchDetailID = @church) AND (MembershipTable.Memberid &lt;&gt; N'MEB1')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtchurchID" Name="church" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label28" runat="server" Text="Pastors Name" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DrpName" CssClass="drop-down" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="FULLNAME" DataValueField="SN">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, FamilyID, FirstName + ' ' + LastName AS FULLNAME, Title, ChurchDetailID FROM MembershipTable WHERE (Title = @ty) AND (ChurchDetailID = @churchID) AND (Memberid &lt;&gt; N'MEB1')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtname" Name="ty" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtchurchID" Name="churchID" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                 </asp:Panel>
                 <asp:Panel ID="NonChurchMember" runat="server" Visible="False">
                     <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Hierarchy" CssClass="label"></asp:Label>
                   <asp:DropDownList ID="CBHierarchy" CssClass="drop-down" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Branch" DataValueField="ChurchDesgID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT DISTINCT ChurchDesgID, Branch FROM ChurchDesignationTable">
                    </asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Church Branch" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="CBChurch" CssClass="drop-down" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="ChurchName" DataValueField="ChurchDetailID">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChurchDetailID, ChurchDesgID, ChurchName FROM ChurchDetailTable WHERE (ChurchDesgID = @Chu)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtCHID" Name="Chu" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                     <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Pastors Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="PastorName" CssClass="input" runat="server"></asp:TextBox>
                </div>
                 </asp:Panel>
                <div class="form-group">
                    <asp:Label ID="Label31" runat="server" Text="Phone" CssClass="label"></asp:Label>
                    &nbsp; <asp:TextBox ID="txtPhone" CssClass="input" runat="server"></asp:TextBox>
                </div>
                   <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Services" CssClass="label"></asp:Label>
                       &nbsp;
                       <asp:DropDownList ID="drpServices"  CssClass="drop-down" runat="server">
                           <asp:ListItem>Full Time</asp:ListItem>
                           <asp:ListItem>Per Time</asp:ListItem>
                           <asp:ListItem>Others</asp:ListItem>
                       </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label32" runat="server" Text="Post" CssClass="label"></asp:Label>
                    &nbsp;
                    <asp:DropDownList ID="DrpPost"  CssClass="drop-down"  runat="server" DataSourceID="SqlDataSource5" DataTextField="DutyName" DataValueField="Dutyid">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Dutyid], [DutyName] FROM [DutyTable]"></asp:SqlDataSource>
                </div>
                 <div class="form-group">
                    <asp:TextBox ID="txtDes" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="txtst" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtname" runat="server" style="font-size: x-small" Visible="False" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtfulname" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                    <asp:TextBox ID="txtCHID" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                </div>
                 <div>
                        &nbsp;&nbsp;
                 </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Save"  class="a_demo_one"  Width="100px" Height="40px"/>

            </div>
                 </div> 
                </div>
                   
               
         <div class="clear-fix">

         </div> 
           </div>

       <div class="footer">
               
        <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p> </div>
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
