<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Loan.aspx.vb" Inherits="Loan" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
       <title>Loan</title>
     
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
        .auto-style1 {
            display: inline-block;
            margin-left: 10px;
            width: 98%;
            font-size: small;
        }
        .auto-style2 {
            width: 344px;
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
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button3" runat="server" Text="View Loan" class="a_demo_one"  Width="180px" Height="40px" />
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
            <div class="formbox">
                 <div class="NewFrameex">
                      <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Applicant" CssClass="label"></asp:Label>
                          <asp:DropDownList ID="CBMembers" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="MEMDS" DataTextField="Members" DataValueField="Memberid" Width="200px"></asp:DropDownList>
                </div>
                        <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Loan Head" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtLoanHead" runat="server" CssClass="input" ReadOnly="True" Width="200px"></asp:TextBox>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Address" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtMsg" runat="server" CssClass="msg" TextMode="MultiLine" Width="200px"></asp:TextBox>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Mobile Phone 1" CssClass="label"></asp:Label>
                    <asp:TextBox ID="TxtPhone" runat="server" CssClass="msg" Width="200px"></asp:TextBox>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Mobile Phone 2" CssClass="label"></asp:Label>
                    <asp:TextBox ID="TxtMobile" runat="server" CssClass="msg" Width="200px"></asp:TextBox>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Date Of Birth" CssClass="label"></asp:Label>
                    <asp:TextBox ID="TxtDOB" runat="server" CssClass="msg" Width="200px"></asp:TextBox>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Marital Status" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtStatus" runat="server" CssClass="msg" Width="200px"></asp:TextBox>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Email" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="msg" Width="200px"></asp:TextBox>
                </div>
                      <div class="form-group">
                          <hr class="auto-style2" />
                </div>
                     <div class="form-group">
                        <strong>
                    <asp:Label ID="Label19" runat="server" Text="Guarantor" CssClass="label"></asp:Label>
                                       </strong>
                                       </div>
                      <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Guarantor" CssClass="label"></asp:Label>
                    <asp:TextBox ID="TxtGuarantor" runat="server" CssClass="msg" Width="200px"></asp:TextBox>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Address Of Guarantor" CssClass="label"></asp:Label>
                    <asp:TextBox ID="TxtAddGuarantor" runat="server" CssClass="msg" Width="200px" TextMode="MultiLine"></asp:TextBox>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label11" runat="server" Text="Place Of Work" CssClass="label"></asp:Label>
                    <asp:TextBox ID="TxtGuarantorWork" runat="server" CssClass="msg" Width="200px" TextMode="MultiLine"></asp:TextBox>
                </div>
                     
                
                </div>
                <div class="NewFrameex">
                     <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Guarantor's NO" CssClass="label"></asp:Label>
                    <asp:TextBox ID="TxtGuarantorPhone" runat="server" CssClass="msg" Width="200px"></asp:TextBox>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label13" runat="server" Text="Guarantor's Email" CssClass="label"></asp:Label>
                    <asp:TextBox ID="TxtGuarantorEmail" runat="server" CssClass="msg" Width="200px"></asp:TextBox>
                </div>
                     <div class="form-group">
                          <hr class="auto-style2" />
                </div>
                    <div class="form-group">
                        <strong>
                    <asp:Label ID="Label18" runat="server" Text="Loan/Repayment" CssClass="label"></asp:Label>
                                       </strong>
                                       </div>
                              <div class="form-group">
                    <asp:Label ID="Label16" runat="server" Text="New Loan" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAmountLoan" runat="server" CssClass="msg" Width="200px"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label14" runat="server" Text="Purpose Of Loan" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPurpose" runat="server" CssClass="msg" Width="200px" Height="150px" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label15" runat="server" Text="Date Collected" CssClass="label"></asp:Label>
                   <telerik:RadDatePicker ID="DateCollectedPicker" Runat="server" Culture="en-US" FocusedDate="2018-07-17" MinDate="1950-01-01">
<Calendar runat="server" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

<DateInput runat="server" DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" EnableSingleInputRendering="True" LabelWidth="64px"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                     </telerik:RadDatePicker>
                </div>
                   
                <div class="form-group">
                    <asp:Label ID="Label17" runat="server" Text="Repayment Date" CssClass="label"></asp:Label>
                   <telerik:RadDatePicker ID="RepaymentPicker" Runat="server" Culture="en-US" FocusedDate="2018-07-17" MinDate="1950-01-01">
<Calendar runat="server" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

<DateInput runat="server" DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" EnableSingleInputRendering="True" LabelWidth="64px"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                     </telerik:RadDatePicker>
                </div>
                      <div class="form-group">

                     </div>
                 <div class="form-group">
                      <asp:Button ID="btnSave" runat="server"  Text="Save" Width="80px" Height="30px"/>
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="80px" style="height: 30px" />

                </div>
                 
                
               
                  <div class="form-group">
                  
                      
                   <div class="form-group">
                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtMembername" runat="server" style="font-size: x-small" Visible="False" Width="23px"></asp:TextBox>
                     <asp:TextBox ID="txtStaffID" runat="server" Font-Size="XX-Small" Visible="False" Width="20px" Height="19px"></asp:TextBox>
                     <asp:TextBox ID="txtexpenid" runat="server" style="font-size: x-small" Visible="False" Width="23px"></asp:TextBox>
                     <asp:TextBox ID="txtMemID" runat="server" style="font-size: x-small" Visible="False" Width="23px"></asp:TextBox>
                     <asp:TextBox ID="txtLoanID" runat="server" style="font-size: x-small" Visible="False" Width="23px"></asp:TextBox>
                       </div>
                
                      
                </div>
            </div>
                    <div class="auto-style1">
                                  <asp:GridView ID="gridAscending" runat="server" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="6" Font-Size="Medium" Height="30px" Width="803px" ForeColor="#333333" GridLines="None" PageSize="5" ShowFooter="True" style="font-size: small; font-weight: 700;" CellSpacing="2" BorderStyle="Solid" DataKeyNames="Loanid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Loanid" HeaderText="Loan ID" SortExpression="Loanid" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Members" HeaderText="Members" SortExpression="Members" />
                    <asp:BoundField DataField="GuarantorName" HeaderText="Guarantor's Name" SortExpression="GuarantorName" />
                    <asp:BoundField DataField="GPhone" HeaderText="Guarantor's Phone" SortExpression="GPhone" />
                    <asp:BoundField DataField="GAddress" HeaderText="Guarantor's Address" SortExpression="GAddress" />
                    <asp:BoundField DataField="GEmail" HeaderText="Guarantor's Email" SortExpression="GEmail" />
                    <asp:BoundField DataField="LoanAmount" HeaderText="Loan Amount" SortExpression="LoanAmount" />
                    <asp:BoundField DataField="Purpose" HeaderText="Purpose" SortExpression="Purpose" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT LoanHeadTable.Loanid, LoanHeadTable.Name, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS Members, LoanHeadTable.GuarantorName, LoanHeadTable.GPhone, LoanHeadTable.Purpose, LoanHeadTable.LoanAmount, LoanHeadTable.GAddress, LoanHeadTable.GEmail FROM LoanHeadTable INNER JOIN MembershipTable ON LoanHeadTable.MembershipID = MembershipTable.Memberid ORDER BY LoanHeadTable.Name, LoanHeadTable.Loanid">
            </asp:SqlDataSource>
           
                                  <asp:SqlDataSource ID="MEMDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Memberid, FirstName + ' ' + LastName AS Members FROM MembershipTable WHERE (Memberid &lt;&gt; N'MEB1')"></asp:SqlDataSource>
           
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
