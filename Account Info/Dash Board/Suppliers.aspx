<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Suppliers.aspx.vb" Inherits="Suppliers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Suppliers</title>
         <link href="../css/menu.css" rel="stylesheet" />
         <link href="css/style.css" rel="stylesheet" />
     <link href="../../css/menu.css" rel="stylesheet" />
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
       
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
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
                    </div>
                
    </div>
         <div>
           &nbsp;&nbsp;&nbsp;
       </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button3" runat="server" Text="View Suppliers " style="font-style: italic; font-weight: 700;" Height="30px" Width="160px" BackColor="#EEEEEE" />
    <div class="main">
        <div class="formbox">
            <div class="formframe">
                 <div class="form-group">
                    <asp:Label ID="Label13" runat="server" Text="Company Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtCompanyname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Address Line" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAddress1" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Phone 1" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPhone1" runat="server" CssClass="input"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label14" runat="server" Text="Phone 2" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPhone2" runat="server" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Supply Item" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtSupplyItem" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div> 
            </div>

            <div class="formframe">
                <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Bank" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="drpBank" CssClass =" drop-down" runat="server" DataSourceID="bank" DataTextField="Bankname" DataValueField="Bankname">
                        <asp:ListItem>Savings</asp:ListItem>
                        <asp:ListItem>Current</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label11" runat="server" Text="Account Type" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="drpAccount" CssClass =" drop-down" runat="server">
                        <asp:ListItem>Savings</asp:ListItem>
                        <asp:ListItem>Current</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Account Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAccountName" placeholder ="Account Name" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Account Number" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAcountNo" placeholder ="Account Number" runat="server" CssClass="input"></asp:TextBox>
                </div>
                
                <div class="form-group">
                       <asp:TextBox ID="txtControl" runat="server" Visible="False" Width="18px"></asp:TextBox>
                       <asp:TextBox ID="txtchurchid" runat="server" Visible="False" Width="18px"></asp:TextBox>

                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                    <asp:TextBox ID="txtBank" runat="server" CssClass="input" Visible="False" Width="20px"></asp:TextBox>
                       <asp:SqlDataSource ID="bank" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [id], [Bankname] FROM [BankTable]"></asp:SqlDataSource>

                </div>
                <div>
                    &nbsp;
                </div>
                   <div>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" Text="Save" Width="64px" style="height: 26px" />
&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Cancel" />

            </div>
            </div>
        </div>
     

        <div class="clear-fix"></div> 
    </div> 

    <div class="footer">
       <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p>
</div>
         
        </div>
    </form>
</body>
</html>
