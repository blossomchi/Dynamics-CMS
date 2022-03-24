<%@ Page Language="VB" AutoEventWireup="false" CodeFile="NonMember.aspx.vb" Inherits="NonMember" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
             <title>Define Non Users</title>
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
           <p class="church-watch">RolofDynamics Church Watch</p>
             <p class="church-mgt">Church Management Software</p>
        </div>
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
        <div class="clear-fix">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblname0" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px">LOG IN AS :</asp:Label>
                   <asp:Label ID="AdminLabel" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname1" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbChurchName" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbLocation" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lbLocation0" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbState" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
            <asp:Label ID="Label7" runat="server" CssClass="label"></asp:Label>
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
         <h2>Define Church Users (Non Members)</h2>
         <p>
             
             <asp:Button ID="Button1" runat="server" class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="40px" Text="Back" />
             
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
             
             <asp:Label ID="Lblid1" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
         <p>
             &nbsp;</p>
            <div class="formbox">
            <div class="formframe">
                  <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="First Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtFirstname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Last Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtFamilyname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Phone" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPhone1" runat="server" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label14" runat="server" Text="Gender" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpGender" CssClass="drop-down" runat="server">
                            <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                      </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Date of Birth" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtDOB" runat="server" placeholder="DD/MM/YYYY" CssClass="input"></asp:TextBox>
                </div>
                    <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Martial Status" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="Dropmarital" runat="server" CssClass="drop-down">
                        <asp:ListItem>Single</asp:ListItem>
                        <asp:ListItem>Married</asp:ListItem>
                        <asp:ListItem>Separated</asp:ListItem>
                        <asp:ListItem>Single</asp:ListItem>
                        <asp:ListItem>Window</asp:ListItem>
                       <asp:ListItem>Windower</asp:ListItem>
                      
                    </asp:DropDownList>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label11" runat="server" Text="Address" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAdress" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label19" runat="server" Text="State Resident" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="drpstate" CssClass="drop-down" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="State" DataValueField="Stateid">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Stateid], [State] FROM [StateTable]"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label27" runat="server" Text="Church location" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DropChurch" runat="server" CssClass="drop-down" AutoPostBack="True" DataSourceID="CDS" DataTextField="ChurchName" DataValueField="ChurchDetailID"> </asp:DropDownList>
                     <asp:SqlDataSource ID="CDS" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ChurchName, ChurchDetailID, Stateid FROM ChurchDetailTable WHERE (Stateid = @ST)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="txtst" Name="ST" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                   </div>
                </div>
                <div class="formframe">
                 
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Designation" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="drpDesignation" CssClass="drop-down" runat="server" DataSourceID="SqlDataSource3" DataTextField="Role" DataValueField="Roleid">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Roleid], [Role] FROM [RoleTable]"></asp:SqlDataSource>
                </div>
                <br />
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Username" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Password" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Question" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DrpQuestion" CssClass="drop-down" runat="server" DataSourceID="SqlDataSource1" DataTextField="Question" DataValueField="Question" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Question] FROM [QuestionTable]"></asp:SqlDataSource>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label15" runat="server" Text="Answer" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAns" runat="server" CssClass="input"></asp:TextBox>
                </div>
                      <div class="form-group">
                    <asp:Label ID="Label13" runat="server" Text="Question" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DrpQuestion2" CssClass="drop-down" runat="server" DataSourceID="SqlDataSource4" DataTextField="Question" DataValueField="Question" AutoPostBack="True">
                    </asp:DropDownList>
                          <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Question] FROM [QuestionTable]"></asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Answer" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAns2" runat="server" CssClass="input"></asp:TextBox>
                </div>
                   <div class="form-group">

                       <asp:TextBox ID="txtst" runat="server" Font-Size="9px" Visible="False" Width="16px"></asp:TextBox>
                       <asp:TextBox ID="txtDes" runat="server" Font-Size="9px" Visible="False" Width="19px"></asp:TextBox>

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtLocation" runat="server" Visible="False" Width="16px"></asp:TextBox>

                       </div>
                    <br />
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Save" Width="80px" Height="30px"/>
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
