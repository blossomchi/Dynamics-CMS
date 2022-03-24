
Partial Class PaymentVoucher
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtAmount.Text = ""


            txtExpensesHead.Text = Session("Expenseid")
            txtRaisedid.Text = Session("raisedid")

            If txtExpensesHead.Text = "" Then
                 Response.Redirect("Login.aspx")
                Exit Sub
            End If

            If txtRaisedid.Text = "" Then
                 Response.Redirect("Login.aspx")
                Exit Sub
            End If
            txtStaffID.Text = Session("StaffID")






            Dim getpayeeid = (From s In madd.RaiseExpensesHdTables
                        Where s.ID = txtRaisedid.Text AndAlso s.ExpenseHead = txtExpensesHead.Text
                        Select s).SingleOrDefault.Supplerid


            Dim getpayee = (From s In madd.SupplierTables
                       Where s.Supplerid = getpayeeid
                       Select s).SingleOrDefault.CompanyName




            lblpayee.Text = getpayee


            Dim checkpayment = (From s In madd.RaiseExpenPaymentTables
                           Where s.RaiseexpHdid = txtRaisedid.Text AndAlso s.Expenseid = txtExpensesHead.Text
                          Select s).Any


            If checkpayment = True Then
                lblPv.Text = ""
                Dim countPV = (From s In madd.PaymentVoucherTables
                                Where s.RaiseExpenseId = txtRaisedid.Text AndAlso s.ExpensesHeadiD = txtExpensesHead.Text
                                                     Select s).Count


                If countPV = 1 Then
                    Dim getpvid = (From s In madd.PaymentVoucherTables
                                Where s.RaiseExpenseId = txtRaisedid.Text AndAlso s.ExpensesHeadiD = txtExpensesHead.Text
                                                     Select s).SingleOrDefault.Pvid

                    lblPv.Text = getpvid
                Else
                    For Each t In (From s In madd.PaymentVoucherTables
                                  Where s.RaiseExpenseId = txtRaisedid.Text AndAlso s.ExpensesHeadiD = txtExpensesHead.Text
                                   Select s)

                        lblPv.Text += t.Pvid & " " & ","
                    Next
                End If
            Else
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Sorry payment has not been made cannot print voucher!.')", True)
                Exit Sub
            End If


            'get date created
            Dim getdate = (From s In madd.RaiseExpensesHdTables
                    Where s.ID = txtRaisedid.Text AndAlso s.ExpenseHead = txtExpensesHead.Text
                    Select s).SingleOrDefault.Datecreated

            txtDate.Text = getdate



            ' get expense parent group
            Dim ExpenseName = (From t In madd.ExpensesHeadTables Join
                              f In madd.RaiseExpensesHdTables On t.Expensesid Equals f.ExpenseHead
                              Where f.ID = CInt(txtRaisedid.Text) AndAlso f.ExpenseHead = CInt(txtExpensesHead.Text)
                              Select t).SingleOrDefault.Name


            lbldetails.Text = ExpenseName


            'get amount from raised tb
            Dim getAmount = (From s In madd.RaiseExpensesHdTables
                   Where s.ID = CInt(txtRaisedid.Text) AndAlso s.ExpenseHead = CInt(txtExpensesHead.Text)
                   Select s).SingleOrDefault.Amount

            txtAmount.Text = getAmount



            'Dim getAmountW = (From s In madd.RaiseExpenPaymentTables
            '     Where s.RaiseexpHdid = txtRaisedid.Text AndAlso s.Expenseid = txtExpensesHead.Text
            '     Select s).SingleOrDefault.AmountW

            'lblAmountinw.Text = getAmountW





            Dim getpaymentid = (From s In madd.RaiseExpenPaymentTables
                                Where s.RaiseexpHdid = txtRaisedid.Text AndAlso s.Expenseid = txtExpensesHead.Text
                                Select New With { _
                                    s.PaymentMethodid})

            Label13.Text = ""
            For Each g In getpaymentid

                Dim PID = g.PaymentMethodid
                Dim getpaymentname = (From s In madd.PaymentMethodTables
                                     Where s.Id = PID
                                     Select s).SingleOrDefault.PaymentName

                Label13.Text += getpaymentname & " " & ","
            Next




            Dim dumcheckd = (From s In madd.RaiseBankPaymentTables
                        Where s.RaiseExpenHdid = txtRaisedid.Text
                       Select s).Any


            If dumcheckd Then
                Dim getdateiss = (From s In madd.RaiseBankPaymentTables
                                 Where s.RaiseExpenHdid = txtRaisedid.Text
                                Select s).SingleOrDefault.Dateissu

                Label6.Text = getdateiss


                Label2.Visible = True
                Label12.Visible = True
                Label9.Visible = True


                Dim getChequeNo = (From s In madd.RaiseBankPaymentTables
                            Where s.RaiseExpenHdid = txtRaisedid.Text
                           Select s).SingleOrDefault.ChequeNo

                Label14.Text = getChequeNo

                Label2.Visible = True
                Label12.Visible = True
                Label9.Visible = True


                Dim getbankid = (From s In madd.RaiseBankPaymentTables
                  Where s.RaiseExpenHdid = txtRaisedid.Text
                 Select s).SingleOrDefault.Bankid

                Dim getbankname = (From s In madd.BankTables
                             Where s.id = getbankid
                            Select s).SingleOrDefault.Bankname


                Label10.Text = getbankname


                Label2.Visible = True
                Label12.Visible = True
                Label9.Visible = True
            Else


                Label2.Visible = False
                Label12.Visible = False
                Label9.Visible = False

                Label2.Visible = False
                Label12.Visible = False
                Label9.Visible = False


                Label2.Visible = False
                Label12.Visible = False
                Label9.Visible = False

            End If








        End If
    End Sub
    
End Class
