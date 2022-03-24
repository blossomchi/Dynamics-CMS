<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ExpenseEdit.aspx.vb" Inherits="ExpenseEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Expenses Edit</title>
     
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
            <asp:Label ID="lblserviceid" runat="server" CssClass="label"></asp:Label>
            </div><br />
            

                    
                    
    </div>
          
    <div class="main">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button3" runat="server" Text="View Expenses " class="a_demo_one"  Width="180px" Height="40px" />
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
            <div class="formbox">
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                 <div class="NewFrameex">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Expenses" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="drpExpenses"  class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Expensesid" Width="199px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Name], [Expensesid] FROM [ExpensesHeadTable]"></asp:SqlDataSource>
                </div>
                        <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Expenses Head" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtExpensesHead" runat="server" CssClass="input"></asp:TextBox>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtExpensesDetails" runat="server" CssClass="input"></asp:TextBox>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Description" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtMsg" runat="server" CssClass="msg" TextMode="MultiLine"></asp:TextBox>
                </div>
                   <div class="form-group">
                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtMembername" runat="server" style="font-size: x-small" Visible="False" Width="23px"></asp:TextBox>
                     <asp:TextBox ID="txtStaffID" runat="server" Font-Size="XX-Small" Visible="False" Width="20px" Height="19px"></asp:TextBox>
                     <asp:TextBox ID="txtexpenid" runat="server" style="font-size: x-small" Visible="False" Width="23px"></asp:TextBox>
                     <asp:TextBox ID="txtMemID" runat="server" style="font-size: x-small" Visible="False" Width="23px"></asp:TextBox>
                       </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Edit" class="a_demo_one"  Width="120px" Height="40px"/>

            </div>
                </div>
                    </asp:Panel>
                <asp:Panel ID="Panel2" runat="server">
                 <div class="item-right">

            <asp:GridView ID="gridHeader" runat="server" AutoGenerateColumns="False" CellPadding="1" DataSourceID="SqlDataSource2" Font-Size="Medium" Height="30px" Width="400px" AllowPaging="True" AllowSorting="True" ForeColor="#333333" GridLines="None" PageSize="1" DataKeyNames="Expensesid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Expensesid" HeaderText="SN" SortExpression="Expensesid" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Expenses Head" SortExpression="Name" />
                    <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
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
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Expensesid, Name FROM ExpensesHeadTable WHERE (Name = @expen)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="txtexpenHead" Name="expen" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     <div>
                         &nbsp;
                     </div>
<asp:GridView ID="Griddetails" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" Font-Size="Medium" Height="30px" Width="400px" AllowPaging="True" AllowSorting="True" ForeColor="#333333" GridLines="None" PageSize="4" DataKeyNames="ID" CellSpacing="2">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Expenses Details" SortExpression="Name" />
                    <asp:BoundField DataField="Datecreated" HeaderText="Datecreated" SortExpression="Datecreated" DataFormatString="{0:dd/MM/yyyy}" />
                    <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
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
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ExpensesdetailsTable.ID, ExpensesdetailsTable.Name, ExpensesdetailsTable.Description, ExpensesdetailsTable.Datecreated FROM ExpensesdetailsTable INNER JOIN ExpensesHeadTable ON ExpensesdetailsTable.Expensesid = ExpensesHeadTable.Expensesid WHERE (ExpensesHeadTable.Name = @name) ORDER BY ExpensesdetailsTable.ID">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="txtexpenHead" Name="name" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
        </div>
                    <div>

                        <asp:TextBox ID="txtexpenHead" Width="20px" Visible="false" runat="server"></asp:TextBox>
                    </div>
                    </asp:Panel>
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
