
Partial Class ViewDedication
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
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("Dedication.aspx")
    End Sub
 
    Protected Sub DrpSorted_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpSorted.SelectedIndexChanged
        txtSelectedDate.Text = ""
     If DrpSorted.SelectedValue = "Ascending" Then
            DrpDate.Visible = False
            GridAscending.Visible = True
            GridMonth.Visible = False
        ElseIf DrpSorted.SelectedValue = "Month" Then
            DrpDate.Visible = True
            GridAscending.Visible = False
            GridMonth.Visible = True

            Dim services = From y In madd.DedicationTables
                           Group By y.Month Into gr = Group
                                   Select [Month] Order By [Month] Ascending

            'Dim services = madd.OrderServiceTables.Select(Function(f) f.ServicesName).Distinct

            DrpDate.DataSource = services
            DrpDate.DataBind()
            DrpDate.Items.Insert(0, New ListItem("Select"))
            DrpDate.SelectedIndex = 0
        End If
    End Sub

    Protected Sub GridAscending_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridAscending.SelectedIndexChanged
        Dim getID = GridAscending.SelectedRow.Cells(0).Text

        Session("DedicationID") = getID

        Response.Redirect("DedicationEdit.aspx")

    End Sub
End Class
