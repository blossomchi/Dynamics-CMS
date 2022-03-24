
Partial Class RaiseExpenses
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

            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName
            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID

            DropPayment.Items.Remove("SELECT")
            DropPayment.DataBind()
            DropPayment.Items.Insert(0, New ListItem("SELECT"))
            DropPayment.SelectedIndex = 0


            DrpExpensesDet.DataBind()
            DrpExpensesDet.Items.Insert(0, New ListItem("Select"))
            DrpExpensesDet.SelectedIndex = 0

            drpExpenseHd.DataBind()
            drpExpenseHd.Items.Insert(0, New ListItem("Select"))
            drpExpenseHd.SelectedIndex = 0

            drpPayee.DataBind()
            drpPayee.Items.Insert(0, New ListItem("Select"))
            drpPayee.SelectedIndex = 0




            Dim strDate As Date
            strDate = Now

            txtDate.Text = strDate
        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        Dim strDate As Date
        strDate = Now

        Dim a As New churchmanDataContext

        txtAmount.Text = 0.0
        Dim AAA As Decimal = 0
        Dim ggg As Decimal = 0

        Dim saveexpenses As New RaiseExpensesHdTable With { _
          .ExpenseHead = drpExpenseHd.SelectedValue, _
          .Supplerid = drpPayee.SelectedValue, _
          .Amount = CDec(txtAmount.Text), _
          .Datecreated = strDate, _
          .Createdby = txtStaffID.Text}

        a.RaiseExpensesHdTables.InsertOnSubmit(saveexpenses)
        a.SubmitChanges()



        Dim GetEHID = From d In madd.RaiseExpensesHdTables
                        Select d

        Dim EHID As String = GetEHID.OrderByDescending(Function(i) i.ID).FirstOrDefault.ID

        txtRaiseid.Text = EHID
       

        AAA = madd.RaiseExpensesHdTables.Where(Function(r) r.ID = txtRaiseid.Text).SingleOrDefault.Amount
        LBAmount.Text = Format(Decimal.Round(AAA, 2), "₦#,#.00")

        ggg = madd.RaiseExpensesHdTables.Where(Function(r) r.ID = txtRaiseid.Text).SingleOrDefault.Amount
        txtAmount.Text = Format(Decimal.Round(ggg, 2), "₦#,#.00")





        DrpExpensesDet.Enabled = True
        TxtDescp.Enabled = True
        TxtQuantity.Enabled = True
        txtUnit.Enabled = True
        PnlDesc.Visible = True

        drpExpenseHd.Enabled = False
        drpPayee.Enabled = False


    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim checkPayment = (From p In madd.RaiseExpenPaymentTables
                             Where p.RaiseexpHdid = txtRaiseid.Text AndAlso p.Expenseid = drpExpenseHd.SelectedValue
                             Select p).Any


        If checkPayment = True Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Payment has already been made!!!')", True)
            Exit Sub
        End If
            Dim AAA As Decimal = 0
            Dim ggg As Decimal = 0
            Dim NewAmount = CDec(TxtQuantity.Text) * CDec(txtUnit.Text)




            Dim saveexpenses As New RaiseExpensedDetailTable With { _
                   .RasieHeadid = txtRaiseid.Text, _
                   .ExpensesDetails = DrpExpensesDet.SelectedValue, _
                   .Amount = CDec(TxtQuantity.Text) * CDec(txtUnit.Text), _
                   .Description = TxtDescp.Text, _
                    .Quantity = TxtQuantity.Text, _
                   .UnitPrice = txtUnit.Text}

            madd.RaiseExpensedDetailTables.InsertOnSubmit(saveexpenses)
            madd.SubmitChanges()

            ' UPDATE total amount
            Dim updateHeader = madd.RaiseExpensesHdTables.Where(Function(r) r.ID = txtRaiseid.Text).SingleOrDefault()

            updateHeader.Amount = updateHeader.Amount + NewAmount

            madd.SubmitChanges()


            AAA = madd.RaiseExpensesHdTables.Where(Function(r) r.ID = txtRaiseid.Text).SingleOrDefault.Amount
            LBAmount.Text = Format(Decimal.Round(AAA, 2), "₦#,#.00")


            ggg = madd.RaiseExpensesHdTables.Where(Function(r) r.ID = txtRaiseid.Text).SingleOrDefault.Amount
            txtAmount.Text = Format(Decimal.Round(ggg, 2), "₦#,#.00")

            GridDesc.DataBind()
            GridDesc.Visible = True

            Button2.Visible = True

            DrpExpensesDet.DataBind()
            DrpExpensesDet.Items.Insert(0, New ListItem("Select"))
            DrpExpensesDet.SelectedIndex = 0

            TxtDescp.Text = ""
            TxtQuantity.Text = ""
            txtUnit.Text = ""

       

        '88888888888888888888888888888888
       


     
       
      
     


    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Dim a As New churchmanDataContext
        Dim strDate As Date
        strDate = Now

        Dim Total As Decimal = 0
        Dim Amount As Decimal = 0
        Dim subt As String = 0
        Dim AllAmount As Decimal = 0
        Dim holdsub As Decimal = 0



        Total = CDec(Right(GrandTotal.Text, Len(GrandTotal.Text) - 1))
        Amount = CDec(txtGrandAmount.Text)
      

        Dim checkPayment = (From p In madd.RaiseExpenPaymentTables
                              Where p.RaiseexpHdid = txtRaiseid.Text AndAlso p.Expenseid = drpExpenseHd.SelectedValue
                              Select p).Any

        If checkPayment Then

            AllAmount = (madd.RaiseExpenPaymentTables.Where(Function(d) d.RaiseexpHdid = txtRaiseid.Text _
                                                            AndAlso d.Expenseid = drpExpenseHd.SelectedValue)).Sum(Function(f) f.Amount)



        End If


        If Amount > Total Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please what you enter can not be greater than what you paid for!!!')", True)
            Exit Sub
        End If

        If Amount = 0 Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Invalid Payment!!!')", True)
            Exit Sub
        End If

        If DropPayment.SelectedValue = "Cash" Then
            If Amount = Total Then
                Dim savepayment As New RaiseExpenPaymentTable With { _
                          .Expenseid = drpExpenseHd.SelectedValue, _
                          .RaiseexpHdid = txtRaiseid.Text, _
                          .PaymentMethodid = txtcashM.Text, _
                          .Amount = txtGrandAmount.Text, _
                          .AmountW = divDisplayWords.Text, _
                          .Datecreated = strDate}
                a.RaiseExpenPaymentTables.InsertOnSubmit(savepayment)
                a.SubmitChanges()
                holdsub = (Total - Amount)
                subt = Format(Decimal.Round(holdsub, 2), "₦#,#.00")

                GrandTotal.Text = subt
                'Save Voucher
                Randomize()
                Dim p1, p2, p3, p4, p5 As Integer
                Dim value As String

                p1 = CInt(Int((9 * Rnd()) + 1)) : p2 = CInt(Int((9 * Rnd()) + 1)) : p3 = CInt(Int((9 * Rnd()) + 1))
                p4 = CInt(Int((9 * Rnd()) + 1)) : p5 = CInt(Int((9 * Rnd()) + 1))
                value = p1 & p2 & p3 & p4 & p5

                txtVocher.Text = value


                Dim savePaymentvoucher As New PaymentVoucherTable With { _
              .Pvid = txtVocher.Text, _
              .ExpensesHeadiD = drpExpenseHd.SelectedValue, _
              .RaiseExpenseId = txtRaiseid.Text, _
              .Createdby = txtStaffID.Text, _
              .Datecreated = strDate}

                a.PaymentVoucherTables.InsertOnSubmit(savePaymentvoucher)
                a.SubmitChanges()


                Dim getraiseid = (From s In madd.RaiseExpensesHdTables
                                     Where s.ID = txtRaiseid.Text
                                     Select s).SingleOrDefault.ID

                Dim getexpenseid = (From s In madd.ExpensesHeadTables
                                       Where s.Expensesid = drpExpenseHd.SelectedValue
                                       Select s).SingleOrDefault.Expensesid




                txtVocherid1.Text = getraiseid

                txtVocherid2.Text = getexpenseid

                Session("Expenseid") = txtVocherid2.Text

                Session("raisedid") = txtVocherid1.Text

                txtGrandAmount.Text = ""
                divDisplayWords.Text = ""



                printReciept()

            ElseIf Amount <> Total Then
                Dim savepayment As New RaiseExpenPaymentTable With { _
                         .Expenseid = drpExpenseHd.SelectedValue, _
                         .RaiseexpHdid = txtRaiseid.Text, _
                         .PaymentMethodid = txtcashM.Text, _
                         .Amount = txtGrandAmount.Text, _
                         .AmountW = divDisplayWords.Text, _
                         .Datecreated = strDate}
                a.RaiseExpenPaymentTables.InsertOnSubmit(savepayment)
                a.SubmitChanges()

                holdsub = (Total - Amount)
                subt = Format(Decimal.Round(holdsub, 2), "₦#,#.00")
                GrandTotal.Text = subt

                txtGrandAmount.Text = ""
                divDisplayWords.Text = ""
            End If

        ElseIf DropPayment.SelectedValue = "Credit" Then
            If Amount = Total Then
                Dim savepayment As New RaiseExpenPaymentTable With { _
                          .Expenseid = drpExpenseHd.SelectedValue, _
                          .RaiseexpHdid = txtRaiseid.Text, _
                          .PaymentMethodid = txtcashM.Text, _
                          .Amount = txtGrandAmount.Text, _
                          .AmountW = divDisplayWords.Text, _
                          .Datecreated = strDate}
                a.RaiseExpenPaymentTables.InsertOnSubmit(savepayment)
                a.SubmitChanges()
                holdsub = (Total - Amount)
                subt = Format(Decimal.Round(holdsub, 2), "₦#,#.00")

                GrandTotal.Text = subt
                'Save Voucher
                Randomize()
                Dim p1, p2, p3, p4, p5 As Integer
                Dim value As String

                p1 = CInt(Int((9 * Rnd()) + 1)) : p2 = CInt(Int((9 * Rnd()) + 1)) : p3 = CInt(Int((9 * Rnd()) + 1))
                p4 = CInt(Int((9 * Rnd()) + 1)) : p5 = CInt(Int((9 * Rnd()) + 1))
                value = p1 & p2 & p3 & p4 & p5

                txtVocher.Text = value


                Dim savePaymentvoucher As New PaymentVoucherTable With { _
              .Pvid = txtVocher.Text, _
              .ExpensesHeadiD = drpExpenseHd.SelectedValue, _
              .RaiseExpenseId = txtRaiseid.Text, _
              .Createdby = txtStaffID.Text, _
              .Datecreated = strDate}

                a.PaymentVoucherTables.InsertOnSubmit(savePaymentvoucher)
                a.SubmitChanges()


                Dim getraiseid = (From s In madd.RaiseExpensesHdTables
                                     Where s.ID = txtRaiseid.Text
                                     Select s).SingleOrDefault.ID

                Dim getexpenseid = (From s In madd.ExpensesHeadTables
                                       Where s.Expensesid = drpExpenseHd.SelectedValue
                                       Select s).SingleOrDefault.Expensesid




                txtVocherid1.Text = getraiseid

                txtVocherid2.Text = getexpenseid

                Session("Expenseid") = txtVocherid2.Text

                Session("raisedid") = txtVocherid1.Text

                AcountPosting()


                txtGrandAmount.Text = ""
                divDisplayWords.Text = ""



                printReciept()

            ElseIf Amount <> Total Then
                Dim savepayment As New RaiseExpenPaymentTable With { _
                         .Expenseid = drpExpenseHd.SelectedValue, _
                         .RaiseexpHdid = txtRaiseid.Text, _
                         .PaymentMethodid = txtcashM.Text, _
                         .Amount = txtGrandAmount.Text, _
                         .AmountW = divDisplayWords.Text, _
                         .Datecreated = strDate}
                a.RaiseExpenPaymentTables.InsertOnSubmit(savepayment)
                a.SubmitChanges()

                holdsub = (Total - Amount)
                subt = Format(Decimal.Round(holdsub, 2), "₦#,#.00")
                GrandTotal.Text = subt

                txtGrandAmount.Text = ""
                divDisplayWords.Text = ""
            End If

        ElseIf DropPayment.SelectedValue = "Cheque" Then
            If Amount = Total Then
                Dim savepayment As New RaiseExpenPaymentTable With { _
                             .Expenseid = drpExpenseHd.SelectedValue, _
                             .RaiseexpHdid = txtRaiseid.Text, _
                             .PaymentMethodid = txtcashM.Text, _
                              .AmountW = divDisplayWords.Text, _
                             .Amount = txtGrandAmount.Text, _
                             .Datecreated = strDate}
                a.RaiseExpenPaymentTables.InsertOnSubmit(savepayment)
                a.SubmitChanges()

                Dim saveBank As New RaiseBankPaymentTable With { _
                .RaiseExpenHdid = txtRaiseid.Text, _
                .Paymentid = txtcashM.Text, _
                .Bankid = DrpBanks.SelectedValue, _
                .ChequeNo = txtchequeno.Text, _
                .Dateissu = txtDatepay.Text, _
                .Datecreated = strDate}
                a.RaiseBankPaymentTables.InsertOnSubmit(saveBank)
                a.SubmitChanges()

                holdsub = (Total - Amount)
                subt = Format(Decimal.Round(holdsub, 2), "₦#,#.00")

                GrandTotal.Text = subt
                'Save Voucher
                Randomize()
                Dim p1, p2, p3, p4, p5 As Integer
                Dim value As String

                p1 = CInt(Int((9 * Rnd()) + 1)) : p2 = CInt(Int((9 * Rnd()) + 1)) : p3 = CInt(Int((9 * Rnd()) + 1))
                p4 = CInt(Int((9 * Rnd()) + 1)) : p5 = CInt(Int((9 * Rnd()) + 1))
                value = p1 & p2 & p3 & p4 & p5

                txtVocher.Text = value


                Dim savePaymentvoucher As New PaymentVoucherTable With { _
              .Pvid = txtVocher.Text, _
              .ExpensesHeadiD = drpExpenseHd.SelectedValue, _
              .RaiseExpenseId = txtRaiseid.Text, _
              .Createdby = txtStaffID.Text, _
              .Datecreated = strDate}

                a.PaymentVoucherTables.InsertOnSubmit(savePaymentvoucher)
                a.SubmitChanges()


                Dim getraiseid = (From s In madd.RaiseExpensesHdTables
                                     Where s.ID = txtRaiseid.Text
                                     Select s).SingleOrDefault.ID

                Dim getexpenseid = (From s In madd.ExpensesHeadTables
                                       Where s.Expensesid = drpExpenseHd.SelectedValue
                                       Select s).SingleOrDefault.Expensesid




                txtVocherid1.Text = getraiseid

                txtVocherid2.Text = getexpenseid

                Session("Expenseid") = txtVocherid2.Text

                Session("raisedid") = txtVocherid1.Text



                txtGrandAmount.Text = ""
                divDisplayWords.Text = ""

                printReciept()

            ElseIf Amount <> Total Then
                Dim savepayment As New RaiseExpenPaymentTable With { _
                          .Expenseid = drpExpenseHd.SelectedValue, _
                          .RaiseexpHdid = txtRaiseid.Text, _
                          .PaymentMethodid = txtcashM.Text, _
                           .AmountW = divDisplayWords.Text, _
                          .Amount = txtGrandAmount.Text, _
                          .Datecreated = strDate}
                a.RaiseExpenPaymentTables.InsertOnSubmit(savepayment)
                a.SubmitChanges()


                Dim saveBank As New RaiseBankPaymentTable With { _
                                .RaiseExpenHdid = txtRaiseid.Text, _
                                .Paymentid = txtcashM.Text, _
                                .Bankid = DrpBanks.SelectedValue, _
                                .ChequeNo = txtchequeno.Text, _
                                .Dateissu = txtDatepay.Text, _
                                .Datecreated = strDate}
                a.RaiseBankPaymentTables.InsertOnSubmit(saveBank)
                a.SubmitChanges()

                holdsub = (Total - Amount)
                subt = Format(Decimal.Round(holdsub, 2), "₦#,#.00")
                GrandTotal.Text = subt
            End If

        End If




    End Sub
    Public Sub printReciept()
        Dim url As String = "PaymentVoucher.aspx"

        Dim s As String = "window.open('" & url + "', 'popup_window', 'width=1000,height=1000,left=100,top=100,resizable=yes,scrollbars=1');"
        ClientScript.RegisterStartupScript(Me.GetType(), "script", s, True)

    End Sub
    Public Sub AcountPosting()
        'Accounts(POSTINGS)
        '=======================================================================================================================================

        Dim PaymentAmount As Decimal = 0


        Dim getPaymentPerID = From g In madd.RaiseExpenPaymentTables
                                Where g.Expenseid = txtVocherid2.Text AndAlso g.RaiseexpHdid = txtVocherid1.Text
                                Group New With {g} By _
                                g.PaymentMethodid, _
                                g.Expenseid, _
                                g.Datecreated
                                Into gr = Group
                                Select New With { _
                                    .ExpensesID = gr.FirstOrDefault.g.Expenseid, _
                                    .PaymentMethodTypeID = gr.FirstOrDefault.g.PaymentMethodid, _
                                    .AmountPaid = gr.Sum(Function(s) s.g.Amount), _
                                    .DateCreated = gr.FirstOrDefault.g.Datecreated}

        Dim supplier = madd.SupplierTables.Where(Function(d) d.Supplerid = drpPayee.SelectedValue).SingleOrDefault.CompanyName
        Dim HeadName = madd.ExpensesHeadTables.Where(Function(d) d.Expensesid = drpExpenseHd.SelectedValue).SingleOrDefault.Name

        Dim CName = supplier
        Dim itemName As String = ""
        For Each d In getPaymentPerID
            Dim methodTypeID = d.PaymentMethodTypeID
            Dim pName = madd.PaymentMethodTables.Where(Function(i) i.Id = methodTypeID).FirstOrDefault.PaymentName


            Select Case pName

                Case "CASH"

                Case "CHEQUE"

                Case "CREDIT"
                    Dim getNames = From y In madd.RaiseExpensedDetailTables
                                   Where y.RasieHeadid = txtVocherid1.Text
                                   Select New With {
                                       y.ExpensesDetails, _
                                       y.Amount}


                    For Each cc In getNames
                        Dim expenseName = cc.ExpensesDetails
                        Dim Amount = cc.Amount
                        Call postExpensesEntry(Now, expenseName, "Account Payables", CName, "DR", Amount, "")

                        Call postVendorEntry(Now, "Expenses", HeadName, expenseName, "CR", Amount, "")
                        ' itemName += expenseName & ","
                    Next cc



                Case "ELECTRONIC TRANSFER"

            End Select


        Next
    End Sub
    Public Sub postExpensesEntry(tDate As String, expenseName As String, Acc As String, AccDetail As String, tType As String, Amt As Decimal, Rmk As String)

        Dim CashAccPosting As New ExpensesAccountTable With { _
            .TranscationDate = tDate, _
            .ExpensesHeadid = drpExpenseHd.SelectedValue, _
            .ExpensesName = expenseName, _
            .AccountName = Acc, _
            .Accountdetails = AccDetail, _
            .Transcationtype = tType, _
            .Amount = Amt, _
            .Remark = Rmk, _
            .Datecreated = Now, _
            .createdby = txtStaffID.Text}

        madd.ExpensesAccountTables.InsertOnSubmit(CashAccPosting)
        madd.SubmitChanges()




    End Sub
    Public Sub postVendorEntry(TDate As String, Acc As String, AccDetail As String, AccDetail2 As String, tType As String, Amt As Decimal, Rmk As String)

        Dim CashAccPosting As New AccountPayableTable With { _
            .Supplierid = drpPayee.SelectedValue, _
            .TranscationDate = TDate, _
            .AccountName = Acc, _
            .Accountdetails = AccDetail, _
            .Transcationtype = tType, _
            .Amount = Amt, _
            .Remark = Rmk, _
            .Datecreated = Now, _
            .createdby = txtStaffID.Text}
        madd.AccountPayableTables.InsertOnSubmit(CashAccPosting)
        madd.SubmitChanges()

    End Sub
    Protected Sub DropPayment_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropPayment.SelectedIndexChanged
        If DropPayment.SelectedValue = "Select" Then
            'do nothing


            Label26.Visible = False
            txtDatepay.Visible = False

            Label20.Visible = False
            txtGrandAmount.Visible = False

            txtGrandAmount.Text = ""

            txtAccountName.Visible = False
            Label22.Visible = False

            Label23.Visible = False
            txtTellno.Visible = False

            Label25.Visible = False
            DrpBanks.Visible = False

            Label26.Visible = False
            txtDatepay.Visible = False

            Label29.Visible = False
            TtxcardNo.Visible = False

            Label7.Visible = False
            txtExpire.Visible = False

            Label30.Visible = False
            txtExpire.Visible = False

            'False value 
            Label24.Visible = False
            txtchequeno.Visible = False
        ElseIf DropPayment.SelectedValue = "Credit" Then
            Dim getid = (From s In madd.PaymentMethodTables
                       Where s.PaymentName = DropPayment.SelectedValue
                       Select s).SingleOrDefault.Id

            txtcashM.Text = getid


            Label26.Visible = False
            txtDatepay.Visible = False

            Label20.Visible = True
            txtGrandAmount.Visible = True

            txtAccountName.Visible = False
            Label22.Visible = False

            Label23.Visible = False
            txtTellno.Visible = False

            Label25.Visible = False
            DrpBanks.Visible = False

            Label26.Visible = False
            txtDatepay.Visible = False

            Label29.Visible = False
            TtxcardNo.Visible = False

            Label7.Visible = False
            txtExpire.Visible = False

            Label30.Visible = False
            txtExpire.Visible = False

            txtGrandAmount.Text = ""
            divDisplayWords.Text = ""
            'False value 
            Label24.Visible = False
            txtchequeno.Visible = False

        ElseIf DropPayment.SelectedValue = "Cash" Then

            Dim getid = (From s In madd.PaymentMethodTables
                        Where s.PaymentName = DropPayment.SelectedValue
                        Select s).SingleOrDefault.Id

            txtcashM.Text = getid


            txtGrandAmount.Text = ""
            divDisplayWords.Text = ""
            Label26.Visible = False
            txtDatepay.Visible = False

            Label20.Visible = True
            txtGrandAmount.Visible = True

            txtAccountName.Visible = False
            Label22.Visible = False

            Label23.Visible = False
            txtTellno.Visible = False

            Label25.Visible = False
            DrpBanks.Visible = False

            Label26.Visible = False
            txtDatepay.Visible = False

            Label29.Visible = False
            TtxcardNo.Visible = False

            Label7.Visible = False
            txtExpire.Visible = False

            Label30.Visible = False
            txtExpire.Visible = False

            'False value 
            Label24.Visible = False
            txtchequeno.Visible = False


        ElseIf DropPayment.SelectedValue = "Cheque" Then

            Dim getid = (From s In madd.PaymentMethodTables
                                   Where s.PaymentName = DropPayment.SelectedValue
                                   Select s).SingleOrDefault.Id

            txtcashM.Text = getid


            txtGrandAmount.Text = ""
            divDisplayWords.Text = ""
            Label26.Visible = False
            txtDatepay.Visible = False

            Label20.Visible = True
            txtGrandAmount.Visible = True

            txtAccountName.Visible = False
            Label22.Visible = False

            Label23.Visible = False
            txtTellno.Visible = False

            Label25.Visible = True
            DrpBanks.Visible = True

            Label26.Visible = True
            txtDatepay.Visible = True

            Label29.Visible = False
            TtxcardNo.Visible = False

            Label7.Visible = False
            txtExpire.Visible = False

            Label30.Visible = False
            txtExpire.Visible = False

            'False value 
            Label24.Visible = True
            txtchequeno.Visible = True


        End If
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("RaiseExpView.aspx")
    End Sub


    Protected Sub drpExpenseHd_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpExpenseHd.SelectedIndexChanged
        If drpExpenseHd.SelectedValue = "Select" Then
            Exit Sub
            DrpExpensesDet.DataBind()
            DrpExpensesDet.Items.Insert(0, New ListItem("Select"))
            DrpExpensesDet.SelectedIndex = 0
        ElseIf drpExpenseHd.SelectedValue <> "Select" Then


            Dim getid = (From s In madd.ExpensesHeadTables
                       Where s.Expensesid = drpExpenseHd.SelectedValue
                       Select s).SingleOrDefault.Expensesid

            txtwelfaresort.Text = getid

            DrpExpensesDet.DataBind()
            DrpExpensesDet.Items.Insert(0, New ListItem("Select"))
            DrpExpensesDet.SelectedIndex = 0
        End If

        Dim getname = (From s In madd.ExpensesHeadTables
                     Where s.Expensesid = drpExpenseHd.SelectedValue
                     Select s).SingleOrDefault.Name

        lblExpHead.Text = getname


    End Sub

    Protected Sub drpPayee_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpPayee.SelectedIndexChanged

        Dim getsname = (From s In madd.SupplierTables
             Where s.Supplerid = drpPayee.SelectedValue
             Select s).SingleOrDefault.CompanyName

        Label13.Text = getsname

    End Sub

    Protected Sub DrpExpensesDet_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpExpensesDet.SelectedIndexChanged

        If DrpExpensesDet.SelectedValue = "Select" Then
            Exit Sub

        End If

        Dim getsname = (From s In madd.ExpensesdetailsTables
                   Where s.Name = DrpExpensesDet.SelectedValue
                   Select s).SingleOrDefault.Description

        TxtDescp.Text = getsname

        Dim newid = (From s In madd.ExpensesdetailsTables
                      Where s.Name = DrpExpensesDet.SelectedValue
                      Select s).SingleOrDefault.ID

        txtsort.Text = newid

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select a payment method!!!')", True)

        GridDesc.Visible = True
        PnlMain.Visible = False
        PnlSub.Visible = True
        PnlSubdes.Visible = True

        Dim r As Decimal = 0
        Dim getAmountPaid As Decimal = 0
        Dim fullTotal As Decimal = 0
        Dim reMain As Decimal = 0

        Dim checkPayment = (From p In madd.RaiseExpenPaymentTables
                         Where p.RaiseexpHdid = txtRaiseid.Text AndAlso p.Expenseid = drpExpenseHd.SelectedValue
                         Select p).Any

        If checkPayment Then
            For Each s1 In (From y In madd.RaiseExpenPaymentTables
                              Where (y.Expenseid = txtRaiseid.Text)
                                   Select y)
                getAmountPaid += s1.Amount
            Next
            r = CDec(Right(txtAmount.Text, Len(txtAmount.Text) - 1))
            lbSummary.Text = Format(Decimal.Round(r, 2), "₦#,#.00")
            fullTotal = r
            reMain = fullTotal - getAmountPaid

            GrandTotal.Text = reMain.ToString("₦#,#.00")

            GrandTotal.ToolTip = "Remaining Balance."
        Else
            r = CDec(Right(txtAmount.Text, Len(txtAmount.Text) - 1))
            lbSummary.Text = Format(Decimal.Round(r, 2), "₦#,#.00")

            GrandTotal.Text = Format(Decimal.Round(r, 2), "₦#,#.00")
            GrandTotal.ToolTip = "Total Balance to be paid."
        End If

    End Sub

    Protected Sub btnReset_Click(sender As Object, e As EventArgs) Handles btnReset.Click
        Dim message As String = "Reset Successfully!"
        Dim url As String = "RaiseExpenses.aspx" ' The page tobe refreshed here!
        Dim script As String = "window.onload = function(){ alert('"
        script += message
        script += "');"
        script += "window.location = '"
        script += url
        script += "'; }"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)

    End Sub
End Class
