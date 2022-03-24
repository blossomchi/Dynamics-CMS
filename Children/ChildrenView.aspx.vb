
Partial Class ChildrenView
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
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("Children.aspx")
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


            txtchurchID.Text = ""


            If lbChurchName.Text = "" Then
                 Response.Redirect("Login.aspx")
                Exit Sub
            End If
            txtStaffID.Text = Session("StaffID")
            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID
            txtcriteria.Visible = False


        End If

    End Sub

    Protected Sub DrpSorted_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpSorted.SelectedIndexChanged

        If DrpSorted.SelectedValue = "Ascending" Then
            txtcriteria.Text = ""
            OtherDetailsGV.Visible = False
            GrdAscending.Visible = True
            txtcriteria.Visible = False
            GrdvPhn.Visible = False
            GrdvPhn.Visible = False
            GrdGender.Visible = False
            CBFamilyname.Visible = False
            CBFunctionalGroup.Visible = False
        ElseIf DrpSorted.SelectedValue = "FamilyName" Then
            txtcriteria.Text = ""
            GrdAscending.Visible = False
            OtherDetailsGV.Visible = False
            txtcriteria.Visible = False
            GrdvPhn.Visible = False
            GrdGender.Visible = False
            GrdvFirstname.Visible = False
            GrdFamilyName.Visible = True
            CBFamilyname.Visible = True

            CBFamilyname.Items.Remove("Select")
            CBFamilyname.DataBind()
            CBFamilyname.Items.Insert(0, New ListItem("Select"))
            CBFamilyname.SelectedIndex = 0

            CBFunctionalGroup.Visible = False
        ElseIf DrpSorted.SelectedValue = "FirstName" Then
            txtcriteria.Text = ""
            GrdAscending.Visible = False
            OtherDetailsGV.Visible = False
            txtcriteria.Visible = True
            GrdvPhn.Visible = False
            GrdGender.Visible = False
            GrdvFirstname.Visible = True
            GrdFamilyName.Visible = False
            CBFamilyname.Visible = False
            CBFunctionalGroup.Visible = False
        ElseIf DrpSorted.SelectedValue = "Functional Group" Then
            txtcriteria.Text = ""
            GrdAscending.Visible = False
            OtherDetailsGV.Visible = False
            txtcriteria.Visible = False
            GrdvPhn.Visible = False
            GrdGender.Visible = False
            GrdvFirstname.Visible = False
            GrdFamilyName.Visible = False
            CBFamilyname.Visible = False
            CBFunctionalGroup.Visible = True

            CBFunctionalGroup.Items.Remove("Select")
            CBFunctionalGroup.DataBind()
            CBFunctionalGroup.Items.Insert(0, New ListItem("Select"))
            CBFunctionalGroup.SelectedIndex = 0

        ElseIf DrpSorted.SelectedValue = "Phone Number" Then
            txtcriteria.Text = ""
            GrdAscending.Visible = False
            OtherDetailsGV.Visible = False
            txtcriteria.Visible = True
            GrdvPhn.Visible = True
            GrdGender.Visible = False
            GrdvFirstname.Visible = False
            GrdFamilyName.Visible = False
            CBFamilyname.Visible = False
            CBFunctionalGroup.Visible = False
        ElseIf DrpSorted.SelectedValue = "Gender" Then
            txtcriteria.Text = ""
            GrdAscending.Visible = False
            txtcriteria.Visible = True
            GrdGender.Visible = True
            OtherDetailsGV.Visible = False
            GrdvPhn.Visible = False
            GrdvFirstname.Visible = False
            GrdFamilyName.Visible = False
            CBFamilyname.Visible = False
            CBFunctionalGroup.Visible = False
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If DrpSorted.SelectedValue = "FamilyName" Then
            If CBFamilyname.SelectedValue = "Select" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, select family name!!!')", True)
                Exit Sub
            Else
                txtcriteria.Text = CBFamilyname.SelectedValue
                Dim checkName = madd.ChildrenTables.Where(Function(q) q.Familyname = txtcriteria.Text).Any

                If Not checkName Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
                ElseIf checkName Then
                    GrdFamilyName.Visible = True
                    GrdAscending.Visible = False
                    OtherDetailsGV.Visible = False
                    txtcriteria.Visible = False
                    GrdvPhn.Visible = False
                    GrdGender.Visible = False
                    GrdvFirstname.Visible = False
                    CBFunctionalGroup.Visible = False
                End If
            End If
        ElseIf DrpSorted.SelectedValue = "FirstName" Then
            Dim checkName = madd.ChildrenTables.Where(Function(q) q.Firstname = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                GrdAscending.Visible = False
                OtherDetailsGV.Visible = False
                txtcriteria.Visible = True
                GrdvPhn.Visible = False
                GrdGender.Visible = False
                GrdvFirstname.Visible = True
                GrdFamilyName.Visible = False
                CBFunctionalGroup.Visible = False
                CBFamilyname.Visible = False
            End If

        ElseIf DrpSorted.SelectedValue = "Phone Number" Then
            Dim checkName = madd.ChildrenTables.Where(Function(q) q.Phone = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                GrdAscending.Visible = False
                OtherDetailsGV.Visible = False
                txtcriteria.Visible = True
                GrdvPhn.Visible = True
                GrdGender.Visible = False
                GrdvFirstname.Visible = False
                GrdFamilyName.Visible = False
                CBFunctionalGroup.Visible = False
                CBFamilyname.Visible = False
            End If
        ElseIf DrpSorted.SelectedValue = "Functional Group" Then
            If CBFunctionalGroup.SelectedValue = "Select" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, select group!!!')", True)
                Exit Sub
            Else
                txtcriteria.Text = CBFunctionalGroup.SelectedValue

                Dim checkName = (From G In madd.ChildrenTables Join
                                    t In madd.MembersGroups On G.FunctiongroupID Equals t.ID
                                    Where t.GroupName = txtcriteria.Text).Any

                If Not checkName Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
                ElseIf checkName Then
                    GrdAscending.Visible = False
                    OtherDetailsGV.Visible = True
                    txtcriteria.Visible = False
                    GrdvPhn.Visible = False
                    GrdGender.Visible = False
                    GrdvFirstname.Visible = False
                    GrdFamilyName.Visible = False
                    CBFamilyname.Visible = False
                End If
            End If
           

        ElseIf DrpSorted.SelectedValue = "Gender" Then
            Dim checkName = madd.ChildrenTables.Where(Function(q) q.Gender = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                GrdAscending.Visible = False
                txtcriteria.Visible = True
                GrdGender.Visible = True
                OtherDetailsGV.Visible = False
                GrdvPhn.Visible = False
                GrdvFirstname.Visible = False
                GrdFamilyName.Visible = False
                CBFamilyname.Visible = False
                CBFunctionalGroup.Visible = False
            End If
        End If

    End Sub
    Protected Sub GrdAscending_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GrdAscending.SelectedIndexChanged
        Dim getID = GrdAscending.SelectedRow.Cells(0).Text

        Session("MemberID") = getID

        Response.Redirect("EditChildren.aspx")
    End Sub
End Class
