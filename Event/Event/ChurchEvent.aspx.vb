
Partial Class ChurchEvent
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

            drpPeriod.Items.Remove("SELECT")
            drpPeriod.DataBind()
            drpPeriod.Items.Insert(0, New ListItem("SELECT"))
            drpPeriod.SelectedIndex = 0


        End If
    End Sub
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        Dim a As New churchmanDataContext
        Dim strDate As Date
        strDate = Now


        txtstD.Text = StartTimePicker1.SelectedDate

        txtEnD.Text = EndTimePicker.SelectedDate

        'Dim startevent As DateAndTime

        'startevent = CDate(txtstD.Text)


        Dim id = From i In a.EventTables
                Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.Sn).FirstOrDefault.Sn
            Dim z = (CInt(latest) + 1)
            Lblid.Text = "ChEv" & "" & z
        Else
            Lblid.Text = "ChEv" & "" & 1

        End If


        Dim savevent As New EventTable With { _
        .DateCreated = strDate, _
        .Period = drpPeriod.SelectedValue, _
        .Descrip = txtdesp.Text, _
        .Createdby = txtMembername.Text, _
        .ChurchID = txtchurchID.Text, _
        .Eventid = Lblid.Text, _
        .NewEvent = txtName.Text, _
        .StartDate = CDate(txtstD.Text), _
        .EndDate = CDate(txtEnD.Text)}


        a.EventTables.InsertOnSubmit(savevent)
        a.SubmitChanges()

        StartTimePicker1.Clear()
        EndTimePicker.Clear()

        drpPeriod.Items.Remove("SELECT")
        drpPeriod.DataBind()
        drpPeriod.Items.Insert(0, New ListItem("SELECT"))
        drpPeriod.SelectedIndex = 0

        txtdesp.Text = ""
        txtName.Text = ""
        'This Code is Displaying Saved Message and Reload/Refresh The Page
        Dim message As String = "Church event, Added Successfully!"
        Dim url As String = "ChurchEvent.aspx" ' The page tobe refreshed here!
        Dim script As String = "window.onload = function(){ alert('"
        script += message
        script += "');"
        script += "window.location = '"
        script += url
        script += "'; }"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)

    End Sub

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
      
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("ViewEvent.aspx")
    End Sub
End Class
