<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Dedication.aspx.vb" Inherits="Dedication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dedication</title>
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
             <p class="church-watch">RolofDynamic Church Watch</p>
            <p class="church-mgt">Church Management Software</p>
        </div>
       
   <div style="float:right">
        <asp:Image ID="Image2" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
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
                    <asp:Label ID="lblid" runat="server" CssClass="label" Visible="False"></asp:Label>
                    <asp:Label ID="lblid1" runat="server" CssClass="label" Visible="False"></asp:Label>
                    </div><br />
   
    </div>
           <div>
           &nbsp;
      </div> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:Button ID="btnViewRec" runat="server" Font-Bold="True" Font-Italic="True" Text="View Record"  class="a_demo_one" Width="143px" Height="40px" />
    <div class="main">
        <div class="formbox">
            <div class="formframe">
              &nbsp;  FATHER<br />
&nbsp;<div class="form-group">
                    <asp:Label ID="Label31" runat="server" Text="Members(Only)" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="drpFather"  class="chosen-select" runat="server" DataSourceID="SqlDataSource1" DataTextField="FULLNAME" DataValueField="SN" AutoPostBack="True" Width="200px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, FamilyID, FirstName + ' ' + LastName AS FULLNAME, ChurchDetailID, Memberid FROM MembershipTable WHERE (ChurchDetailID = @churchID) AND (Memberid &lt;&gt; N'MEB1')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtchurchID" Name="churchID" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="First Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="Ffirstname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Surname" CssClass="label"></asp:Label>
                    <asp:TextBox ID="Fsurname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Phone Number" CssClass="label"></asp:Label>
                    <asp:TextBox ID="Fphone" runat="server" CssClass="input"></asp:TextBox>
                </div>
                 
            </div>
            
            <div class="formframe">
              &nbsp;  MOTHER<br />
&nbsp;<div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Members(Only)" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="drpMother"  class="chosen-select" runat="server" DataSourceID="SqlDataSource1" DataTextField="FULLNAME" DataValueField="SN" AutoPostBack="True" Width="200px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, FamilyID, FirstName + ' ' + LastName AS FULLNAME, ChurchDetailID FROM MembershipTable WHERE (ChurchDetailID = @churchID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtchurchID" Name="churchID" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="First Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="Mfirstname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                 <div class="form-group">
                      <asp:Label ID="Label10" runat="server" Text="Surname" CssClass="label"></asp:Label>
                    <asp:TextBox ID="Msurname" runat="server" CssClass="input"></asp:TextBox>
                     </div>
                 <div class="form-group">
                    <asp:Label runat="server" Text="Phone Number" CssClass="label"></asp:Label>
                    <asp:TextBox ID="Mphone" runat="server" CssClass="input"></asp:TextBox>
                </div>
            </div>
              <div class="formframe">
                  &nbsp; BABY<br />
                   <br />
                 <div class="form-group">
                    <asp:Label ID="Label15" runat="server" Text="First Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="bfirstname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label11" runat="server" Text="Other Names" CssClass="label"></asp:Label>
                    <asp:TextBox ID="OtherNames" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label16" runat="server" Text="Surname" CssClass="label"></asp:Label>
                    <asp:TextBox ID="Bsurname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label14" runat="server" Text="Gender" CssClass="label"></asp:Label>
                    
                      <asp:DropDownList ID="DropGender" CssClass="drop-down" runat="server" AutoPostBack="True">
                          <asp:ListItem>Male</asp:ListItem>
                          <asp:ListItem>Female</asp:ListItem>
                      </asp:DropDownList>
                    
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Date of Birth" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtDob" runat="server" placeholder ="DD/MM/YYYY" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="label" Text="Date of Dedication"></asp:Label>
                    <asp:TextBox ID="txtDedi" runat="server" placeholder ="DD/MM/YYYY" CssClass="input"></asp:TextBox>
                </div>
                    <div class="form-group">
                    <asp:Label ID="Label17" runat="server" Text="Month" CssClass="label" Visible="False"></asp:Label>
                  <asp:DropDownList ID="ddlMonth" class="chosen-select" runat="server" Width="200px" DataSourceID="SqlDataSourceMonth" DataTextField="Month" DataValueField="Monthvalue" Visible="False" >
                    </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceMonth" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, Monthvalue, Month FROM MonthTable"></asp:SqlDataSource>
                </div>
                  </div>
             <div class="formframe">
                 &nbsp; OTHERS<br />
                  <br />
         
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Place of Birth" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtplacebirth" runat="server" CssClass="msg" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label13" runat="server" Text="Parent's Address" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAdress" runat="server" CssClass="msg" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Pastor/Minister" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="drpminister" class="chosen-select" runat="server" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="SN" AutoPostBack="True" Width="200px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT DISTINCT MinisterTable.SN, MinisterTable.Name, ChurchDetailTable.ChurchDetailID FROM MinisterTable INNER JOIN ChurchDetailTable ON MinisterTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (ChurchDetailTable.ChurchDetailID = @chu)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Phone Number" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPstNo" runat="server" CssClass="input"></asp:TextBox>
                </div>
                 <div class="form-group">
                     &nbsp;
                     </div>
                <div class="form-group">
                    <asp:TextBox ID="txtDes" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="txtst" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtname" runat="server" style="font-size: x-small" Visible="False" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtfulname" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtmothername" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtpstname" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="txtStaffID" runat="server" Visible="False" Width="20px"></asp:TextBox>

                     <asp:TextBox ID="picTextBox" runat="server" Font-Size="XX-Small" Visible="False" Width="20px" Height="19px"></asp:TextBox>

                </div>
                  </div>
        </div>
        <div class ="picturebox">
        <div>
            <asp:Image ID="MemberImage" runat="server" Height="257px" Width="234px" ImageUrl="~/Register/Water Baptiism/Images/index.jpg" onclick="DisplayFullImage(this);"/>
            <br />

            <asp:FileUpload ID="FileUpload1" runat="server" />
               <br />
               <br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:Button ID="Upload" runat="server" Text="Upload" Visible="False" />
         
            <br />
            <br />
        </div>
            <div>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:Button ID="btnSave" runat="server" Text="Save" class="a_demo_one" Width="64px" style="height: 40px" />
&nbsp;&nbsp;
                
            </div>
        </div>


        <div class="clear-fix"></div> 
    </div> 

    <div class="footer">
         <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p>
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
        </div>
    </form>
</body>
</html>
