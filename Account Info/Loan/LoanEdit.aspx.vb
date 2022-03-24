Imports System.IO
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Data
Partial Class ExpenseEdit
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

            txtMemID.Text = Session("loanid")

            Dim getAllInfo = madd.LoanHeadTables.Where(Function(l) l.Loanid = txtMemID.Text).SingleOrDefault

            txtLHead.Text = getAllInfo.Name
            Panel1.Visible = False
            Panel2.Visible = True

            'Dim h As String = String.Empty
            'h = getAllInfo.Name
            'If h = String.Empty Then
            '    drpExpenses.DataBind()
            '    drpExpenses.Items.Insert(0, New ListItem("Select"))
            '    drpExpenses.SelectedIndex = 0
            'ElseIf h <> String.Empty Then
            '    drpExpenses.DataBind()
            '    drpExpenses.SelectedValue = h
            'End If






        End If
    End Sub
    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("loanView.aspx")
    End Sub
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        If btnSave.Text = "Edit Header" Then
            Dim updateHeader = madd.LoanHeadTables.Where(Function(h) h.Loanid = txtMemID.Text).SingleOrDefault

            updateHeader.Name = txtLoanHead.Text
            updateHeader.Description = txtMsg.Text
            madd.SubmitChanges()

            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Loan Header has been Edited!!!')", True)
            txtMsg.Text = ""
            txtLoanHead.Text = ""
            gridHeader.DataBind()
        End If


    End Sub
    Protected Sub gridHeader_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridHeader.SelectedIndexChanged
        Dim getheaderID = gridHeader.SelectedRow.Cells(0).Text

        Dim headerInfo = madd.LoanHeadTables.Where(Function(l) l.Loanid = getheaderID).SingleOrDefault

        txtLoanHead.Text = headerInfo.Name

        txtMsg.Text = headerInfo.Description

        Panel1.Visible = True
       
        btnSave.Text = "Edit Header"
    End Sub
    
End Class
