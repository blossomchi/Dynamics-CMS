<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Children.aspx.vb" Inherits="Children" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Children Department</title>
 <link href="css/Style.css" rel="stylesheet" />
     <link href="css/style.css" rel="stylesheet" />
    <link href="css/style2.css" rel="stylesheet" />
    <link href="../css/menu.css" rel="stylesheet" />
    <script src="jquery/chosen.jquery.js"></script>
    <link href="jquery/chosen.css" rel="stylesheet" />
    <script src="jquery/Jquery/jquery-1.7.1.min.js"></script>
    <script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>
    <script src="jquery/chosen.jquery.min.js"></script>
    <script src="jquery/chosen.proto.min.js"></script>
    <script src="jquery/chosen.proto.js"></script>
     <script src="../jQuery-webcam-master/jquery.webcam.js"></script>
    <script src="jquery.webcam.js" type="text/javascript"></script>
    <style type="text/css">
        #form1 {
            height: 667px;
        }
        </style>
    
</head>
<body>
    <form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
                    
                    </div>               
    <div class="main">
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button3" runat="server" Text="View Children Record" class="a_demo_one"  Width="190px" Height="40px" />
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
             <div class="formbox center">
           <div class="NewFrame">
                  <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Family Name" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpFamily" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Family Name" DataValueField="Familyid" Width="280px">
                    </asp:DropDownList>
                   
                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, FamilyName + ' ' + FamilyFirstName AS [Family Name], Familyid FROM FamilyTable WHERE (Familyid &lt;&gt; N'FAM1')"></asp:SqlDataSource>
                   
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="First Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtFirstname" runat="server" CssClass="input" Width="260px"></asp:TextBox>
                </div>
                   <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Last Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtLastname" runat="server" CssClass="input" Width="260px"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Phone Number" CssClass="label"></asp:Label>
                      <asp:TextBox ID="txtPhone" runat="server" CssClass ="input" Width="260px"  ></asp:TextBox>
                </div>  
                   <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Gender" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpGender"  class="chosen-select" runat="server" AutoPostBack="True" Width="280px">
                          <asp:ListItem>Male</asp:ListItem>
                          <asp:ListItem>Female</asp:ListItem>
                         
                      </asp:DropDownList>
                </div>
                <div class="form-group">
                    &nbsp;
                       </div>
                 <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Date of Birth" CssClass="label"></asp:Label>
                     <telerik:RadDatePicker ID="ChildDatePicker" Runat="server" AutoPostBack="True" Culture="en-US" Width="280px">
<Calendar runat="server" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

<DateInput runat="server" DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" EnableSingleInputRendering="True" LabelWidth="64px" autopostback="True"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                     </telerik:RadDatePicker>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label11" runat="server" Text="Age" CssClass="label"></asp:Label>
                    <asp:TextBox runat="server"  CssClass="input" ID="txtAge" placeholder="Age" Width="260px" ></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Functional Group" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="DrpFunctional"  class="chosen-select" runat="server" DataSourceID="SqlDataSource1" DataTextField="GroupName" DataValueField="ID" AutoPostBack="True" Width="280px">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT GroupName, ID FROM MembersGroup WHERE (ID = 5)"></asp:SqlDataSource>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Guardian/Parents" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtParents"  runat="server" CssClass="input" Width="260px" ></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Phone Number" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtParentsNo" runat="server" CssClass="input" Width="260px" ></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Resident Address" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="input" TextMode="MultiLine" Width="260px" ></asp:TextBox>
                </div>
                <div class="form-group">
                     &nbsp;
                       </div>
                   <div class="form-group">
                       <asp:TextBox ID="txtControl" runat="server" Visible="False" Width="18px"></asp:TextBox>
                       <asp:TextBox ID="txtst" runat="server" Visible="False" Width="18px"></asp:TextBox>

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                    <asp:TextBox runat="server"  CssClass="input" ID="txtDob" placeholder="DD/MM/YYYY" AutoPostBack="True" Visible="False" Width="20px" ></asp:TextBox>

                       </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Save" class="a_demo_one"  Width="100px" Height="40px"/>

            </div>
                </div>

                 <div class ="picturebox">
        <div>
            <asp:Image ID="MemberAddImage" runat="server" Height="257px" Width="234px" ImageUrl="~/Membership/Images/default-avatar.png" />
            <br />

            <asp:FileUpload ID="FileUpload1" runat="server" />
               <br />
               <br />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:Button ID="Upload" runat="server" Text="Upload" Visible="False" />
         
                     <asp:TextBox ID="picTextBox" runat="server" Font-Size="XX-Small" Visible="False" Width="20px" Height="19px"></asp:TextBox>

            <br />
            <br />
        </div>
            <asp:Label ID="PriceTypeLabel1" runat="server" style="text-align: center; font-weight: 700;" Text="Live Camera."></asp:Label>
            <div id="webcam">
            </div>
            <div>
         &nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" class="a_demo_one" Text="Capture" Width="150px" style="height: 40px; left: 0px;" OnClientClick="return Capture();" />

            </div>
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

        <script type="text/javascript">
             var pageUrl = '<%=ResolveUrl("Children.aspx") %>';
             $(function () {
                 jQuery("#webcam").webcam({
                     width: 234,
                     height: 240,
                     mode: "save",
                     swffile: '<%=ResolveUrl("jscam.swf") %>',
                //debug: function (type, status) {
                //    $('#camStatus').append(type + ": " + status + '<br /><br />');
                //},
                onSave: function (data) {
                    $.ajax({
                        type: "POST",
                        url: pageUrl + "/GetCapturedImage",
                        data: '',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            $("[id*=MemberAddImage]").css("visibility", "visible");
                            $("[id*=MemberAddImage]").attr("src", r.d);
                        },
                        failure: function (response) {
                            alert(response.d);
                        }
                    });
                },
                onCapture: function () {
                    webcam.save(pageUrl);
                }
                });
            });
            function Capture() {
                webcam.capture();
                return false;
            }
      </script>
    </form>
</body>
</html>
