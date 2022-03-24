
Partial Class NewBank
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
            btnSave.Text = "Save"

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
        End If
    End Sub
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext

        If btnSave.Text = "Save" Then
            Dim checkDuty = (From f In a.BankTables
                            Where f.Bankname = txtName.Text
                            Select f).Any

            If checkDuty = True Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Existing Bank Name !!!')", True)
                Exit Sub
            End If


            If txtName.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter Bank Name!!!')", True)
                Exit Sub
            End If


            Dim strDate As Date
            strDate = Now


            Dim saveProject As New BankTable With { _
               .Bankname = txtName.Text.ToUpper, _
               .Updatedby = txtMembername.Text, _
               .Updateddate = strDate, _
               .Churchid = txtchurchID.Text, _
               .Createdby = txtStaffID.Text, _
               .Datecreated = strDate}

            a.BankTables.InsertOnSubmit(saveProject)
            a.SubmitChanges()

            txtName.Text = ""


            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('saved!!!')", True)

            gridPledge.DataBind()


        ElseIf btnSave.Text = "Edit" Then
            Dim updateBank = madd.BankTables.Where(Function(d) d.id = txtBankId.Text).SingleOrDefault()

            updateBank.Bankname = txtName.Text.ToUpper
            updateBank.Updatedby = AdminLabel.Text
            updateBank.Updateddate = Now

            madd.SubmitChanges()

            Dim CountBankName = madd.BankTables.Where(Function(q) q.Bankname = txtName.Text).Count

            If CountBankName = 1 Then
                'do nothing
            ElseIf CountBankName > 1 Then
                Dim updateBank1 = madd.BankTables.Where(Function(d) d.id = txtBankId.Text).SingleOrDefault()

                updateBank1.Bankname = txtPendingBank.Text.ToUpper
                updateBank1.Updatedby = AdminLabel.Text
                updateBank1.Updateddate = Now

                madd.SubmitChanges()

                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Name already exit!')", True)

            End If
            txtName.Text = ""
            
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Updated!')", True)

            gridPledge.DataBind()

            btnSave.Text = "Save"
        End If
        
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        txtName.Text = ""
        Response.Redirect("\Mainboard.aspx")
    End Sub

    Protected Sub gridPledge_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gridPledge.RowCommand
        If e.CommandName = "DeleteBank" Then


            Dim ID As Integer = Convert.ToInt32(e.CommandArgument)


            'Dim checkBankUsed = madd..Where(Function(w) w.Department = depCode).Any

            'If checkDepatCode = True Then

            '    Dim deleteDept = From c In HMS.Department_tbls
            '                              Where (c.SN = ID)
            '                              Select c

            '    For Each q As Department_tbl In deleteDept
            '        HMS.Department_tbls.DeleteOnSubmit(q)
            '    Next
            '    Try
            '        HMS.SubmitChanges()
            '    Catch ex As Exception

            '    End Try
            '    view_dept_list.DataBind()
            '    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Deleted.');", True)
            'Else
            '    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Sorry, it cannot be deleted.');", True)
            'End If

        End If
    End Sub

    Protected Sub gridPledge_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridPledge.SelectedIndexChanged
        btnSave.Text = "Edit"
        Dim BankId = gridPledge.SelectedRow.Cells(0).Text
        txtBankId.Text = BankId

        txtName.Text = gridPledge.SelectedRow.Cells(1).Text
        txtPendingBank.Text = txtName.Text

    End Sub
End Class
