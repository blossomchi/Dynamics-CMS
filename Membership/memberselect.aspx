<%@ Page Language="VB" AutoEventWireup="false" CodeFile="memberselect.aspx.vb" Inherits="memberselect" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Member Select</title>
      <link href="jquery/chosen.css" rel="stylesheet" />
    <script src="jquery/Jquery/jquery-1.7.1.min.js"></script>
    <script src="jquery/Jquery/jquery-ui-1.8.20.min.js"></script>
    <script src="jquery/chosen.jquery.min.js"></script>
    <script src="jquery/chosen.proto.min.js"></script>
    <script src="jquery/chosen.proto.js"></script>
    <link href="css/style2.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <script src="jquery.webcam.js" type="text/javascript"></script>
   <script src="../jQuery-webcam-master/jquery.webcam.js"></script>
    <style type="text/css">
        #form1 {
            height: 667px;
        }
        .auto-style1 {
            width: 85%;
        }
        .auto-style2 {
            width: 143px;
            text-align: left;
        }
        .auto-style3 {
            width: 159px;
        }
        .auto-style4 {
            left: 1px;
            top: 0px;
        }
        .auto-style5 {
            height: 40px;
            left: 1px;
            top: 0px;
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
       <br />
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
        <div class="clear-fix">
              &nbsp;
                     &nbsp; <asp:Label ID="lblname0" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px">LOG IN AS :</asp:Label>
                   <asp:Label ID="AdminLabel" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname1" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbChurchName" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblname" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbLocation" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lbLocation0" runat="server" CssClass="label">|</asp:Label>
                    <asp:Label ID="lbState" runat="server" CssClass="label" style="font-weight: bold; font-size: 13px"></asp:Label>
                    <asp:Label ID="lblFamid" runat="server" CssClass="label" Visible="False"></asp:Label>
                    <asp:Label ID="lblid" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
    </div>
     <br />
&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnViewRec" runat="server" Font-Bold="True" Font-Italic="True" Text="View Record" class="a_demo_one" style="font-style: italic; font-weight: 700;" Height="35px" Width="130px" CssClass="auto-style4" />
    <div class="main">
        <div class="formbox">
            <div class="formframe">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="FirstName" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtFirstname" runat="server" CssClass="input"></asp:TextBox>
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/image/PLUSign.png" ToolTip="Enter Firstname" />
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label33" runat="server" Text="Middle Names" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtMiddle" runat="server" CssClass="input"></asp:TextBox>
                </div>
                   <div class="form-group">
                    <asp:Label ID="Label15" runat="server" Text="LastName" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtlastname" runat="server" CssClass="input" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Gender" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="dropGender" runat="server" CssClass="drop-down">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                &nbsp;<asp:Image ID="Image4" runat="server" ImageUrl="~/image/PLUSign.png" ToolTip="Enter gender" />
                </div>

                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Date of Birth" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtDOB" runat="server" placeholder="DD/MM/YYYY" CssClass="input" AutoPostBack="True" ></asp:TextBox>
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/image/PLUSign.png" ToolTip="Enter date of birth" />
                </div>
                    <div class="form-group">
                    <asp:Label ID="Label27" runat="server" Text="Age" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAge" runat="server" placeholder="Display Age" CssClass="input" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Nationality" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="ddlCountry" class="chosen-select"  runat="server" DataSourceID="SqlDataSource2" DataTextField="CountryName" DataValueField="ID" Width="198px"></asp:DropDownList>
                    &nbsp;<asp:Image ID="Image6" runat="server" ImageUrl="~/image/PLUSign.png" ToolTip="Select Nationality" />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [ID], [CountryName] FROM [Country]"></asp:SqlDataSource>
                </div>
               
                 <div class="form-group">
                    <asp:Label ID="Label30" runat="server" Text="State of origin" CssClass="label"></asp:Label>
                     <asp:DropDownList ID="drpStateO" runat="server" class="chosen-select" Width="198px" DataSourceID="SqlDataSource4" DataTextField="State" DataValueField="Stateid" AutoPostBack="True">
                    </asp:DropDownList>
                     <asp:Image ID="Image7" runat="server" ImageUrl="~/image/PLUSign.png" ToolTip="State Of Origin" />
                     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Stateid], [State] FROM [StateTable]"></asp:SqlDataSource>
                </div>
                 <div class="form-group">
                    <asp:Label ID="LaState" runat="server" Text="State" CssClass="label" Visible="False"></asp:Label>
                    <asp:TextBox ID="TXTState" runat="server" CssClass="input" Visible="False" AutoPostBack="True"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Position in family" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="dropAuthority" runat="server" class="chosen-select" Width="198px">
                    <asp:ListItem>Contact Person</asp:ListItem>
                    <asp:ListItem>Spouse</asp:ListItem>
                    <asp:ListItem>Child</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                &nbsp;<asp:Image ID="Image8" runat="server" ImageUrl="~/image/PLUSign.png" ToolTip="Family place" />
                </div>
                
            </div>
          

            <div class="formframe">
                <div class="form-group">
                    <asp:Label ID="Label16" runat="server" Text="Martital Status" CssClass="label"></asp:Label>
                   <asp:DropDownList ID="Dropmarital" runat="server" class="chosen-select" Width="198px" AutoPostBack="True">
                        <asp:ListItem>Single</asp:ListItem>
                        <asp:ListItem>Married</asp:ListItem>
                        <asp:ListItem>Separated</asp:ListItem>
                        <asp:ListItem>Single</asp:ListItem>
                        <asp:ListItem>Window</asp:ListItem>
                       <asp:ListItem>Windower</asp:ListItem>
                      
                    </asp:DropDownList>
                &nbsp;<asp:Image ID="Image12" runat="server" ImageUrl="~/image/PLUSign.png" ToolTip="Select status" />
                </div>
                <div class="form-group">
                    <asp:Label ID="Marriage" runat="server" Text="Date" CssClass="label" Visible="False"></asp:Label>
                    <telerik:RadDatePicker ID="MarrigeDatePicker" Runat="server" Culture="en-US" Visible="False" FocusedDate="1953-01-01" MinDate="1953-01-01">
