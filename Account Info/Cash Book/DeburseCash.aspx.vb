
Partial Class DeburseCash
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub OnMenuItemDataBound(sender As Object, e As MenuEventArgs)
        If SiteMap.CurrentNode IsNot Nothing Then
            If e.Item.Text = SiteMap.CurrentNode.Title Then
                If e.Item.Parent IsNot Nothing Then
                    e.Item.Parent.Selected = True
                Else
                    e.Item.Selected = True
                End If
            End If
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtchurchID.Text = ""

            Dim userName As String = User.Identity.Name

            Dim getMemberID = madd.AuthenticalTables.Where(Function(f) f.Username = userName).SingleOrDefault.Memberid

            Dim name = madd.MembershipTables.Where(Function(d) d.Memberid = getMemberID).SingleOrDefault.FirstName

            Dim getChurch = (From y In madd.MembershipTables Join
                                h In madd.ChurchDetailTables On y.ChurchDetailID Equals h.ChurchDetailID
                                Where y.Memberid = getMemberID
                                Select h).SingleOrDefault.ChurchName


            Dim Location = (From d In madd.ChurchDetailTables
                          Where d.ChurchName = getChurch
                          Select d).SingleOrDefault.Location.Name

            Dim state = (From d In madd.ChurchDetailTables
                          Where d.ChurchName = getChurch
                          Select d).SingleOrDefault.StateTable.State



            Session("StaffID") = getMemberID


            lbChurchName.Text = "Welcome to Church of God Mission Management System"

            AdminLabel.Text = name.ToUpper

            lbChurchName.Text = getChurch.ToUpper

            lbState.Text = state.ToUpper
            lbLocation.Text = Location.ToUpper


            txtchurchID.Text = ""


            If lbChurchName.Text = "" Then
                 Response.Redirect("Login.aspx")
                Exit Sub
            End If
            txtStaffID.Text = Session("StaffID")

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID
            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            Dim strDate As Date
            strDate = Now

            TextBox1.Text = strDate
            TextBox2.Text = txtMembername.Text

            drpCash.DataBind()
            drpCash.Items.Insert(0, New ListItem("Select"))
            drpCash.SelectedIndex = 0

            drpBank.DataBind()
            drpBank.Items.Insert(0, New ListItem("Select"))
            drpBank.SelectedIndex = 0
            RadDatePicker1.Clear()


            drpAccount.DataBind()
            drpAccount.Items.Insert(0, New ListItem("Select"))
            drpAccount.SelectedIndex = 0

            drpdetails.DataBind()
            drpdetails.Items.Insert(0, New ListItem("Select"))
            drpdetails.SelectedIndex = 0

        End If
    End Sub

    Protected Sub drpCash_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpCash.SelectedIndexChanged

        If drpCash.SelectedValue = "Select" Then
            drpBank.Visible = False
            Label10.Visible = False

        ElseIf drpCash.SelectedValue = "Cash" Then

            drpBank.Visible = False
            Label10.Visible = False

        ElseIf drpCash.SelectedValue = "Bank" Then
            drpBank.Visible = True
            Label10.Visible = True

        End If

    End Sub

    Protected Sub drpAccount_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpAccount.SelectedIndexChanged
        If drpAccount.SelectedValue = "Select" Then

            Label5.Text = "Account Details"

            drpdetails.DataBind()
            drpdetails.Items.Insert(0, New ListItem("Select"))
            drpdetails.SelectedIndex = 0

        ElseIf drpAccount.SelectedValue = "Account Payable" Then

            Label5.Text = "Account Payable"

            Dim qryTitle = madd.SupplierTables.Select(Function(f) f.CompanyName).Distinct

            drpdetails.DataSource = qryTitle
            drpdetails.DataBind()
            drpdetails.Items.Insert(0, New ListItem("Select"))
            drpdetails.SelectedIndex = 0

        ElseIf drpAccount.SelectedValue = "Account Recievable" Then


            Dim qrypost = madd.MinisterTables.Select(Function(f) f.Post).Distinct

            Label5.Text = "Account Recievable"

            Dim qryTitle = madd.MembershipTables.Select(Function(f) f.LastName & " " & f.FirstName).Distinct

            drpdetails.DataSource = qryTitle
            drpdetails.DataBind()
            drpdetails.Items.Insert(0, New ListItem("Select"))
            drpdetails.SelectedIndex = 0



        ElseIf drpAccount.SelectedValue = "Bank" Then


            Dim qrypost = madd.MinisterTables.Select(Function(f) f.Post).Distinct

            Label5.Text = "Bank"

            Dim qryTitle = madd.BankTables.Select(Function(f) f.Bankname).Distinct

            drpdetails.DataSource = qryTitle
            drpdetails.DataBind()
            drpdetails.Items.Insert(0, New ListItem("Select"))
            drpdetails.SelectedIndex = 0


        ElseIf drpAccount.SelectedValue = "Bank" Then


            Dim qrypost = madd.MinisterTables.Select(Function(f) f.Post).Distinct

            Label5.Text = "Bank"

            Dim qryTitle = madd.BankTables.Select(Function(f) f.Bankname).Distinct

            drpdetails.DataSource = qryTitle
            drpdetails.DataBind()
            drpdetails.Items.Insert(0, New ListItem("Select"))
            drpdetails.SelectedIndex = 0


        ElseIf drpAccount.SelectedValue = "Expenses" Then

            Dim qrypost = madd.MinisterTables.Select(Function(f) f.Post).Distinct

            Label5.Text = "Expenses"

            Dim qryTitle = madd.ExpensesHeadTables.Select(Function(f) f.Name).Distinct

            drpdetails.DataSource = qryTitle
            drpdetails.DataBind()
            drpdetails.Items.Insert(0, New ListItem("Select"))
            drpdetails.SelectedIndex = 0


        ElseIf drpAccount.SelectedValue = "Other Income" Then

            Dim qrypost = madd.MinisterTables.Select(Function(f) f.Post).Distinct

            Label5.Text = "Other Income"

            Dim qryTitle = madd.IncomeTables.Select(Function(f) f.Income).Distinct

            drpdetails.DataSource = qryTitle
            drpdetails.DataBind()
            drpdetails.Items.Insert(0, New ListItem("Select"))
            drpdetails.SelectedIndex = 0


        ElseIf drpAccount.SelectedValue = "Loan" Then


            Label5.Text = "loan"

            Dim qryTitle = madd.LoanHeadTables.Select(Function(f) f.Name).Distinct

            drpdetails.DataSource = qryTitle
            drpdetails.DataBind()
            drpdetails.Items.Insert(0, New ListItem("Select"))
            drpdetails.SelectedIndex = 0


        End If
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("CashBookView.aspx")
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim strDate As Date
        strDate = Now
        If drpAccount.SelectedValue = "Select" Then

            Label5.Text = "Account Details"

            drpdetails.DataBind()
            drpdetails.Items.Insert(0, New ListItem("Select"))
            drpdetails.SelectedIndex = 0


        ElseIf drpAccount.SelectedValue = "Loan" Then

            Dim LoanID = madd.LoanHeadTables.Where(Function(p) p.Name = drpdetails.SelectedValue).SingleOrDefault.Loanid
            'credit loan account
            Dim saveLoan As New LoanAccountTable With { _
                  .LoanID = LoanID, _
                  .TranscationDate = txtTransDate.Text, _
                  .AccountName = "Cash", _
                  .Accountdetails = "Cash", _
                  .Amount = txtAmount.Text, _
                  .Transcationtype = "DR", _
                  .Remark = txtDescrip.Text, _
                   .Datecreated = strDate, _
                   .createdby = txtStaffID.Text}
            madd.LoanAccountTables.InsertOnSubmit(saveLoan)
            madd.SubmitChanges()


            'Debit cash account
            Dim SavePurchase As New Cash_BookTable With { _
                                           .Cash_Bank = drpCash.SelectedValue, _
                                           .Transactiondate = txtTransDate.Text, _
                                           .AccountName = "Loan", _
                                           .Accountdetails = drpdetails.SelectedValue, _
                                           .Accountdetails1 = drpCash.SelectedValue, _
                                           .TransactionType = drpAssets.SelectedValue, _
                                           .Amount = txtAmount.Text, _
                                           .Remark = txtDescrip.Text, _
                                           .Staffid = txtStaffID.Text, _
                                            .Datecreated = strDate}
            madd.Cash_BookTables.InsertOnSubmit(SavePurchase)
            madd.SubmitChanges()


            Dim message As String = "Load Deburse Successfully!"
            Dim url As String = "CashBookView.aspx" ' The page tobe refreshed here!
            Dim script As String = "window.onload = function(){ alert('"
            script += message
            script += "');"
            script += "window.location = '"
            script += url
            script += "'; }"
            ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)

        ElseIf drpAccount.SelectedValue = "Bank" Then
            'if cash is going to the bank
            If drpCash.SelectedValue = "Cash" Then
                'debit cash on cash book
                Dim DebitCash As New Cash_BookTable With { _
                                          .Cash_Bank = drpCash.SelectedValue, _
                                          .Transactiondate = txtTransDate.Text, _
                                          .AccountName = "Cash", _
                                          .Accountdetails = drpdetails.SelectedValue, _
                                          .Accountdetails1 = drpCash.SelectedValue, _
                                          .TransactionType = "DR", _
                                          .Amount = txtAmount.Text, _
                                          .Remark = txtDescrip.Text, _
                                          .Staffid = txtStaffID.Text, _
                                           .Datecreated = strDate}
                madd.Cash_BookTables.InsertOnSubmit(DebitCash)
                madd.SubmitChanges()

                ' credit bank on cash book
                Dim CreditBank As New Cash_BookTable With { _
                                        .Cash_Bank = drpCash.SelectedValue, _
                                        .Transactiondate = txtTransDate.Text, _
                                        .AccountName = "Bank", _
                                        .Accountdetails = drpdetails.SelectedValue, _
                                        .Accountdetails1 = drpCash.SelectedValue, _
                                        .TransactionType = drpAssets.SelectedValue, _
                                        .Amount = txtAmount.Text, _
                                        .Remark = txtDescrip.Text, _
                                        .Staffid = txtStaffID.Text, _
                                         .Datecreated = strDate}
                madd.Cash_BookTables.InsertOnSubmit(CreditBank)
                madd.SubmitChanges()

            ElseIf drpCash.SelectedValue = "Bank" Then
                'debit cash on cash book
                Dim DebitCash As New Cash_BookTable With { _
                                        .Cash_Bank = drpCash.SelectedValue, _
                                        .Transactiondate = txtTransDate.Text, _
                                        .AccountName = "Cash", _
                                        .Accountdetails = drpdetails.SelectedValue, _
                                        .Accountdetails1 = drpCash.SelectedValue, _
                                        .TransactionType = "DR", _
                                        .Amount = txtAmount.Text, _
                                        .Remark = txtDescrip.Text, _
                                        .Staffid = txtStaffID.Text, _
                                         .Datecreated = strDate}
                madd.Cash_BookTables.InsertOnSubmit(DebitCash)
                madd.SubmitChanges()


                ' credit bank on cash book
                Dim CreditBank As New Cash_BookTable With { _
                                        .Cash_Bank = drpCash.SelectedValue, _
                                        .Transactiondate = txtTransDate.Text, _
                                        .AccountName = "Bank", _
                                        .Accountdetails = drpdetails.SelectedValue, _
                                        .Accountdetails1 = drpCash.SelectedValue, _
                                        .TransactionType = drpAssets.SelectedValue, _
                                        .Amount = txtAmount.Text, _
                                        .Remark = txtDescrip.Text, _
                                        .Staffid = txtStaffID.Text, _
                                         .Datecreated = strDate}
                madd.Cash_BookTables.InsertOnSubmit(CreditBank)
                madd.SubmitChanges()
            End If


            Dim message As String = "Load Deburse Successfully!"
            Dim url As String = "CashBookView.aspx" ' The page tobe refreshed here!
            Dim script As String = "window.onload = function(){ alert('"
            script += message
            script += "');"
            script += "window.location = '"
            script += url
            script += "'; }"

            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Disburse was made Successfully!');", True)

        ElseIf drpAccount.SelectedValue = "Expenses" Then


            '#################
            Dim sumTotal As Decimal = 0
            Dim SupID As Integer = CInt(ExpSupplier.Text)

            Dim supplier = madd.SupplierTables.Where(Function(d) d.Supplerid = SupID).SingleOrDefault.CompanyName
            Dim CName = supplier.ToUpper

            Dim checkCashAccountPosting = madd.Cash_BookTables.Where(Function(y) y.AccountName = "Expenses" AndAlso y.Accountdetails = txtPaymentVoucher.Text).Any

            If checkCashAccountPosting Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('This expenses has already been disbursed.');", True)
                Exit Sub
            End If

            'head id
            Dim expenseHeadId = madd.PaymentVoucherTables.Where(Function(w) w.Pvid = txtPaymentVoucher.Text).SingleOrDefault.ExpensesHeadiD

            'raised header id
            Dim ExpenseHeaderID = madd.PaymentVoucherTables.Where(Function(w) w.Pvid = txtPaymentVoucher.Text).SingleOrDefault.RaiseExpenseId

            Dim ExpenseName = From w In madd.RaiseExpensedDetailTables
                                  Where w.RasieHeadid = ExpenseHeaderID
                                  Select w


            Dim getallPV = From r In madd.RaiseExpenPaymentTables Join
                           d In madd.PaymentMethodTables On r.PaymentMethodid Equals d.Id
                           Where r.Expenseid = CInt(expenseHeadId) AndAlso r.RaiseexpHdid = CInt(ExpenseHeaderID)
                           Select New With {
                                       r.PaymentMethodid,
                                       d.PaymentName,
                                       r.Amount}

            Dim ExpenseBalance As Decimal = 0
            Dim checkExpenseAmountPost As Decimal = 0

            For Each t In getallPV
                Dim EName = t.PaymentName
                Dim EAmount = t.Amount

                If EName = "Cash" Then
                    'if Cash, Credit cash account 
                    'Debit cash account
                    Dim SavePurchase As New Cash_BookTable With { _
                                                   .Cash_Bank = EName, _
                                                   .Transactiondate = txtTransDate.Text, _
                                                   .AccountName = "Expenses", _
                                                   .Accountdetails = drpdetails.SelectedValue, _
                                                   .Accountdetails1 = drpCash.SelectedValue, _
                                                   .TransactionType = drpAssets.SelectedValue, _
                                                   .Amount = txtAmount.Text, _
                                                   .Remark = txtDescrip.Text, _
                                                   .Staffid = txtStaffID.Text, _
                                                    .Datecreated = strDate}
                    madd.Cash_BookTables.InsertOnSubmit(SavePurchase)
                    madd.SubmitChanges()

                    Dim CountPaymentName = (From w In madd.RaiseExpenPaymentTables
                                            Where w.RaiseexpHdid = ExpenseHeaderID
                                            Select w).Count

                    Dim countExpenses = madd.RaiseExpensedDetailTables.Where(Function(w) w.RasieHeadid = ExpenseHeaderID).Count

                    For Each m In ExpenseName
                        Dim ItemName = m.ExpensesDetails
                        Dim AmounE = m.Amount

                        If countExpenses = 1 Then
                            'if expenses is only 1 items
                            If CountPaymentName = 1 Then
                                'Debit expense account, its only cash

                                Dim SaveExepen As New ExpensesAccountTable With { _
                               .ExpensesHeadid = expenseHeadId, _
                               .TranscationDate = txtTransDate.Text, _
                               .ExpensesName = ItemName, _
                               .AccountName = "Cash", _
                               .Accountdetails = drpdetails.SelectedValue, _
                               .Transcationtype = "DR", _
                               .Amount = AmounE, _
                               .Remark = CName, _
                               .Datecreated = strDate, _
                               .createdby = txtStaffID.Text}

                                madd.ExpensesAccountTables.InsertOnSubmit(SaveExepen)
                                madd.SubmitChanges()

                            ElseIf CountPaymentName > 1 AndAlso AmounE > EAmount Then
                                'more than one payment
                                'Debit expense account
                              
                                Dim SaveExepen As New ExpensesAccountTable With { _
                              .ExpensesHeadid = expenseHeadId, _
                              .TranscationDate = txtTransDate.Text, _
                              .ExpensesName = ItemName, _
                              .AccountName = "Cash", _
                              .Accountdetails = drpdetails.SelectedValue, _
                              .Transcationtype = "DR", _
                              .Amount = AmounE - EAmount, _
                              .Remark = CName, _
                              .Datecreated = strDate, _
                              .createdby = txtStaffID.Text}

                                madd.ExpensesAccountTables.InsertOnSubmit(SaveExepen)
                                madd.SubmitChanges()

                            ElseIf CountPaymentName > 1 AndAlso AmounE < EAmount Then
                                'more than one payment
                                'Debit expense account
                              
                                Dim SaveExepen As New ExpensesAccountTable With { _
                           .ExpensesHeadid = expenseHeadId, _
                           .TranscationDate = txtTransDate.Text, _
                           .ExpensesName = ItemName, _
                           .AccountName = "Cash", _
                           .Accountdetails = drpdetails.SelectedValue, _
                           .Transcationtype = "DR", _
                           .Amount = EAmount, _
                           .Remark = CName, _
                           .Datecreated = strDate, _
                           .createdby = txtStaffID.Text}

                                madd.ExpensesAccountTables.InsertOnSubmit(SaveExepen)
                                madd.SubmitChanges()


                            End If
                        ElseIf countExpenses > 1 Then
                            'if expenses is more than one items and payment is only one
                            If CountPaymentName = 1 Then
                                'Debit expense account
                                Dim SaveExepen As New ExpensesAccountTable With { _
                                       .ExpensesHeadid = expenseHeadId, _
                                       .TranscationDate = txtTransDate.Text, _
                                       .ExpensesName = ItemName, _
                                       .AccountName = "Cash", _
                                       .Accountdetails = drpdetails.SelectedValue, _
                                       .Transcationtype = "DR", _
                                       .Amount = AmounE, _
                                       .Remark = CName, _
                                       .Datecreated = strDate, _
                                       .createdby = txtStaffID.Text}

                                madd.ExpensesAccountTables.InsertOnSubmit(SaveExepen)
                                madd.SubmitChanges()

                            End If
                        End If
                    Next
                    If countExpenses > 1 AndAlso CountPaymentName > 1 Then
                        'if payment is more than one type
                        '**************************
                        Dim ExpenseItem = From w In madd.RaiseExpensedDetailTables
                                          Where w.RasieHeadid = ExpenseHeaderID
                                          Select w

                        For Each y In ExpenseItem
                            Dim EItemName = y.ExpensesDetails
                            Dim ItemAmounE = y.Amount

                            If ItemAmounE < EAmount Then
                                'sum cash amount posted
                                Dim checkPost = madd.ExpensesAccountTables.Where(Function(a) a.ExpensesHeadid = expenseHeadId AndAlso CDate(a.TranscationDate) = CDate(txtTransDate.Text)
                                                                                                      ).Any
                                If checkPost = True Then
                                    checkExpenseAmountPost = madd.ExpensesAccountTables.Where(Function(a) a.ExpensesHeadid = expenseHeadId AndAlso CDate(a.TranscationDate) = CDate(txtTransDate.Text)
                                                                                                                                            ).Sum(Function(a) a.Amount)
                                End If
                                If checkExpenseAmountPost = EAmount Then
                                    'cash amount has been posted
                                    GoTo BankPayment
                                ElseIf checkExpenseAmountPost < EAmount Then
                                    'Debit expense account with ItemAmounE

                                    Dim SaveExepen As New ExpensesAccountTable With { _
                                     .ExpensesHeadid = expenseHeadId, _
                                     .TranscationDate = txtTransDate.Text, _
                                     .ExpensesName = EItemName, _
                                     .AccountName = "Cash", _
                                     .Accountdetails = drpdetails.SelectedValue, _
                                     .Transcationtype = "DR", _
                                     .Amount = ItemAmounE, _
                                     .Remark = CName, _
                                     .Datecreated = strDate, _
                                     .createdby = txtStaffID.Text}

                                    madd.ExpensesAccountTables.InsertOnSubmit(SaveExepen)
                                    madd.SubmitChanges()

                                    ' ExpenseBalance = EAmount - ItemAmounE
                                End If
                            ElseIf ItemAmounE > EAmount Then
                                Dim checkPost = madd.ExpensesAccountTables.Where(Function(a) a.ExpensesHeadid = expenseHeadId AndAlso CDate(a.TranscationDate) = CDate(txtTransDate.Text)
                                                                                                      ).Any
                                If checkPost = True Then
                                    checkExpenseAmountPost = madd.ExpensesAccountTables.Where(Function(a) a.ExpensesHeadid = expenseHeadId AndAlso CDate(a.TranscationDate) = CDate(txtTransDate.Text)
                                                                                                                                            ).Sum(Function(a) a.Amount)
                                End If

                                If checkExpenseAmountPost = EAmount Then
                                    'cash amount has been posted
                                    GoTo BankPayment
                                ElseIf checkExpenseAmountPost < EAmount Then
                                    'Debit expense account with EAmount
                                    Dim SaveExepen As New ExpensesAccountTable With { _
                                    .ExpensesHeadid = expenseHeadId, _
                                    .TranscationDate = txtTransDate.Text, _
                                    .ExpensesName = EItemName, _
                                    .AccountName = "Cash", _
                                    .Accountdetails = drpdetails.SelectedValue, _
                                    .Transcationtype = "DR", _
                                    .Amount = EAmount - checkExpenseAmountPost, _
                                    .Remark = CName, _
                                    .Datecreated = strDate, _
                                    .createdby = txtStaffID.Text}

                                    madd.ExpensesAccountTables.InsertOnSubmit(SaveExepen)
                                    madd.SubmitChanges()

                                    checkExpenseAmountPost = madd.ExpensesAccountTables.Where(Function(a) a.ExpensesHeadid = expenseHeadId AndAlso CDate(a.TranscationDate) = CDate(txtTransDate.Text)
                                                                                                      ).Sum(Function(a) a.Amount)
                                    If checkExpenseAmountPost = EAmount Then
                                        ' ExpenseBalance = ItemAmounE - ExpenseBalance
                                        GoTo BankPayment
                                    End If
                                End If
                            ElseIf ItemAmounE = EAmount Then
                                Dim checkPost = madd.ExpensesAccountTables.Where(Function(a) a.ExpensesHeadid = expenseHeadId AndAlso CDate(a.TranscationDate) = CDate(txtTransDate.Text)
                                                                                                      ).Any
                                If checkPost = True Then
                                    checkExpenseAmountPost = madd.ExpensesAccountTables.Where(Function(a) a.ExpensesHeadid = expenseHeadId AndAlso CDate(a.TranscationDate) = CDate(txtTransDate.Text)
                                                                                                                                            ).Sum(Function(a) a.Amount)
                                End If

                                If checkExpenseAmountPost = EAmount Then
                                    'cash amount has been posted
                                    GoTo BankPayment
                                ElseIf checkExpenseAmountPost < EAmount AndAlso ItemAmounE = EAmount Then
                                    'Debit expense account with EAmount

                                    Dim SaveExepen As New ExpensesAccountTable With { _
                                    .ExpensesHeadid = expenseHeadId, _
                                    .TranscationDate = txtTransDate.Text, _
                                    .ExpensesName = EItemName, _
                                    .AccountName = "Cash", _
                                    .Accountdetails = drpdetails.SelectedValue, _
                                    .Transcationtype = "DR", _
                                    .Amount = ItemAmounE, _
                                    .Remark = CName, _
                                    .Datecreated = strDate, _
                                    .createdby = txtStaffID.Text}

                                    madd.ExpensesAccountTables.InsertOnSubmit(SaveExepen)
                                    madd.SubmitChanges()

                                    checkExpenseAmountPost = madd.ExpensesAccountTables.Where(Function(a) a.ExpensesHeadid = expenseHeadId AndAlso CDate(a.TranscationDate) = CDate(txtTransDate.Text)
                                                                                                         ).Sum(Function(a) a.Amount)
                                    If checkExpenseAmountPost = EAmount Then
                                        GoTo BankPayment
                                    End If
                                End If
                            End If
                        Next
                        '***********************
                    End If

