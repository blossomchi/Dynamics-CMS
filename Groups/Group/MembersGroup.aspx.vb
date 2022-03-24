
Partial Class Serviceunit
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
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext
        If btnSave.Text = "Save" Then
            If txtservice.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter group name!!!')", True)
                Exit Sub
            End If


            Dim saveunit As New MembersGroup With { _
           .GroupName = txtservice.Text.ToUpper, _
           .Description = txtdesp.Text.ToUpper, _
           .EnterBy = txtenter.Text, _
           .DateCreated = Now}

            a.MembersGroups.InsertOnSubmit(saveunit)
            a.SubmitChanges()

            txtservice.Text = ""
            txtdesp.Text = ""


            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Group name has been saved!!!')", True)

            GridUnit.DataBind()
        ElseIf btnSave.Text = "Edit" Then

            Dim updateGroups = madd.MembersGroups.Where(Function(d) d.ID = txtGroupId.Text).SingleOrDefault()

            updateGroups.GroupName = txtservice.Text.ToUpper
            updateGroups.Description = txtdesp.Text.ToUpper
           
            madd.SubmitChanges()

            Dim CountName = madd.MembersGroups.Where(Function(q) q.GroupName = txtservice.Text).Count

            If CountName = 1 Then
                'do nothing
            ElseIf CountName <> 1 Then
                Dim updateGroups1 = madd.MembersGroups.Where(Function(d) d.ID = txtGroupId.Text).SingleOrDefault()

                updateGroups1.GroupName = txtPendingGroup.Text.ToUpper
                updateGroups1.Description = txtdesp.Text.ToUpper

                madd.SubmitChanges()

            End If

            txtservice.Text = ""
            txtdesp.Text = ""

            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Group name was updated!')", True)

            GridUnit.DataBind()

            btnSave.Text = "Save"
        End If
        
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        txtservice.Text = ""
        txtdesp.Text = ""
        Response.Redirect("\Mainboard.aspx")
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


            ' txtchurchid.Text = ""
            txtenter.Text = name.ToUpper

            If lbChurchName.Text = "" Then
                 Response.Redirect("Login.aspx")
                Exit Sub
            End If
        End If
    End Sub

    Protected Sub GridUnit_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridUnit.SelectedIndexChanged
        btnSave.Text = "Edit"
        Dim GroupID = GridUnit.SelectedRow.Cells(0).Text
        txtGroupId.Text = GroupID

        txtservice.Text = GridUnit.SelectedRow.Cells(1).Text
        txtPendingGroup.Text = txtservice.Text
        txtdesp.Text = GridUnit.SelectedRow.Cells(2).Text
    End Sub
End Class
