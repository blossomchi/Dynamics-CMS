
Partial Class duty
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
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

            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName
            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID
        End If

    End Sub
  
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext
        If btnSave.Text = "Save" Then
            Dim checkDuty = (From f In a.DutyTables
                           Where f.DutyName = txtName.Text
                           Select f).Any

            If checkDuty = True Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Existing Duty Name !!!')", True)
                Exit Sub
            End If


            If txtName.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter Duty Name!!!')", True)
                Exit Sub
            End If


            Dim strDate As Date
            strDate = Now


            Dim id = From i In a.DutyTables
                     Select i
            If id.Count > 0 Then

                Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
                Dim z = (CInt(latest) + 1)
                Lblid.Text = "Dut" & "" & z
            Else
                Lblid.Text = "Dut" & "" & 1

            End If

            Dim saveDuty As New DutyTable With { _
               .Dutyid = Lblid.Text, _
               .DutyName = txtName.Text.ToUpper, _
               .DutyDescp = txtdesp.Text.ToUpper, _
               .Updatedby = txtMembername.Text, _
               .Churchid = txtchurchID.Text, _
               .DateCreated = Now}

            a.DutyTables.InsertOnSubmit(saveDuty)
            a.SubmitChanges()

            txtName.Text = ""
            txtdesp.Text = ""
            gridLocation.DataBind()
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('saved!!!')", True)
        ElseIf btnSave.Text = "Edit" Then
            Dim updateDuty = madd.DutyTables.Where(Function(d) d.SN = txtDutyId.Text).SingleOrDefault()

            updateDuty.DutyName = txtName.Text.ToUpper
            updateDuty.DutyDescp = txtdesp.Text.ToUpper

            madd.SubmitChanges()

            Dim CountName = madd.DutyTables.Where(Function(q) q.DutyName = txtName.Text).Count

            If CountName = 1 Then
                'do nothing
            ElseIf CountName <> 1 Then
                'update back to previous information

                Dim updateGroups1 = madd.DutyTables.Where(Function(d) d.SN = txtDutyId.Text).SingleOrDefault()

                updateGroups1.DutyName = txtPendingServices.Text.ToUpper
                updateGroups1.DutyDescp = txtdesp.Text.ToUpper

                madd.SubmitChanges()

            End If
             
            txtName.Text = ""
            txtdesp.Text = ""
            btnSave.Text = "Save"
            gridLocation.DataBind()
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Updated!')", True)
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

    
    Protected Sub gridLocation_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridLocation.SelectedIndexChanged
        btnSave.Text = "Edit"
        Dim ServicesID = gridLocation.SelectedRow.Cells(0).Text
        txtDutyId.Text = ServicesID

        txtName.Text = gridLocation.SelectedRow.Cells(1).Text
        txtPendingServices.Text = txtName.Text
        txtdesp.Text = gridLocation.SelectedRow.Cells(2).Text
    End Sub
End Class