BankPayment:    ElseIf EName <> "Cash" Then
                    EName = "Bank"
                    'if Bank, Credit cash account  
                    Dim SavePurchase As New Cash_BookTable With { _
                                                  .Cash_Bank = EName, _
                                                  .Transactiondate = txtTransDate.Text, _
                                                  .AccountName = "Expenses", _
                                                  .Accountdetails = drpdetails.SelectedValue, _
                                                  .Accountdetails1 = drpCash.SelectedValue, _
                                                  .TransactionType = drpAssets.SelectedValue, _
                                                  .Amount = txtAmount.Text, _
                                                  .Remark = txtDescrip.Text, _
                                                  .Staffid = txtStaffID.Text, _
                                                   .Datecreated = strDate}
                    madd.Cash_BookTables.InsertOnSubmit(SavePurchase)
                    madd.SubmitChanges()

                    Dim CountPaymentName = (From w In madd.RaiseExpenPaymentTables
                                            Where w.RaiseexpHdid = ExpenseHeaderID
                                            Select w).Count
0:
                    Dim countExpenses = madd.RaiseExpensedDetailTables.Where(Function(w) w.RasieHeadid = ExpenseHeaderID).Count

                    For Each m In ExpenseName
                        Dim ItemName = m.ExpensesDetails
                        Dim AmounE = m.Amount
                        'if expenses is only 1 items
                        If countExpenses = 1 Then
                            If CountPaymentName = 1 Then
                                'Debit expense account, its only cash

                                Dim SaveExepen As New ExpensesAccountTable With { _
                                   .ExpensesHeadid = expenseHeadId, _
                                   .TranscationDate = txtTransDate.Text, _
                                   .ExpensesName = ItemName, _
                                   .AccountName = "Cash", _
                                   .Accountdetails = EName, _
                                   .Transcationtype = "DR", _
                                   .Amount = AmounE, _
                                   .Remark = CName, _
                                   .Datecreated = strDate, _
                                   .createdby = txtStaffID.Text}

                                madd.ExpensesAccountTables.InsertOnSubmit(SaveExepen)
                                madd.SubmitChanges()

                            ElseIf CountPaymentName > 1 AndAlso AmounE > EAmount Then
                                'more than one payment
                                'Debit expense account
                                Dim SaveExepen As New ExpensesAccountTable With { _
                                    .ExpensesHeadid = expenseHeadId, _
                                    .TranscationDate = txtTransDate.Text, _
                                    .ExpensesName = ItemName, _
                                    .AccountName = "Cash", _
                                    .Accountdetails = EName, _
                                    .Transcationtype = "DR", _
                                    .Amount = AmounE - EAmount, _
                                    .Remark = CName, _
                                    .Datecreated = strDate, _
                                    .createdby = txtStaffID.Text}

                                madd.ExpensesAccountTables.InsertOnSubmit(SaveExepen)
                                madd.SubmitChanges()

                            ElseIf CountPaymentName > 1 AndAlso AmounE < EAmount Then
                                'more than one payment
                                'Debit expense account
                                Dim SaveExepen As New ExpensesAccountTable With { _
                                   .ExpensesHeadid = expenseHeadId, _
                                   .TranscationDate = txtTransDate.Text, _
                                   .ExpensesName = ItemName, _
                                   .AccountName = "Cash", _
                                   .Accountdetails = EName, _
                                   .Transcationtype = "DR", _
                                   .Amount = EAmount, _
                                   .Remark = CName, _
                                   .Datecreated = strDate, _
                                   .createdby = txtStaffID.Text}

                                madd.ExpensesAccountTables.InsertOnSubmit(SaveExepen)
                                madd.SubmitChanges()

                            End If
                        ElseIf countExpenses > 1 Then
                            'if expenses is more than one items and payment is only one
                            If CountPaymentName = 1 Then
                                'Debit expense account
                                Dim SaveExepen As New ExpensesAccountTable With { _
                                  .ExpensesHeadid = expenseHeadId, _
                                  .TranscationDate = txtTransDate.Text, _
                                  .ExpensesName = ItemName, _
                                  .AccountName = "Cash", _
                                  .Accountdetails = EName, _
                                  .Transcationtype = "DR", _
                                  .Amount = AmounE, _
                                  .Remark = CName, _
                                  .Datecreated = strDate, _
                                  .createdby = txtStaffID.Text}

                                madd.ExpensesAccountTables.InsertOnSubmit(SaveExepen)
                                madd.SubmitChanges()
                            End If
                        End If

                    Next
                    If countExpenses > 1 AndAlso CountPaymentName > 1 Then
                        'if expenses is more than one with multiple payment
                        'if payment is more than one type
                        '**************************
                        Dim ItemPosted As String = ""
                        Dim ItemAmountPosted As Decimal = 0

                        Dim ExpenseItem = From w In madd.RaiseExpensedDetailTables
                                        Where w.RasieHeadid = ExpenseHeaderID
                                        Select w

