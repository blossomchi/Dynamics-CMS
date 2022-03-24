﻿
Partial Class Pledges
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
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


            Dim currentYear = DateTime.Now.Year.ToString()
            txtYear.Text = currentYear


            DrpCurrency.DataBind()
            DrpCurrency.Items.Insert(0, New ListItem("Select"))
            DrpCurrency.SelectedIndex = 0


            drpGiving.DataBind()
            drpGiving.Items.Insert(0, New ListItem("Select"))
            drpGiving.SelectedIndex = 0

            DrpBanks.DataBind()
            DrpBanks.Items.Insert(0, New ListItem("Select"))
            DrpBanks.SelectedIndex = 0

            DropPayment.DataBind()
            DropPayment.Items.Insert(0, New ListItem("Select"))
            DropPayment.SelectedIndex = 0

            drpProject.DataBind()
            drpProject.Items.Insert(0, New ListItem("Select"))
            drpProject.SelectedIndex = 0

            drpFrequency.DataBind()
            drpFrequency.Items.Insert(0, New ListItem("Select"))
            drpFrequency.SelectedIndex = 0

            DrpMember.DataBind()
            DrpMember.Items.Insert(0, New ListItem("Select"))
            DrpMember.SelectedIndex = 0

        End If
    End Sub
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

    Protected Sub DropPayment_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropPayment.SelectedIndexChanged
        If DropPayment.SelectedValue = "Select" Then
            'do nothing


            Label18.Visible = False
            txtDatepay.Visible = False

            Label17.Visible = False
            Text1.Visible = False

            Text1.Text = ""

            Label19.Visible = False
            txtAccountName.Visible = False

            Label14.Visible = False
            txtTellno.Visible = False

            Label16.Visible = False
            DrpBanks.Visible = False

            Label18.Visible = False
            txtDatepay.Visible = False

            Label17.Visible = False
            Text1.Visible = False

            Label5.Visible = False
            TtxcardNo.Visible = False

            Label7.Visible = False
            txtExpire.Visible = False


            txtSecoundValue.Visible = False
            Label13.Visible = False

            Label3.Visible = False
            DrpCurrency.Visible = False
            btnConvert.Visible = False
            'False value 
            Label15.Visible = False
            txtchequeno.Visible = False

        ElseIf DropPayment.SelectedValue = "Cash" Then

            Dim getid = (From s In madd.PaymentMethodTables
                        Where s.PaymentName = DropPayment.SelectedValue
                        Select s).SingleOrDefault.Id

            txtcashM.Text = getid

            Label17.Visible = True
            Text1.Visible = True

            Label18.Visible = True
            txtDatepay.Visible = True



            txtSecoundValue.Visible = True
            Label13.Visible = True

            Label3.Visible = True
            DrpCurrency.Visible = True

            btnConvert.Visible = True

            txtchequeno.Visible = False
            Label15.Visible = False

            Label5.Visible = False
            TtxcardNo.Visible = False

            Label7.Visible = False
            txtExpire.Visible = False

            Label14.Visible = False
            txtTellno.Visible = False

            Label16.Visible = False
            DrpBanks.Visible = False

            Dim strDate As Date
            strDate = Now

            txtDatepay.Text = strDate

        ElseIf DropPayment.SelectedValue = "Cheque" Then

            Dim getid = (From s In madd.PaymentMethodTables
                                   Where s.PaymentName = DropPayment.SelectedValue
                                   Select s).SingleOrDefault.Id

            txtcashM.Text = getid


            Label18.Visible = True
            txtDatepay.Visible = True

            txtchequeno.Visible = True
            Label15.Visible = True

            Label16.Visible = True
            DrpBanks.Visible = True

            Label17.Visible = True
            Text1.Visible = True

            btnConvert.Visible = False
            txtSecoundValue.Visible = False
            Label13.Visible = False

            Label3.Visible = False
            DrpCurrency.Visible = False


            Label5.Visible = False
            TtxcardNo.Visible = False

            Label7.Visible = False
            txtExpire.Visible = False

            Label14.Visible = False
            txtTellno.Visible = False
        ElseIf DropPayment.SelectedValue = "Card" Then


            Dim getid = (From s In madd.PaymentMethodTables
                                Where s.PaymentName = DropPayment.SelectedValue
                                Select s).SingleOrDefault.Id

            txtcashM.Text = getid

            Label16.Visible = True
            DrpBanks.Visible = True

            Label17.Visible = True
            Text1.Visible = True

            Label5.Visible = True
            TtxcardNo.Visible = True

            Label7.Visible = True
            txtExpire.Visible = True
            btnConvert.Visible = False
            Label18.Visible = True
            txtDatepay.Visible = True

            Label19.Visible = True
            txtAccountName.Visible = True



            txtSecoundValue.Visible = False
            Label13.Visible = False

            Label3.Visible = False
            DrpCurrency.Visible = False

            txtchequeno.Visible = False
            Label15.Visible = False

            Label14.Visible = False
            txtTellno.Visible = False

            Label15.Visible = False
            txtchequeno.Visible = False

        ElseIf DropPayment.SelectedValue = "Electronic Transfer" Then


            Dim getid = (From s In madd.PaymentMethodTables
                                Where s.PaymentName = DropPayment.SelectedValue
                                Select s).SingleOrDefault.Id

            txtcashM.Text = getid

            Label16.Visible = True
            DrpBanks.Visible = True

            Label18.Visible = True
            txtDatepay.Visible = True

            Label17.Visible = True
            Text1.Visible = True

            Label19.Visible = True
            txtAccountName.Visible = True

            txtSecoundValue.Visible = False
            Label13.Visible = False

            Label3.Visible = False
            DrpCurrency.Visible = False

            txtchequeno.Visible = False
            Label15.Visible = False
            btnConvert.Visible = False
            Label5.Visible = False
            TtxcardNo.Visible = False

            Label7.Visible = False
            txtExpire.Visible = False

            Label14.Visible = False
            txtTellno.Visible = False


        ElseIf DropPayment.SelectedValue = "Bank Payment" Then


            Dim getid = (From s In madd.PaymentMethodTables
                                Where s.PaymentName = DropPayment.SelectedValue
                                Select s).SingleOrDefault.Id

            txtcashM.Text = getid

            Label14.Visible = True
            txtTellno.Visible = True

            Label18.Visible = True
            txtDatepay.Visible = True

            Label17.Visible = True
            Text1.Visible = True

            Label19.Visible = True
            txtAccountName.Visible = True

            txtchequeno.Visible = False
            Label15.Visible = False

            Label5.Visible = False
            TtxcardNo.Visible = False

            Label7.Visible = False
            txtExpire.Visible = False

            btnConvert.Visible = False
            txtSecoundValue.Visible = False
            Label13.Visible = False

            Label3.Visible = False
            DrpCurrency.Visible = False

        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        Dim a As New churchmanDataContext

        'If txtName1.Text = "" Then
        '    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter a name!!!')", True)
        '    Exit Sub
        'End If

        If DropPayment.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select a Payment!!!')", True)
            Exit Sub
        End If


        If Text1.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter the Amount!!!')", True)
            Exit Sub
        End If

        If drpGiving.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select a giving !!!')", True)
            Exit Sub
        End If

        Dim strDate As Date
        strDate = Now

        Dim id = From i In a.PledgeTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            Lblid.Text = "Plg" & "" & z
        Else
            Lblid.Text = "Plg" & "" & 1

        End If

        Dim savePledge As New PledgeTable With { _
          .Pledgeid = Lblid.Text, _
          .incomeid = drpGiving.SelectedValue, _
          .Year = txtYear.Text, _
          .Amountword = divDisplayWords.Text, _
          .Datecreated = strDate, _
          .Staffid = txtStaffID.Text, _
          .Churchid = txtchurchID.Text}

        a.PledgeTables.InsertOnSubmit(savePledge)
        a.SubmitChanges()


        If DropPayment.SelectedValue = "Cash" Then

            Dim savepayment As New PledgePaymentTable With { _
              .PledgeId = Lblid.Text, _
              .Incomeid = drpGiving.SelectedValue, _
              .Datecreated = strDate, _
              .PaymentMethodid = txtcashM.Text, _
              .Amount = Text1.Text}
            a.PledgePaymentTables.InsertOnSubmit(savepayment)
            a.SubmitChanges()

        ElseIf DropPayment.SelectedValue = "Card" Then

            Dim savepayment As New PledgePaymentTable With { _
                .PledgeId = Lblid.Text, _
                .Incomeid = drpGiving.SelectedValue, _
                .Datecreated = strDate, _
                .PaymentMethodid = txtcashM.Text, _
                .Amount = Text1.Text}
            a.PledgePaymentTables.InsertOnSubmit(savepayment)
            a.SubmitChanges()


            Dim saveBank As New PledgeBankPaymentTable With { _
            .PledgeId = Lblid.Text, _
            .Paymentid = txtcashM.Text, _
            .BankId = DrpBanks.SelectedValue, _
           .CardNumber = TtxcardNo.Text, _
            .AccountName = txtAccountName.Text, _
            .ExpireDate = txtExpire.Text, _
            .Datecreated = strDate}
            a.PledgeBankPaymentTables.InsertOnSubmit(saveBank)
            a.SubmitChanges()

        ElseIf DropPayment.SelectedValue = "Cheque" Then

             Dim savepayment As New PledgePaymentTable With { _
               .PledgeId = Lblid.Text, _
               .Incomeid = drpGiving.SelectedValue, _
               .Datecreated = strDate, _
               .PaymentMethodid = txtcashM.Text, _
               .Amount = Text1.Text}
            a.PledgePaymentTables.InsertOnSubmit(savepayment)
            a.SubmitChanges()

            Dim saveBank As New PledgeBankPaymentTable With { _
            .PledgeId = Lblid.Text, _
            .Paymentid = txtcashM.Text, _
            .BankId = DrpBanks.SelectedValue, _
            .ChequeNo = txtchequeno.Text, _
            .Dateissu = txtDatepay.Text, _
            .Datecreated = strDate}

            a.PledgeBankPaymentTables.InsertOnSubmit(saveBank)
            a.SubmitChanges()

        ElseIf DropPayment.SelectedValue = "Bank Payment" Then

           Dim savepayment As New PledgePaymentTable With { _
                 .PledgeId = Lblid.Text, _
                 .Incomeid = drpGiving.SelectedValue, _
                 .Datecreated = strDate, _
                 .PaymentMethodid = txtcashM.Text, _
                 .Amount = Text1.Text}
            a.PledgePaymentTables.InsertOnSubmit(savepayment)
            a.SubmitChanges()

            Dim saveBank As New PledgeBankPaymentTable With { _
            .PledgeId = Lblid.Text, _
            .Paymentid = txtcashM.Text, _
            .BankId = DrpBanks.SelectedValue, _
            .Dateissu = txtDatepay.Text, _
           .AccountName = txtAccountName.Text, _
           .Datecreated = strDate}

            a.PledgeBankPaymentTables.InsertOnSubmit(saveBank)
            a.SubmitChanges()

        ElseIf DropPayment.SelectedValue = "Electronic Transfer" Then
            Dim savepayment As New PledgePaymentTable With { _
       .PledgeId = Lblid.Text, _
       .Incomeid = drpGiving.SelectedValue, _
      .Datecreated = strDate, _
      .PaymentMethodid = txtcashM.Text, _
      .Amount = Text1.Text}
            a.PledgePaymentTables.InsertOnSubmit(savepayment)
            a.SubmitChanges()


            Dim saveBank As New PledgeBankPaymentTable With { _
            .PledgeId = Lblid.Text, _
            .Paymentid = txtcashM.Text, _
            .BankId = DrpBanks.SelectedValue, _
             .Dateissu = txtDatepay.Text, _
            .AccountName = txtAccountName.Text, _
            .Datecreated = strDate}
            a.PledgeBankPaymentTables.InsertOnSubmit(saveBank)
            a.SubmitChanges()
        End If
        Call AccountPosting()

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Pledge has been saved!!!')", True)


        Text1.Text = ""
        txtName1.Text = ""
        txtfulname.Text = ""
        txtDatepay.Text = ""
        txtTellno.Text = ""
        Lblid.Text = ""
        txtAccountName.Text = ""
        txtchequeno.Text = ""
        TtxcardNo.Text = ""
        divDisplayWords.Text = ""
        txtExpire.Text = ""
        txtPhone.Text = ""


        drpGiving.DataBind()
        drpGiving.Items.Insert(0, New ListItem("Select"))
        drpGiving.SelectedIndex = 0

        DrpBanks.DataBind()
        DrpBanks.Items.Insert(0, New ListItem("Select"))
        DrpBanks.SelectedIndex = 0

        DropPayment.DataBind()
        DropPayment.Items.Insert(0, New ListItem("Select"))
        DropPayment.SelectedIndex = 0

        drpProject.DataBind()
        drpProject.Items.Insert(0, New ListItem("Select"))
        drpProject.SelectedIndex = 0

        drpFrequency.DataBind()
        drpFrequency.Items.Insert(0, New ListItem("Select"))
        drpFrequency.SelectedIndex = 0

        DrpMember.DataBind()
        DrpMember.Items.Insert(0, New ListItem("Select"))
        DrpMember.SelectedIndex = 0

        Response.Redirect("Pledges.aspx")

    End Sub
    Public Sub AccountPosting()
        Dim getPaymentPerID = From g In madd.PledgePaymentTables
                              Where g.PledgeId = Lblid.Text
                              Group New With {g} By _
                              g.PaymentMethodid, _
                              g.PledgeId, _
                              g.Datecreated
                              Into gr = Group
                              Select New With { _
                                  .id = gr.Max(Function(i) i.g.SN), _
                                  .PledgeID = gr.FirstOrDefault.g.PledgeId, _
                                  .PaymentMethodid = gr.FirstOrDefault.g.PaymentMethodid, _
                                  .Amount = gr.Sum(Function(s) s.g.Amount), _
                                  .DateCreated = gr.FirstOrDefault.g.Datecreated}


      
        Dim givingName = madd.IncomeTables.Where(Function(p) p.ID = CInt(drpGiving.SelectedValue)).SingleOrDefault.Income

        Dim strDate As Date
        strDate = Now

        'Dim checkname = madd.MembershipTables.Where(Function(q) q.FirstName & " " & q.LastName = txtName1.Text AndAlso q.Phone1 = txtPhone.Text).Any
        'posting

        'Cash Component
        Dim pidCash = madd.PaymentMethodTables.Where(Function(i) i.PaymentName = "Cash").FirstOrDefault.Id

        'bank component 
        Dim pidCard = madd.PaymentMethodTables.Where(Function(i) i.PaymentName = "Card").FirstOrDefault.Id
        Dim pidCheque = madd.PaymentMethodTables.Where(Function(i) i.PaymentName = "Cheque").FirstOrDefault.Id
        Dim pidBankPayment = madd.PaymentMethodTables.Where(Function(i) i.PaymentName = "Bank Payment").FirstOrDefault.Id
        Dim pidETransfer = madd.PaymentMethodTables.Where(Function(i) i.PaymentName = "Electronic Transfer").FirstOrDefault.Id


        Dim hasCash = getPaymentPerID.Where(Function(i) i.PaymentMethodid = pidCash).Any
        Dim hasCard = getPaymentPerID.Where(Function(i) i.PaymentMethodid = pidCard).Any
        Dim hasChegue = getPaymentPerID.Where(Function(i) i.PaymentMethodid = pidCheque).Any
        Dim hasETransfer = getPaymentPerID.Where(Function(i) i.PaymentMethodid = pidETransfer).Any
        Dim hasBankPayment = getPaymentPerID.Where(Function(i) i.PaymentMethodid = pidBankPayment).Any


        Dim CashAmount As Decimal = 0
        Dim CardAmount As Decimal = 0
        Dim ChequeAmount As Decimal = 0
        Dim BankPaymentAmount As Decimal = 0
        Dim ETransferAmount As Decimal = 0

        If CInt(txtcashM.Text) = pidCash Then
            CashAmount = getPaymentPerID.Where(Function(i) i.PaymentMethodid = pidCash).Sum(Function(r) r.Amount)
        End If


        If CInt(txtcashM.Text) = pidCard Then
            CardAmount = getPaymentPerID.Where(Function(i) i.PaymentMethodid = pidCard).Sum(Function(r) r.Amount)
        End If

        If CInt(txtcashM.Text) = pidCheque Then
            ChequeAmount = getPaymentPerID.Where(Function(i) i.PaymentMethodid = pidCheque).Sum(Function(r) r.Amount)
        End If

        If CInt(txtcashM.Text) = pidBankPayment Then
            BankPaymentAmount = getPaymentPerID.Where(Function(i) i.PaymentMethodid = pidBankPayment).Sum(Function(r) r.Amount)
        End If

        If CInt(txtcashM.Text) = pidETransfer Then
            ETransferAmount = getPaymentPerID.Where(Function(i) i.PaymentMethodid = pidETransfer).Sum(Function(r) r.Amount)
        End If


        'posting begins

        If hasCash Then
            Call PostingCash(strDate, "Cash", "Cash", Lblid.Text, "Cash", "DR ", CashAmount, givingName)

            Call PostingPledgeAccount(strDate, drpGiving.SelectedValue, "Cash", Lblid.Text, "CR", CashAmount, "")
            'Call PostingMember(strDate, getMemeid, "Cash", Lblid.Text, "CR", CashAmount, givingName)

        ElseIf hasCard Then
            Call PostingCash(strDate, "Bank", "Cash", Lblid.Text, "Card", "DR ", CardAmount, givingName)

            Call PostingPledgeAccount(strDate, drpGiving.SelectedValue, "Cash", Lblid.Text, "CR", CardAmount, "")
            'Call PostingMember(strDate, getMemeid, "Cash", Lblid.Text, "CR", CardAmount, givingName)

        ElseIf hasChegue Then
            Call PostingCash(strDate, "Bank", "Cash", Lblid.Text, "Chegue", "DR ", ChequeAmount, givingName)

            Call PostingPledgeAccount(strDate, drpGiving.SelectedValue, "Cash", Lblid.Text, "CR", ChequeAmount, "")
            'Call PostingMember(strDate, getMemeid, "Cash", Lblid.Text, "CR", ChequeAmount, givingName)

        ElseIf hasBankPayment Then
            Call PostingCash(strDate, "Bank", "Cash", Lblid.Text, "Bank Payment", "DR ", pidBankPayment, givingName)

            Call PostingPledgeAccount(strDate, drpGiving.SelectedValue, "Cash", Lblid.Text, "CR", pidBankPayment, "")
            'Call PostingMember(strDate, getMemeid, "Cash", Lblid.Text, "CR", pidBankPayment, givingName)

        ElseIf hasETransfer Then
            Call PostingCash(strDate, "Bank", "Cash", Lblid.Text, "Electronic Transfer", "DR ", ETransferAmount, givingName)

            Call PostingPledgeAccount(strDate, drpGiving.SelectedValue, "Cash", Lblid.Text, "CR", ETransferAmount, "")
            'Call PostingMember(strDate, getMemeid, "Cash", Lblid.Text, "CR", ETransferAmount, givingName)

        End If

    End Sub
    'New generation saving
    'Saving for posting to differnent account

    Public Sub PostingOtherIncome(ByVal TDate As Date, IncomeID As Integer, Account As String, ADetails As String, TType As String, Amount As Integer, Remark As String)
        Dim staff = txtStaffID.Text

        Dim SavePosting As New Other_incomeAccountTable With { _
            .TransactionDate = TDate, _
            .Other_incomeid = IncomeID, _
            .AccountName = Account, _
            .Accountdetails = ADetails, _
            .Transcationtype = TType, _
            .Amount = Amount, _
            .Remark = Remark, _
            .Datecreated = Now, _
            .StaffId = staff}
        madd.Other_incomeAccountTables.InsertOnSubmit(SavePosting)
        madd.SubmitChanges()

    End Sub
    'New generation saving
    'Saving for posting to differnent account

    Public Sub PostingPledgeAccount(ByVal TDate As Date, IncomeID As Integer, Account As String, ADetails As String, TType As String, Amount As Integer, Remark As String)
        Dim staff = txtStaffID.Text

        Dim SavePosting As New PledgeAccountTable With { _
            .TranscationDate = TDate, _
            .Incomeid = IncomeID, _
            .AccountName = Account, _
            .Accountdetails = ADetails, _
            .Transcationtype = TType, _
            .Amount = Amount, _
            .Remark = Remark, _
            .Datecreated = Now, _
            .StaffId = staff}
        madd.PledgeAccountTables.InsertOnSubmit(SavePosting)
        madd.SubmitChanges()

    End Sub
    Public Sub PostingMember(ByVal TDate As Date, memID As String, Account As String, ADetails As String, TType As String, Amount As Integer, Remark As String)
        'New generation saving
        'Saving for posting to differnent account

        Dim staff = txtStaffID.Text

        Dim SavePosting As New AccountRecivableTable With { _
            .TranscationDate = TDate, _
            .Memberid = memID, _
            .AccountName = Account, _
            .Accountdetails = ADetails, _
            .Amount = Amount, _
            .Transcationtype = TType, _
            .Remark = Remark, _
            .Datecreated = Now, _
            .StaffId = staff}
        madd.AccountRecivableTables.InsertOnSubmit(SavePosting)
        madd.SubmitChanges()

    End Sub
    Public Sub PostingCash(ByVal TDate As Date, cashbank As String, Account As String, ADetails As String, ADetails1 As String, TType As String, Amount As Integer, Remark As String)
        Dim staff = txtStaffID.Text

        Dim SavePosting As New Cash_BookTable With { _
            .Transactiondate = TDate, _
            .Cash_Bank = cashbank, _
            .AccountName = Account, _
            .Accountdetails = ADetails, _
            .Amount = Amount, _
            .TransactionType = TType, _
            .Accountdetails1 = ADetails1, _
            .Remark = Remark, _
            .Datecreated = Now, _
            .Staffid = staff}
        madd.Cash_BookTables.InsertOnSubmit(SavePosting)
        madd.SubmitChanges()

    End Sub
    Protected Sub DrpMember_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpMember.SelectedIndexChanged
        'If DrpMember.SelectedValue = "Select" Then
        '    'do nothing
        '    txtName1.Text = ""
        '    txtfulname.Text = ""
        '    txtPhone.Text = ""
        'Else


        '    Dim getfirstName = (From s In madd.MembershipTables
        '                           Where s.SN = DrpMember.SelectedValue
        '                           Select s).SingleOrDefault.FirstName

        '    Dim getLastName = (From s In madd.MembershipTables
        '                           Where s.SN = DrpMember.SelectedValue
        '                           Select s).SingleOrDefault.LastName

        '    Dim getNumber = (From s In madd.MembershipTables
        '                           Where s.SN = DrpMember.SelectedValue
        '                           Select s).SingleOrDefault.Phone1


        '    txtName1.Text = getfirstName & " " & getLastName



        '    txtPhone.Text = getNumber
        'End If
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("Pledgeview.aspx")
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

                nSet = IIf((intAmount.ToString.Trim.Length / 3) > (CLng(intAmount.ToString.Trim.Length / 3)), CLng(intAmount.ToString.Trim.Length / 3) + 1, CLng(intAmount.ToString.Trim.Length / 3))

                Dim eAmount As Long = Microsoft.VisualBasic.Left(intAmount.ToString.Trim, (intAmount.ToString.Trim.Length - ((nSet - 1) * 3)))

                Dim multiplier As Long = 10 ^ (((nSet - 1) * 3))

                Dim Ones() As String = {"", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine"}

                Dim Teens() As String = {"", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"}

                Dim Tens() As String = {"", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"}

                Dim HMBT() As String = {"", "", "Thousand", "Million", "Billion", "Trillion", "Quadrillion", "Quintillion"}

                intAmount = eAmount

                Dim nHundred As Integer = intAmount \ 100 : intAmount = intAmount Mod 100
                Dim nTen As Integer = intAmount \ 10 : intAmount = intAmount Mod 10
                Dim nOne As Integer = intAmount \ 1

                If nHundred > 0 Then wAmount = wAmount & Ones(nHundred) & " Hundred " 'This is for hundreds                
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
                wAmount = AmountInWords(CStr(CLng(nAmount) - (eAmount * multiplier)).Trim & tempDecValue, wAmount, nSet - 1)
            Else
                If Val(nAmount) = 0 Then nAmount = nAmount & tempDecValue : tempDecValue = String.Empty
                If (Math.Round(Val(nAmount), 2) * 100) > 0 Then wAmount = Trim(AmountInWords(CStr(Math.Round(Val(nAmount), 2) * 100), wAmount.Trim & " Naira And ", 1)) & " Cents"
            End If
        Catch ex As Exception
            'MessageBox.Show("Error Encountered: " & ex.Message, _
            '  "Convert Numbers To Words", _
            '  MessageBoxButtons.OK, MessageBoxIcon.Error)
            Return "!#ERROR_ENCOUNTERED"
        End Try

        'Trap null values
        If IsNothing(wAmount) = True Then
            wAmount = String.Empty
        Else
            '& "Naira"
            wAmount = IIf(InStr(wAmount.Trim.ToLower, " Naira"), wAmount.Trim, wAmount.Trim)
        End If

        'Display the result
        Return wAmount
    End Function
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles btnConvert.Click
        If DrpCurrency.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select a currency value!!!')", True)
            Exit Sub
        End If


        Dim amount As Decimal
        amount = txtFirstValue.Text * txtSecoundValue.Text

        ' Text1.Text = Format((Decimal.Round(amount, 2)), "₦, #.00")
        Text1.Text = Format((Decimal.Round(amount, 2)), "#.00")

        divDisplayWords.Text = AmountInWords(amount)
    End Sub

    Protected Sub DrpCurrency_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpCurrency.SelectedIndexChanged
        Dim getrate = (From s In madd.Exchange_RateTables
                           Where s.Exchange_Rate = DrpCurrency.SelectedValue
                           Select s).SingleOrDefault.Exchange_Rate
        txtFirstValue.Text = getrate

    End Sub

    Protected Sub Text1_TextChanged(sender As Object, e As EventArgs) Handles Text1.TextChanged

    End Sub

    Protected Sub txtAccountName_TextChanged(sender As Object, e As EventArgs) Handles txtAccountName.TextChanged

    End Sub

End Class
