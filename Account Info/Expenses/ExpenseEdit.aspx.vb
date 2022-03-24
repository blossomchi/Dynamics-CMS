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

            drpExpenses.DataBind()
            drpExpenses.Items.Insert(0, New ListItem("Select"))
            drpExpenses.SelectedIndex = 0


            txtMemID.Text = Session("Expenseid")

            Dim getAllInfo = madd.ExpensesHeadTables.Where(Function(l) l.Expensesid = txtMemID.Text).SingleOrDefault

            txtexpenHead.Text = getAllInfo.Name
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

    Protected Sub drpExpenses_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpExpenses.SelectedIndexChanged
        If drpExpenses.SelectedValue = "Select" Then
            txtExpensesHead.ReadOnly = False

        ElseIf drpExpenses.SelectedValue <> "Select" Then
            txtExpensesHead.ReadOnly = True

        End If


        Dim getid = (From s In madd.ExpensesHeadTables
                                   Where s.Expensesid = drpExpenses.SelectedValue
                                   Select s).SingleOrDefault.Name


        txtExpensesHead.Text = getid
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("ExpensesView.aspx")
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        If btnSave.Text = "Edit Header" Then
            Dim updateHeader = madd.ExpensesHeadTables.Where(Function(h) h.Expensesid = txtMemID.Text).SingleOrDefault

            updateHeader.Name = txtExpensesHead.Text
            madd.SubmitChanges()

            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Expenses Header has been Edited!!!')", True)

            txtExpensesHead.Text = ""

        ElseIf btnSave.Text = "Edit Details" Then

            Dim getheaderID1 = Griddetails.SelectedRow.Cells(0).Text

            Dim updatedetails = madd.ExpensesdetailsTables.Where(Function(l) l.ID = getheaderID1).SingleOrDefault

            updatedetails.Name = txtExpensesDetails.Text
            updatedetails.Description = txtMsg.Text
            madd.SubmitChanges()

            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Expenses Details has been Edited!!!')", True)

            txtExpensesDetails.Text = ""
            txtMsg.Text = ""
            txtExpensesHead.Text = ""
            drpExpenses.DataBind()
            drpExpenses.Items.Insert(0, New ListItem("Select"))
            drpExpenses.SelectedIndex = 0


        End If


    End Sub
    Protected Sub gridHeader_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridHeader.SelectedIndexChanged
        Dim getheaderID = gridHeader.SelectedRow.Cells(0).Text

        Dim headerInfo = madd.ExpensesHeadTables.Where(Function(l) l.Expensesid = getheaderID).SingleOrDefault

        txtExpensesHead.Text = headerInfo.Name

        txtExpensesDetails.Enabled = False
        drpExpenses.Enabled = False
        txtMsg.Enabled = False
        Panel1.Visible = True
        Panel2.Visible = False

        btnSave.Text = "Edit Header"
    End Sub
    Protected Sub Griddetails_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Griddetails.SelectedIndexChanged

        Dim getheaderID1 = Griddetails.SelectedRow.Cells(0).Text


        Dim headerdetails = madd.ExpensesdetailsTables.Where(Function(l) l.ID = getheaderID1).SingleOrDefault


        Dim h As String = String.Empty
        h = headerdetails.Expensesid
        If h = String.Empty Then
            drpExpenses.DataBind()
            drpExpenses.Items.Insert(0, New ListItem("Select"))
            drpExpenses.SelectedIndex = 0
        ElseIf h <> String.Empty Then
            drpExpenses.DataBind()
            drpExpenses.SelectedValue = h
        End If


        Dim getid = (From s In madd.ExpensesHeadTables
                                   Where s.Expensesid = drpExpenses.SelectedValue
                                   Select s).SingleOrDefault.Name


        txtExpensesHead.Text = getid

        txtExpensesDetails.Text = headerdetails.Name
        txtMsg.Text = headerdetails.Description

        txtExpensesHead.Enabled = False
        txtExpensesDetails.Enabled = True
        drpExpenses.Enabled = False
        txtMsg.Enabled = True
        Panel1.Visible = True
        Panel2.Visible = False

        btnSave.Text = "Edit Details"
    End Sub
End Class
