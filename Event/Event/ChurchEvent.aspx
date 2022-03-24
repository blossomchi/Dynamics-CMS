<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ChurchEvent.aspx.vb" Inherits="ChurchEvent" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Church Events</title>
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
<asp:scriptmanager runat="server"></asp:scriptmanager>
     <div class="wrapper">
    <div class="header">
        <div class="bg-header"></div>
        <div class="header-text">
            <p class="church-watch">RolofDynamics Church Watch</p>
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
             </div>
        <br />
<asp:Label ID="lblserviceid" runat="server" CssClass="label"></asp:Label>               
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
   <div class="main">
          <asp:Button ID="Button3" runat="server" Text="View Event " class="a_demo_one"  Width="150px" Height="40px" />
      
            <div>
 &nbsp;
            </div> 
          <br />
      
             
        <div class="formbox center">
             <div class="NewFrame">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="New Event" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Description" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtdesp" runat="server" CssClass="input"  TextMode="MultiLine" ></asp:TextBox>
                </div>
                <div class="form-group">
                    &nbsp;
                       </div>
                   <div class="form-group" style="font-style: italic; font-weight: 600">
                   
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label7" runat="server" Text="Date and Time of Occurrence"></asp:Label>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Period" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpPeriod" CssClass="drop-down" runat="server" AutoPostBack="True">
                          <asp:ListItem>One Day Event</asp:ListItem>
                          <asp:ListItem>More than one Day</asp:ListItem>
                      </asp:DropDownList>
                     &nbsp;&nbsp; </div>
                   <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Start Date and Time" CssClass="label"></asp:Label>
                       <telerik:RadDateTimePicker ID="StartTimePicker1" Runat="server" Width="260px">
                       </telerik:RadDateTimePicker>
                 </div>
                <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="End Date and  Time" CssClass="label"></asp:Label>
                    <telerik:RadDateTimePicker ID="EndTimePicker" Runat="server" Width="260px">
                    </telerik:RadDateTimePicker>
                 </div>
                 <div class="form-group">
                    &nbsp;
                       </div>
                  <div class="form-group" style="font-style: italic; font-weight: 600">
                   
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                  
                   <div class="form-group">
                       <asp:TextBox ID="txtControl" runat="server" Visible="False" Width="18px"></asp:TextBox>
                       <asp:TextBox ID="txtst" runat="server" Visible="False" Width="18px"></asp:TextBox>

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtEnD" runat="server" Visible="False" Width="18px"></asp:TextBox>

                       <asp:TextBox ID="txtstD" runat="server" Visible="False" Width="18px"></asp:TextBox>

                    <asp:TextBox ID="txtStartT" runat="server" CssClass="input" Width="20px" Visible="False"></asp:TextBox>
                    <asp:TextBox ID="txtEndT" runat="server" CssClass="input" Width="20px" Visible="False"></asp:TextBox>

                       </div>
                <div style="position: absolute; top: 505px; left: 900px;">


                    <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Visible="False" Width="234px">
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                    </asp:Calendar>


                </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Save" class="a_demo_one"  Width="100px" Height="40px"/>

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
    </form>
</body>
</html>
