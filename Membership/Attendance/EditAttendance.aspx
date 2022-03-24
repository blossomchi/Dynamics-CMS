<%@ Page Language="VB" AutoEventWireup="false" CodeFile="EditAttendance.aspx.vb" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Attendance</title>

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

      <script language="javascript" type="text/javascript">
        function onlyNumbers(evt) {
            var e = event || evt; 
            var charCode = e.which || e.keyCode;

            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }

          function Add() {
              var a, b, c, d, e, f, g, h, i, j, k, l, m, n, p, q, r, s, t;

              var a = parseInt(document.getElementById("txtFirstValue").value);
              if (isNaN(a) == true) {
                  a = 0;
              }
              var b = parseInt(document.getElementById("txtSecondValue").value);
              if (isNaN(b) == true) {
                  b = 0;
              }
              var c = parseInt(document.getElementById("txtThirdValue").value);
              if (isNaN(c) == true) {
                  c = 0;
              }
              var d = parseInt(document.getElementById("txtFourthValue").value);
              if (isNaN(d) == true) {
                  d = 0;
              }
              var e = parseInt(document.getElementById("txtFifthValue").value);
              if (isNaN(e) == true) {
                  e = 0;
              }
              var f = parseInt(document.getElementById("txtSixthValue").value);
              if (isNaN(f) == true) {
                  f = 0;
              }
              var g = parseInt(document.getElementById("txtChildBoy").value);
              if (isNaN(g) == true) {
                  g = 0;
              }
              var h = parseInt(document.getElementById("txtTeenAdultMale").value);
              if (isNaN(h) == true) {
                  h = 0;
              }
              var i = parseInt(document.getElementById("txtTeenAdultFemale").value);
              if (isNaN(i) == true) {
                  i = 0;
              }

              var j = parseInt(document.getElementById("txtTeenMale").value);
              if (isNaN(j) == true) {
                  j = 0;
              }

              var j = parseInt(document.getElementById("txtTeenFemale").value);
              if (isNaN(j) == true) {
                  j = 0;
              }

              var k = parseInt(document.getElementById("txtTeenChildMale").value);
              if (isNaN(k) == true) {
                  k = 0;
              }

              var l = parseInt(document.getElementById("txtTeenChildFemale").value);
              if (isNaN(l) == true) {
                  l = 0;
              }

              var m = parseInt(document.getElementById("txtChildChurchAMale").value);
              if (isNaN(m) == true) {
                  m = 0;
              }

              var n = parseInt(document.getElementById("txtChildChurchAFemale").value);
              if (isNaN(n) == true) {
                  n = 0;
              }

              var p = parseInt(document.getElementById("txtChildChurchTMale").value);
              if (isNaN(p) == true) {
                  p = 0;
              }

              var q = parseInt(document.getElementById("txtChildChurchTFemale").value);
              if (isNaN(q) == true) {
                  q = 0;
              }

              var r = parseInt(document.getElementById("txtChildChurchMale").value);
              if (isNaN(r) == true) {
                  r = 0;
              }

              var s = parseInt(document.getElementById("txtChildChurchFemale").value);
              if (isNaN(s) == true) {
                  s = 0;
              }

              var t = parseInt(document.getElementById("txtVisitorFemale").value);
              if (isNaN(t) == true) {
                  t = 0;
              }
              document.getElementById("txtTotal").value = a + b + c + d + e + f + g + h + i + j + k + l + m + n + p + q + r + s + t;
          }</script>

     <link href="css/style.css" rel="stylesheet" />
      <link href="../css/menu.css" rel="stylesheet" />

    <style type="text/css">

        #form1 {
            height: 667px;
        }
        .auto-style2 {
            display: inline-block;
            margin-left: 10px;
            width: 28%;
            font-size: small;
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
                    
                    </div>
      
    <div class="main">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="Button3" runat="server" Text="View Attendance " class="a_demo_one"  Width="180px" Height="40px" />
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
            <div class="formbox center">
            <div class="NewFrame">
                  <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Week" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpWeek" CssClass="drop-down" runat="server">
                          <asp:ListItem>First Week</asp:ListItem>
                          <asp:ListItem>Second Week</asp:ListItem>
                          <asp:ListItem>Third Week</asp:ListItem>
                          <asp:ListItem>Fourth Week</asp:ListItem>
                          <asp:ListItem>Fifth Week</asp:ListItem>
                      </asp:DropDownList>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Date" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtdate" runat="server" placeholder="DD/MM/YYYY" CssClass="input"></asp:TextBox>
                </div>
                   <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Day" CssClass="label"></asp:Label>
                       <asp:DropDownList ID="DrpDay" CssClass="drop-down" runat="server">
                            <asp:ListItem>Sunday</asp:ListItem>
                          <asp:ListItem>Monday</asp:ListItem>
                          <asp:ListItem>Tuesday</asp:ListItem>
                          <asp:ListItem>Wednesday</asp:ListItem>
                          <asp:ListItem>Thursday</asp:ListItem>
                           <asp:ListItem>Friday</asp:ListItem>
                          <asp:ListItem>Saturday</asp:ListItem>
                       </asp:DropDownList>
                </div>
                <div class="form-group">
                    &nbsp;
                       </div>
                <div class="form-group">
                    <strong>
                    <asp:Label ID="Label11" runat="server" Text="MAIN SANCTUARY" CssClass="label"></asp:Label>
                    </strong>
                </div>
                <div class="form-group">
                    <strong>
                    <asp:Label ID="Label13" runat="server" Text="ADULT" CssClass="label"></asp:Label>
                    </strong>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Male" CssClass="label"></asp:Label>
                    <asp:TextBox runat="server" CssClass="input" ID="txtFirstValue" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Female" CssClass="label"></asp:Label>
                    <asp:TextBox runat="server" CssClass="input" ID="txtSecondValue" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <strong>
                    <asp:Label ID="Label14" runat="server" Text="TEENAGERS" CssClass="label"></asp:Label>
                    </strong>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Male" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtThirdValue"  runat="server" CssClass="input" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Female" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtFourthValue" runat="server" CssClass="input" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                <div class="form-group">
                    <strong>
                    <asp:Label ID="Label15" runat="server" Text="CHILDREN" CssClass="label"></asp:Label>
                    </strong>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Male" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtFifthValue" runat="server" CssClass="input" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Female" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtChildBoy" runat="server" CssClass="input" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                <div class="form-group">
                    <strong>
                    <asp:Label ID="Label43" runat="server" Text="VISITORS" CssClass="label"></asp:Label>
                    </strong>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Visitor male" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtSixthValue" runat="server" CssClass="input" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label41" runat="server" Text="Visitor Female" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtVisitorFemale" runat="server" CssClass="input" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label37" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <strong>
                    <asp:Label ID="Label16" runat="server" Text="TEENAGER CHURCH" CssClass="label"></asp:Label>
                    </strong>
                </div>
                   <div class="form-group">
                    <strong>
                    <asp:Label ID="Label17" runat="server" Text="ADULT" CssClass="label"></asp:Label>
                    </strong>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label18" runat="server" Text="Male" CssClass="label"></asp:Label>
                    <asp:TextBox runat="server" CssClass="input" ID="txtTeenAdultMale" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label19" runat="server" Text="Female" CssClass="label"></asp:Label>
                    <asp:TextBox runat="server" CssClass="input" ID="txtTeenAdultFemale" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <strong>
                    <asp:Label ID="Label20" runat="server" Text="TEENAGERS" CssClass="label"></asp:Label>
                    </strong>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label21" runat="server" Text="Male" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtTeenMale"  runat="server" CssClass="input" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label22" runat="server" Text="Female" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtTeenFemale" runat="server" CssClass="input" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                <div class="form-group">
                    <strong>
                    <asp:Label ID="Label23" runat="server" Text="CHILDREN" CssClass="label"></asp:Label>
                    </strong>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label24" runat="server" Text="Male" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtTeenChildMale" runat="server" CssClass="input" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="Label25" runat="server" Text="Female" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtTeenChildFemale" runat="server" CssClass="input" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                 <div class="form-group">
                     <asp:Label ID="Label36" runat="server"></asp:Label>
                </div>
                <div class="form-group">
                    <strong>
                    <asp:Label ID="Label26" runat="server" Text="CHILDREN CHURCH" CssClass="label"></asp:Label>
                    </strong>
                </div>
                <div class="form-group">
                    <strong>
                    <asp:Label ID="Label27" runat="server" Text="ADULT" CssClass="label"></asp:Label>
                    </strong>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label28" runat="server" Text="Male" CssClass="label"></asp:Label>
                    <asp:TextBox runat="server" CssClass="input" ID="txtChildChurchAMale" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label29" runat="server" Text="Female" CssClass="label"></asp:Label>
                    <asp:TextBox runat="server" CssClass="input" ID="txtChildChurchAFemale" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <strong>
                    <asp:Label ID="Label30" runat="server" Text="TEENAGERS" CssClass="label"></asp:Label>
                    </strong>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label31" runat="server" Text="Male" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtChildChurchTMale"  runat="server" CssClass="input" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label32" runat="server" Text="Female" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtChildChurchTFemale" runat="server" CssClass="input" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                <div class="form-group">
                    <strong>
                    <asp:Label ID="Label33" runat="server" Text="CHILDREN" CssClass="label"></asp:Label>
                    </strong>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label34" runat="server" Text="Male" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtChildChurchMale" runat="server" CssClass="input" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="Label35" runat="server" Text="Female" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtChildChurchFemale" runat="server" CssClass="input" onkeypress="return onlyNumbers();" 
              onKeyUp="javascript:Add();"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Total Attendance" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtTotal" runat="server" CssClass="input"></asp:TextBox>
                </div>
              
                <div class="form-group">
                     &nbsp;
                       </div>
                   <div class="form-group">
                       <asp:TextBox ID="txtControl" runat="server" Visible="False" Width="18px"></asp:TextBox>
                       <asp:TextBox ID="txtst" runat="server" Visible="False" Width="18px"></asp:TextBox>

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                     <asp:TextBox ID="txtStaffID" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>

                     <asp:TextBox ID="txtAttendanceID" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>

                       </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="btnSave" runat="server"  Text="Edit"  class="a_demo_one"  Width="100px" Height="40px" />

            </div>
                </div>
                <div class="auto-style2">

            <div>
               &nbsp; 
            </div>
             <div>
               &nbsp; 
            </div>
             <div>
               &nbsp; 
            </div>
              <p>
         <asp:Label ID="Label38" runat="server" Text="OVERAL SUMMARY" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>    
        </p>
             <div>
               &nbsp; 
            </div>
            <p>
         <asp:Label ID="Label40" runat="server" Text="SUM TOTAL ADULT :" Font-Bold="True" Font-Size="Medium"></asp:Label>    <asp:Label ID="TotalAdult" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </p>
              <p>
         <asp:Label ID="Label42" runat="server" Text="SUM TOTAL TEEN :" Font-Bold="True" Font-Size="Medium"></asp:Label>    <asp:Label ID="TotalTeen" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </p>
                   <p>
         <asp:Label ID="Label44" runat="server" Text="SUM TOTAL CHILDREN :" Font-Bold="True" Font-Size="Medium"></asp:Label>    <asp:Label ID="TotalChildren" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </p>
                        <p>
         <asp:Label ID="Label46" runat="server" Text="SUM TOTAL VISITORS :" Font-Bold="True" Font-Size="Medium"></asp:Label>    <asp:Label ID="TotalVisitors" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </p>
                <p>
         <asp:Label ID="Label48" runat="server" Text="GRAND TOTAL:" Font-Bold="True" Font-Size="Medium"></asp:Label>    <asp:Label ID="GrandAttendance" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </p>
                      <div>
               &nbsp; 
            </div>
            
               <div>
               &nbsp; 
            </div>
              <p>
         <asp:Label ID="Label39" runat="server" Text="OVERAL GENDER SUMMARY" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>    
        </p>
            
            <p>
         <asp:Label ID="Label50" runat="server" Text="MALE :" Font-Bold="True" Font-Size="Medium"></asp:Label>    <asp:Label ID="TotalMale" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </p>
              <p>
         <asp:Label ID="Label52" runat="server" Text="FEMALE :" Font-Bold="True" Font-Size="Medium"></asp:Label>    <asp:Label ID="TotalFemale" runat="server" Text="Label" Font-Bold="True" Font-Size="Medium"></asp:Label>
        </p>
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
