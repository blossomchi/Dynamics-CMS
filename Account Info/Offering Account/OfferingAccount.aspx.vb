
Partial Class OfferingAccount
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
            txtStaffID.Text = Session("StaffID")
            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID

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
        txtSelectedDate.Text = ""
        If DrpSorted.SelectedValue = "Transcation Date" Then
            DrpDate.Visible = True
            gridOffering.Visible = False
            gridincome.Visible = False
            Dim OrderDate = From y In madd.IncomeAccountTables
                            Group By y.TranscationDate Into gr = Group
                                    Select [TranscationDate] Order By [TranscationDate] Ascending

            DrpDate.DataSource = OrderDate
            DrpDate.DataBind()
            DrpDate.Items.Insert(0, New ListItem("Select"))
            DrpDate.SelectedIndex = 0

        ElseIf DrpSorted.SelectedValue = "Ascending" Then
            DrpDate.Visible = False
            gridOffering.Visible = True
            gridincome.Visible = False
            gridDate.Visible = False
        ElseIf DrpSorted.SelectedValue = "Income" Then
            DrpDate.Visible = True
            gridincome.Visible = True
            gridOffering.Visible = False
            gridDate.Visible = False

            Dim services = From y In madd.IncomeTables
                           Group By y.Income Into gr = Group
                                   Select [Income] Order By [income] Ascending

            'Dim services = madd.OrderServiceTables.Select(Function(f) f.ServicesName).Distinct

            DrpDate.DataSource = services
            DrpDate.DataBind()
            DrpDate.Items.Insert(0, New ListItem("Select"))
            DrpDate.SelectedIndex = 0
        End If
    End Sub

    Protected Sub DrpDate_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpDate.SelectedIndexChanged
        Dim dateSelected As Date
        If DrpSorted.SelectedValue = "" Then
            'message
            Exit Sub
        ElseIf DrpSorted.SelectedValue = "Transcation Date" Then
            dateSelected = CDate(DrpDate.SelectedValue)
            txtSelectedDate.Text = Format(dateSelected, "yyyy-MM-dd")

            gridDate.Visible = True
            gridOffering.Visible = False
        End If
    End Sub
End Class
