
Partial Class ViewVisitor
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

            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID

            txtLocation.Text = madd.Locations.Where(Function(s) s.Name = lbLocation.Text).SingleOrDefault.Locationid

            DrpSorted.DataBind()
            DrpSorted.Items.Insert(0, New ListItem("Select"))
            DrpSorted.SelectedIndex = 0
            txtcriteria.Text = ""

            GrdVisitor.Visible = True
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
   
    Protected Sub DrpSorted_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpSorted.SelectedIndexChanged
        If DrpSorted.SelectedValue = "Ascending" Then
            txtcriteria.Text = ""
            GrdVisitor.Visible = True
            txtcriteria.Visible = False
            GrdvSurname.Visible = False
            GrdvPhn.Visible = False
            GrdvPhn.Visible = False
        ElseIf DrpSorted.SelectedValue = "Surname" Then
            txtcriteria.Text = ""
            GrdVisitor.Visible = False
            txtcriteria.Visible = True
            GrdvSurname.Visible = True
            GrdvPhn.Visible = False
        ElseIf DrpSorted.SelectedValue = "Firstname" Then
            txtcriteria.Text = ""
            GrdVisitor.Visible = False
            txtcriteria.Visible = True
            GrdvSurname.Visible = True
            GrdvPhn.Visible = False
        ElseIf DrpSorted.SelectedValue = "Phone Number" Then
            txtcriteria.Text = ""
            GrdVisitor.Visible = False
            txtcriteria.Visible = True
            GrdvSurname.Visible = False
            GrdvPhn.Visible = True
        End If
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        If DrpSorted.SelectedValue = "Surname" Then
            Dim checkName = madd.AddvisitorTables.Where(Function(q) q.Lastname = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                GrdVisitor.Visible = False
                GrdvPhn.Visible = False
                GrdvSurname.Visible = True

            End If

        ElseIf DrpSorted.SelectedValue = "Firstname" Then
            Dim checkName = madd.AddvisitorTables.Where(Function(q) q.Firstname = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                GrdVisitor.Visible = False
                GrdvSurname.Visible = False
                GrdvPhn.Visible = False
                GrdvFirstname.Visible = True
            End If

        ElseIf DrpSorted.SelectedValue = "Phone Number" Then
            Dim checkName = madd.AddvisitorTables.Where(Function(q) q.Phone = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                GrdVisitor.Visible = False
                GrdvSurname.Visible = False
                GrdvFirstname.Visible = False
                GrdvPhn.Visible = True


            End If


        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("AddVisitor.aspx")
    End Sub
    Protected Sub GrdVisitor_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GrdVisitor.RowCommand
        If e.CommandName = "DeleteMinstersID" Then
            If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
                Dim SNID As Integer = Convert.ToInt32(e.CommandArgument)
                Dim FName = madd.AddvisitorTables.Where(Function(s) s.SN = SNID).SingleOrDefault.Firstname
                Dim LName = madd.AddvisitorTables.Where(Function(s) s.SN = SNID).SingleOrDefault.Lastname

                Dim Name = FName & " " & LName
                Dim checkFunctional = (From s In madd.AddvisitorTables
                                       Where (s.SN = SNID)
                                       Select s).Any

                If checkFunctional Then
                    Dim deleteInfo = (From s In madd.AddvisitorTables
                                      Where (s.SN = SNID)
                                      Select s).SingleOrDefault

                    madd.AddvisitorTables.DeleteOnSubmit(deleteInfo)
                    madd.SubmitChanges()
                End If

                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('" & Name & " was deleted.');", True)
                GrdVisitor.DataBind()
                ' End If

            End If
        End If
    End Sub
End Class
