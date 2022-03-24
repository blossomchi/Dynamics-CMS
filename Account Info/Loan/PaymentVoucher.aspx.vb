
Partial Class PaymentVoucher
    Inherits System.Web.UI.Page
    Private grdTotal As Decimal = 0
    Protected Sub GridViewPV_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewPV.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowTotal As Decimal =
            Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Amount"))
            grdTotal = grdTotal + rowTotal

        End If

        If e.Row.RowType = DataControlRowType.Footer Then
            Dim lbl As Label = DirectCast(e.Row.FindControl("lblTotal1"), Label)
            lbl.Text = grdTotal.ToString("₦#,#.00")
            txtSumAmount.Text = grdTotal
        End If


    End Sub
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim maDB As New churchmanDataContext
        If Not IsPostBack Then
            UpdateTextBox.Text = Format(Now, "MMMM dd, yyyy")
            UpdateTextBox1.Text = Format(Now, "yyyy/MM/dd HH:m:ss")


            PV.Text = Session("PaymentVoucherID")
            LBLoanID.Text = Session("LoanID")

            PVID.Text = Session("PaymentVoucherID")
            Dim MemID = maDB.LoanHeadTables.Where(Function(w) w.Loanid = LBLoanID.Text).SingleOrDefault.MembershipID

            Dim FirstName = maDB.MembershipTables.Where(Function(w) w.Memberid = MemID).SingleOrDefault.FirstName
            Dim LastName = maDB.MembershipTables.Where(Function(w) w.Memberid = MemID).SingleOrDefault.LastName

            LBMembers.Text = FirstName & "" & LastName

            Dim mmm = maDB.LoanHeadTables.Where(Function(d) d.Loanid = LBLoanID.Text).SingleOrDefault.DateCreated

            LBDate5.Text = Format(mmm, "MMMM dd, yyyy")

            GridViewPV.DataBind()

            LBAmount5.Text = AmountInWords(txtSumAmount.Text.Trim)
        End If

    End Sub
    Public Function AmountInWords(ByVal nAmount As String, Optional ByVal wAmount As String = vbNullString, Optional ByVal nSet As Object = Nothing) As String
        'Let's make sure entered value is numeric
        If Not IsNumeric(nAmount) Then
            '  Return "Please enter numeric values only."
            Exit Function
        End If


        Dim tempDecValue As String = String.Empty

        If InStr(nAmount, ".") Then
            tempDecValue = nAmount.Substring(nAmount.IndexOf("."))
            nAmount = Replace(nAmount, tempDecValue, String.Empty)
        End If

        Try
            Dim intAmount As Long = nAmount
            If intAmount > 0 Then
                nSet = IIf((intAmount.ToString.Trim.Length / 3) _
                    > (CLng(intAmount.ToString.Trim.Length / 3)),
                  CLng(intAmount.ToString.Trim.Length / 3) + 1,
                    CLng(intAmount.ToString.Trim.Length / 3))
                Dim eAmount As Long = Microsoft.VisualBasic.Left(intAmount.ToString.Trim,
                  (intAmount.ToString.Trim.Length - ((nSet - 1) * 3)))
                Dim multiplier As Long = 10 ^ (((nSet - 1) * 3))

                Dim Ones() As String =
                {"", "One", "Two", "Three",
                  "Four", "Five",
                  "Six", "Seven", "Eight", "Nine"}
                Dim Teens() As String = {"",
                "Eleven", "Twelve", "Thirteen",
                  "Fourteen", "Fifteen",
                  "Sixteen", "Seventeen", "Eighteen", "Nineteen"}
                Dim Tens() As String = {"", "Ten",
                "Twenty", "Thirty",
                  "Forty", "Fifty", "Sixty",
                  "Seventy", "Eighty", "Ninety"}
                Dim HMBT() As String = {"", "",
                "Thousand", "Million",
                  "Billion", "Trillion",
                  "Quadrillion", "Quintillion"}

                intAmount = eAmount

                Dim nHundred As Integer = intAmount \ 100 : intAmount = intAmount Mod 100
                Dim nTen As Integer = intAmount \ 10 : intAmount = intAmount Mod 10
                Dim nOne As Integer = intAmount \ 1

                If nHundred > 0 Then wAmount = wAmount &
                Ones(nHundred) & " Hundred " 'This is for hundreds                
                If nTen > 0 Then 'This is for tens and teens
                    If nTen = 1 And nOne > 0 Then 'This is for teens 
                        wAmount = wAmount & Teens(nOne) & " "
                    Else 'This is for tens, 10 to 90
                        wAmount = wAmount & Tens(nTen) & IIf(nOne > 0, "-", " ")
                        If nOne > 0 Then wAmount = wAmount & Ones(nOne) & " "
                    End If
                Else 'This is for ones, 1 to 9
                    If nOne > 0 Then wAmount = wAmount & Ones(nOne) & " "
                End If
                wAmount = wAmount & HMBT(nSet) & " "
                wAmount = AmountInWords(CStr(CLng(nAmount) -
                  (eAmount * multiplier)).Trim & tempDecValue, wAmount, nSet - 1)
            Else
                If Val(nAmount) = 0 Then nAmount = nAmount &
                tempDecValue : tempDecValue = String.Empty
                If (Math.Round(Val(nAmount), 2) * 100) > 0 Then wAmount =
                  Trim(AmountInWords(CStr(Math.Round(Val(nAmount), 2) * 100),
                  wAmount.Trim & " Naira And ", 1)) & " Cents"
            End If
        Catch ex As Exception
            'MessageBox.Show("Error Encountered: " & ex.Message, _
            '  "Convert Numbers To Words", _
            '  MessageBoxButtons.OK, MessageBoxIcon.Error)
            Return "!#ERROR_ENCOUNTERED"
        End Try

        'Trap null values
        If IsNothing(wAmount) = True Then wAmount = String.Empty Else wAmount =
          IIf(InStr(wAmount.Trim.ToLower, "Naira"),
          wAmount.Trim, wAmount.Trim & " Naira")

        'Display the result
        Return wAmount
    End Function
End Class

