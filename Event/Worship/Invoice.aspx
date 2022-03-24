<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Invoice.aspx.vb" Inherits="Invoice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta name="XAR Files" content="invoice_htm_files/xr_files.txt"/>
 <title></title>
 <meta http-equiv="Content-Type" content="text/html; charset=Windows-1252"/>
 <meta name="Generator" content="Xara HTML filter v.4.1.2.673"/>
 <link rel="stylesheet" type="text/css" href="invoice_htm_files/xr_main.css"/>
 <link rel="stylesheet" type="text/css" href="invoice_htm_files/xr_text.css"/>
 <script type="text/javascript" src="invoice_htm_files/roe.js"></script>
    <link href="css/style2.css" rel="stylesheet" />
       <link href="jquery/chosen.css" rel="stylesheet" />
     
    <link href="css/style.css" rel="stylesheet" />
         <link href="../css/menu.css" rel="stylesheet" />
         <link href="css/style.css" rel="stylesheet" />

    <style type="text/css">
        .style1
        {
        }
        .style21
        {
            height: 12px;
            text-align: left;
            width: 345px;
        }
        #InvoiceHeaderTable
        {
            width: 740px;
        }       
        .style23
        {
            width: 92px;
        }
        .style25
        {            text-align: center;
        }
        .style26
        {
        }
        .style27
        {
            height: 36px;
        }
        .style28
        {
            font-size: 13pt;
        }
        #imageTable
        {
            width: 179px;
        }
        #TotalTable
        {
            width: 832px;
        }
        .style38
        {
            height: 12px;
            text-align: left;
            width: 177px;
        }
        .style40
        {
            height: 12px;
            text-align: left;
        }
        .style48
        {
            height: 16px;
            text-align: left;
            width: 369px;
        }
        .style49
        {
            height: 27px;
            width: 369px;
        }
        .style50
        {
            width: 92px;
        }
        .style55
        {
            height: 12px;
            text-align: left;
            width: 269px;
        }
        .style57
        {
            height: 12px;
            text-align: left;
            width: 480px;
        }
        .style59
        {
            height: 12px;
            text-align: left;
            width: 285px;
        }
        .style65
        {
            height: 12px;
            text-align: left;
            width: 1269px;
        }
        .style67
        {
            height: 12px;
            text-align: left;
            width: 263px;
        }
        .style69
        {
            text-align: center;
            width: 536px;
        }
        .style70
        {
            text-align: left;
            width: 142px;
            height: 16px;
        }
        .style71
        {
            height: 27px;
            width: 142px;
        }
        .style72
        {
            height: 15px;
            width: 142px;
        }
        .style73
        {
            height: 15px;
            width: 369px;
        }
        .style74
        {
            height: 20px;
            width: 142px;
        }
        .style75
        {
            height: 20px;
            width: 369px;
        }
        .style76
        {
            height: 19px;
            width: 177px;
        }
        .style77
        {
            height: 19px;
            width: 480px;
        }
        .style78
        {
            height: 19px;
            width: 285px;
        }
        .style79
        {
            height: 19px;
        }
        .style80
        {
            height: 19px;
            width: 269px;
        }
        .style81
        {
            height: 19px;
            width: 1269px;
        }
        .style82
        {
            height: 19px;
            width: 263px;
        }
        .style83
        {
            height: 19px;
            width: 345px;
        }
        .style84
        {
            height: 14px;
            width: 177px;
        }
        .style85
        {
            height: 14px;
            width: 480px;
        }
        .style86
        {
            height: 14px;
            width: 285px;
        }
        .style87
        {
            height: 14px;
        }
        .style88
        {
            height: 14px;
            width: 269px;
        }
        .style89
        {
            height: 14px;
            width: 1269px;
        }
        .style90
        {
            height: 14px;
            width: 263px;
        }
        .style91
        {
            height: 14px;
            width: 345px;
        }
        .style92
        {
            height: 16px;
            width: 177px;
        }
        .style93
        {
            height: 16px;
            width: 480px;
        }
        .style94
        {
            height: 16px;
            width: 285px;
        }
        .style95
        {
            height: 16px;
        }
        .style96
        {
            height: 16px;
            width: 269px;
        }
        .style97
        {
            height: 16px;
            width: 1269px;
        }
        .style98
        {
            height: 16px;
            width: 263px;
        }
        .style99
        {
            height: 16px;
            width: 345px;
        }
        .style100
        {
            width: 92px;
            height: 36px;
        }
        .style101
        {
            height: 12px;
            text-align: left;
            width: 1381px;
        }
        .style102
        {
            height: 19px;
            width: 1381px;
        }
        .style103
        {
            height: 14px;
            width: 1381px;
        }
        .style104
        {
            height: 16px;
            width: 1381px;
        }
        .style105
        {
            height: 12px;
            text-align: left;
            width: 1298px;
        }
        .style106
        {
            height: 19px;
            width: 1298px;
        }
        .style107
        {
            height: 14px;
            width: 1298px;
        }
        .style108
        {
            height: 16px;
            width: 1298px;
        }
        .style109
        {
            height: 28px;
        }
    </style>
   <style type="text/css">
         #InvoiceTCTable
        {
            page-break-after: always;
        }
   p.MsoListParagraphCxSpFirst
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
p.MsoListParagraphCxSpMiddle
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
p.MsoListParagraphCxSpLast
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:10.0pt;
	margin-left:.5in;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
        .style27
        {
            width: 840px;
        }
        p.MsoListParagraph
	{margin-top:0in;
	margin-right:0in;
	margin-bottom:10.0pt;
	margin-left:.5in;
	line-height:115%;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	}
        .style110
       {
           height: 12px;
           text-align: left;
           width: 220px;
       }
       .style111
       {
           height: 19px;
           width: 220px;
       }
       .style112
       {
           height: 14px;
           width: 220px;
       }
       .style113
       {
           height: 16px;
           width: 220px;
       }
        </style>

        <script type="text/javascript">
            DA = (document.all) ? 1 : 0
            function HandleError() {
                alert("\nNothing was printed. \n\nIf you do want to print this page, then\nclick on the printer icon in the toolbar above.")
                return true;
            }   
 </script>
