<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PaymentVoucher.aspx.vb" Inherits="PaymentVoucher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Voucher Form</title>
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
         <link href="css/style.css" rel="stylesheet" />
    <style type="text/css">
        #form1 {
            height: 667px;
        }
        .auto-style1 {
            padding: 8px;
            border: 1px solid #ccc;
            text-align: left;
            margin-left : 20px;
            width: 171px;
        }
        .auto-style3 {
            color: black;
            font-weight: bold;
            text-align: left;
            width: 397px;
            border: 1px solid #ccc;
            padding: 8px;
        }
        .auto-style4 {
            padding: 20px;
            border: 1px solid #ccc;
            text-align: left;
            width: 397px;
        }
        .auto-style5 {
            color: black;
            font-weight: bold;
            text-align: left;
            width: 56px;
            border: 1px solid #ccc;
            padding: 8px;
        }
        .auto-style6 {
            padding: 20px;
            border: 1px solid #ccc;
            text-align: left;
            width: 56px;
        }
        .auto-style7 {
            color: black;
            font-weight: bold;
            text-align: left;
            width: 577px;
            border: 1px solid #ccc;
            padding: 8px;
        }
        .auto-style8 {
            padding: 30px;
            border: 1px solid #ccc;
            text-align: left;
            width: 577px;
        }
        .auto-style9 {
            color: black;
            font-weight: bold;
            text-align: left;
            width: 353px;
            border: 1px solid #ccc;
            padding: 8px;
        }
        .auto-style10 {
            padding: 30px;
            border: 1px solid #ccc;
            text-align: left;
            width: 353px;
        }
        .auto-style11 {
            padding: 8px;
            border: 1px solid #ccc;
            text-align: left;
            margin-left : 20px;
            width: 171px;
            height: 68px;
        }
        .auto-style12 {
            padding: 20px;
            border: 1px solid #ccc;
            text-align: left;
            width: 397px;
            height: 68px;
        }
        .auto-style13 {
            padding: 20px;
            border: 1px solid #ccc;
            text-align: left;
            width: 56px;
            height: 68px;
        }
        .auto-style14 {
            padding: 20px;
            border: 1px solid #ccc;
            text-align: left;
            height: 68px;
        }
        .auto-style15 {
            padding: 8px;
            border: 1px solid #ccc;
            text-align: left;
            margin-left : 20px;
            width: 171px;
            height: 67px;
        }
        .auto-style16 {
            padding: 20px;
            border: 1px solid #ccc;
            text-align: left;
            width: 397px;
            height: 67px;
        }
        .auto-style17 {
            padding: 20px;
            border: 1px solid #ccc;
            text-align: left;
            width: 56px;
            height: 67px;
        }
        .auto-style18 {
            padding: 20px;
            border: 1px solid #ccc;
            text-align: left;
            height: 67px;
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
     <div class="wrapper">
   <div class="headers">
       <div>
  &nbsp;&nbsp;&nbsp;
       </div>
         <div>
  &nbsp;&nbsp;&nbsp;
       </div>
       <asp:Image ID="Image1" runat="server" Height="150px" Width="200px" class="picimg" ImageUrl="~/image/CGM.png" />
        <div class="headers-text">
              <p class="church-watch">CHURCH OF GOD MISSION INT. INC. </p>
             <p class="church-mgts"> &nbsp;&nbsp;&nbsp; PRAISE CENTRE.</p>
             <p class="church-mgt"> &nbsp;&nbsp;&nbsp; JAKPA ROAD EFFURUN.</p>
               <div>
  &nbsp;&nbsp;&nbsp;
       </div>
                   <div>
  &nbsp;&nbsp;&nbsp;
       </div>
             <p class="church-mgtt">
              
                 <asp:Label ID="Label1" runat="server" Text="PAYMENT VOUCHER - " Font-Size="X-Large"></asp:Label><asp:Label ID="lblPv" runat="server" Font-Size="X-Large"></asp:Label> <asp:Label ID="txtMemID" runat="server" Text="Label" Visible="False"></asp:Label></p></div>
        </div>
    
        <div class="clear-fix">
                    </div>
       

       <div class="main">
           <div class="printlbl">
           <p>
               <asp:Label ID="Label3" CssClass="label" runat="server" Text="REF NO :"></asp:Label><asp:Label ID="Label4" CssClass="label" runat="server"></asp:Label>
           </p>
                </div>
                 <div class="printlbl">
                <p>
               <asp:Label ID="Label5" runat="server" CssClass="label" Text="DATE :" Width="90px"></asp:Label><asp:Label ID="txtDate" runat="server" CssClass="label"></asp:Label>
                </p>
                      </div>
                       <div class="printlbl">
               <p>
               <asp:Label ID="Label11" CssClass="labels" runat="server" Text="PAYMENT METHOD:"></asp:Label>   <asp:Label ID="Label13" CssClass="label" runat="server" Visible="False"></asp:Label>         
                   <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GridLines="None" PageSize="3" ShowHeader="False">
                       <Columns>
                           <asp:BoundField DataField="PaymentName" HeaderText="PaymentName" SortExpression="PaymentName" />
                       </Columns>
                   </asp:GridView>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ChurchdbConnectionString %>" SelectCommand="SELECT PaymentMethodTable.PaymentName FROM RaiseExpenPaymentTable INNER JOIN PaymentMethodTable ON RaiseExpenPaymentTable.PaymentMethodid = PaymentMethodTable.Id WHERE (RaiseExpenPaymentTable.Expenseid = @Head) AND (RaiseExpenPaymentTable.RaiseexpHdid = @Rai) GROUP BY PaymentMethodTable.PaymentName">
                       <SelectParameters>
                           <asp:ControlParameter ControlID="txtExpensesHead" Name="Head" PropertyName="Text" />
                           <asp:ControlParameter ControlID="txtRaisedid" Name="Rai" PropertyName="Text" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                           </p>
              </div>
              <div class="printlbl">

           <p>
               <asp:Label ID="Label7" CssClass="label" runat="server" Text="Payee" Width="90px"></asp:Label><asp:Label ID="lblpayee" CssClass="label" runat="server" Width="300px"></asp:Label>
           </p>
               </div>
  
             <div class="clear-fix">
                    </div>
       <table class="tbl">
	<thead >
	<tr>
		<th class="auto-style9">Details</th>
		<th class="auto-style7">Amount in words</th>
		<th class="tblth">Debit</th>
        <th class="tblth">Credit</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td class="auto-style10">
            <asp:Label ID="lbldetails" runat="server"></asp:Label>
        </td>
		<td class="auto-style8">
            <asp:Label ID="lblAmountinw" runat="server" Width="700px" style="margin-top: 0px"></asp:Label>
        </td>
		<td class="tbltd"></td>
        <td class="tbltd"></td>
	</tr>
        <tr>
		<td class="auto-style10"></td>
		<td class="auto-style8"></td>
		<td class="tbltd"></td>
        <td class="tbltd"></td>
	</tr>

         <tr>
		<td class="auto-style10"></td>
		<td class="auto-style8"></td>
		<td class="tbltd"></td>
        <td class="tbltd"></td>
	</tr>

         <tr>
		<td class="auto-style10"></td>
		<td class="auto-style8"></td>
		<td class="tbltd"></td>
        <td class="tbltd"></td>
	</tr>
         <tr>
		<td class="auto-style10"></td>
		<td class="auto-style8">
            <asp:Label ID="txtAmount" runat="server"></asp:Label>
           
             </td>
		<td class="tbltd"></td>
        <td class="tbltd"></td>
	</tr>

	</tbody>
</table>
            <div>
            &nbsp;
           </div>
           <div class="printlbl">
           <p>
               <asp:Label ID="Label9" CssClass="labels" runat="server" Text="Bank:" Width="90px" Visible="False"></asp:Label><asp:Label ID="Label10" CssClass="label" runat="server" Width="250px"></asp:Label>
           </p>
               </div>
                <div class="printlbl">
                <p>
               <asp:Label ID="Label12" runat="server" CssClass="labels" Text="Cheque No:" Width="150px" Visible="False"></asp:Label><asp:Label ID="Label14" runat="server" CssClass="label" Width="90px"></asp:Label>
                </p>
                    </div>
                <div class="printlbl">
             <p>
               <asp:Label ID="Label2" runat="server" CssClass="labels" Text="Date Issu:" Width="120px" Visible="False"></asp:Label><asp:Label ID="Label6" runat="server" CssClass="label"></asp:Label>
                </p>
            </div>
           <div>
            &nbsp;
           </div>
            <div>
            &nbsp;
           </div>
           <p class="church-mgtt">
              
                 <asp:Label ID="Label8" runat="server" Text="OFFICIAL USE ONLY" Font-Size="X-Large"></asp:Label></p></div>
            <div>
            &nbsp;
           </div>
                  <table class="tbls">
	<thead >
	<tr>
		
        <th class="auto-style1"></th>
        <th class="auto-style3">Name</th>
		<th class="auto-style5">Signature</th>
		<th class="tblths">Date</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td class="auto-style15">Issued by:</td>
		<td class="auto-style16"></td>
		<td class="auto-style17"></td>
        <td class="auto-style18"></td>
	</tr>
        <tr>
		<td class="auto-style1">Authorized by:</td>
		<td class="auto-style4"></td>
		<td class="auto-style6"></td>
        <td class="tbltds"></td>
	</tr>

         <tr>
		<td class="auto-style1">Received by:</td>
		<td class="auto-style4"></td>
		<td class="auto-style6"></td>
        <td class="tbltds"></td>
	</tr>

         <tr>
	<td class="auto-style11">Checked by:</td>
		<td class="auto-style12"></td>
		<td class="auto-style13"></td>
        <td class="auto-style14"></td>
	</tr>
	</tbody>
</table>
     </div>
         <div>

             <asp:TextBox ID="txtStaffID" runat="server" Visible="False" Width="11px"></asp:TextBox>

                      <asp:TextBox ID="txtRaisedid" runat="server" Font-Size="XX-Small" Visible="False" Width="20px" Height="19px"></asp:TextBox>

                      <asp:TextBox ID="txtExpensesHead" runat="server" Font-Size="XX-Small" Visible="False" Width="20px"></asp:TextBox>

         </div>
  </div>
    </form>
</body>
</html>
