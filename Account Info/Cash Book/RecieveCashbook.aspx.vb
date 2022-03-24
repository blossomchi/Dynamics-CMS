
Partial Class RecieveCashbook
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

            RadDatePicker1.Clear()

            drpCash.DataBind()
            drpCash.Items.Insert(0, New ListItem("Select"))
            drpCash.SelectedIndex = 0

            drpBank.DataBind()
            drpBank.Items.Insert(0, New ListItem("Select"))
            drpBank.SelectedIndex = 0


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

     


            Label5.Text = "Account Recievable"

            Dim qryTitle = madd.MembershipTables.Select(Function(f) f.LastName & " " & f.FirstName).Distinct

            drpdetails.DataSource = qryTitle
            drpdetails.DataBind()
            drpdetails.Items.Insert(0, New ListItem("Select"))
            drpdetails.SelectedIndex = 0



        ElseIf drpAccount.SelectedValue = "Bank" Then


       

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

            Label5.Text = "Expenses"

            Dim qryTitle = madd.ExpensesHeadTables.Select(Function(f) f.Name).Distinct

            drpdetails.DataSource = qryTitle
            drpdetails.DataBind()
            drpdetails.Items.Insert(0, New ListItem("Select"))
            drpdetails.SelectedIndex = 0

            'Dim Expensesdetails = madd.ExpensesHeadTables.Where(Function(p) p.Expensesid = drpdetails.SelectedValue).SingleOrDefault.Expensesid

           



        ElseIf drpAccount.SelectedValue = "Other Income" Then
            
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
        If drpAccount.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select an account name!');", True)
            Exit Sub
        End If

        If drpCash.SelectedValue = "SELECT" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select either cash or bank!');", True)
            Exit Sub
        End If

        If txtTrandate.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, enter transaction date!');", True)
            Exit Sub
        End If
        If txtAmount.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, enter amount!');", True)
            Exit Sub
        End If






        Dim strDate As Date
        strDate = Now
        If drpAccount.SelectedValue = "Select" Then

            Label5.Text = "Account Details"

            drpdetails.DataBind()
            drpdetails.Items.Insert(0, New ListItem("Select"))
            drpdetails.SelectedIndex = 0

        ElseIf drpAccount.SelectedValue = "Bank" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No Code yet!');", True)
            Exit Sub
        ElseIf drpAccount.SelectedValue = "Loan" Then

            Dim LoanID = madd.LoanHeadTables.Where(Function(p) p.Name = drpdetails.SelectedValue).SingleOrDefault.Loanid


            Dim saveLoan As New LoanAccountTable With { _
               .LoanID = LoanID, _
               .TranscationDate = txtTrandate.Text, _
               .AccountName = "Cash", _
               .Accountdetails = "Cash", _
               .Amount = txtAmount.Text, _
               .Transcationtype = "CR", _
               .Remark = txtDescription.Text, _
                .Datecreated = strDate, _
                .createdby = txtStaffID.Text}
            madd.LoanAccountTables.InsertOnSubmit(saveLoan)
            madd.SubmitChanges()

            If drpCash.SelectedValue = "Cash" Then
                'Debit cash account
                Dim SavePurchase As New Cash_BookTable With { _
                                               .Cash_Bank = drpCash.SelectedValue, _
                                               .Transactiondate = txtTrandate.Text, _
                                               .AccountName = "Loan", _
                                               .Accountdetails = drpdetails.SelectedValue, _
                                               .Accountdetails1 = drpCash.SelectedValue, _
                                               .TransactionType = drpAssets.SelectedValue, _
                                               .Amount = txtAmount.Text, _
                                               .Remark = txtDescription.Text, _
                                               .Staffid = txtStaffID.Text, _
                                                .Datecreated = strDate}
                madd.Cash_BookTables.InsertOnSubmit(SavePurchase)
                madd.SubmitChanges()
            ElseIf drpCash.SelectedValue = "Bank" Then
                'Debit cash account
                Dim SavePurchase As New Cash_BookTable With { _
                                               .Cash_Bank = drpCash.SelectedValue, _
                                               .Transactiondate = txtTrandate.Text, _
                                               .AccountName = "Loan", _
                                               .Accountdetails = drpdetails.SelectedValue, _
                                               .Accountdetails1 = drpCash.SelectedValue, _
                                               .TransactionType = drpAssets.SelectedValue, _
                                               .Amount = txtAmount.Text, _
                                               .Remark = txtDescription.Text, _
                                               .Staffid = txtStaffID.Text, _
                                                .Datecreated = strDate}
                madd.Cash_BookTables.InsertOnSubmit(SavePurchase)
                madd.SubmitChanges()
            End If


            Dim message As String = "Load Recieve Successfully!"
            Dim url As String = "CashBookView.aspx" ' The page tobe refreshed here!
            Dim script As String = "window.onload = function(){ alert('"
            script += message
            script += "');"
            script += "window.location = '"
            script += url
            script += "'; }"
            ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)

           

        ElseIf drpAccount.SelectedValue = "Expenses" Then
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


            Dim ExpenseName = "CHANGES ON PV:" & " " & txtPaymentVoucher.Text

            'Credit expense account
            Dim SaveExepen As New ExpensesAccountTable With { _
                            .ExpensesHeadid = expenseHeadId, _
                            .TranscationDate = txtTrandate.Text, _
                            .ExpensesName = ExpenseName, _
                            .AccountName = "Cash", _
                            .Accountdetails = drpdetails.SelectedValue, _
                            .Transcationtype = "CR", _
                            .Amount = txtAmount.Text, _
                            .Remark = txtDescription.Text, _
                            .Datecreated = strDate, _
                            .createdby = txtStaffID.Text}

            madd.ExpensesAccountTables.InsertOnSubmit(SaveExepen)
            madd.SubmitChanges()

            If drpCash.SelectedValue = "Cash" Then
                'Debit cash account
                Dim SavePurchase As New Cash_BookTable With { _
                                                  .Cash_Bank = drpCash.SelectedValue, _
                                                  .Transactiondate = txtTrandate.Text, _
                                                  .AccountName = "Expenses", _
                                                  .Accountdetails = drpdetails.SelectedValue, _
                                                  .Accountdetails1 = drpCash.SelectedValue, _
                                                  .TransactionType = drpAssets.SelectedValue, _
                                                  .Amount = txtAmount.Text, _
                                                  .Remark = txtDescription.Text, _
                                                  .Staffid = txtStaffID.Text, _
                                                   .Datecreated = strDate}
                madd.Cash_BookTables.InsertOnSubmit(SavePurchase)
                madd.SubmitChanges()

            ElseIf drpCash.SelectedValue = "Bank" Then
                'Debit cash account
                Dim SavePurchase As New Cash_BookTable With { _
                                                .Cash_Bank = drpCash.SelectedValue, _
                                                .Transactiondate = txtTrandate.Text, _
                                                .AccountName = "Expenses", _
                                                .Accountdetails = drpdetails.SelectedValue, _
                                                .Accountdetails1 = drpCash.SelectedValue, _
                                                .TransactionType = drpAssets.SelectedValue, _
                                                .Amount = txtAmount.Text, _
                                                .Remark = txtDescription.Text, _
                                                .Staffid = txtStaffID.Text, _
                                                 .Datecreated = strDate}
                madd.Cash_BookTables.InsertOnSubmit(SavePurchase)
                madd.SubmitChanges()

            End If

                Dim message As String = "Expenses Recieve Successfully!"
                Dim url As String = "CashBookView.aspx" ' The page tobe refreshed here!
                Dim script As String = "window.onload = function(){ alert('"
                script += message
                script += "');"
                script += "window.location = '"
                script += url
                script += "'; }"
                ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)
          
            RadDatePicker1.Clear()
        End If
    End Sub

    Protected Sub drpdetails_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpdetails.SelectedIndexChanged

        If drpAccount.SelectedValue = "Expenses" Then

            Dim HeadID = madd.ExpensesHeadTables.Where(Function(a) a.Name = drpdetails.SelectedValue).SingleOrDefault.Expensesid

            txtwelfaresort.Text = HeadID

            GridExp.Visible = True
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

    Protected Sub RadDatePicker1_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles RadDatePicker1.SelectedDateChanged
        txtTrandate.Text = RadDatePicker1.SelectedDate

    End Sub
End Class
