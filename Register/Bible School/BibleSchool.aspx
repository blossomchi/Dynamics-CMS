<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BibleSchool.aspx.vb" Inherits="BibleSchool" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>School of the Bible</title>
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
     <script src="jquery/Jquery/numtoword.js"></script>
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
       
        <div style="float:right">
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
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
                    <asp:Label ID="Label10" runat="server" CssClass="label"></asp:Label>
                    </div>
<asp:Label ID="lblserviceid" runat="server" CssClass="label"></asp:Label>
                    </div>
  
          
    <div class="main">
          <asp:Button ID="Button3" runat="server" Text="View Record " class="a_demo_one"  Width="150px" Height="40px" />
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
             <div class="formbox center">
             <div class="NewFrame">
                  <div class="form-group">
                     &nbsp;
                       </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Bble Class" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="drpBibleclass" class="chosen-select" runat="server" DataSourceID="SqlDataSource2" DataTextField="NewEvent" DataValueField="Sn" AutoPostBack="True" Width="285px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Eventid, NewEvent, SN FROM EventTable WHERE (Eventid = N'ChEv1')"></asp:SqlDataSource>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Details" CssClass="label"></asp:Label>
                       <asp:TextBox ID="txtDescp" CssClass="input" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="New Convert" CssClass="label"></asp:Label>
                     <asp:DropDownList ID="DrpNewConvert" class="chosen-select" runat="server" DataSourceID="SqlDataSource3" DataTextField="FULLNAME" DataValueField="SN" AutoPostBack="True" Width="285px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, Firstname + ' ' + Lastname AS FULLNAME FROM AddvisitorTable"></asp:SqlDataSource>
                </div>
                   <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Phone Number" CssClass="label"></asp:Label>
                       <asp:TextBox ID="txtPhone" CssClass="input" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    &nbsp;
                       </div>

                  <div class="form-group" style="font-style: italic; font-weight: 600">
                   
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Label ID="Label8" runat="server" Text="Durations"></asp:Label>
                </div>
                  <div class="form-group">
                       </div>
                  <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="From" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtFrom" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="To" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtTo" runat="server" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Week" CssClass="label"></asp:Label>
                        <asp:DropDownList ID="DrpWeek" CssClass="drop-down" runat="server" AutoPostBack="True">
                            <asp:ListItem>Sunday</asp:ListItem>
                            <asp:ListItem>Monday</asp:ListItem>
                            <asp:ListItem>Tuesday</asp:ListItem>
                            <asp:ListItem>Wednesday</asp:ListItem>
                            <asp:ListItem>Thursday</asp:ListItem>
                            <asp:ListItem>Thursday</asp:ListItem>
                            <asp:ListItem>Friday</asp:ListItem>
                            <asp:ListItem>Saturday</asp:ListItem>
                    </asp:DropDownList>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Session" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DrpSession" CssClass="drop-down" runat="server" AutoPostBack="True">
                        <asp:ListItem>Morning</asp:ListItem>
                        <asp:ListItem>Afternoon</asp:ListItem>
                        <asp:ListItem>Evening</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                     &nbsp;
                       <asp:TextBox ID="txtfulname" runat="server" Visible="False" Width="16px"></asp:TextBox>
                       <asp:TextBox ID="txtname" runat="server" Visible="False" Width="16px"></asp:TextBox>
                       <asp:TextBox ID="txtfirstname2" runat="server" Visible="False" Width="16px"></asp:TextBox>
                       <asp:TextBox ID="txtfirstname3" runat="server" Visible="False" Width="16px"></asp:TextBox>
                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                     <asp:TextBox ID="txtMembername" runat="server" style="font-size: x-small" Visible="False" Width="23px" Height="19px"></asp:TextBox>
                     <asp:TextBox ID="txtStaffID" runat="server" Font-Size="XX-Small" Visible="False" Width="20px" Height="19px"></asp:TextBox>
                       </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Save" class="a_demo_one" Width="80px"/>

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
