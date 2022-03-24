<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LoanEdit.aspx.vb" Inherits="ExpenseEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Loan Edit</title>
     
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
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button3" runat="server" Text="View Loan" class="a_demo_one"  Width="180px" Height="40px" />
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
            <div class="formbox">
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                 <div class="NewFrameex">
                        <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Expenses Head" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtLoanHead" runat="server" CssClass="input"></asp:TextBox>
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

            <asp:GridView ID="gridHeader" runat="server" AutoGenerateColumns="False" CellPadding="1" DataSourceID="SqlDataSource2" Font-Size="Medium" Height="30px" Width="400px" AllowPaging="True" AllowSorting="True" ForeColor="#333333" GridLines="None" PageSize="1" DataKeyNames="Loanid">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Loanid" HeaderText="Loanid" SortExpression="Loanid" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
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
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Loanid, Name FROM LoanHeadTable WHERE (Loanid = @expen)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="txtMemID" Name="expen" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                     <div>
                         &nbsp;
                     </div>
        </div>
                    <div>

                        <asp:TextBox ID="txtLHead" Width="20px" Visible="false" runat="server"></asp:TextBox>
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
