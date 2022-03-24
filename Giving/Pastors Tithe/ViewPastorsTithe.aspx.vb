
Partial Class ViewTithe
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

        If DrpSorted.SelectedValue = "Member Name" Then
            Dim checkName = madd.TitheTables.Where(Function(q) q.Membername = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                DrpDate.Visible = False
                gridAscending.Visible = False
                GridTitheNo.Visible = False
                gridDate.Visible = False
                GridMember.Visible = True
                GridWeek.Visible = False
                GridMonth.Visible = False
                GridPhone.Visible = False
                Button1.Visible = True
                txtcriteria.Visible = True
            End If


        ElseIf DrpSorted.SelectedValue = "Phone Number" Then
            Dim checkName = madd.TitheTables.Where(Function(q) q.PhoneNumber = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                DrpDate.Visible = False
                gridAscending.Visible = False
                GridTitheNo.Visible = False
                gridDate.Visible = False
                GridMember.Visible = False
                GridWeek.Visible = False
                GridMonth.Visible = False
                GridPhone.Visible = True
                Button1.Visible = True
                txtcriteria.Visible = True
            End If
        ElseIf DrpSorted.SelectedValue = "TitheNo" Then
            Dim checkName = madd.TitheTables.Where(Function(q) q.TitheNo = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                DrpDate.Visible = False
                gridAscending.Visible = False
                GridTitheNo.Visible = True
                gridDate.Visible = False
                GridMember.Visible = False
                GridWeek.Visible = False
                GridMonth.Visible = False
                GridPhone.Visible = False
                Button1.Visible = True
                txtcriteria.Visible = True
            End If
        ElseIf DrpSorted.SelectedValue = "Year" Then
            Dim checkName = madd.TitheTables.Where(Function(q) q.Year = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                DrpDate.Visible = False
                gridAscending.Visible = False
                GridTitheNo.Visible = False
                gridDate.Visible = False
                GridMember.Visible = False
                GridWeek.Visible = False
                GridMonth.Visible = False
                GridPhone.Visible = False
                Button1.Visible = True
                txtcriteria.Visible = True
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

        End If

    End Sub


    Protected Sub DrpSorted_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpSorted.SelectedIndexChanged
        txtSelectedDate.Text = ""
        txtcriteria.Text = ""
        If DrpSorted.SelectedValue = "Date Created" Then
            DrpDate.Visible = True
            gridAscending.Visible = False
            GridTitheNo.Visible = False
            GridMember.Visible = False
            GridWeek.Visible = False
            GridMonth.Visible = False
            GridPhone.Visible = False
            Button1.Visible = False
            txtcriteria.Visible = False
            Dim OrderDate = From y In madd.PastorsTitheTables
                            Group By y.Datecreated Into gr = Group
                                    Select [Datecreated] Order By [Datecreated] Ascending

            DrpDate.DataSource = OrderDate
            DrpDate.DataBind()
            DrpDate.Items.Insert(0, New ListItem("Select"))
            DrpDate.SelectedIndex = 0

        ElseIf DrpSorted.SelectedValue = "Ascending" Then
            DrpDate.Visible = False
            gridAscending.Visible = True
            GridTitheNo.Visible = False
            gridDate.Visible = False
            GridMember.Visible = False
            GridWeek.Visible = False
            GridMonth.Visible = False
            GridPhone.Visible = False
            Button1.Visible = False
            txtcriteria.Visible = False
        ElseIf DrpSorted.SelectedValue = "Month" Then
            DrpDate.Visible = True
            gridAscending.Visible = False
            GridTitheNo.Visible = False
            gridDate.Visible = False
            GridMember.Visible = False
            GridWeek.Visible = False
            GridMonth.Visible = True
            GridPhone.Visible = False
            Button1.Visible = False
            txtcriteria.Visible = False
            Dim services = From y In madd.PastorsTitheTables
                           Group By y.Month Into gr = Group
                                   Select [Month] Order By [Month] Ascending

            'Dim services = madd.OrderServiceTables.Select(Function(f) f.ServicesName).Distinct

            DrpDate.DataSource = services
            DrpDate.DataBind()
            DrpDate.Items.Insert(0, New ListItem("Select"))
            DrpDate.SelectedIndex = 0

        ElseIf DrpSorted.SelectedValue = "Week" Then
            DrpDate.Visible = True
            gridAscending.Visible = False
            GridTitheNo.Visible = False
            gridDate.Visible = False
            GridMember.Visible = False
            GridWeek.Visible = True
            GridMonth.Visible = False
            GridPhone.Visible = False
            Button1.Visible = False
            txtcriteria.Visible = False
            Dim services = From y In madd.PastorsTitheTables
                           Group By y.Week Into gr = Group
                                   Select [Week] Order By [Week] Ascending

            'Dim services = madd.OrderServiceTables.Select(Function(f) f.ServicesName).Distinct

            DrpDate.DataSource = services
            DrpDate.DataBind()
            DrpDate.Items.Insert(0, New ListItem("Select"))
            DrpDate.SelectedIndex = 0

        ElseIf DrpSorted.SelectedValue = "Pastors Name" Then
            DrpDate.Visible = False
            gridAscending.Visible = False
            GridTitheNo.Visible = False
            gridDate.Visible = False
            GridMember.Visible = True
            GridWeek.Visible = False
            GridMonth.Visible = False
            GridPhone.Visible = False
            Button1.Visible = True
            txtcriteria.Visible = True

        ElseIf DrpSorted.SelectedValue = "Phone Number" Then
            DrpDate.Visible = False
            gridAscending.Visible = False
            GridTitheNo.Visible = False
            gridDate.Visible = False
            GridMember.Visible = False
            GridWeek.Visible = False
            GridMonth.Visible = False
            GridPhone.Visible = True
            Button1.Visible = True
            txtcriteria.Visible = True

        ElseIf DrpSorted.SelectedValue = "Tithe No" Then
            DrpDate.Visible = False
            gridAscending.Visible = False
            GridTitheNo.Visible = True
            gridDate.Visible = False
            GridMember.Visible = False
            GridWeek.Visible = False
            GridMonth.Visible = False
            GridPhone.Visible = False
            Button1.Visible = True
            txtcriteria.Visible = True

        ElseIf DrpSorted.SelectedValue = "Year" Then
            DrpDate.Visible = False
            gridAscending.Visible = False
            GridTitheNo.Visible = False
            gridDate.Visible = False
            GridMember.Visible = False
            GridWeek.Visible = False
            GridMonth.Visible = False
            GridPhone.Visible = False
            Button1.Visible = True
            txtcriteria.Visible = True
        End If

    End Sub

    Protected Sub DrpDate_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpDate.SelectedIndexChanged
        Dim dateSelected As Date
        If DrpSorted.SelectedValue = "" Then
            'message
            Exit Sub
        ElseIf DrpSorted.SelectedValue = "Date Created" Then
            dateSelected = CDate(DrpDate.SelectedValue)
            txtSelectedDate.Text = Format(dateSelected, "yyyy-MM-dd")

            gridDate.Visible = True
            gridAscending.Visible = False
            GridTitheNo.Visible = False
            GridMember.Visible = False
            GridWeek.Visible = False
            GridMonth.Visible = False
            GridPhone.Visible = False
            Button1.Visible = False
            txtcriteria.Visible = False
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Response.Redirect("PastorsTithe.aspx")
    End Sub
End Class
