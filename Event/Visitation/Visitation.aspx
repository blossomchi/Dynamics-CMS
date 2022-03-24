<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Visitation.aspx.vb" Inherits="Visitation" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Visitation</title>
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
                    <asp:Label ID="lblid" runat="server" CssClass="label" Visible="False"></asp:Label>
                    </div>
       
    </div><br />
           &nbsp; &nbsp; &nbsp; &nbsp;<asp:Button ID="btnViewRec" runat="server" Font-Bold="True" Font-Italic="True" Text="View Record" class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="35px" Width="130px" />
    <div class="main">
        <div class="formbox">
            <div class="formframe">
                <div class="form-group">
                    <asp:Label ID="Label31" runat="server" Text="Member" CssClass="label"></asp:Label>
                     <asp:DropDownList ID="DrpMember" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="FULLNAME" DataValueField="SN" Width="198px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS FULLNAME FROM MembershipTable INNER JOIN ChurchDetailTable ON MembershipTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (ChurchDetailTable.ChurchDetailID = @chu) AND (MembershipTable.Memberid &lt;&gt; N'MEB1')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                
                   <div class="form-group">
                    <asp:Label ID="Label15" runat="server" Text="Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtfirstname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                   <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Phone No" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtphone" runat="server" CssClass="input"></asp:TextBox>
                </div>

                   <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Address" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="Pastor/Minister" CssClass="label"></asp:Label>
                      <asp:DropDownList  class="chosen-select"  ID="DropMinister" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="FULLNAME" DataValueField="SN" Width="198px">
                      </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, FamilyID, FirstName + ' ' + LastName AS FULLNAME, Title, ChurchDetailID FROM MembershipTable WHERE (ChurchDetailID = @churchID) AND (MembershipTable.Memberid &lt;&gt; N'MEB1')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtchurchID" Name="churchID" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Phone" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPhone2" runat="server" CssClass="input"></asp:TextBox>
                </div>
                   <div class="form-group">
                   &nbsp;
                </div>
            </div>

            <div class="formframe">
                <div class="form-group">
                    <asp:Label ID="Label11" runat="server" Text="Team Leader" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="drpMember1" class="chosen-select" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="FULLNAME" DataValueField="SN" Width="198px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembershipTable.SN, MembershipTable.FirstName + ' ' + MembershipTable.LastName AS FULLNAME FROM MembershipTable INNER JOIN ChurchDetailTable ON MembershipTable.ChurchDetailID = ChurchDetailTable.ChurchDetailID WHERE (ChurchDetailTable.ChurchDetailID = @chu) AND (MembershipTable.Memberid &lt;&gt; N'MEB1')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtfullname" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Phone" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPhone1" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Others" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtOthers" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Feedback / Reasons" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtreason" runat="server" CssClass="input" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtDes" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                    <asp:TextBox ID="txtst" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtname" runat="server" style="font-size: x-small" Visible="False" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtfulname" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtLocation" runat="server" Visible="False" Width="16px"></asp:TextBox>

                       <asp:TextBox ID="txtpastorname" runat="server" Visible="False" Width="16px"></asp:TextBox>

                     <asp:TextBox ID="txtStaffID" runat="server" Font-Size="XX-Small" Visible="False" Width="20px" Height="19px"></asp:TextBox>

                </div>
                   <div>

               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnSave" runat="server" Text="Save" class="a_demo_one"  Width="80px" Height="35px" />
&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" class="a_demo_one"  Text="Cancel" Width="80px" style="height: 35px" Height="60px" />

            </div>
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
