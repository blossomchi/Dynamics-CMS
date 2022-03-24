
Partial Class ServicesEdit
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim userName As String = User.Identity.Name

            Dim getMemberID = madd.AuthenticalTables.Where(Function(f) f.Username = userName).SingleOrDefault.Memberid

            Dim name = madd.MembershipTables.Where(Function(d) d.Memberid = getMemberID).SingleOrDefault.FirstName

            Dim getChurch = (From y In madd.MembershipTables Join
                                h1 In madd.ChurchDetailTables On y.ChurchDetailID Equals h1.ChurchDetailID
                                Where y.Memberid = getMemberID
                                Select h1).SingleOrDefault.ChurchName


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
            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID
            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            txtMemID.Text = Session("Orderid")

            Dim getAllInfo = madd.OrderServiceTables.Where(Function(l) l.SN = txtMemID.Text).SingleOrDefault


            txtName.Text = getAllInfo.ServicesName
            txtfrom.Text = getAllInfo.Timefrom
            txtTo.Text = getAllInfo.TimeTo
            txtprogram.Text = getAllInfo.Program
            txtModerator.Text = getAllInfo.Moderator
            txtDate.Text = getAllInfo.Date
            txtMembername.Text = getAllInfo.Updatedby







            Dim h As String = String.Empty
            h = getAllInfo.Period
            If h = String.Empty Then
                drpPeriod.DataBind()
                drpPeriod.Items.Insert(0, New ListItem("Select"))
                drpPeriod.SelectedIndex = 0
            ElseIf h <> String.Empty Then
                drpPeriod.DataBind()
                drpPeriod.SelectedValue = h
            End If
        

        

        End If
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("ViewServices.aspx")
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        'update syntax
        Dim updateservice = madd.OrderServiceTables.Where(Function(h) h.SN = txtMemID.Text).SingleOrDefault

        updateservice.Date = txtDate.Text
        updateservice.Moderator = txtModerator.Text
        updateservice.Period = drpPeriod.SelectedValue
        updateservice.Program = txtprogram.Text
        updateservice.ServicesName = txtName.Text
        updateservice.Timefrom = txtfrom.Text
        updateservice.TimeTo = txtTo.Text
        updateservice.Updatedby = txtMembername.Text

        madd.SubmitChanges()

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Has been Edited!!!')", True)
    End Sub
End Class
