<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RecieveCashbook.aspx.vb" Inherits="RecieveCashbook" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Recieve Cash Book</title>
      <link href="css/Style.css" rel="stylesheet" />
    <link href="css/style2.css" rel="stylesheet" />
        <script src="jquery/chosen.jquery.js"></script>
    <link href="jquery/chosen.css" rel="stylesheet" />
    <script src="jquery/Jquery/jquery-1.7.1.min.js"></script>
    <script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>
    <script src="jquery/chosen.jquery.min.js"></script>
    <script src="jquery/chosen.proto.min.js"></script>
    <script src="jquery/chosen.proto.js"></script>
       <link href="../../css/menu.css" rel="stylesheet" />
     <script src="jquery/Jquery/numtoword.js"></script>
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
        <div class="bg-header"></div>
        <div class="header-text">
            <p class="church-watch">Church Watch</p>
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
                    <asp:Label ID="lblserviceid" runat="server" CssClass="label"></asp:Label>
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

    <asp:Button ID="Button3" runat="server" Text="Cash Book " class="a_demo_one"  Width="90px" Height="40px" /><asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
        <h2>Recieve Cash</h2>
            <div class="formbox center">
            <div class="NewFrame">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Cash/Bank" CssClass="label"></asp:Label>
                        <asp:DropDownList ID="drpCash" runat="server" CssClass="drop-down" AutoPostBack="True">
                            <asp:ListItem>Cash</asp:ListItem>
                            <asp:ListItem>Bank</asp:ListItem>
                    </asp:DropDownList>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Bank" CssClass="label" Visible="False"></asp:Label>
                        <asp:DropDownList ID="drpBank" CssClass="drop-down" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="PaymentName" DataValueField="PaymentName" Visible="False">
                    </asp:DropDownList>
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Id, PaymentName FROM PaymentMethodTable WHERE (PaymentName &lt;&gt; N'Cash')"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Transscation Type" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpAssets" runat="server" CssClass="drop-down" Enabled="False">
                          <asp:ListItem>DR</asp:ListItem>
                    </asp:DropDownList>
                </div>
                  <div class="form-group">
                      <asp:Label ID="Label3" runat="server" Text="Transcation Date" CssClass="label" ></asp:Label>
                      <telerik:RadDatePicker ID="RadDatePicker1" Runat="server" AutoPostBack="True" Culture="en-US" Width="280px">
<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

<DateInput DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" EnableSingleInputRendering="True" LabelWidth="64px" autopostback="True"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                      </telerik:RadDatePicker>
                      <asp:TextBox ID="txtTrandate"  CssClass="input" runat="server" Visible="False" Width="20px"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Account" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpAccount" runat="server" CssClass="drop-down" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Accountname" DataValueField="Accountname">
                    </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChartAccountTable.Accountid, ChartAccountTable.Accountname FROM ChartAccountTable INNER JOIN Cash_bankrelationshipTable ON ChartAccountTable.cash_bank_relationshipid = Cash_bankrelationshipTable.Id WHERE (Cash_bankrelationshipTable.Cash_bankrelationship = N'Disburse and Receive') AND (ChartAccountTable.Accountname &lt;&gt; N'Account Payable') OR (Cash_bankrelationshipTable.Cash_bankrelationship = N'Receive')"></asp:SqlDataSource>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Account Details" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpdetails" class="chosen-select" runat="server" AutoPostBack="True">
                    </asp:DropDownList>

                </div>
                  <div>
                      <asp:GridView ID="GridExp" runat="server" AutoGenerateColumns="False" DataKeyNames="Pvid" DataSourceID="SqlDataSource3" Visible="False" Width="400px" style="text-align: left">
                          <Columns>
                              <asp:CommandField ShowSelectButton="True" />
                              <asp:BoundField DataField="ID" HeaderText="Raised ID" />
                              <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                              <asp:BoundField DataField="Pvid" HeaderText="Payment Voucher ID" ReadOnly="True" SortExpression="Pvid" />
                          </Columns>
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT RaiseExpensesHdTable.Amount, PaymentVoucherTable.Pvid, RaiseExpensesHdTable.ID FROM RaiseExpensesHdTable INNER JOIN PaymentVoucherTable ON RaiseExpensesHdTable.ID = PaymentVoucherTable.RaiseExpenseId WHERE (RaiseExpensesHdTable.ExpenseHead = @id)">
                          <SelectParameters>
                              <asp:ControlParameter ControlID="txtwelfaresort" Name="id" PropertyName="Text" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Amount" CssClass="label"></asp:Label>
                      <asp:TextBox ID="txtAmount" CssClass="input" runat="server"></asp:TextBox>
                </div>
               
                  <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Description" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="input" placeholder="Little Description" TextMode="MultiLine" ></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Entry Date" CssClass="label"></asp:Label>
                      <asp:TextBox ID="TextBox1" CssClass="input" runat="server"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Entered By" CssClass="label"></asp:Label>
                      <asp:TextBox ID="TextBox2" CssClass="input" runat="server"></asp:TextBox>
                </div>

                   <div class="form-group">

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="10px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                    <asp:TextBox ID="txtwelfaresort" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="10px"></asp:TextBox>

                    <asp:TextBox ID="txtStaffID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="10px"></asp:TextBox>

                    <asp:TextBox ID="txtRaisedid" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="10px"></asp:TextBox>

                    <asp:TextBox ID="txtPaymentVoucher" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="10px"></asp:TextBox>

                    <asp:TextBox ID="ExpSupplier" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="10px"></asp:TextBox>

                       </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Save" class="a_demo_one"  Width="100px" Height="40px"/>

            </div>
                </div>
                </div>
         <div class="clear-fix"></div> 
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
