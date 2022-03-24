<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EditSermon.aspx.vb" Inherits="Sermon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Edit Sermon</title>
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
         &nbsp;&nbsp; <asp:Button ID="Button1" runat="server" Text="View Sermon" style="font-weight: 700;" Height="30px" Width="150px" />
            &nbsp;&nbsp;<br />
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
            <div class="formbox center">
            <div class="formframe">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Date" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtdate" runat="server" CssClass="input" ReadOnly="True"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Identifier" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtIdentifier" runat="server" placeholder="Enter Only String" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Sermon Title" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtsermontitle" runat="server" CssClass="input" placeholder="Enter topic" TextMode="MultiLine" ></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Scriptures" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtScripture" runat="server" CssClass="input" placeholder="Enter scriptures"  TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Pastor Name" CssClass="label"></asp:Label>
                     <asp:DropDownList ID="DrpName" CssClass="drop-down" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="Ministerid">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MinisterTable.Ministerid, MinisterTable.Name, ChurchDetailTable.ChurchDetailID FROM MinisterTable INNER JOIN ChurchDetailTable ON MinisterTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (ChurchDetailTable.ChurchDetailID = @chu)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Guest Speaker" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtGSpecker" runat="server" CssClass="input"></asp:TextBox>
                </div>
                                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Phone" CssClass="label" Visible="False"></asp:Label>
                    <asp:TextBox ID="txtPstNo" runat="server" CssClass="input" Visible="False"></asp:TextBox>
                </div>
                            <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Duration" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtDuration" runat="server" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Sermon Format" CssClass="label"></asp:Label>
                      <asp:CheckBox ID="CKDVD" runat="server" Text="DVD" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:CheckBox ID="CBAUDIO" runat="server" Text="AUDIO" />
                      <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:CheckBox ID="CKVIDEO" runat="server" Text="VIDEO" />
&nbsp;&nbsp;&nbsp;
                      <asp:CheckBox ID="CKMP3" runat="server" Text="MP3" />
                </div>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Keyword" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtkeyword" runat="server" CssClass="input"></asp:TextBox>
                </div>
                   <div class="form-group">
                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="txtPastor" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="DVD" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="Audio" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="video" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="mp" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="IdenSN" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                       </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Edit" Width="80px" Height="30px"/>
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="80px" style="height: 30px" />

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
