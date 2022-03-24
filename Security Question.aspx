<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Security Question.aspx.vb" Inherits="Security_Question" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Security Question</title>
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
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <%-- <asp:Label ID="lblname0" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px">LOG IN AS :</asp:Label>
                   <asp:Label ID="AdminLabel" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname1" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbChurchName" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbLocation" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lbLocation0" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbState" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>--%>
            <asp:Label ID="Label7" runat="server" CssClass="label"></asp:Label>
<asp:Label ID="lblserviceid" runat="server" CssClass="label"></asp:Label>
             </div><br />

             <div class="linknav">  
             <a  href="Login.aspx">Exit</a>
        </div>
                    
                   
    </div>
          
    <div class="main">
         <h2>Security Questions</h2>
         <p>
             &nbsp;</p>
            <div class="formbox">
            <div class="formframe">
          <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Username" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="input"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Question" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DrpQuestion" CssClass="drop-down" runat="server" DataSourceID="SqlDataSource6" DataTextField="Question" DataValueField="Question" AutoPostBack="True">
                    </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Question] FROM [QuestionTable]"></asp:SqlDataSource>
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

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtLocation" runat="server" Visible="False" Width="16px"></asp:TextBox>

                       <asp:TextBox ID="txtPMemberid" runat="server" Visible="False" Width="16px"></asp:TextBox>

                       <asp:TextBox ID="txtPUsername" runat="server" Visible="False" Width="16px"></asp:TextBox>

                       </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Check" Width="80px" Height="30px"/>
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
    </form>
</body>
</html>
