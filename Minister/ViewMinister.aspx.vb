
Partial Class ViewMinister
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim userName As String = User.Identity.Name
            txtChurchDetailID.Text = ""
            GVTitle0.Visible = False
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

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID
            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName


            DrpCriteria.DataBind()
            DrpCriteria.Items.Insert(0, New ListItem("Select"))
            DrpCriteria.SelectedIndex = 0


            GVPost.Visible = False
            GVAllMinister.Visible = True
            GVTitle.Visible = False


            DrpCriteria2.DataBind()
            DrpCriteria2.Items.Insert(0, New ListItem("Select"))
            DrpCriteria2.SelectedIndex = 0

            DrpChurch.Visible = False

            DrpChurch.DataBind()
            DrpChurch.Items.Insert(0, New ListItem("Select"))
            DrpChurch.SelectedIndex = 0
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
    Protected Sub DrpCriteria_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpCriteria.SelectedIndexChanged
        If DrpCriteria.SelectedValue = "Ascending" Then
            DrpChurch.Visible = False
            GVPost.Visible = False
            GVAllMinister.Visible = True
            GVTitle.Visible = False
            DrpCriteria2.Visible = False
            txtChurchDetailID.Text = ""
            GVTitle0.Visible = False
        ElseIf DrpCriteria.SelectedValue = "Title" Then
            GVPost.Visible = False
            GVAllMinister.Visible = False
            DrpCriteria2.Visible = True
            DrpChurch.Visible = False

            txtChurchDetailID.Text = ""
            Dim qryTitle = madd.MinisterTables.Select(Function(f) f.Title).Distinct

            DrpCriteria2.DataSource = qryTitle
            DrpCriteria2.DataBind()
            DrpCriteria2.Items.Insert(0, New ListItem("Select"))
            DrpCriteria2.SelectedIndex = 0

            GVTitle.Visible = True
            GVTitle0.Visible = False
        ElseIf DrpCriteria.SelectedValue = "Post" Then
            txtChurchDetailID.Text = ""
            GVAllMinister.Visible = False
            DrpCriteria2.Visible = True
            GVTitle.Visible = False
            DrpChurch.Visible = False

            ' Dim qrypost = madd.MinisterTables.Select(Function(f) f.Post).Distinct

            Dim qrypost = From t In madd.MinisterTables Join
                           d In madd.DutyTables On t.Post Equals d.Dutyid
                           Where t.Title = "Member"
                           Select d.DutyName()

            DrpCriteria2.DataSource = qrypost
            DrpCriteria2.DataBind()
            DrpCriteria2.Items.Insert(0, New ListItem("Select"))
            DrpCriteria2.SelectedIndex = 0

            GVPost.Visible = True

            GVTitle0.Visible = False
        End If

    End Sub

   
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("AddMinisters.aspx")
    End Sub

    Protected Sub DrpCriteria2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpCriteria2.SelectedIndexChanged
        If DrpCriteria2.SelectedValue = "Member" Then
            DrpChurch.Visible = False
            GVTitle0.Visible = False
        ElseIf DrpCriteria2.SelectedValue = "None Church Member" Then
            DrpChurch.Visible = True
            Dim qryChurch = From t In madd.MinisterTables Join
                           d In madd.ChurchDetailTables On t.ChurchDetailID Equals d.ChurchDetailID
                           Where t.PastorsTypes = "None Church Member"
                           Select d.ChurchName

            DrpChurch.DataSource = qryChurch
            DrpChurch.DataBind()
            DrpChurch.Items.Insert(0, New ListItem("Select"))
            DrpChurch.SelectedIndex = 0

            GVTitle0.Visible = True
        End If
    End Sub
    Protected Sub GVAllMinister_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GVAllMinister.RowCommand
        If e.CommandName = "DeleteMinstersID" Then
            If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
                Dim SNID As Integer = Convert.ToInt32(e.CommandArgument)
                Dim MinisterName = madd.MinisterTables.Where(Function(s) s.SN = SNID).SingleOrDefault.Name
                'Dim checkMinister = madd.MinisterTables.Where(Function(s) s.SN = SNID).Any

                'If checkMinister Then
                '    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Are you sure you wan t to delete?');", True)

                'Else
                Dim checkMini = (From s In madd.MinisterTables
                                     Where (s.SN = SNID)
                                     Select s).Any

                    If checkMini Then
                        Dim deleteInfo = (From s In madd.MinisterTables
                                          Where (s.SN = SNID)
                                          Select s).SingleOrDefault

                        madd.MinisterTables.DeleteOnSubmit(deleteInfo)
                        madd.SubmitChanges()
                    End If

                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('" & MinisterName & " was deleted.');", True)
                GVAllMinister.DataBind()
                    ' End If

                End If
        End If
    End Sub
    Protected Sub GVAllMinister_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVAllMinister.SelectedIndexChanged
        'edit minister
        TXTSN.Text = GVAllMinister.SelectedRow.Cells(0).Text
        Session("MinistersID") = TXTSN.Text
        Response.Redirect("EditMinisters.aspx")
    End Sub
    Protected Sub GVTitle_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVTitle.SelectedIndexChanged
        'edit minister
        TXTSN.Text = GVTitle.SelectedRow.Cells(0).Text
        Session("MinistersID") = TXTSN.Text
        Response.Redirect("EditMinisters.aspx")
    End Sub
    Protected Sub GVTitle0_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVTitle0.SelectedIndexChanged
        'edit minister
        TXTSN.Text = GVTitle0.SelectedRow.Cells(0).Text
        Session("MinistersID") = TXTSN.Text
        Response.Redirect("EditMinisters.aspx")
    End Sub
    Protected Sub GVPost_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVPost.SelectedIndexChanged
        'edit minister
        TXTSN.Text = GVPost.SelectedRow.Cells(0).Text
        Session("MinistersID") = TXTSN.Text
        Response.Redirect("EditMinisters.aspx")
    End Sub
    Protected Sub GVTitle_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GVTitle.RowCommand
        If e.CommandName = "DeleteMinstersID" Then
            If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
                Dim SNID As Integer = Convert.ToInt32(e.CommandArgument)
                Dim MinisterName = madd.MinisterTables.Where(Function(s) s.SN = SNID).SingleOrDefault.Name
                'Dim checkMinister = madd.MinisterTables.Where(Function(s) s.SN = SNID).Any

                'If checkMinister Then
                '    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Are you sure you wan t to delete?');", True)

                'Else
                Dim checkMini = (From s In madd.MinisterTables
                                 Where (s.SN = SNID)
                                 Select s).Any

                If checkMini Then
                    Dim deleteInfo = (From s In madd.MinisterTables
                                      Where (s.SN = SNID)
                                      Select s).SingleOrDefault

                    madd.MinisterTables.DeleteOnSubmit(deleteInfo)
                    madd.SubmitChanges()
                End If

                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('" & MinisterName & " was deleted.');", True)
                GVTitle.DataBind()
                ' End If

            End If
        End If
    End Sub
    Protected Sub GVTitle0_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GVTitle0.RowCommand
        If e.CommandName = "DeleteMinstersID" Then
            If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
                Dim SNID As Integer = Convert.ToInt32(e.CommandArgument)
                Dim MinisterName = madd.MinisterTables.Where(Function(s) s.SN = SNID).SingleOrDefault.Name
                'Dim checkMinister = madd.MinisterTables.Where(Function(s) s.SN = SNID).Any

                'If checkMinister Then
                '    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Are you sure you wan t to delete?');", True)

                'Else
                Dim checkMini = (From s In madd.MinisterTables
                                 Where (s.SN = SNID)
                                 Select s).Any

                If checkMini Then
                    Dim deleteInfo = (From s In madd.MinisterTables
                                      Where (s.SN = SNID)
                                      Select s).SingleOrDefault

                    madd.MinisterTables.DeleteOnSubmit(deleteInfo)
                    madd.SubmitChanges()
                End If

                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('" & MinisterName & " was deleted.');", True)
                GVTitle0.DataBind()
                ' End If

            End If
        End If
    End Sub
    Protected Sub GVPost_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GVPost.RowCommand
        If e.CommandName = "DeleteMinstersID" Then
            If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
                Dim SNID As Integer = Convert.ToInt32(e.CommandArgument)
                Dim MinisterName = madd.MinisterTables.Where(Function(s) s.SN = SNID).SingleOrDefault.Name
                'Dim checkMinister = madd.MinisterTables.Where(Function(s) s.SN = SNID).Any

                'If checkMinister Then
                '    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Are you sure you wan t to delete?');", True)

                'Else
                Dim checkMini = (From s In madd.MinisterTables
                                 Where (s.SN = SNID)
                                 Select s).Any

                If checkMini Then
                    Dim deleteInfo = (From s In madd.MinisterTables
                                      Where (s.SN = SNID)
                                      Select s).SingleOrDefault

                    madd.MinisterTables.DeleteOnSubmit(deleteInfo)
                    madd.SubmitChanges()
                End If

                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('" & MinisterName & " was deleted.');", True)
                GVPost.DataBind()
                ' End If

            End If
        End If
    End Sub
End Class
