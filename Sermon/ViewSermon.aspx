<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewSermon.aspx.vb" Inherits="ViewSermon" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>View Sermon</title>
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
        <div class="bg-header">
        </div>
        <div class="header-text">
            <p class="church-watch">RolofDynamics Church Watch</p>
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
                    <asp:Label ID="lblid" runat="server" CssClass="label" Visible="False"></asp:Label>
                    <br />

        </div>
        <br />
         <div>
<asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="false" />
&nbsp;
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

        <div>
            &nbsp;&nbsp;&nbsp;<br />
            &nbsp;&nbsp;<asp:Button ID="Button1" runat="server" class="a_demo_one" Text="Record New Sermon" style="font-style: italic" Height="30px" Width="150px" />
            &nbsp;&nbsp;<br />
            <br />
            </div>
        <div>
            &nbsp;
            <asp:DropDownList ID="DrpCriteria" runat="server" Height="22px" Width="200px" AutoPostBack="True">
                <asp:ListItem>Ascending</asp:ListItem>
                <asp:ListItem>Sermon Title</asp:ListItem>
                <asp:ListItem>Pastor</asp:ListItem>
                <asp:ListItem>Keywords</asp:ListItem>
                <asp:ListItem>Date</asp:ListItem>
                <asp:ListItem>Identifier</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;<telerik:RadDatePicker ID="DatePicker" Runat="server" AutoPostBack="True" Culture="en-US" Visible="False">
<Calendar runat="server" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

