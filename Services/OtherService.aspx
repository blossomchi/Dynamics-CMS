<%@ Page Language="VB" AutoEventWireup="false" CodeFile="OtherService.aspx.vb" Inherits="OtherService" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Other Services</title>
    <link href="css/style2.css" rel="stylesheet" />
         <link href="css/Style.css" rel="stylesheet" />
      <link href="../css/menu.css" rel="stylesheet" />
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

       		.panel-block{
			width: 400px;
			display: inline-block;
			margin: 20px;
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
        <div class="bg-header">
        </div>
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
                 

               <div style=" width: 90%; margin: 0 auto;">
                   <div> &nbsp; </div>
  <h2 style="color:#3e6911;" >&nbsp;&nbsp;&nbsp;Other Services</h2>
           <div> &nbsp; </div>
            <div> &nbsp; </div>
		<div class="panel-block">
			<h4>Established</h4>
			<ul>
                	<li><a href="Serviceunit.aspx">Add Services Unit</a></li>
				<li><a href="Town.aspx">Add New Town</a></li>
				<li><a href="Areaform.aspx">Add New Area</a></li>
              
			</ul>
		</div>

		<div class="panel-block">
			<h4>Deligate</h4>
			<ul>
				<li><a href="../Designation.aspx">Define user desgination</a></li>
	            <li><a href="CommitteeDefine.aspx">Define a Committe</a></li>				
                	<li><a href="PledgeDefine.aspx">Define Church Project</a></li>
                	
			</ul>
		</div>
 </div>
	
	 
            <div class="clear-fix"></div> 
   <div>
                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

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