</head>
<body onload="window.print();">
<script type="text/vbscript">
 Sub window_onunload()
 On Error Resume Next
 Set WB = nothing
 On Error Goto 0
 End Sub
 Sub Print()
 OLECMDID_PRINT = 6
 OLECMDEXECOPT_DONTPROMPTUSER = 2
 OLECMDEXECOPT_PROMPTUSER = 1
 On Error Resume Next

 If DA Then
 call WB.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER,1)

 Else
 call WB.IOleCommandTarget.Exec(OLECMDID_PRINT ,OLECMDEXECOPT_DONTPROMPTUSER,"","","")

 End If

 If Err.Number <> 0 Then
 If DA Then 
 Alert("Nothing Printed :" & err.number & " : " & err.description)
 Else
 HandleError()
 End if
 End If
 On Error Goto 0
 End Sub
 If DA Then
 wbvers="8856F961-340A-11D0-A96B-00C04FD705A2"
 Else
 wbvers="EAB22AC3-30C1-11CF-A7EB-0000C05BAE0B"
 End If

 document.write "<object ID=""WB"" WIDTH=0 HEIGHT=0 CLASSID=""CLSID:"
 document.write wbvers & """> </object>"
 </script>
    <form id="form1" runat="server">
<div class="xr_ap" id="xr_xr" 
        
        style=" width: 993px; height: auto; top:0px; ">
 <script type="text/javascript">     var xr_xr = document.getElementById("xr_xr")</script>
<!--[if IE]><div class="xr_ap" id="xr_xri" 
        
        style="width: 993px; height: auto; clip: rect(0px 955px 1477px 0px); top: 1px; left: 0px;"><![endif]-->
<!--[if !IE]>--><div class="xr_ap" id="xr_xri" 
            style="width: 993px; height: auto; clip: rect(0px, 955px, 1477px, 0px); top: 0px; left: 16px;"><!--<![endif]-->
    <div class="xr_ap" style="left: 91px; top: 19px; width: 825px; height: 125px;">
             <p  style="color: #3e6911; font-size: 36px; font-weight: bold; font-style: normal; text-transform: uppercase; text-align: center; height: 40px;">CHURCH OF GOD MISSION INT. INC. </p>
             <p style="font-size: 25px; font-weight: bold; font-style: inherit; text-transform: uppercase; text-align: center;"> PRAISE CENTRE, JAKPA ROAD EFFURUN.</p>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:Label ID="Label1" runat="server" Text="CHURCH SERVICE PROGRAM - " 
             Font-Size="X-Large" style="text-align: center"></asp:Label>
             <asp:Label ID="Label2" runat="server" Text="Label" 
              Font-Size="X-Large"></asp:Label>
              <asp:Label ID="txtMemID" runat="server" Text="Label" Visible="False">
              </asp:Label></div>
 
    <img class="xr_ap" src="image/CGM.png" alt="" title="" 
                style="left: 43px; top: 44px; width: 148px; height: 147px; right: 790px;"/>&nbsp;&nbsp;&nbsp;
 <table id="InvoiceTable" runat="server" visible="True"              
                
                style="position: absolute; top: 199px; left: 16px; width: 913px; height: 227px; margin-right: 0px;"  >
                            <tr>
                                <td class="style26" valign="top"  >
                        
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" style="font-size: 17px" Width="897px" Font-Size="X-Large">
               <Columns>
                   <asp:BoundField DataField="TIME" HeaderText="TIME" SortExpression="TIME" ReadOnly="True" />
                   <asp:BoundField DataField="MINS" HeaderText="MINS" SortExpression="MINS" />
                   <asp:BoundField DataField="PROGRAM" HeaderText="PROGRAM" SortExpression="PROGRAM" />
                   <asp:BoundField DataField="MODERATOR" HeaderText="MODERATOR" SortExpression="MODERATOR" />
               </Columns>
           </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT Timefrom + ' - ' + TimeTo AS TIME, Min AS MINS, Program AS PROGRAM, Moderator AS MODERATOR FROM OrderServiceTable WHERE (Date = @date)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label2" Name="date" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        
                                </td>
                            </tr>
                            </table>


 <div id="xr_xo0" class="xr_ap" style="left:0; top:0; width:955px; height:100px; visibility:hidden;">
 <a href="#" onclick="return(false);">
 </a>
 </div>

 
 <div id="xr_xd0"></div>
</div>

</div>
 


<!--[if lt IE 7]><script type="text/javascript" src="invoice_htm_files/png.js"></script><![endif]-->
<script type="text/javascript">    </script>
    
    
    
    
    </form>
    
</body>
</html>
