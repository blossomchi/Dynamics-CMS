<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Reminder.aspx.vb" Inherits="Reminder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Reminder</title>
    <link href="css/style.css" rel="stylesheet" />
      <link href="../css/menu.css" rel="stylesheet" />
      <link href="css/table.css" rel="stylesheet" />
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
             <p class="church-mgt">CHURCH MANAGEMENT SOFTWARE</p>
        </div>
       
        <asp:Image ID="Image1" runat="server" Height="100px" Width="130px" class="headerImg" ImageUrl="~/image/New.PNG" />
        <div class="clear-fix">
                    <br />
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
        <div class="linknav">  
             <a href="../../Mainboard.aspx" target="blank">Home</a>
             <a  href="Login.aspx">LogOut</a>
        </div>
          <br />
    </div>
       
         <h2 style="color:#3e6911;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Todays's Reminder</h2>

        <div class="wrapperr">
  <div class="table">
    <div><h3>&nbsp;&nbsp;&nbsp;Today Events</h3>
        <div class="cell">
         
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" Width="780px" ForeColor="#333333" GridLines="None" BorderStyle="Ridge" AllowPaging="True">
                <AlternatingRowStyle />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" SortExpression="SN" ReadOnly="True" Visible="False" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NewEvent" HeaderText="New Event" SortExpression="NewEvent" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Period" HeaderText="Period" SortExpression="Period" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Descrip" HeaderText="Description" SortExpression="Descrip" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, NewEvent, Period, Descrip, CONVERT (varchar(5), StartDate, 110) AS StartDate, EndDate FROM EventTable WHERE (CONVERT (varchar(5), StartDate, 110) = @st)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtevent" Name="st" PropertyName="Text" />
                </SelectParameters>
                </asp:SqlDataSource>
    
     <div class="row">
         <asp:TextBox ID="txtAdult" runat="server" Visible="False" Width="20px"></asp:TextBox>
         <asp:TextBox ID="txtevent" runat="server" Visible="False" Width="20px"></asp:TextBox>
         <asp:TextBox ID="txtMarriage" runat="server" Visible="False" Width="20px"></asp:TextBox>
         <asp:TextBox ID="txtChild" runat="server" Visible="False" Width="20px"></asp:TextBox>
    </div>
    
        </div>
      </div>
    
  </div>
  
  <div class="table">
      <div><h3>&nbsp;&nbsp;&nbsp;Marriage Anniversary</h3> </div>
    
    <div class="row">
      <div class="cell">
         
          <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="SN" DataSourceID="SqlDataSource3" Width="780px" ForeColor="#333333" GridLines="None" BorderStyle="Ridge" AllowPaging="True">
              <AlternatingRowStyle BackColor="White" />
              <Columns>
                  <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" Visible="False" />
                  <asp:BoundField DataField="Husband" HeaderText="Husband Name" ReadOnly="True" SortExpression="Husband" >
                  <HeaderStyle HorizontalAlign="Left" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Hphone" HeaderText="Phone Number" SortExpression="Hphone" >
                  <HeaderStyle HorizontalAlign="Left" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Wife" HeaderText="Wife Name" ReadOnly="True" SortExpression="Wife" >
                  <HeaderStyle HorizontalAlign="Left" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Wphone" HeaderText="Phone Number" SortExpression="Wphone" >
                  <HeaderStyle HorizontalAlign="Left" />
                  </asp:BoundField>
                  <asp:BoundField DataField="MarriageDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Marriage Date" SortExpression="MarriageDate" >
                  <HeaderStyle HorizontalAlign="Left" />
                  </asp:BoundField>
              </Columns>
              <EditRowStyle BackColor="#7C6F57" />
              <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
              <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
              <RowStyle BackColor="#E3EAEB" />
              <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
              <SortedAscendingCellStyle BackColor="#F8FAFA" />
              <SortedAscendingHeaderStyle BackColor="#246B61" />
              <SortedDescendingCellStyle BackColor="#D4DFE1" />
              <SortedDescendingHeaderStyle BackColor="#15524A" />
          </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, Hfirstname + ' ' + Hlastname AS Husband, Hphone, Wphone, CONVERT (varchar(5), MarriageDate, 110) AS MarriageDate, Wfirstname + ' ' + Wlastnamae AS Wife FROM MarriageTable WHERE (CONVERT (varchar(5), MarriageDate, 110) = @mar)">
              <SelectParameters>
                  <asp:ControlParameter ControlID="txtMarriage" Name="mar" PropertyName="Text" />
              </SelectParameters>
          </asp:SqlDataSource>
                
          <br />

        <asp:Label ID="LBLMaDate" runat="server" CssClass="label"></asp:Label>
      </div>
    </div>
    
  </div>
  
  <div class="table">
      <div><h3>&nbsp;&nbsp;&nbsp;Birthday Reminder (Adult)</h3> </div>
    
    <div>
      <div>
         
          <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" Width="780px" ForeColor="#333333" GridLines="None" BorderStyle="Ridge" AllowPaging="True">
              <Columns>
                  <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" Visible="False" />
                  <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" >
                  <HeaderStyle HorizontalAlign="Left" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" >
                  <HeaderStyle HorizontalAlign="Left" />
                  </asp:BoundField>
                  <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" ReadOnly="True" >
                  <HeaderStyle HorizontalAlign="Left" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Phone1" HeaderText="Phone" SortExpression="Phone1" >
                  <HeaderStyle HorizontalAlign="Left" />
                  </asp:BoundField>
              </Columns>
              <EditRowStyle BackColor="#7C6F57" />
              <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
              <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
              <RowStyle BackColor="#E3EAEB" />
              <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
              <SortedAscendingCellStyle BackColor="#F8FAFA" />
              <SortedAscendingHeaderStyle BackColor="#246B61" />
              <SortedDescendingCellStyle BackColor="#D4DFE1" />
              <SortedDescendingHeaderStyle BackColor="#15524A" />
          </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT SN, FirstName + ' ' + LastName AS Name, Gender, CONVERT (varchar(5), DOB, 110) AS DOB, Phone1 FROM MembershipTable WHERE (CONVERT (varchar(5), DOB, 110) = @str)">
              <SelectParameters>
                  <asp:ControlParameter ControlID="txtAdult" Name="str" PropertyName="Text" />
              </SelectParameters>
          </asp:SqlDataSource>
             
          <br />
          <asp:Label ID="LBBirthDate" runat="server" CssClass="label" Font-Size="14px" Visible="False"></asp:Label>
      </div>
    </div>
    
  </div>
  <div class="table">
      <div><h3>&nbsp;&nbsp;&nbsp;Birthday Reminder (Children)</h3> </div>
    
    <div class="row">
      <div class="cell">
         
          <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource5" Width="780px" GridLines="None" BorderStyle="Ridge" AllowPaging="True">
              <AlternatingRowStyle BackColor="White" />
              <Columns>
                  <asp:BoundField DataField="SN" HeaderText="SN" InsertVisible="False" ReadOnly="True" SortExpression="SN" Visible="False" />
                  <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" >
                  <HeaderStyle HorizontalAlign="Left" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" >
                  <HeaderStyle HorizontalAlign="Left" />
                  </asp:BoundField>
                  <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" DataFormatString="{0:dd/MM/yyyy}" >
                  <HeaderStyle HorizontalAlign="Left" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" >
                  <HeaderStyle HorizontalAlign="Left" />
                  </asp:BoundField>
                  <asp:BoundField DataField="Parents" HeaderText="Parent Name" SortExpression="Parents" >
                  <HeaderStyle HorizontalAlign="Left" />
                  </asp:BoundField>
                  <asp:BoundField DataField="ParentNo" HeaderText="Parent Number" SortExpression="ParentNo" >
                  <HeaderStyle HorizontalAlign="Left" />
                  </asp:BoundField>
              </Columns>
              <EditRowStyle BackColor="#7C6F57" />
              <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
              <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
              <RowStyle BackColor="#E3EAEB" />
              <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
              <SortedAscendingCellStyle BackColor="#F8FAFA" />
              <SortedAscendingHeaderStyle BackColor="#246B61" />
              <SortedDescendingCellStyle BackColor="#D4DFE1" />
              <SortedDescendingHeaderStyle BackColor="#15524A" />
          </asp:GridView>
          <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Firstname + '  ' + Lastname AS Name, Gender, CONVERT (varchar(5), DOB, 110) AS DOB, Phone, ParentNo, Parents, SN FROM ChildrenTable WHERE (CONVERT (varchar(5), DOB, 110) = @dob)">
              <SelectParameters>
                  <asp:ControlParameter ControlID="txtChild" Name="dob" PropertyName="Text" />
              </SelectParameters>
          </asp:SqlDataSource>
             
          <br />
          <asp:Label ID="Label1" runat="server" CssClass="label" Font-Size="14px" Visible="False"></asp:Label>
      </div>
    </div>
    
  </div>
</div>
<div>   

                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px" Height="18px"></asp:TextBox>
        </div>

        <div class="footer">
     <p><a href="http://www.rolofdynamics.com/">RolofDynamics</a> © 2016 - <% = Year(Now)%>. All rights reserved..</p>
    </div>
    </div>

    

    </form>
</body>
</html>