nextPayment:            For Each y In ExpenseItem
                            Dim EItemName = y.ExpensesDetails
                            Dim ItemAmounE = y.Amount

                            Dim ItemPostedAmount = madd.ExpensesAccountTables.Where(Function(a) a.ExpensesHeadid = expenseHeadId AndAlso CDate(a.TranscationDate) = CDate(txtTransDate.Text) _
                                                                AndAlso a.ExpensesName = EItemName AndAlso a.Amount = ItemAmounE).Any

                            If ItemPostedAmount = True Then
                                GoTo nextPayment
                            ElseIf ItemPostedAmount = False Then
                                Dim checkItemPosted = madd.ExpensesAccountTables.Where(Function(a) a.ExpensesHeadid = expenseHeadId AndAlso CDate(a.TranscationDate) = CDate(txtTransDate.Text) _
                                                                AndAlso a.ExpensesName = EItemName).Any
                                If checkItemPosted = True Then
                                    ItemAmountPosted = madd.ExpensesAccountTables.Where(Function(a) a.ExpensesHeadid = expenseHeadId AndAlso CDate(a.TranscationDate) = CDate(txtTransDate.Text) _
                                                               AndAlso a.ExpensesName = EItemName).SingleOrDefault.Amount

                                    'Debit expense account with ItemAmounE
                                    Dim SaveExepen As New ExpensesAccountTable With { _
                                         .ExpensesHeadid = expenseHeadId, _
                                         .TranscationDate = txtTransDate.Text, _
                                         .ExpensesName = EItemName, _
                                         .AccountName = "Cash", _
                                         .Accountdetails = EName, _
                                         .Transcationtype = "DR", _
                                         .Amount = ItemAmounE - ItemAmountPosted, _
                                         .Remark = CName, _
                                         .Datecreated = strDate, _
                                         .createdby = txtStaffID.Text}

                                    madd.ExpensesAccountTables.InsertOnSubmit(SaveExepen)
                                    madd.SubmitChanges()
                                    'GoTo nextPayment
                                ElseIf checkItemPosted = False Then
                                    'Debit expense account with ItemAmounE
                                    Dim SaveExepen As New ExpensesAccountTable With { _
                                       .ExpensesHeadid = expenseHeadId, _
                                       .TranscationDate = txtTransDate.Text, _
                                       .ExpensesName = EItemName, _
                                       .AccountName = "Cash", _
                                       .Accountdetails = EName, _
                                       .Transcationtype = "DR", _
                                       .Amount = ItemAmounE, _
                                       .Remark = CName, _
                                       .Datecreated = strDate, _
                                       .createdby = txtStaffID.Text}

                                    madd.ExpensesAccountTables.InsertOnSubmit(SaveExepen)
                                    madd.SubmitChanges()

                                End If
                            End If
                        Next
                        '***********************
                    End If
                End If
            Next
            RadDatePicker1.Clear()
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Disburse was made Successfully!');", True)
            Response.Redirect("CashBookView.aspx")
        End If
    End Sub

    Protected Sub GridExp_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridExp.SelectedIndexChanged
        Dim getID = GridExp.SelectedRow.Cells(1).Text

        txtRaisedid.Text = getID

        Dim amountid = madd.RaiseExpensesHdTables.Where(Function(a) a.ID = getID).SingleOrDefault.Amount
        txtAmount.Text = amountid

        txtPaymentVoucher.Text = madd.PaymentVoucherTables.Where(Function(a) a.RaiseExpenseId = getID).SingleOrDefault.Pvid
        ExpSupplier.Text = madd.RaiseExpensesHdTables.Where(Function(a) a.ID = getID).SingleOrDefault.Supplerid

    End Sub

    Protected Sub drpdetails_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpdetails.SelectedIndexChanged
        If drpAccount.SelectedValue = "Expenses" Then

            Dim HeadID = madd.ExpensesHeadTables.Where(Function(a) a.Name = drpdetails.SelectedValue).SingleOrDefault.Expensesid

            txtwelfaresort.Text = HeadID

            GridExp.Visible = True
        End If
    End Sub

    Protected Sub RadDatePicker1_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDatePicker1.SelectedDateChanged
        txtTransDate.Text = RadDatePicker1.SelectedDate

    End Sub
End Class
