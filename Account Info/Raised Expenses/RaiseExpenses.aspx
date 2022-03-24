<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RaiseExpenses.aspx.vb" Inherits="RaiseExpenses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Expenses Raise</title>
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
            &nbsp;<asp:Button ID="Button3" runat="server" Text="Back"  class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="40px" Width="100px" />
          
            <br />
            </div>
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
        <asp:Panel ID="PnlMain" runat="server">
            <div class="formbox">
                 <div class="NewFrameex">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Date" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtDate" CssClass="input" runat="server" ReadOnly="True"></asp:TextBox>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Expenses Head" CssClass="label"></asp:Label>
                          <asp:DropDownList ID="drpExpenseHd" class="chosen-select" runat="server" Width="199px" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Expensesid"></asp:DropDownList>
                          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Expensesid, Name FROM ExpensesHeadTable"></asp:SqlDataSource>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Payee" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpPayee" class="chosen-select" runat="server" Width="199px" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="CompanyName" DataValueField="Supplerid"></asp:DropDownList>
                          <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Supplerid], [CompanyName] FROM [SupplierTable]"></asp:SqlDataSource>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Amount" CssClass="label"></asp:Label>
                 <asp:TextBox ID="txtAmount" CssClass="input" runat="server" ReadOnly="True"></asp:TextBox>
                </div>
                  <div class="form-group">

                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Save" Width="85px" Height="25px"/>

                      <asp:Button ID="btnReset" runat="server" Height="25px" Text="Reset" Width="85px" />

            </div>
                </div>
               
                 <div class="item-right"> 
                     <asp:Panel ID="PnlDesc" runat="server" Visible="False">
                 <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Expenses Head:" CssClass="label" Font-Bold="True" Font-Size="Small"></asp:Label>
                <asp:Label ID="lblExpHead" runat="server" CssClass="labels" Font-Bold="True"></asp:Label>
                     
                </div>
                         <div>&nbsp;</div>
                      <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Payee:" CssClass="label" Font-Bold="True"></asp:Label>
                  <asp:Label ID="Label13" runat="server" CssClass="labels" Font-Bold="True"></asp:Label>
                          
                </div>
                          <div>&nbsp;</div>
                      <div class="form-group">
                    <asp:Label ID="Label11" runat="server" Text="Amount:" CssClass="label" Font-Bold="True"></asp:Label>
                 <asp:Label ID="LBAmount" runat="server" CssClass="labels" Font-Bold="True"></asp:Label>
                </div>
                     </asp:Panel>
        </div>
                <div class="NewFrameex">
                          <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Item" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="DrpExpensesDet" class="chosen-select" runat="server" Width="199px" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="Name" Enabled="False"></asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Name, ID, Expensesid FROM ExpensesdetailsTable WHERE (Expensesid = @exph)">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="txtwelfaresort" Name="exph" PropertyName="Text" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                </div>
                     <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Description" CssClass="label"></asp:Label>
                    <asp:TextBox ID="TxtDescp" runat="server" CssClass="input" Enabled="False"></asp:TextBox>
                </div> 
                    <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Quantity" CssClass="label"></asp:Label>
                    <asp:TextBox ID="TxtQuantity" runat="server" CssClass="input" Enabled="False"></asp:TextBox>
                </div>
                     <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Unit Price" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtUnit" runat="server" CssClass="input" Enabled="False"></asp:TextBox>
                </div>
                                      <div class="form-group">
                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtMembername" runat="server" style="font-size: x-small" Visible="False" Width="23px"></asp:TextBox>
                     <asp:TextBox ID="txtStaffID" runat="server" Font-Size="XX-Small" Visible="False" Width="20px" Height="19px"></asp:TextBox>
                                          <asp:TextBox ID="txtwelfaresort" runat="server" Font-Size="XX-Small" Height="19px" Visible="False" Width="20px"></asp:TextBox>
                                          <asp:TextBox ID="txtNewid" runat="server" Font-Size="XX-Small" Height="19px" Visible="False" Width="20px"></asp:TextBox>
                                          <asp:TextBox ID="txtsort" runat="server" Font-Size="XX-Small" Height="19px" Visible="False" Width="20px"></asp:TextBox>
                                          <asp:TextBox ID="txtRaiseid" runat="server" Font-Size="XX-Small" Height="19px" Visible="False" Width="20px"></asp:TextBox>
                       </div>
                  <div class="form-group">

                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;

                <asp:Button ID="Button1" runat="server"  Text="Save" Width="80px" Height="30px"/>
                <asp:Button ID="Button2" runat="server" Text="Checkout" Width="80px" style="height: 30px" Visible="False" />

            </div>
                </div>
                        <div class="item-right">

            <asp:GridView ID="GridDesc" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource7" Font-Size="Medium" Height="30px" Width="400px" AllowPaging="True" AllowSorting="True" PageSize="3" Visible="False">
                <Columns>
                    <asp:BoundField DataField="ExpensesDetails" HeaderText="Details" SortExpression="ExpensesDetails" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="UnitPrice" DataFormatString="{0:0,0.00}" HeaderText="Unit Price" SortExpression="UnitPrice" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" DataFormatString="{0:0,0.00}" />
                </Columns>
            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT RaiseExpensedDetailTable.ExpensesDetails, RaiseExpensedDetailTable.UnitPrice, RaiseExpensedDetailTable.Quantity, RaiseExpensedDetailTable.Amount FROM RaiseExpensedDetailTable INNER JOIN RaiseExpensesHdTable ON RaiseExpensedDetailTable.RasieHeadid = RaiseExpensesHdTable.ID WHERE (RaiseExpensesHdTable.ID = @ID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtRaiseid" Name="ID" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>

        </div>
                </div>
            </asp:Panel>
         <div class="clear-fix"></div> 
        <asp:Panel ID="PnlSub" runat="server" Visible="False">
            <div class="formbox">
                 <div class="NewFrameex">
         <div class="form-group">
                    <asp:Label ID="Label17" runat="server" Text="Payment" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DropPayment" CssClass="drop-down" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="PaymentName" DataValueField="PaymentName">
                    </asp:DropDownList>
                       <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Total Amount
                    <asp:Label ID="GrandTotal" runat="server"></asp:Label>
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Id, PaymentName FROM PaymentMethodTable WHERE (PaymentName &lt;&gt; N'Card') AND (PaymentName &lt;&gt; N'Electronic Transfer') AND (PaymentName &lt;&gt; N'Bank Payment')"></asp:SqlDataSource>
                </div>
              <div class="form-group">
                    <asp:Label ID="Label20" runat="server" Text="Amount" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:TextBox ID="txtGrandAmount" runat="server" placeholder="Enter Amount" CssClass="input" Visible="False" onkeypress="return onlyNumbers(this.value);" onkeyup="NumToWord(this.value,'divDisplayWords');"
        maxlength="9" Height="16px"  ></asp:TextBox>
                </div>
                    
           
                  <div class="form-group">
                    <asp:Label ID="Label22" runat="server" Text="Account Name" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:TextBox ID="txtAccountName" runat="server" placeholder="Enter Acount Name" CssClass="input" Visible="False"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label23" runat="server" Text="Teller No" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:TextBox ID="txtTellno" runat="server" placeholder="Enter TellerNo" CssClass="input" Visible="False"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label24" runat="server" Text="Cheque No" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:TextBox ID="txtchequeno" runat="server" placeholder="Enter Cheque No" CssClass="input" Visible="False"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label25" runat="server" Text="Banks" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:DropDownList ID="DrpBanks" CssClass="drop-down" runat="server" AutoPostBack="True" Visible="False" DataSourceID="SqlDataSource4" DataTextField="Bankname" DataValueField="id">
                    </asp:DropDownList>
                         <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [id], [Bankname] FROM [BankTable]"></asp:SqlDataSource>
                </div>
                   
                  <div class="form-group">
                    <asp:Label ID="Label26" runat="server" Text="Date Issued" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:TextBox ID="txtDatepay" runat="server" placeholder="DD/MM/YYYY" CssClass="input" Visible="False"></asp:TextBox>
                </div>
             <div class="New-group">
                    <asp:Label ID="Label29" runat="server" Text="Card Number " CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:TextBox ID="TtxcardNo" runat="server" placeholder="Enter Card Number" CssClass="input" Visible="False"></asp:TextBox>
                </div>
         <div class="form-group">
                    <asp:Label ID="Label30" runat="server" Text="Expire Date" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:TextBox ID="txtExpire" runat="server" placeholder="Enter Card Expire Date" CssClass="input" Visible="False"></asp:TextBox>
                </div>
               <div class="form-group">
                    <asp:Label ID="Label31" runat="server" Text="Amount in Word" CssClass="label"></asp:Label>
                     <asp:TextBox ID="divDisplayWords"  runat="server" CssClass="msg" TextMode="MultiLine"></asp:TextBox>
                </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="Button4" runat="server"  Text="Save" Width="85px" Height="25px"/>

                      <asp:TextBox ID="txtcashM" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>

                      <asp:TextBox ID="txtVocher" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>

                      <asp:TextBox ID="txtVocherid1" runat="server" Font-Size="XX-Small" Height="19px" Visible="False" Width="20px"></asp:TextBox>
                      <asp:TextBox ID="txtVocherid2" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>

            </div>
                </div>
               
                 <div class="item-right"> 
                     <asp:Panel ID="PnlSubdes" runat="server" Visible="False">
                 <div class="form-group">
                    <asp:Label ID="Label21" runat="server" Text="Order Summary" Font-Bold="True" Font-Size="Large" Width="201px" ></asp:Label>
           
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label27" runat="server" Text="Total" CssClass="label"></asp:Label>
                 <asp:Label ID="lbSummary" runat="server" CssClass="label"></asp:Label>
                </div>
                     </asp:Panel>
        </div>
     
                </div>
            </asp:Panel>
           </div>
        
        <div class="clear-fix"></div> 
      
    <div class="footer">
        <p><a href="http://www.rolofdynamics.com/">RolofDynamics> © 2016 - cs> © 2016 - <% = Year(Now)%>. All rights reserved..</p>
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
