
Partial Class ViewSchool
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
        Response.Redirect("BibleSchool.aspx")
    End Sub

    Protected Sub DrpSorted_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpSorted.SelectedIndexChanged
        txtSelectedDate.Text = ""
        If DrpSorted.SelectedValue = "Class" Then
            DrpDate.Visible = True
            GrdAscending.Visible = False
            gridClass.Visible = True
            GridFirstName.Visible = False
            GridWeek.Visible = False
            GridSession.Visible = False
            Dim OrderDate = From y In madd.ClassTables
                            Group By y.Classname Into gr = Group
                                    Select [Classname] Order By [Classname] Ascending

            DrpDate.DataSource = OrderDate
            DrpDate.DataBind()
            DrpDate.Items.Insert(0, New ListItem("Select"))
            DrpDate.SelectedIndex = 0

        ElseIf DrpSorted.SelectedValue = "Ascending" Then
            DrpDate.Visible = False
            GrdAscending.Visible = True
            gridClass.Visible = False
            GridFirstName.Visible = False
            GridWeek.Visible = False
            GridSession.Visible = False
        ElseIf DrpSorted.SelectedValue = "FirstName" Then
            DrpDate.Visible = True
            GrdAscending.Visible = False
            gridClass.Visible = False
            GridFirstName.Visible = True
            GridWeek.Visible = False
            GridSession.Visible = False

            Dim services = From y In madd.ClassTables
                           Group By y.FirstName Into gr = Group
                                   Select [FirstName] Order By [FirstName] Ascending

            'Dim services = madd.OrderServiceTables.Select(Function(f) f.ServicesName).Distinct

            DrpDate.DataSource = services
            DrpDate.DataBind()
            DrpDate.Items.Insert(0, New ListItem("Select"))
            DrpDate.SelectedIndex = 0

        ElseIf DrpSorted.SelectedValue = "Week" Then
            DrpDate.Visible = True
            GrdAscending.Visible = False
            gridClass.Visible = False
            GridFirstName.Visible = False
            GridWeek.Visible = True
            GridSession.Visible = False
            Dim services = From y In madd.ClassTables
                           Group By y.Week Into gr = Group
                                   Select [Week] Order By [Week] Ascending

            'Dim services = madd.OrderServiceTables.Select(Function(f) f.ServicesName).Distinct

            DrpDate.DataSource = services
            DrpDate.DataBind()
            DrpDate.Items.Insert(0, New ListItem("Select"))
            DrpDate.SelectedIndex = 0
        ElseIf DrpSorted.SelectedValue = "Session" Then
            DrpDate.Visible = True
            GrdAscending.Visible = False
            gridClass.Visible = False
            GridFirstName.Visible = False
            GridWeek.Visible = False
            GridSession.Visible = True
            Dim services = From y In madd.ClassTables
                           Group By y.Session Into gr = Group
                                   Select [Session] Order By [Session] Ascending

            'Dim services = madd.OrderServiceTables.Select(Function(f) f.ServicesName).Distinct

            DrpDate.DataSource = services
            DrpDate.DataBind()
            DrpDate.Items.Insert(0, New ListItem("Select"))
            DrpDate.SelectedIndex = 0
        End If
    End Sub
    Protected Sub GrdAscending_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GrdAscending.RowCommand
        If e.CommandName = "DeleteMinstersID" Then
            If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
                Dim SNID As Integer = Convert.ToInt32(e.CommandArgument)

                Dim checkFunctional = (From s In madd.ClassTables
                                       Where (s.SN = SNID)
                                       Select s).Any

                If checkFunctional Then
                    Dim deleteInfo = (From s In madd.ClassTables
                                      Where (s.SN = SNID)
                                      Select s).SingleOrDefault

                    madd.ClassTables.DeleteOnSubmit(deleteInfo)
                    madd.SubmitChanges()
                End If

                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Deleted.');", True)
                GrdAscending.DataBind()
                ' End If

            End If
        End If
    End Sub
End Class