<Calendar runat="server" UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" ViewSelectorText="x"></Calendar>

<DateInput runat="server" DisplayDateFormat="dd/MM/yyyy" DateFormat="dd/MM/yyyy" EnableSingleInputRendering="True" LabelWidth="64px"></DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
                     </telerik:RadDatePicker>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label11" runat="server" Text="Occupation" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtoccupa" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label12" runat="server" Text="Email" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="input"></asp:TextBox>
                </div>
                   
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Residential/HNo" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtAdress" runat="server" CssClass="input" placeholder="Enter Home Address" TextMode="MultiLine" ></asp:TextBox>
                    <asp:Image ID="Image13" runat="server" ImageUrl="~/image/PLUSign.png" ToolTip="Enter address" />
                </div>
                 <div class="form-group">
                     <asp:Label ID="Label20" runat="server" Text="Spoken languages" CssClass="label"></asp:Label>
                        <asp:Label ID="Label24" runat="server" Text="&nbsp;" CssClass="label"></asp:Label>
                        
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label21" runat="server" Text="&nbsp;" CssClass="label"></asp:Label>
                     <asp:Label ID="Label25" runat="server" Text="&nbsp;" CssClass="label"></asp:Label>
                  <asp:TextBox ID="txtlang1" runat="server"  CssClass="input"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label22" runat="server" Text="&nbsp;" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtlang2" runat="server" CssClass="input"></asp:TextBox>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label23" runat="server" Text="&nbsp;" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtlang3" runat="server" CssClass="input"></asp:TextBox>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label28" runat="server" Text="&nbsp;" CssClass="label"></asp:Label>
                     <asp:Label ID="Label29" runat="server" Text="&nbsp;" CssClass="label"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </div>
            <div class="formframe">
                 <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text="PhoneNo1" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtPhone1" runat="server" CssClass="input"></asp:TextBox>
                     <asp:Image ID="Image9" runat="server" ImageUrl="~/image/PLUSign.png" ToolTip="phone" />
                </div>
                <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="PhoneNo2" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtphone2" runat="server" CssClass="input"></asp:TextBox>
                </div> 
                 <div class="form-group">
                    <asp:Label ID="Label31" runat="server" Text="Title" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DrpTitle" runat="server" class="chosen-select" Width="198px">
                    <asp:ListItem>Arch Bishop</asp:ListItem>
                    <asp:ListItem>Bishop</asp:ListItem>
                    <asp:ListItem>Rev</asp:ListItem>
                    <asp:ListItem>Pastor</asp:ListItem> 
                    <asp:ListItem>Deacon</asp:ListItem>
                    <asp:ListItem>Deaconess</asp:ListItem>
                    <asp:ListItem>Elder</asp:ListItem>      
                        <asp:ListItem>Member</asp:ListItem>
                    </asp:DropDownList>
                     &nbsp;<asp:Image ID="Image10" runat="server" ImageUrl="~/image/PLUSign.png" ToolTip="Select title" />
                     <br />
                </div>

               <div class="form-group">
                    <asp:Label ID="Label17" runat="server" Text="Service Unit" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="DropServiceunit" runat="server" CssClass="drop-down" DataSourceID="SqlDataSource1" DataTextField="ServiceName" DataValueField="ServiceId" AutoPostBack="True">
                        <asp:ListItem Enabled="False" Selected="True">Select</asp:ListItem>
                        <asp:ListItem Enabled="False" Selected="True">Deslect</asp:ListItem>
                    </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [ServiceName], [ServiceId] FROM [UnitTable]"></asp:SqlDataSource>
                </div>
                 <div class="form-group">
                     <table align="center" class="auto-style1">
                         <tr>
                             <td class="auto-style2">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourcePending" PageSize="4" ShowHeader="False" Visible="False" Width="154px" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="ServiceID" HeaderText="ServiceID" SortExpression="ServiceID" Visible="False" />
                            <asp:BoundField DataField="ServiceName" HeaderText="ServiceName" SortExpression="ServiceName" />
                         <asp:TemplateField ShowHeader="False">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="false" 
                                  CommandName="DeleteServiceID" ImageUrl="~/Membership/Images/Delete_icon.png" Text="Delete" Tooltip="Delete" CommandArgument='<%#Eval("ID")%>'/>
                             </ItemTemplate>
                         </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                             </td>
                             <td class="auto-style3">
                    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource6" PageSize="4" ShowHeader="False" Visible="False" Width="173px" GridLines="Horizontal">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:BoundField DataField="ServiceName" HeaderText="ServiceName" SortExpression="ServiceName" />
                         <asp:TemplateField ShowHeader="False">
                             <ItemTemplate>
                                 <asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="false" 
                                  CommandName="DeleteServiceID" ImageUrl="~/Membership/Images/Delete_icon.png" Text="Delete" Tooltip="Delete" CommandArgument='<%#Eval("ID")%>'/>
                             </ItemTemplate>
                         </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                             </td>
                         </tr>
                     </table>
