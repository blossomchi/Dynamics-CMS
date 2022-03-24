<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Calenda.aspx.vb" Inherits="PrintingForm2" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Calendar</title>
</head>
<body>
    <form id="form1" runat="server">
  <div>
    <DayPilot:DayPilotCalendar ID="DayPilotCalendar1" runat="server" BackColor="#FFFFD5" BorderColor="#000000" CssClassPrefix="calendar_default" DataEndField="EndDate" DataSourceID="SqlDataSource4" DataStartField="StartDate" DataTextField="NewEvent" DataValueField="NewEvent" DayFontFamily="Tahoma" DayFontSize="10pt" Days="5" DurationBarColor="Blue" EventBackColor="#FFFFFF" EventBorderColor="#000000" EventClickHandling="Disabled" EventFontFamily="Tahoma" EventFontSize="8pt" EventHoverColor="#DCDCDC" HourBorderColor="#EAD098" HourFontFamily="Tahoma" HourFontSize="16pt" HourHalfBorderColor="#F3E4B1" HourNameBackColor="#ECE9D8" HourNameBorderColor="#ACA899" HoverColor="#FFED95" NonBusinessBackColor="#FFF4BC" ScrollPositionHour="9" StartDate="2017-08-10" style="top: 0px; left: 0px" />         
  <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Eventid], [NewEvent], [StartDate], [EndDate] FROM [EventTable]"></asp:SqlDataSource>

  </div>
     <div> 
         &nbsp;
         </br> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" Text="Back" Height="40px" Width="60px" />
        </div> 
    </form>
</body>
</html>
