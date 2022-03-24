<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AccountInfo.aspx.vb" Inherits="AccountInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Account Info</title>
   <link href="css/style.css" rel="stylesheet" />
      <link href="../../css/menu.css" rel="stylesheet" />

    <style type="text/css">
        #form1 {
            height: 667px;
        }

		.panel-block{
			width: 400px;
			display: inline-block;
			 margin-left: 50px;
			background-color: #eee;
			box-shadow: 1px 1px 2px #999;
           
		}
		.panel-block h4{
			background-color: #3e6911;
			color: #FFF;
			padding: 5px 10px;
			text-align: left;
             
		}
		.panel-block ul{
			list-style-type: none;
			padding: 5px 10px;
          
		}
		.panel-block li{
			margin-bottom: 3px;
		}
		.panel-block a{
			color: #025c8b;
			text-decoration: none;
		}
		.panel-block a:hover{
			text-decoration: underline;
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
        <br />
<asp:Label ID="lblserviceid" runat="server" CssClass="label"></asp:Label>
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
      
         <div>
            &nbsp;
        </div>
         <div>
            &nbsp;
        </div>
          <div style="align:center; text-align: center;">
		   <div class="panel-block">
			<h4>Other Details</h4>
			<ul>
                 <li><a href="Bank.aspx">Add and View Banks</a></li>
                	<li><a href="ViewSupplier.aspx">View Suppliers Details</a></li>
                <li><a href="Currency.aspx">Add New Currency</a></li>
                <li><a href="ExchangeRate.aspx">Add New Exchange Rate </a></li>
			</ul>
               </div>
		</div>
        <div>
            &nbsp;
        </div>
            <div class="clear-fix"></div> 
   <div>
                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       </div>

    <div class="footer">
       <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p>
    </div>
               </div>
    </form>
</body>
</html>
