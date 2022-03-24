<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Welfare.aspx.vb" Inherits="Welfare" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welfare</title>
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
            <p class="church-watch">RolofDynamics Church Watch</p>
             <p class="church-mgt">Church Management Software</p>
        </div>
       
            <div style="float:right">
        <asp:Image ID="Image1" runat="server" Height="100px" Width="138px" class="headerImg" ImageUrl="~/image/New.PNG" />
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
       
    </div>

    <div class="main">
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button3" runat="server" Text="View Welfare Record " class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="40px" Width="180px"  />
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
           <div class="formbox center">
            <div class="NewFrame">
   
                 <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Date Raised" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtDate" runat="server" placeholder="DD/MM/YYYY" CssClass="input" Width="260px"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Church" CssClass="label" Height="16px"></asp:Label>
                     <asp:TextBox ID="txtName1" runat="server" placeholder="Church Name" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Year" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:TextBox ID="txtYear" runat="server" placeholder="Church Name" CssClass="input" Visible="False"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Giving" CssClass="label" Visible="False"></asp:Label>
                    <asp:DropDownList ID="drpGiving" CssClass="drop-down" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Expensesid" Visible="False">
                    </asp:DropDownList>
                       <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Expensesid, Name FROM ExpensesHeadTable WHERE (Name = N'Welfare')"></asp:SqlDataSource>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Welfare" CssClass="label" Visible="False"></asp:Label>
                    <asp:DropDownList ID="drpWelfare" CssClass="drop-down" runat="server" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="ID" AutoPostBack="True" Visible="False">
                    </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Expensesid, Name, ID FROM ExpensesdetailsTable WHERE (Expensesid = @exp)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="txtwelfaresort" Name="exp" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Payment" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DropPayment" CssClass="drop-down" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="PaymentName" DataValueField="PaymentName">
                    </asp:DropDownList>
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Id, PaymentName FROM PaymentMethodTable"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label11" runat="server" Text="Currency" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:DropDownList ID="DrpCurrency" CssClass="drop-down" runat="server" DataSourceID="SqlDataSource5" DataTextField="Currency_Code" DataValueField="Exchange_Rate" AutoPostBack="True" Visible="False">
                    </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Currency_Code], [Exchange_Rate] FROM [Exchange_RateTable]"></asp:SqlDataSource>
                </div>
               
                  <div class="New-group">
                    <asp:Label ID="Label13" runat="server" Text="Exchange Amount" CssClass="label" Height="16px" Visible="False"></asp:Label>
                       <asp:TextBox ID="txtSecoundValue" CssClass="input" runat="server" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();" Visible="False" Width="100px"></asp:TextBox>
                   <asp:Button ID="btnConvert" runat="server" Text="Convert" Visible="False" Height="26px" />
                </div>
                     <div class="form-group">
                    <asp:Label ID="Label17" runat="server" Text="Amount" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:TextBox ID="Text1" runat="server" placeholder="Enter Amount" CssClass="input" Visible="False" onkeypress="return onlyNumbers(this.value);" onkeyup="NumToWord(this.value,'divDisplayWords');"
        maxlength="9" Height="16px" ></asp:TextBox>
                </div>
                    <div class="form-group">
                    <asp:Label ID="Label19" runat="server" Text="Account Name" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:TextBox ID="txtAccountName" runat="server" placeholder="Enter Acount Name" CssClass="input" Visible="False"></asp:TextBox>
                </div>
                     <div class="form-group">
                    <asp:Label ID="Label14" runat="server" Text="Teller No" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:TextBox ID="txtTellno" runat="server" placeholder="Enter TellerNo" CssClass="input" Visible="False"></asp:TextBox>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label15" runat="server" Text="Cheque No" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:TextBox ID="txtchequeno" runat="server" placeholder="Enter Cheque No" CssClass="input" Visible="False"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label16" runat="server" Text="Banks" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:DropDownList ID="DrpBanks" CssClass="drop-down" runat="server" Visible="False" DataSourceID="SqlDataSource4" DataTextField="Bankname" DataValueField="id">
                        <asp:ListItem>UBA</asp:ListItem>
                        <asp:ListItem>ECO BANK</asp:ListItem>
                        <asp:ListItem>ZENITH</asp:ListItem>
                    </asp:DropDownList>
                         <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [id], [Bankname] FROM [BankTable]"></asp:SqlDataSource>
                </div>
                   
                      <div class="form-group">
                    <asp:Label ID="Label18" runat="server" Text="Date Issued" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:TextBox ID="txtDatepay" runat="server" placeholder="Enter Date issued" CssClass="input" Visible="False"></asp:TextBox>
                </div>
              <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Card Number " CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:TextBox ID="TtxcardNo" runat="server" placeholder="Enter Card Number" CssClass="input" Visible="False"></asp:TextBox>
                </div>
             <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Expire Date" CssClass="label" Height="16px" Visible="False"></asp:Label>
                     <asp:TextBox ID="txtExpire" runat="server" placeholder="Enter Card Expire Date" CssClass="input" Visible="False"></asp:TextBox>
                </div>
                    <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Amount in Word" CssClass="label"></asp:Label>
                     <asp:TextBox ID="divDisplayWords" runat="server" CssClass="msg" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="txtst" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtMembername" runat="server" style="font-size: x-small" Visible="False" Width="23px"></asp:TextBox>
                     <asp:TextBox ID="txtfulname" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtcashM" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtStaffID" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtFirstValue" runat="server" Font-Size="XX-Small" Width="20px" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();" Visible="False"></asp:TextBox>
                     <asp:TextBox ID="txtwelfaresort" runat="server" Font-Size="XX-Small" Width="20px" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();" Visible="False"></asp:TextBox>
                       </div>
                     <div class="container_buttons">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server" class="a_demo_one" Text="Save" Width="100px" Height="40px"/>
                <asp:Button ID="btnCancel" runat="server" class="a_demo_one"  Text="Cancel" Width="100px" style="height: 40px" Height="60px" />

            </div>
                </div>
          
                </div>
                </div>
         <div class="clear-fix"></div> 
         

    <div class="footer">
        <p>The footer text goes here.</p>
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
