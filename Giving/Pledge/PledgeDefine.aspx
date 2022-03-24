<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PledgeDefine.aspx.vb" Inherits="PledgeDefine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>New Duty</title>
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
         <h2>Church Project</h2>
         <p>
             <asp:Label ID="Lblid" runat="server" Text="Label" Visible="False"></asp:Label>
         </p>
         <p>
             &nbsp;</p>
            <div class="formbox">
            <div class="formframe">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Project Name" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Description" CssClass="label"></asp:Label>
                    <asp:TextBox ID="txtdesp" runat="server" CssClass="input" placeholder="Description about the post" TextMode="MultiLine" ></asp:TextBox>
                </div>
                   <div class="form-group">
                    <asp:TextBox ID="txtchurchID" runat="server" Visible="False" Font-Size="9px" Width="20px"></asp:TextBox>
                     <asp:TextBox ID="txtMembername" runat="server" style="font-size: x-small" Visible="False" Width="23px"></asp:TextBox>
                       </div>
                  <div class="form-group">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btnSave" runat="server"  Text="Save" Width="80px" Height="30px"/>
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="80px" style="height: 30px" />

            </div>
                </div>
                 <div class="item-right">

            <asp:GridView ID="gridPledge" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" Font-Size="Medium" Height="30px" Width="700px" AllowPaging="True" AllowSorting="True" ForeColor="#333333" GridLines="None" PageSize="6">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="SN" HeaderText="SN" ReadOnly="True" SortExpression="SN" InsertVisible="False" />
                    <asp:BoundField DataField="Projectname" HeaderText="Projectname" SortExpression="Projectname" />
                    <asp:BoundField DataField="ProjectDescrip" HeaderText="ProjectDescrip" SortExpression="ProjectDescrip" />
                    <asp:BoundField DataField="Updatedby" HeaderText="Updatedby" SortExpression="Updatedby" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT ProjectTable.SN, ProjectTable.Projectname, ProjectTable.ProjectDescrip, ProjectTable.Updatedby FROM ProjectTable CROSS JOIN ChurchDetailTable WHERE (ChurchDetailTable.ChurchDetailID = @chu)">
                         <SelectParameters>
                             <asp:ControlParameter ControlID="txtchurchID" Name="chu" PropertyName="Text" />
                         </SelectParameters>
                     </asp:SqlDataSource>

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
