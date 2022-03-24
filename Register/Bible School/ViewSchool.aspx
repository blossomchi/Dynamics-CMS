<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ViewSchool.aspx.vb" Inherits="ViewSchool" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>View Bible School</title>
    <link href="css/Style.css" rel="stylesheet" />
    <link href="css/style2.css" rel="stylesheet" />
      <link href="css/menu.css" rel="stylesheet" />
    <script src="jquery/chosen.jquery.js"></script>
    <link href="jquery/chosen.css" rel="stylesheet" />
    <script src="jquery/Jquery/jquery-1.7.1.min.js"></script>
    <script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>
    <script src="jquery/chosen.jquery.min.js"></script>
    <script src="jquery/chosen.proto.min.js"></script>
    <script src="jquery/chosen.proto.js"></script>
         <style type="text/css">
        #form1 {
            height: 667px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>  <div class="wrapper">
    <div class="header">
        <div class="bg-header">
        </div>
        <div class="header-text">
            <p class="church-watch">RolofDynamics Church Watch</p>
               <p class="church-mgt">Church Management Software</p>
        </div>
    
   <div style="float:right">
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
           </div>
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
            &nbsp;<asp:Button ID="Button1" runat="server" Text="Enter Record"  class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="40px" Width="170px" />
            &nbsp;&nbsp;<br />
            <br />
            </div>
<div>
                      &nbsp;<asp:DropDownList ID="DrpSorted" class="chosen-select" runat="server" Height="22px" Width="180px" AutoPostBack="True">
                <asp:ListItem>Ascending</asp:ListItem>
                <asp:ListItem>Class</asp:ListItem>
                <asp:ListItem>FirstName</asp:ListItem>
                <asp:ListItem>Week</asp:ListItem>
                <asp:ListItem>Session</asp:ListItem>
            </asp:DropDownList>
                             <asp:DropDownList ID="DrpDate" class="chosen-select" runat="server" Height="22px" Width="180px" AutoPostBack="True" Visible="False">
            </asp:DropDownList>

                    <asp:TextBox ID="txtSelectedDate" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                      <br />

                      <br />

        </div>        
        <div>
            <asp:GridView ID="GrdAscending" runat="server" Width="1150px" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small; font-weight: 700;" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" SortExpression="SN" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Classname" HeaderText="School Of The Bible" SortExpression="Classname" />
                    <asp:BoundField DataField="Candidate" HeaderText="Candidate" SortExpression="Candidate" ReadOnly="True" />
                    <asp:BoundField DataField="Datefrom" HeaderText="From Date" SortExpression="Datefrom" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Dateto" HeaderText="To Date" SortExpression="Dateto" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Session" HeaderText="Session" SortExpression="Session" />
                    <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
                <asp:TemplateField ShowHeader="False">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="false" 
                                  CommandName="DeleteMinstersID" ImageUrl="~/Groups/Functional Group/Images/Delete_icon.png" Text="Delete" Tooltip="Delete" CommandArgument='<%#Eval("SN")%>'/>
                             </ItemTemplate>
                         </asp:TemplateField>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, Classname, FirstName + '  ' + LastName AS Candidate, Datefrom, Dateto, Session, Week FROM ClassTable ORDER BY SN"></asp:SqlDataSource>
            <asp:GridView ID="gridClass" runat="server" Width="1150px" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small; font-weight: 700;" Visible="False" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Classname" HeaderText="Classname" SortExpression="Classname" />
                    <asp:BoundField DataField="Candidate" HeaderText="Candidate" SortExpression="Candidate" ReadOnly="True" />
                    <asp:BoundField DataField="Datefrom" HeaderText="Datefrom" SortExpression="Datefrom" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Dateto" HeaderText="Dateto" SortExpression="Dateto" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Session" HeaderText="Session" SortExpression="Session" />
                    <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, Classname, FirstName + '  ' + LastName AS Candidate, Datefrom, Dateto, Session, Week FROM ClassTable WHERE (Classname = @class) ORDER BY SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DrpDate" Name="class" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
           <asp:GridView ID="GridFirstName" runat="server" Width="1150px" DataSourceID="SqlDataSource4" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small; font-weight: 700;" Visible="False" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Classname" HeaderText="Classname" SortExpression="Classname" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Datefrom" HeaderText="Datefrom" SortExpression="Datefrom" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Dateto" HeaderText="Dateto" SortExpression="Dateto" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Session" HeaderText="Session" SortExpression="Session" />
                    <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
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
             <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, Classname, FirstName, LastName, Datefrom, Dateto, Session, Week FROM ClassTable WHERE (FirstName = @first) ORDER BY SN">
                 <SelectParameters>
                     <asp:ControlParameter ControlID="DrpDate" Name="first" PropertyName="SelectedValue" />
                 </SelectParameters>
            </asp:SqlDataSource>
            
             <asp:GridView ID="GridWeek" runat="server" Width="1150px" DataSourceID="SqlDataSource5" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small; font-weight: 700;" Visible="False" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Classname" HeaderText="Classname" SortExpression="Classname" />
                    <asp:BoundField DataField="Candidate" HeaderText="Candidate" SortExpression="Candidate" ReadOnly="True" />
                    <asp:BoundField DataField="Datefrom" HeaderText="Datefrom" SortExpression="Datefrom" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Dateto" HeaderText="Dateto" SortExpression="Dateto" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Session" HeaderText="Session" SortExpression="Session" />
                    <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
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
               <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, Classname, FirstName + '  ' + LastName AS Candidate, Datefrom, Dateto, Session, Week FROM ClassTable WHERE (Week = @week) ORDER BY SN">
                   <SelectParameters>
                       <asp:ControlParameter ControlID="DrpDate" Name="week" PropertyName="SelectedValue" />
                   </SelectParameters>
            </asp:SqlDataSource>
               <asp:GridView ID="GridSession" runat="server" Width="1150px" DataSourceID="SqlDataSource6" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" style="font-size: small; font-weight: 700;" Visible="False" Height="50px" BorderStyle="Solid" PageSize="20">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" />
                    <asp:BoundField DataField="Classname" HeaderText="Classname" SortExpression="Classname" />
                    <asp:BoundField DataField="Candidate" HeaderText="Candidate" SortExpression="Candidate" ReadOnly="True" />
                    <asp:BoundField DataField="Datefrom" HeaderText="Datefrom" SortExpression="Datefrom" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Dateto" HeaderText="Dateto" SortExpression="Dateto" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:BoundField DataField="Session" HeaderText="Session" SortExpression="Session" />
                    <asp:BoundField DataField="Week" HeaderText="Week" SortExpression="Week" />
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
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, Classname, FirstName + '  ' + LastName AS Candidate, Datefrom, Dateto, Session, Week FROM ClassTable WHERE (Session = @session) ORDER BY SN">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DrpDate" Name="session" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="txtCriteria2" runat="server" Visible="False" Width="18px"></asp:TextBox>
            <asp:TextBox ID="txtCriteria3" runat="server" Visible="False" Width="18px"></asp:TextBox>

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtLocation" runat="server" Visible="False" Width="16px"></asp:TextBox>

            <br />
        </div>


    </div>

           <div class="footer">
               
    <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p>  </div>
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