<DateInput runat="server" DisplayDateFormat="yyyy-MM-dd" DateFormat="yyyy-MM-dd" EnableSingleInputRendering="True" LabelWidth="64px" autopostback="True"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
            </telerik:RadDatePicker>
            <asp:TextBox ID="txtcriteria" runat="server" Font-Size="Medium" Height="19px" Width="180px"></asp:TextBox>&nbsp;&nbsp;&nbsp; <asp:Button ID="Button3" runat="server" Text="Search" />

                    <asp:TextBox ID="txtSelectedDate" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

            <br />
                
        </div>
        <div style="font-style: italic">
            <asp:GridView ID="GridSermon" runat="server" Width="1150px" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small" CellSpacing="2" Height="50px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="SermonIdentifier" HeaderText="Identifier" SortExpression="SermonIdentifier" />
                    <asp:BoundField DataField="SermonTitle" HeaderText="SermonTitle" SortExpression="SermonTitle" />
                    <asp:BoundField DataField="Scripture" HeaderText="Scripture" SortExpression="Scripture" />
                    <asp:BoundField DataField="Pastor" HeaderText="Pastor" SortExpression="Pastor" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                    <asp:BoundField DataField="SermonDvD" HeaderText="SermonDvD" SortExpression="SermonDvD" />
                    <asp:BoundField DataField="SermonAudio" HeaderText="SermonAudio" SortExpression="SermonAudio" />
                    <asp:BoundField DataField="SermonVideo" HeaderText="SermonVideo" SortExpression="SermonVideo" />
                    <asp:BoundField DataField="SermonMp3" HeaderText="SermonMp3" SortExpression="SermonMp3" />
                    <asp:BoundField DataField="Keyword" HeaderText="Keyword" SortExpression="Keyword" />
                    <asp:BoundField DataField="Createdby" HeaderText="Createdby" SortExpression="Createdby" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd/MM/yyyy}" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, SermonTitle, Pastor, Keyword, Date, Createdby, Scripture, Duration, SermonDvD, SermonAudio, SermonVideo, SermonMp3, SermonIdentifier FROM SermonTable WHERE (Churchid = @chu)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GrideTitle" runat="server" Width="1150px" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="SermonIdentifier" HeaderText="Identifier" SortExpression="SermonIdentifier" />
                    <asp:BoundField DataField="SermonTitle" HeaderText="SermonTitle" SortExpression="SermonTitle" />
                    <asp:BoundField DataField="Scripture" HeaderText="Scripture" SortExpression="Scripture" />
                    <asp:BoundField DataField="Pastor" HeaderText="Pastor" SortExpression="Pastor" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                    <asp:BoundField DataField="SermonDvD" HeaderText="SermonDvD" SortExpression="SermonDvD" />
                    <asp:BoundField DataField="SermonAudio" HeaderText="SermonAudio" SortExpression="SermonAudio" />
                    <asp:BoundField DataField="SermonVideo" HeaderText="SermonVideo" SortExpression="SermonVideo" />
                    <asp:BoundField DataField="SermonMp3" HeaderText="SermonMp3" SortExpression="SermonMp3" />
                    <asp:BoundField DataField="Createdby" HeaderText="Createdby" SortExpression="Createdby" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Keyword" HeaderText="Keyword" SortExpression="Keyword" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, SermonTitle, Pastor, Keyword, Date, Createdby, Scripture, Duration, SermonDvD, SermonAudio, SermonVideo, SermonMp3, SermonIdentifier FROM SermonTable WHERE (Churchid = @chu) AND (SermonTitle = @Title)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtcriteria" Name="Title" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridPastor" runat="server" Width="1150px" DataSourceID="UnsignedDS" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small" Visible="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="SermonIdentifier" HeaderText="Identifier" SortExpression="SermonIdentifier" />
                    <asp:BoundField DataField="SermonTitle" HeaderText="SermonTitle" SortExpression="SermonTitle" />
                    <asp:BoundField DataField="Scripture" HeaderText="Scripture" SortExpression="Scripture" />
                    <asp:BoundField DataField="Pastor" HeaderText="Pastor" SortExpression="Pastor" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                    <asp:BoundField DataField="SermonDvD" HeaderText="SermonDvD" SortExpression="SermonDvD" />
                    <asp:BoundField DataField="SermonAudio" HeaderText="SermonAudio" SortExpression="SermonAudio" />
                    <asp:BoundField DataField="SermonMp3" HeaderText="SermonMp3" SortExpression="SermonMp3" />
                    <asp:BoundField DataField="SermonVideo" HeaderText="SermonVideo" SortExpression="SermonVideo" />
                    <asp:BoundField DataField="Keyword" HeaderText="Keyword" SortExpression="Keyword" />
                    <asp:BoundField DataField="Createdby" HeaderText="Createdby" SortExpression="Createdby" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd/MM/yyyy}" />
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
            <asp:SqlDataSource ID="UnsignedDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, SermonTitle, Pastor, Keyword, Date, Createdby, Scripture, Duration, SermonDvD, SermonAudio, SermonMp3, SermonVideo, SermonIdentifier FROM SermonTable WHERE (Churchid = @chu) AND (Pastor = @past)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtcriteria" Name="past" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridKeyword" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" style="font-size: small" Width="1150px" ShowFooter="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="SermonIdentifier" HeaderText="Identifier" SortExpression="SermonIdentifier" />
                    <asp:BoundField DataField="SermonTitle" HeaderText="SermonTitle" SortExpression="SermonTitle" />
                    <asp:BoundField DataField="Scripture" HeaderText="Scripture" SortExpression="Scripture" />
                    <asp:BoundField DataField="Pastor" HeaderText="Pastor" SortExpression="Pastor" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                    <asp:BoundField DataField="SermonDvD" HeaderText="SermonDvD" SortExpression="SermonDvD" />
                    <asp:BoundField DataField="SermonAudio" HeaderText="SermonAudio" SortExpression="SermonAudio" />
                    <asp:BoundField DataField="SermonVideo" HeaderText="SermonVideo" SortExpression="SermonVideo" />
                    <asp:BoundField DataField="SermonMp3" HeaderText="SermonMp3" SortExpression="SermonMp3" />
                    <asp:BoundField DataField="Keyword" HeaderText="Keyword" SortExpression="Keyword" />
                    <asp:BoundField DataField="Createdby" HeaderText="Createdby" SortExpression="Createdby" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd/MM/yyyy}" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, SermonTitle, Pastor, Keyword, Date, Createdby, Scripture, Duration, SermonDvD, SermonAudio, SermonVideo, SermonMp3, SermonIdentifier FROM SermonTable WHERE (Churchid = @chu) AND (Keyword = @keyword)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txtcriteria" Name="keyword" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridDate" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource5" ForeColor="#333333" GridLines="None" style="font-size: small" Width="1150px" ShowFooter="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="SermonIdentifier" HeaderText="Identifier" SortExpression="SermonIdentifier" />
                    <asp:BoundField DataField="SermonTitle" HeaderText="SermonTitle" SortExpression="SermonTitle" />
                    <asp:BoundField DataField="Scripture" HeaderText="Scripture" SortExpression="Scripture" />
                    <asp:BoundField DataField="Pastor" HeaderText="Pastor" SortExpression="Pastor" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                    <asp:BoundField DataField="SermonDvD" HeaderText="SermonDvD" SortExpression="SermonDvD" />
                    <asp:BoundField DataField="SermonAudio" HeaderText="SermonAudio" SortExpression="SermonAudio" />
                    <asp:BoundField DataField="SermonVideo" HeaderText="SermonVideo" SortExpression="SermonVideo" />
                    <asp:BoundField DataField="SermonMp3" HeaderText="SermonMp3" SortExpression="SermonMp3" />
                    <asp:BoundField DataField="Keyword" HeaderText="Keyword" SortExpression="Keyword" />
                    <asp:BoundField DataField="Createdby" HeaderText="Createdby" SortExpression="Createdby" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd/MM/yyyy}" />
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
          

                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, SermonTitle, Pastor, Keyword, Date, Createdby, Scripture, Duration, SermonDvD, SermonAudio, SermonVideo, SermonMp3, SermonIdentifier FROM SermonTable WHERE (Churchid = @chu) AND (Date = @date)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtcriteria" Name="date" PropertyName="Text" />
                        </SelectParameters>
            </asp:SqlDataSource>
          

                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, SermonTitle, Pastor, Keyword, Date, Createdby, Scripture, Duration, SermonDvD, SermonAudio, SermonVideo, SermonMp3, SermonIdentifier FROM SermonTable WHERE (Churchid = @chu) AND (SermonIdentifier = @date)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtcriteria" Name="date" PropertyName="Text" />
                        </SelectParameters>
            </asp:SqlDataSource>
          

            <asp:GridView ID="GridIdentifier" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" style="font-size: small" Width="1150px" ShowFooter="True">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="SermonIdentifier" HeaderText="Identifier" SortExpression="SermonIdentifier" />
                    <asp:BoundField DataField="SermonTitle" HeaderText="SermonTitle" SortExpression="SermonTitle" />
                    <asp:BoundField DataField="Scripture" HeaderText="Scripture" SortExpression="Scripture" />
                    <asp:BoundField DataField="Pastor" HeaderText="Pastor" SortExpression="Pastor" />
                    <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                    <asp:BoundField DataField="SermonDvD" HeaderText="SermonDvD" SortExpression="SermonDvD" />
                    <asp:BoundField DataField="SermonAudio" HeaderText="SermonAudio" SortExpression="SermonAudio" />
                    <asp:BoundField DataField="SermonVideo" HeaderText="SermonVideo" SortExpression="SermonVideo" />
                    <asp:BoundField DataField="SermonMp3" HeaderText="SermonMp3" SortExpression="SermonMp3" />
                    <asp:BoundField DataField="Keyword" HeaderText="Keyword" SortExpression="Keyword" />
                    <asp:BoundField DataField="Createdby" HeaderText="Createdby" SortExpression="Createdby" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" DataFormatString="{0:dd/MM/yyyy}" />
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
          

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtLocation" runat="server" Visible="False" Width="16px"></asp:TextBox>

            <br />
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
