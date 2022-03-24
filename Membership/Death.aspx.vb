
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
        If txtMemeber.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, enter memeber name!!!')", True)
            Exit Sub
        End If
        Dim memebershipID As String = String.Empty

        Dim checkName = madd.MembershipTables.Where(Function(d) d.Phone1 = txtPhone.Text Or d.Phone2 = txtPhone.Text).Any

        If checkName Then
            memebershipID = madd.MembershipTables.Where(Function(d) d.Phone1 = txtPhone.Text Or d.Phone2 = txtPhone.Text).SingleOrDefault.Memberid

            Dim checkImage = madd.MemberImageTables.Where(Function(f) f.MemberID = memebershipID).Any

            If checkImage = True Then
                Dim deletemembersImage = (From s In madd.MemberImageTables
                                          Where (s.MemberID = memebershipID)
                                          Select s)

                For Each q As MemberImageTable In deletemembersImage
                    madd.MemberImageTables.DeleteOnSubmit(q)
                Next
                Try
                    madd.SubmitChanges()
                Catch ex As Exception
                End Try
            End If

            Dim checkmemberUnit = madd.MembersUnits.Where(Function(f) f.Memberid = memebershipID).Any
            If checkmemberUnit = True Then
                Dim deletemembersUnit = (From s In madd.MembersUnits
                                         Where (s.Memberid = memebershipID)
                                         Select s)

                For Each q As MembersUnit In deletemembersUnit
                    madd.MembersUnits.DeleteOnSubmit(q)
                Next
                Try
                    madd.SubmitChanges()
                Catch ex As Exception
                End Try
            End If

            'delete from memebership table
            Dim deletemembers = (From s In madd.MembershipTables
                                 Where (s.Phone1 = txtPhone.Text Or s.Phone2 = txtPhone.Text)
                                 Select s)

            For Each q As MembershipTable In deletemembers
                madd.MembershipTables.DeleteOnSubmit(q)
            Next
            Try
                madd.SubmitChanges()
            Catch ex As Exception
            End Try


            'add to death table
            Dim saveInfo As New MemberDeath With {
                .MemeberName = txtMemeber.Text,
                .PhoneNumer = txtPhone.Text,
                .Description = txtdesp.Text,
                .DeathDate = DeathDate.SelectedDate,
                .CreatedBy = txtenter.Text,
                .DateCreated = Now}

            madd.MemberDeaths.InsertOnSubmit(saveInfo)
            madd.SubmitChanges()

        ElseIf Not checkName Then
            'add to death table

            'add to death table
            Dim saveInfo As New MemberDeath With { _
                .MemeberName = txtMemeber.Text, _
                .PhoneNumer = txtPhone.Text, _
                .Description = txtdesp.Text, _
                .DeathDate = DeathDate.SelectedDate, _
                .CreatedBy = txtenter.Text, _
                .DateCreated = Now}

            madd.MemberDeaths.InsertOnSubmit(saveInfo)
            madd.SubmitChanges()
        End If

        CBMember.DataBind()
        CBMember.Items.Insert(0, New ListItem("Select"))
        CBMember.SelectedIndex = 0

        txtPhone.Text = ""
        txtMemeber.Text = ""
        txtdesp.Text = ""
        DeathDate.Clear()

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Record has been saved. Bye to this member.')", True)
        GridUnit.DataBind()
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        CBMember.DataBind()
        CBMember.Items.Insert(0, New ListItem("Select"))
        CBMember.SelectedIndex = 0

        txtPhone.Text = ""
        txtMemeber.Text = ""
        txtdesp.Text = ""
        DeathDate.Clear()

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


            ' txtchurchid.Text = ""
            txtenter.Text = name.ToUpper

            CBMember.DataBind()
            CBMember.Items.Insert(0, New ListItem("Select"))
            CBMember.SelectedIndex = 0


            If lbChurchName.Text = "" Then
                 Response.Redirect("Login.aspx")
                Exit Sub
            End If
        End If
    End Sub

    Protected Sub CBMember_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CBMember.SelectedIndexChanged
        Dim firstname = madd.MembershipTables.Where(Function(w) w.SN = CBMember.SelectedValue).SingleOrDefault.FirstName
        Dim lastNamee = madd.MembershipTables.Where(Function(w) w.SN = CBMember.SelectedValue).SingleOrDefault.LastName

        txtMemeber.Text = firstname & " " & lastNamee

        txtPhone.Text = madd.MembershipTables.Where(Function(w) w.SN = CBMember.SelectedValue).SingleOrDefault.Phone1
        If txtPhone.Text Is Nothing Then
            txtPhone.Text = madd.MembershipTables.Where(Function(w) w.SN = CBMember.SelectedValue).SingleOrDefault.Phone2
        Else
            txtPhone.Text = madd.MembershipTables.Where(Function(w) w.SN = CBMember.SelectedValue).SingleOrDefault.Phone1
        End If
    End Sub
End Class
