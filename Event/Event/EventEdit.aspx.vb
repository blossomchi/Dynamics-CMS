
Partial Class EventEdit
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
            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            txtMemID.Text = Session("EventID")


            drpPeriod.Items.Remove("SELECT")
            drpPeriod.DataBind()
            drpPeriod.Items.Insert(0, New ListItem("SELECT"))
            drpPeriod.SelectedIndex = 0


        End If
    End Sub
    Protected Sub FromIMG_Click(sender As Object, e As ImageClickEventArgs) Handles FromIMG.Click
        Calendar1.Visible = True
        Calendar1.SelectedDates.Clear()
        txtControl.Text = 1
    End Sub

    Protected Sub ToIMG_Click(sender As Object, e As ImageClickEventArgs) Handles ToIMG.Click
        Calendar1.Visible = True
        Calendar1.SelectedDates.Clear()
        txtControl.Text = 2
    End Sub

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        If txtControl.Text = 1 Then
            txtDate.Text = Calendar1.SelectedDate
        ElseIf txtControl.Text = 2 Then
            txtTo.Text = Calendar1.SelectedDate
        End If

        Calendar1.Visible = False
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("ViewEvent.aspx")
    End Sub
End Class
