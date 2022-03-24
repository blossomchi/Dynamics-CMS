<%@ Page Language="VB" AutoEventWireup="false" CodeFile="BaptismEdit.aspx.vb" Inherits="BaptismEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Baptism Edit</title>
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
         <link href="css/style.css" rel="stylesheet" />
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
        <br />
                    <asp:Label ID="lblid" runat="server" CssClass="label" Visible="False"></asp:Label>
                
       
    </div>
        <br />
        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <asp:Button ID="btnViewRec" runat="server" Font-Bold="True" Font-Italic="True" Text="View Baptism Record" class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="35px" Width="180px" />
    <div class="main">
        <div class="formbox">
             <div class="NewFrameex">
                <div class="form-group">
                    <asp:Label ID="Label31" runat="server" Text="Visitors Only" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="drpbaptismname" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="FULLNAME" DataValueField="SN" Width="198px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, FirstName + ' ' + LastName AS FULLNAME FROM ClassTable"></asp:SqlDataSource>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label13" runat="server" Text="First Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtfirstname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                   <div class="form-group">
                    <asp:Label ID="Label15" runat="server" Text="Last Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtlastname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Phone Number" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPhone1" runat="server" CssClass="input"></asp:TextBox>
                </div>

                   <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Gender" CssClass="label"></asp:Label>
                       <asp:DropDownList ID="DropGender" CssClass= "drop-down" runat="server">
                           <asp:ListItem>Male</asp:ListItem>
                           <asp:ListItem>Female</asp:ListItem>
                       </asp:DropDownList>
                </div>
                    <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Parents" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtParents" runat="server" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Phone Number" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPhone3" runat="server" CssClass="input"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Baptism Date" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtBaptismDate" placeholder ="DD/MM/YYYY" runat="server" CssClass="input"></asp:TextBox>
                &nbsp;</div>
                  
                
            </div>

             <div class="NewFrameex">
                
                <div class="form-group">
                    <asp:Label ID="Label16" runat="server" Text="Authority" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="dropAuthority" runat="server" CssClass="drop-down"  Width="198px">
                    <asp:ListItem>Contact</asp:ListItem>
                    <asp:ListItem>Spouse</asp:ListItem>
                    <asp:ListItem>Child</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label11" runat="server" Text="Date of Birth" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtBirth" runat="server" placeholder ="DD/MM/YYYY" CssClass="input" AutoPostBack="True"></asp:TextBox>
                &nbsp;</div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Age" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAge" runat="server" CssClass="input"></asp:TextBox>
                &nbsp;</div>
                <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Pastor/Minister" CssClass="label"></asp:Label>
                      <asp:DropDownList  class="chosen-select"  ID="DropMinister" CssClass="drop-down" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Pastor" DataValueField="SN">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MinisterTable.Title + '  ' + MinisterTable.Name AS Pastor, MinisterTable.Post, MinisterTable.SN FROM ChurchDetailTable INNER JOIN MinisterTable ON ChurchDetailTable.ChurchDetailID = MinisterTable.ChurchName WHERE (ChurchDetailTable.ChurchDetailID = @chu)">
                          <SelectParameters>
                              <asp:ControlParameter ControlID="txtchurchid" Name="chu" PropertyName="Text" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Resident Address" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Place of Birth" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPOB" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtDes" runat="server" Visible="False" Font-Size="9px" Width="5px"></asp:TextBox>
                    <asp:TextBox ID="txtst" runat="server" Visible="False" Font-Size="9px" Width="5px"></asp:TextBox>
                     <asp:TextBox ID="txtname" runat="server" style="font-size: x-small" Visible="False" Width="5px"></asp:TextBox>
                     <asp:TextBox ID="txtfulname" runat="server" Font-Size="XX-Small" Visible="False" Width="5px"></asp:TextBox>
                       <asp:TextBox ID="txtControl" runat="server" Visible="False" Width="5px"></asp:TextBox>
                       <asp:TextBox ID="txtchurchid" runat="server" Visible="False" Width="5px"></asp:TextBox>
                     <asp:TextBox ID="txtStaffID" runat="server" Font-Size="XX-Small" Visible="False" Width="5px"></asp:TextBox>

                       <asp:TextBox ID="txtMemID" runat="server" Visible="False" Width="5px"></asp:TextBox>

                     <asp:TextBox ID="picTextBox" runat="server" Font-Size="XX-Small" Visible="False" Width="5px" Height="19px"></asp:TextBox>
                       <asp:TextBox ID="txtchurchID0" runat="server" Visible="False" Font-Size="9px" Width="5px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="5px"></asp:TextBox>

                       <asp:TextBox ID="txtLocation" runat="server" Visible="False" Width="5px"></asp:TextBox>

                       <asp:TextBox ID="txtfamilyid" runat="server" Visible="False" Width="5px"></asp:TextBox>

                       <asp:TextBox ID="txtmemberid" runat="server" Visible="False" Width="5px"></asp:TextBox>

                       <asp:TextBox ID="txtchildid" runat="server" Visible="False" Width="5px"></asp:TextBox>
                </div>
                 <div>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                
                <asp:Button ID="btnSave" runat="server" class="a_demo_one" Text="Edit" Width="60px" style="height: 40px" />

                
            </div>
            </div>
        </div>
        <div class ="picturebox">
        <div>
            <asp:Image ID="Memberimage" runat="server" Height="118px" Width="198px" />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="Upload" runat="server" Text="Upload" Visible="False" ToolTip="Upload and update picture." />
         
            <br />
            <br />
            <br />
&nbsp;&nbsp; <asp:Button ID="btnchange" runat="server" class="a_demo_one" Text="Change Picture" Width="150px" style="height: 40px; left: 0px;" />
        </div>
            
        </div>


        <div class="clear-fix"></div> 
    </div> 

    <div class="footer">
         <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p>
</div>
         
        </div>
        <script type="text/javascript">
            var config = {
                '.chosen-select': {}
            }
            for (var selector in config) {
                $(selector).chosen(config[selector]);
            }
      </script>
    </form>
</body>
</html>
