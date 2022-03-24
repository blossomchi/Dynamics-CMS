<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Marriage.aspx.vb" Inherits="Marriage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Marriage</title>
  <script src="jquery/chosen.jquery.js"></script>
    <link href="jquery/chosen.css" rel="stylesheet" />
    <script src="jquery/Jquery/jquery-1.7.1.min.js"></script>
    <script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>
    <script src="jquery/chosen.jquery.min.js"></script>
    <script src="jquery/chosen.proto.min.js"></script>
    <script src="jquery/chosen.proto.js"></script>
    <link href="css/style2.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
      
    <style type="text/css">
        #form1 {
            height: 667px;
        }
    </style>
    <script type="text/javascript">
        function DisplayFullImage(ctrlimg) {
            txtCode = "<HTML><HEAD>"
            + "</HEAD><BODY TOPMARGIN=0 LEFTMARGIN=0 MARGINHEIGHT=0 MARGINWIDTH=0><CENTER>"
            + "<IMG src='" + ctrlimg.src + "' BORDER=0 NAME=FullImage "
            + "onload='window.resizeTo(document.FullImage.width,document.FullImage.height)'>"
            + "</CENTER>"
            + "</BODY></HTML>";
            mywindow = window.open('', 'image', 'left=100,top=100,right=100,bottom=100,width=700,height=500,resizable=yes,scrollbars=1');
            mywindow.document.open();
            mywindow.document.write(txtCode);
            mywindow.document.close();
            mywindow.focus();
            mywindow.print();
        }
</script>
</head>
<body>
    <form id="form1" runat="server">
  <div class="wrapper">
    <div class="header">
        <div class="bg-header"></div>
        <div class="header-text">
             <p class="church-watch">&nbsp;&nbsp;RolofDynamics Church Watch</p>
               <p class="church-mgt">&nbsp;&nbsp;&nbsp;&nbsp; Church Management Software</p>
        </div>
       
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
        <div class="clear-fix">
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblname0" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px">LOG IN AS :</asp:Label>
                   <asp:Label ID="AdminLabel" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname1" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbChurchName" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbLocation" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lbLocation0" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbState" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblid" runat="server" CssClass="label" Visible="False"></asp:Label>
                    <br />
                    </div>
       
    </div>
      <br />
      <br />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Button ID="btnViewRec" runat="server" Font-Bold="True" Font-Italic="True" Text="View Marriage Record" class="a_demo_one"  Width="180px" Height="40px" />
      <br />
    <div class="main">
        <div class="formbox">
           <div class="NewFrameex">
                <em>HUSBAND</em><br />
&nbsp;<div class="form-group">
                    <asp:Label ID="Label31" runat="server" Text="Members(Only)" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DrpHusband" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="FULLNAME" DataValueField="SN" Width="198px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS FULLNAME, MembershipTable.Memberid FROM MembershipTable INNER JOIN ChurchDetailTable ON MembershipTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (ChurchDetailTable.ChurchDetailID = @chu) AND (MembershipTable.Memberid &lt;&gt; N'MEB1')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label17" runat="server" Text="First Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtFirstname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label18" runat="server" Text="Surname" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label19" runat="server" Text="Phone Number" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Date of Birth" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtDOB" runat="server" placeholder="DD/MM/YYYY" CssClass="input"></asp:TextBox>
                </div>

                   <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Parents(Mr/Mrs)" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtParents" runat="server" placeholder="Enter Parents name" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label13" runat="server" Text="Parents Number" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtHParentsNo" runat="server" placeholder="Enter Parents number" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label14" runat="server" Text="Parents(Address)" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtHParentsAddress" runat="server" placeholder="Enter Parents Address" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>

         <div class="NewFrameex">
                <em>WIFE</em><br />
