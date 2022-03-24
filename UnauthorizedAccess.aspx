<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UnauthorizedAccess.aspx.vb" Inherits="UnauthorizedAccess" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF3300;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center" style="height: 223px">
     <h2 class="style1">Error 403:&nbsp; Unauthorized Access</h2>
 <p>
 You have attempted to access a page that you are not authorized to view.
 </p>
 <p>
 If you have any questions, please contact the site administrator or click the plus icon to re-login.<p>
 &nbsp;<strong><asp:ImageButton ID="ImageClose" runat="server" Height="88px" 
                                     ImageUrl="~/image/plus222.png" 
                                     ToolTip="Click to return to login page." 
         Width="116px" />
                        </strong>
                                
    </div>
    </form>
</body>
</html>