&nbsp;<asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT MembersUnit.ID, UnitTable.ServiceName FROM MembersUnit INNER JOIN UnitTable ON MembersUnit.ServiceUnitID = UnitTable.ServiceId WHERE (MembersUnit.Memberid = @MemberID)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="lblid" Name="MemberID" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                </div>
             <div class="form-group">
                    <asp:SqlDataSource ID="SqlDataSourcePending" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT PendingSavingUnit.ID, PendingSavingUnit.ServiceID, UnitTable.ServiceName FROM PendingSavingUnit INNER JOIN UnitTable ON PendingSavingUnit.ServiceID = UnitTable.ServiceId WHERE (PendingSavingUnit.CreatedBy = @Name)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="AdminLabel" Name="Name" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label32" runat="server" Text="Members Group" CssClass="label"></asp:Label>
                    <asp:DropDownList ID="cbMemGroup" runat="server" CssClass="drop-down" DataSourceID="SqlDataSource5" DataTextField="GroupName" DataValueField="ID">
                        <asp:ListItem Enabled="False" Selected="True">Select</asp:ListItem>
                        <asp:ListItem Enabled="False" Selected="True">Deslect</asp:ListItem>
                    </asp:DropDownList>
                        &nbsp;<asp:Image ID="Image11" runat="server" ImageUrl="~/image/PLUSign.png" ToolTip="Select group" />
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ID, GroupName FROM MembersGroup WHERE (ID &lt;&gt; 5)"></asp:SqlDataSource>
                </div>
                 <div class="form-group">
                    <asp:Label ID="Label13" runat="server" Text="Tithe Card " CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtTithe" runat="server" placeholder="Enter tithe card Number " CssClass="input"></asp:TextBox>

                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtst" runat="server" Visible="False" Font-Size="9px" Width="34px"></asp:TextBox>
                    <asp:TextBox ID="txtDes" runat="server" Visible="False" Font-Size="9px" Width="21px"></asp:TextBox>

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
                    <asp:TextBox ID="txtMembername" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>

                       <asp:TextBox ID="txtLocation" runat="server" Visible="False" Width="16px"></asp:TextBox>

                       <asp:TextBox ID="txtMemID" runat="server" Visible="False" Width="16px"></asp:TextBox>

                     <asp:TextBox ID="picTextBox" runat="server" Font-Size="XX-Small" Visible="False" Width="20px" Height="19px"></asp:TextBox>

                </div>
            </div>
            
            <div class="formframe">
                  
                <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Date Converted" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtDateCon" runat="server" placeholder="DD/MM/YYYY"  CssClass="input"></asp:TextBox>
                    <br />
                </div>
                <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Date Baptised" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtDateBap" runat="server" placeholder="DD/MM/YYYY"  CssClass="input"></asp:TextBox>
                    <br />
                </div>
                
                <div class="form-group">
                    <asp:Label ID="Label14" runat="server" Text="House fellowship" CssClass="label"></asp:Label>
                      <asp:Label ID="Label26" runat="server" Text="&nbsp;" Width="50px"></asp:Label>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label18" runat="server" Text="Town" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpTown" class="chosen-select" runat="server" DataSourceID="SqlDataSource8" DataTextField="Name" DataValueField="Locationid" AutoPostBack="True" Width="198px">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT [Locationid], [Name] FROM [Location]"></asp:SqlDataSource>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label19" runat="server" Text="Area" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="drpArea" class="chosen-select" runat="server" DataSourceID="SqlDataSource3" DataTextField="AreaName" DataValueField="Areaid" AutoPostBack="True" Width="198px">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT DISTINCT AreaTable.AreaName, AreaTable.Areaid, AreaTable.Locationid FROM AreaTable INNER JOIN Location ON AreaTable.Locationid = Location.Locationid WHERE (AreaTable.Locationid = @loc)">
                          <SelectParameters>
                              <asp:ControlParameter ControlID="LocTXT" Name="loc" PropertyName="Text" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                </div>
                  <div class="form-group">
                    <asp:Label ID="Label34" runat="server" Text="Location" CssClass="label"></asp:Label>
                      <asp:DropDownList ID="CBLocation" class="chosen-select" runat="server" DataSourceID="SqlDataSource7" DataTextField="Adress" DataValueField="Adress" AutoPostBack="True" Width="198px">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT DISTINCT AreaTable.AreaName, AreaTable.Areaid, HomecellTable.Adress FROM AreaTable INNER JOIN HomecellTable ON AreaTable.Areaid = HomecellTable.AreaId AND AreaTable.Areaid = HomecellTable.AreaId WHERE (AreaTable.Areaid = @AreaID)">
                          <SelectParameters>
                              <asp:ControlParameter ControlID="txtAreaID" Name="AreaID" PropertyName="Text" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                </div>
                <div>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                
                <asp:Button ID="Button1" runat="server" class="a_demo_one" Text="Edit" Width="60px" CssClass="auto-style5" />

                
                     <asp:TextBox ID="LocTXT" runat="server" Font-Size="XX-Small" Visible="False" Width="20px" Height="19px"></asp:TextBox>

                     <asp:TextBox ID="txtAreaID" runat="server" Font-Size="XX-Small" Visible="False" Width="20px" Height="19px"></asp:TextBox>

                
            </div>
            </div>
          
        </div>



        <div class ="picturebox">
        <div>
            <asp:Image ID="Memberimage" runat="server" Height="257px" Width="234px" ImageUrl="~/Membership/Images/default-avatar.png" />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="Upload" runat="server" Text="Upload" Visible="False" ToolTip="Upload and update picture." />
         
            <br />
            <br />
            <br />
        </div>
            <asp:Label ID="PriceTypeLabel1" runat="server" style="text-align: center; font-weight: 700;" Text="Live Camera."></asp:Label>
            <div id="webcam">
            </div>
            <div>
                             &nbsp;&nbsp; <asp:Button ID="Button2" runat="server" class="a_demo_one" Text="Capture" Width="150px" style="height: 40px; left: 0px;" OnClientClick="return Capture();" />
                 <br />


            </div>
            <div>

             &nbsp;&nbsp; <asp:Button ID="btnchange" runat="server" class="a_demo_one" Text="Change Picture" Width="150px" />
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
        <script type="text/javascript">
             var pageUrl = '<%=ResolveUrl("memberselect.aspx") %>';
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
                        url: pageUrl + "/GetCapturedSelectImage",
                        data: '',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (r) {
                            $("[id*=Memberimage]").css("visibility", "visible");
                            $("[id*=Memberimage]").attr("src", r.d);
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