&nbsp;<div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Members(Only)" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DrpWife" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="FULLNAME" DataValueField="SN" Width="198px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS FULLNAME, MembershipTable.Memberid FROM MembershipTable INNER JOIN ChurchDetailTable ON MembershipTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (ChurchDetailTable.ChurchDetailID = @chu) AND (MembershipTable.Memberid &lt;&gt; N'MEB1')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label11" runat="server" Text="First Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtWfirtsname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label20" runat="server" Text="Surname" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtWlastname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label21" runat="server" Text="Phone Number" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtphone2" runat="server" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label22" runat="server" Text="Date of Birth" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtWDob" runat="server" placeholder="DD/MM/YYYY" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Parents(Mr/Mrs)" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtWparents" placeholder="Enter Parents name" runat="server" CssClass="input"></asp:TextBox>
                </div>
              <div class="form-group">
                    <asp:Label ID="Label15" runat="server" Text="Parents Number" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtWphone" runat="server" placeholder="Enter Parents Number" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label16" runat="server" Text="Parents(Address)" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtWparentAd" runat="server" placeholder="Enter Parents Address" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtDes" runat="server" Visible="False" Font-Size="9px" Width="23px"></asp:TextBox>
                    <asp:TextBox ID="txtst" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtname" runat="server" style="font-size: x-small" Visible="False" Width="26px"></asp:TextBox>
                     <asp:TextBox ID="txtfulname" runat="server" Font-Size="XX-Small" Visible="False" Width="26px"></asp:TextBox>

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtLocation" runat="server" Visible="False" Width="16px"></asp:TextBox>

                </div>
            </div>
            <div class="NewFrameex">
                &nbsp; ATTENDEE<br />
&nbsp;<div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Pastor/Reverend" CssClass="label"></asp:Label>
                      <asp:DropDownList  class="chosen-select"  ID="DropMinister"  runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="SN" Width="198px">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MinisterTable.Title, MinisterTable.Name, MinisterTable.Post, MinisterTable.SN, ChurchDetailTable.ChurchDetailID FROM MinisterTable INNER JOIN ChurchDetailTable ON MinisterTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (ChurchDetailTable.ChurchDetailID = @chu)">
                          <SelectParameters>
                          <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                          </SelectParameters>
                      </asp:SqlDataSource>

                </div>
                   <div class="form-group">
                    <asp:Label ID="Label23" runat="server" Text="Phone" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtMphone" runat="server"  placeholder="Pastor Number" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Witness1" CssClass="label"></asp:Label>
                    <asp:TextBox ID="witness1" runat="server"  placeholder="Mr and Mrs" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Witness2" CssClass="label"></asp:Label>
                    <asp:TextBox ID="witness2" runat="server" placeholder="Mr and Mrs" CssClass="input"></asp:TextBox>
                </div>
                    <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Sponsor" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtsponsor" runat="server"  placeholder="Mr and Mrs" CssClass="input"></asp:TextBox>
                </div>
                 </div>

          <div class="NewFrameex">
                &nbsp; OTHERS<br />
&nbsp;<div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Marriage Date" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtMarriage" runat="server"  placeholder="DD/MM/YYYY" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Resident Address" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAddress" runat="server" placeholder="Enter Current Resident Address" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label24" runat="server" Text="Month" CssClass="label"></asp:Label>
                  <asp:DropDownList ID="ddlMonth" class="chosen-select" runat="server" Width="200px" >
                        <asp:ListItem>January</asp:ListItem>
                        <asp:ListItem>February</asp:ListItem>
                        <asp:ListItem>March</asp:ListItem>
                        <asp:ListItem>April</asp:ListItem>
                        <asp:ListItem>May</asp:ListItem>
                        <asp:ListItem>June</asp:ListItem>
                        <asp:ListItem>July</asp:ListItem>
                        <asp:ListItem>August</asp:ListItem>
                        <asp:ListItem>September</asp:ListItem>
                        <asp:ListItem>October</asp:ListItem>
                        <asp:ListItem>November</asp:ListItem>
                        <asp:ListItem>December</asp:ListItem>
                    </asp:DropDownList>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Venue" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtVenue" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div>
                 </div>
            </div>
       
        <div class ="picturebox">
        <div>
            <asp:Image ID="Image2" runat="server" Height="257px" Width="234px" ImageUrl="~/Register/Water Baptiism/Images/index.jpg" onclick="DisplayFullImage(this);"/>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnBrowse" runat="server" Text="Browse" Width="110px" />
            <br />
            <br />
        </div>
            <div>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSave" runat="server" Text="Save" class="a_demo_one"  Width="100px" Height="40px" />
&nbsp;&nbsp;
                
            </div>
        </div>

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
