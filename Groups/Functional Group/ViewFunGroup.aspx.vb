
Partial Class ViewFunGroup
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

        End If
    End Sub
    Protected Sub DrpCriteria_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpCriteria.SelectedIndexChanged
        If DrpCriteria.SelectedValue = "Ascending" Then
            txtSearch.Text = ""
            gridGroup.Visible = True
            DrpCriteria2.Visible = False
            GridFungroup.Visible = False
            GridCommitees.Visible = False

        ElseIf DrpCriteria.SelectedValue = "Functional Group" Then
            gridGroup.Visible = False
            DrpCriteria2.Visible = True
            GridCommitees.Visible = False
            txtSearch.Text = ""

            Dim qrygroup = madd.MembersGroups.Select(Function(f) f.GroupName).Distinct

            DrpCriteria2.DataSource = qrygroup
            DrpCriteria2.DataBind()
            DrpCriteria2.Items.Insert(0, New ListItem("Select"))
            DrpCriteria2.SelectedIndex = 0

            GridFungroup.Visible = False

        ElseIf DrpCriteria.SelectedValue = "Committees" Then
            gridGroup.Visible = False
            DrpCriteria2.Visible = True
            GridFungroup.Visible = False
            txtSearch.Text = ""
            Dim qrycommitees = madd.CommTables.Select(Function(f) f.ComName).Distinct

            DrpCriteria2.DataSource = qrycommitees
            DrpCriteria2.DataBind()
            DrpCriteria2.Items.Insert(0, New ListItem("Select"))
            DrpCriteria2.SelectedIndex = 0
            GridCommitees.Visible = False

        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("FunctionalGroup.aspx")
    End Sub

    Protected Sub DrpCriteria2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpCriteria2.SelectedIndexChanged
        If DrpCriteria.SelectedValue = "Committees" Then
            If DrpCriteria2.SelectedValue = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, select committee !!!')", True)
                Exit Sub
            Else
                txtSearch.Text = DrpCriteria2.SelectedValue
                GridCommitees.DataBind()
                GridCommitees.Visible = True
                GridFungroup.Visible = False
            End If
        ElseIf DrpCriteria.SelectedValue = "Functional Group" Then
            If DrpCriteria2.SelectedValue = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, select funcrional group !!!')", True)
                Exit Sub
            Else
                txtSearch.Text = DrpCriteria2.SelectedValue
                GridFungroup.DataBind()
                GridFungroup.Visible = True
                GridCommitees.Visible = False
            End If
        End If
    End Sub
    Protected Sub gridGroup_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gridGroup.RowCommand
        If e.CommandName = "DeleteMinstersID" Then
            If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
                Dim SNID As Integer = Convert.ToInt32(e.CommandArgument)
                Dim Name = madd.FunctionalGroupTables.Where(Function(s) s.SN = SNID).SingleOrDefault.Name

                Dim checkFunctional = (From s In madd.FunctionalGroupTables
                                       Where (s.SN = SNID)
                                       Select s).Any

                If checkFunctional Then
                    Dim deleteInfo = (From s In madd.FunctionalGroupTables
                                      Where (s.SN = SNID)
                                      Select s).SingleOrDefault

                    madd.FunctionalGroupTables.DeleteOnSubmit(deleteInfo)
                    madd.SubmitChanges()
                End If

                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('" & Name & " was deleted.');", True)
                gridGroup.DataBind()
                ' End If

            End If
        End If
    End Sub
End Class
