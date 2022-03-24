Imports System.IO
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Data
Partial Class Loan
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


            CBMembers.DataBind()
            CBMembers.Items.Insert(0, New ListItem("Select"))
            CBMembers.SelectedIndex = 0
        End If
    End Sub
    
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext
        Dim FirstName = madd.MembershipTables.Where(Function(w) w.Memberid = CBMembers.SelectedValue).SingleOrDefault.FirstName.Substring(0, 2)
        Dim LastName = madd.MembershipTables.Where(Function(w) w.Memberid = CBMembers.SelectedValue).SingleOrDefault.LastName.Substring(0, 2)


        If txtLoanHead.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter loan applicant!!!')", True)
            Exit Sub
        End If


        Dim strDate As Date
        strDate = Now

        Dim LoanLatestID = From i In a.LoanHeadTables
                           Select i

        If LoanLatestID.Count > 0 Then

            Dim latest As String = LoanLatestID.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            txtLoanID.Text = FirstName & LastName & "_" & z
        Else
            txtLoanID.Text = FirstName & LastName & "_" & 1

        End If

        If CBMembers.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, select applicant!!!')", True)
            Exit Sub
        End If

        If txtMsg.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, enter applicant address!!!')", True)
            Exit Sub
        End If

        If TxtGuarantor.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, enter guarantor!!!')", True)
            Exit Sub
        End If

        If TxtAddGuarantor.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, enter guarantor's address!!!')", True)
            Exit Sub
        End If

        If TxtGuarantorPhone.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, enter guarantor's phone number!!!')", True)
            Exit Sub
        End If

        If txtAmountLoan.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, enter loan amount!!!')", True)
            Exit Sub
        End If

        If txtPurpose.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, state your purpose!!!')", True)
            Exit Sub
        End If

        Dim saveLoan As New LoanHeadTable With {
                .Loanid = txtLoanID.Text,
                .MembershipID = CBMembers.SelectedValue,
               .Name = txtLoanHead.Text,
               .Address = txtMsg.Text,
               .Phone = TxtPhone.Text,
               .Phone2 = TxtMobile.Text,
               .DOB = TxtDOB.Text,
               .MaritaStatus = txtStatus.Text,
               .Email = txtEmail.Text,
               .GuarantorName = TxtGuarantor.Text,
               .GAddress = TxtAddGuarantor.Text,
               .PlaceOfWork = TxtGuarantorWork.Text,
               .GPhone = TxtGuarantorPhone.Text,
               .GEmail = TxtGuarantorEmail.Text,
               .LoanAmount = txtAmountLoan.Text,
               .Purpose = txtPurpose.Text,
               .DateCollected = DateCollectedPicker.SelectedDate,
               .RepaymentDate = RepaymentPicker.SelectedDate,
               .DateCreated = Now,
               .CreatedBy = txtStaffID.Text}

        a.LoanHeadTables.InsertOnSubmit(saveLoan)
        a.SubmitChanges()

        Dim saveLoanPV As New LoanPVTable With {
                .Loanid = txtLoanID.Text,
                .DateCreated = Now,
               .CreatedBy = txtStaffID.Text}

        a.LoanPVTables.InsertOnSubmit(saveLoanPV)
        a.SubmitChanges()

        gridAscending.DataBind()


        Dim getLoanID = txtLoanID.Text

        Dim getPVID = (From s In madd.LoanPVTables
                       Where s.Loanid = txtLoanID.Text
                       Select s).SingleOrDefault.Pvid

        Session("PaymentVoucherID") = getPVID
        Session("LoanID") = getLoanID
        Session("PayeeID") = CBMembers.SelectedValue

        printReciept()

        txtMsg.Text = ""
        CBMembers.DataBind()
        CBMembers.Items.Insert(0, New ListItem("Select"))
        CBMembers.SelectedIndex = 0
        txtLoanHead.Text = ""
        TxtPhone.Text = ""
        TxtMobile.Text = ""
        TxtDOB.Text = ""
        txtStatus.Text = ""
        txtEmail.Text = ""
        TxtGuarantor.Text = ""
        TxtAddGuarantor.Text = ""
        TxtGuarantorWork.Text = ""
        TxtGuarantorPhone.Text = ""
        TxtGuarantorEmail.Text = ""
        txtAmountLoan.Text = ""
        txtPurpose.Text = ""
        DateCollectedPicker.Clear()
        RepaymentPicker.Clear()

        '  ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Loan information was entered successful!!!')", True)

    End Sub
    Public Sub printReciept()
        Dim url As String = "PaymentVoucher.aspx"
        Dim s As String = "window.open('" & url + "', 'popup_window', 'width=980,height=980,left=0,top=100,resizable=yes,scrollbars=1');"
        ' Dim s As String = "window.open('" & url + "', 'popup_window', 'width=300,height=1000,left=100,top=100,resizable=yes,scrollbars=1');"
        ClientScript.RegisterStartupScript(Me.GetType(), "script", s, True)
    End Sub
    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("LoanView.aspx")
    End Sub

    Protected Sub gridAscending_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridAscending.SelectedIndexChanged
        Dim getID = gridAscending.SelectedRow.Cells(0).Text

        Session("loanid") = getID

        Response.Redirect("LoanEdit.aspx")
    End Sub
    Protected Sub CBMembers_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CBMembers.SelectedIndexChanged
        Dim FirstName = madd.MembershipTables.Where(Function(w) w.Memberid = CBMembers.SelectedValue).SingleOrDefault.FirstName
        Dim LastName = madd.MembershipTables.Where(Function(w) w.Memberid = CBMembers.SelectedValue).SingleOrDefault.LastName

        txtLoanHead.Text = FirstName & " " & LastName
        txtMsg.Text = madd.MembershipTables.Where(Function(w) w.Memberid = CBMembers.SelectedValue).SingleOrDefault.Address
        TxtPhone.Text = madd.MembershipTables.Where(Function(w) w.Memberid = CBMembers.SelectedValue).SingleOrDefault.Phone1
        TxtMobile.Text = madd.MembershipTables.Where(Function(w) w.Memberid = CBMembers.SelectedValue).SingleOrDefault.Phone2
        TxtDOB.Text = madd.MembershipTables.Where(Function(w) w.Memberid = CBMembers.SelectedValue).SingleOrDefault.DOB
        txtStatus.Text = madd.MembershipTables.Where(Function(w) w.Memberid = CBMembers.SelectedValue).SingleOrDefault.MartialStatus
        txtEmail.Text = madd.MembershipTables.Where(Function(w) w.Memberid = CBMembers.SelectedValue).SingleOrDefault.Email

    End Sub
End Class
