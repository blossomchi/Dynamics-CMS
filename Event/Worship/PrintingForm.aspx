<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PrintingForm.aspx.vb" Inherits="PrintingForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Printing View</title>
      <script src="jquery/chosen.jquery.js"></script>
    <link href="jquery/chosen.css" rel="stylesheet" />
    <script src="jquery/Jquery/jquery-1.7.1.min.js"></script>
    <script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>
    <script src="jquery/chosen.jquery.min.js"></script>
    <script src="jquery/chosen.proto.min.js"></script>
    <script src="jquery/chosen.proto.js"></script>
    <link href="css/style2.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
         <link href="../css/menu.css" rel="stylesheet" />
         <link href="css/style.css" rel="stylesheet" />
    <style type="text/css">
        #form1 {
            height: 667px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
   <div class="wrapper">
   <div class="headers">
       <div>
  &nbsp;&nbsp;&nbsp;
       </div>
         <div>
  &nbsp;&nbsp;&nbsp;
       </div>
       <asp:Image ID="Image1" runat="server" Height="150px" Width="200px" class="picimg" ImageUrl="~/image/CGM.png" />
        <div class="headers-text">
              <p class="church-watch">CHURCH OF GOD MISSION INT. INC. </p>
             <p class="church-mgts"> PRAISE CENTRE.</p>
             <p class="church-mgt"> JAKPA ROAD EFFURUN.</p>
               <div>
  &nbsp;&nbsp;&nbsp;
       </div>
                   <div>
  &nbsp;&nbsp;&nbsp;
       </div>
             <p class="church-mgtt">
                <asp:Label ID="Label1" runat="server" Text="CHURCH SERVICE PROGRAM - " Font-Size="X-Large"></asp:Label><asp:Label ID="Label2" runat="server" Text="Label" Font-Size="X-Large"></asp:Label> <asp:Label ID="txtMemID" runat="server" Text="Label" Visible="False"></asp:Label></p></div>
        </div>
    
        <div class="clear-fix">
                    </div>
       

       <div class="main">
            <div class ="print2" >
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" style="font-size: x-large" Width="1149px" Font-Size="X-Large">
               <Columns>
                   <asp:BoundField DataField="TIME" HeaderText="TIME" SortExpression="TIME" ReadOnly="True" />
                   <asp:BoundField DataField="MINS" HeaderText="MINS" SortExpression="MINS" />
                   <asp:BoundField DataField="PROGRAM" HeaderText="PROGRAM" SortExpression="PROGRAM" />
                   <asp:BoundField DataField="MODERATOR" HeaderText="MODERATOR" SortExpression="MODERATOR" />
               </Columns>
           </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Timefrom + ' - ' + TimeTo AS TIME, Min AS MINS, Program AS PROGRAM, Moderator AS MODERATOR FROM OrderServiceTable WHERE (Date = @date)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label2" Name="date" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
    </div>
           </div>
  </div>
    </form>
</body>
</html>
