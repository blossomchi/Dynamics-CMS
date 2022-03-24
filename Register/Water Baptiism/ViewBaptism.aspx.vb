
Partial Class Register
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


            txtchurchid.Text = ""


            If lbChurchName.Text = "" Then
                 Response.Redirect("Login.aspx")
                Exit Sub
            End If

            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            txtchurchid.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID


            txtcriteria.Text = ""

            GrdAscending.Visible = True
            txtcriteria.Visible = False
            GrdvSurname.Visible = False
            GrdvFirstname.Visible = False
            GrdvPhn.Visible = False
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
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("Baptism.aspx")
    End Sub

  
    Protected Sub DrpSorted_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpSorted.SelectedIndexChanged
        If DrpSorted.SelectedValue = "Ascending" Then
            txtcriteria.Text = ""
            GrdAscending.Visible = True
            txtcriteria.Visible = False
            GrdvSurname.Visible = False
            GrdvPhn.Visible = False
            GrdvPhn.Visible = False
            GrdGender.Visible = False
        ElseIf DrpSorted.SelectedValue = "Surname" Then
            txtcriteria.Text = ""
            GrdAscending.Visible = False
            txtcriteria.Visible = True
            GrdvSurname.Visible = True
            GrdvPhn.Visible = False
            GrdGender.Visible = False
            GrdvFirstname.Visible = False
        ElseIf DrpSorted.SelectedValue = "FirstName" Then
            txtcriteria.Text = ""
            GrdAscending.Visible = False
            txtcriteria.Visible = True
            GrdvSurname.Visible = False
            GrdvFirstname.Visible = True
            GrdvPhn.Visible = False
            GrdGender.Visible = False
        ElseIf DrpSorted.SelectedValue = "Phone Number" Then
            txtcriteria.Text = ""
            GrdAscending.Visible = False
            GrdvFirstname.Visible = False
            GrdvSurname.Visible = False
            txtcriteria.Visible = True
            GrdvPhn.Visible = True
            GrdGender.Visible = False
        ElseIf DrpSorted.SelectedValue = "Gender" Then
            txtcriteria.Text = ""
            GrdAscending.Visible = False
            GrdvFirstname.Visible = False
            GrdvSurname.Visible = False
            txtcriteria.Visible = True
            GrdvPhn.Visible = False
            GrdGender.Visible = True
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If DrpSorted.SelectedValue = "Surname" Then
            Dim checkName = madd.BaptismTables.Where(Function(q) q.LastName = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                GrdAscending.Visible = False
                GrdvPhn.Visible = False
                GrdvFirstname.Visible = False
                GrdvSurname.Visible = True
                GrdGender.Visible = False
            End If

        ElseIf DrpSorted.SelectedValue = "FirstName" Then
            Dim checkName = madd.BaptismTables.Where(Function(q) q.FirstName = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                GrdAscending.Visible = False
                GrdvPhn.Visible = False
                GrdvFirstname.Visible = True
                GrdvSurname.Visible = False
                GrdGender.Visible = False
            End If

        ElseIf DrpSorted.SelectedValue = "Phone Number" Then
            Dim checkName = madd.BaptismTables.Where(Function(q) q.PhoneNo = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                GrdAscending.Visible = False
                GrdvPhn.Visible = True
                GrdvFirstname.Visible = False
                GrdvSurname.Visible = False
                GrdGender.Visible = False
            End If

        ElseIf DrpSorted.SelectedValue = "Gender" Then
            Dim checkName = madd.BaptismTables.Where(Function(q) q.Gender = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                GrdAscending.Visible = False
                GrdvFirstname.Visible = False
                GrdvSurname.Visible = False
                txtcriteria.Visible = True
                GrdvPhn.Visible = False
                GrdGender.Visible = True
            End If

        End If

    End Sub

    Protected Sub GrdAscending_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GrdAscending.SelectedIndexChanged
        Dim getID = GrdAscending.SelectedRow.Cells(0).Text

        Session("BaptismID") = getID

        Response.Redirect("BaptismEdit.aspx")
    End Sub
End Class
