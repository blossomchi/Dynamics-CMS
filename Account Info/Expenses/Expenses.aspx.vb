Imports System.IO
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Data
Partial Class Expenses
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
  
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtExpensesHeadID.Text = ""
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


        End If
    End Sub

    Protected Sub drpExpenses_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpExpenses.SelectedIndexChanged

        If drpExpenses.SelectedValue = "Select" Then
            txtExpensesHead.ReadOnly = False
            txtExpensesHead.Text = ""
            txtExpensesHeadID.Text = ""
            Exit Sub
        ElseIf drpExpenses.SelectedValue <> "Select" Then
            txtExpensesHeadID.Text = drpExpenses.SelectedValue
            Dim getid = (From s In madd.ExpensesHeadTables
                         Where s.Expensesid = drpExpenses.SelectedValue
                         Select s).SingleOrDefault.Name

            txtExpensesHead.Text = getid
            txtExpensesHead.ReadOnly = True
        End If



    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext



        If txtExpensesHead.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter Expenses Head!!!')", True)
            Exit Sub
        End If


        Dim strDate As Date
        strDate = Now


        If drpExpenses.SelectedValue = "Select" Then
            Dim checkHead = madd.ExpensesHeadTables.Where(Function(f) f.Name = txtExpensesHead.Text).Any
            If checkHead = True Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('That name already exist.Select from the drop list or type another name.!!!')", True)
                Exit Sub
            ElseIf Not checkHead Then
                Dim saveExpensesHead As New ExpensesHeadTable With { _
                  .Name = txtExpensesHead.Text.ToUpper}
                a.ExpensesHeadTables.InsertOnSubmit(saveExpensesHead)
                a.SubmitChanges()


                Dim getid = (From s In madd.ExpensesHeadTables
                                         Where s.Name = txtExpensesHead.Text
                                         Select s).SingleOrDefault.Expensesid


                txtexpenid.Text = getid
                txtExpensesHeadID.Text = txtexpenid.Text

                Dim checkDetailsName = madd.ExpensesdetailsTables.Where(Function(w) w.Expensesid = getid AndAlso w.Name = txtExpensesDetails.Text).Any
                If checkDetailsName = True Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Details name already exist!!!')", True)
                Else
                    Dim saveExpensesdetails As New ExpensesdetailsTable With { _
                                      .Name = txtExpensesDetails.Text.ToUpper, _
                                      .Expensesid = txtexpenid.Text, _
                                      .Description = txtMsg.Text.ToUpper, _
                                      .Datecreated = strDate}
                    a.ExpensesdetailsTables.InsertOnSubmit(saveExpensesdetails)
                    a.SubmitChanges()

                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('saved!!!')", True)

                    txtexpenid.Text = ""
                    txtMsg.Text = ""
                    txtExpensesDetails.Text = ""
                    txtExpensesHead.Text = ""

                    drpExpenses.DataBind()
                    drpExpenses.Items.Insert(0, New ListItem("Select"))
                    drpExpenses.SelectedIndex = 0

                    txtExpensesHead.ReadOnly = False
                    gridAscending.DataBind()
                    Griddetails.DataBind()
                End If
            End If
        ElseIf drpExpenses.SelectedValue <> "Select" Then
            Dim checkHead = madd.ExpensesHeadTables.Where(Function(f) f.Name = txtExpensesHead.Text).Any

            If checkHead = True Then
                'check detail and save depending on avaliablity
                Dim getid1 = (From s In madd.ExpensesHeadTables
                              Where s.Expensesid = drpExpenses.SelectedValue
                              Select s).SingleOrDefault.Expensesid


                txtexpenid.Text = getid1
                Dim checkDetailsName = madd.ExpensesdetailsTables.Where(Function(w) w.Expensesid = getid1 AndAlso w.Name = txtExpensesDetails.Text).Any

                If checkDetailsName = True Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Details name already exist!!!')", True)

                Else
                    Dim saveExpensesdetails As New ExpensesdetailsTable With {
                                       .Name = txtExpensesDetails.Text.ToUpper,
                                       .Expensesid = txtexpenid.Text,
                                       .Description = txtMsg.Text.ToUpper,
                                       .Datecreated = strDate}
                    a.ExpensesdetailsTables.InsertOnSubmit(saveExpensesdetails)
                    a.SubmitChanges()

                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('saved!!!')", True)

                    txtexpenid.Text = ""
                    txtMsg.Text = ""
                    txtExpensesDetails.Text = ""
                    txtExpensesHead.Text = ""

                    drpExpenses.DataBind()
                    drpExpenses.Items.Insert(0, New ListItem("Select"))
                    drpExpenses.SelectedIndex = 0

                    txtExpensesHead.ReadOnly = False
                    gridAscending.DataBind()
                    Griddetails.DataBind()
                End If
            ElseIf Not checkHead Then
                Dim saveExpensesHead As New ExpensesHeadTable With {
                  .Name = txtExpensesHead.Text.ToUpper}
                a.ExpensesHeadTables.InsertOnSubmit(saveExpensesHead)
                a.SubmitChanges()

                Dim getid1 = (From s In madd.ExpensesHeadTables
                                      Where s.Expensesid = drpExpenses.SelectedValue
                                      Select s).SingleOrDefault.Expensesid


                txtexpenid.Text = getid1
                Dim checkDetailsName = madd.ExpensesdetailsTables.Where(Function(w) w.Expensesid = getid1 AndAlso w.Name = txtExpensesDetails.Text).Any

                If checkDetailsName = True Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Details name already exist!!!')", True)

                Else
                    Dim saveExpensesdetails As New ExpensesdetailsTable With { _
                                       .Name = txtExpensesDetails.Text.ToUpper, _
                                       .Expensesid = txtexpenid.Text, _
                                       .Description = txtMsg.Text.ToUpper, _
                                       .Datecreated = strDate}
                    a.ExpensesdetailsTables.InsertOnSubmit(saveExpensesdetails)
                    a.SubmitChanges()

                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('saved!!!')", True)

                    txtexpenid.Text = ""
                    txtMsg.Text = ""
                    txtExpensesDetails.Text = ""
                    txtExpensesHead.Text = ""

                    drpExpenses.DataBind()
                    drpExpenses.Items.Insert(0, New ListItem("Select"))
                    drpExpenses.SelectedIndex = 0

                    txtExpensesHead.ReadOnly = False
                    gridAscending.DataBind()
                    Griddetails.DataBind()
                End If
                
            End If
            End If

    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("ExpensesView.aspx")
    End Sub

    Protected Sub gridAscending_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridAscending.SelectedIndexChanged
        Dim getID = gridAscending.SelectedRow.Cells(1).Text

        Session("Expenseid") = getID

        Response.Redirect("ExpenseEdit.aspx")
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Response.Redirect("ExpensesView.aspx")
    End Sub

    Protected Sub Griddetails_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles Griddetails.RowCommand
        If e.CommandName = "DeleteItem" Then

            If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
                Dim ID As Integer = Convert.ToInt32(e.CommandArgument)


                Dim st As String = ConfigurationManager.ConnectionStrings("ChurchdbConnectionString").ToString : Dim con As New Data.SqlClient.SqlConnection(st)
                con.Open()
                Dim cmd As New SqlCommand("DELETE FROM ExpensesdetailsTable WHERE ( ID = @ID)", con)
                cmd.Parameters.AddWithValue("@ID", ID)
                cmd.ExecuteNonQuery()
                con.Close()
                Griddetails.DataBind()
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Deleted!')", True)
              
            End If
        End If
    End Sub

    Protected Sub Griddetails_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Griddetails.SelectedIndexChanged
      

    End Sub
End Class
