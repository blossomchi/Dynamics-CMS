<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BranchDetails.aspx.vb" Inherits="BranchDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>New Church</title>
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
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
           </div>
        <div class="clear-fix">
                    <asp:Label ID="lblserviceid" runat="server" CssClass="label"></asp:Label>
                    </div>
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
         <h2>Add New Church</h2>
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
            <div class="formbox center">
              <div class="NewFrame">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Church" CssClass="label"></asp:Label>
                  
                    <asp:DropDownList ID="DrpChurch" runat="server" class="chosen-select" DataSourceID="SqlDataSource1" DataTextField="Branch" DataValueField="ChurchDesgID" AutoPostBack="True">
                    </asp:DropDownList>
                  
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [ChurchDesgID], [Branch] FROM [ChurchDesignationTable]"></asp:SqlDataSource>
                  
                </div>

                   <div class="form-group">
                    <asp:Label ID="Label15" runat="server" Text="Church Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtchurchname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Address" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtaddress" runat="server" CssClass="input" placeholder="Enter Home Address" TextMode="MultiLine" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label18" runat="server" Text="Country" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="Dropcountry" class="chosen-select"  runat="server" DataSourceID="SqlDataSource2" DataTextField="CountryName" DataValueField="ID"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [ID], [CountryName] FROM [Country]"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="State" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DrpState" class="chosen-select" runat="server" DataSourceID="SqlDataSource5" DataTextField="State" DataValueField="Stateid" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Stateid], [State] FROM [StateTable]"></asp:SqlDataSource>
                </div>
                
                 <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Town/Location" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DrpLocation" class="chosen-select" runat="server" DataSourceID="SqlDataSource6" DataTextField="Name" DataValueField="Locationid">
                    </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Locationid], [Name] FROM [Location]"></asp:SqlDataSource>
                </div>

                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                <div>
                     <asp:TextBox ID="txtDes" runat="server" Visible="False" Width="20px"></asp:TextBox>
                      <asp:TextBox ID="txtState" runat="server" Visible="False" Width="20px"></asp:TextBox>
                </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                     
   <asp:Button ID="btnSave" runat="server"  Text="Save" class="a_demo_one"  Width="100px" Height="40px"/>
                <asp:Button ID="btnCancel" runat="server" class="a_demo_one"  Text="Cancel" Width="100px" style="height: 40px" Height="60px" />

            </div>
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
