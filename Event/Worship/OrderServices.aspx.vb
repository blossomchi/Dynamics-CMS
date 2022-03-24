
Partial Class OrderServices
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
            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID
            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            drpPeriod.Items.Remove("SELECT")
            drpPeriod.DataBind()
            drpPeriod.Items.Insert(0, New ListItem("SELECT"))
            drpPeriod.SelectedIndex = 0

            Dim strDate As Date
            strDate = Now

            txtDate.Text = strDate


        End If
    End Sub
  

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click


        Dim a As New churchmanDataContext


        Dim strDate As Date
        strDate = Now

        txtDate.Text = strDate

        Dim id = From i In a.OrderServiceTables
                Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.Sn).FirstOrDefault.Sn
            Dim z = (CInt(latest) + 1)
            Lblid.Text = "Order" & "" & z
        Else
            Lblid.Text = "Order" & "" & 1

        End If


        Dim saveservices As New OrderServiceTable With { _
        .Orderid = Lblid.Text, _
        .ServicesName = txtName.Text.ToUpper, _
        .Period = drpPeriod.SelectedValue, _
        .Timefrom = txtfrom.Text.ToUpper, _
        .TimeTo = txtTo.Text.ToUpper, _
        .Min = txtMins.Text, _
        .Program = txtprogram.Text.ToUpper, _
        .churchid = txtchurchID.Text, _
        .Moderator = txtModerator.Text.ToUpper, _
        .Date = txtDate.Text, _
        .Datecreated = strDate, _
        .Updatedby = txtMembername.Text}


        a.OrderServiceTables.InsertOnSubmit(saveservices)
        a.SubmitChanges()

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Church event has been saved!!!')", True)

        txtMins.Text = ""
        ' txtDate.Text = ""
        txtModerator.Text = ""
        Lblid.Text = ""
        '  txtName.Text = ""
        txtfrom.Text = ""
        txtTo.Text = ""
        txtprogram.Text = ""

        'drpPeriod.Items.Remove("SELECT")
        'drpPeriod.DataBind()
        'drpPeriod.Items.Insert(0, New ListItem("SELECT"))
        'drpPeriod.SelectedIndex = 0


    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("ViewServices.aspx")
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        txtMins.Text = ""
        txtName.Text = ""
        txtDate.Text = ""
        txtModerator.Text = ""
        Lblid.Text = ""
        txtName.Text = ""
        txtfrom.Text = ""
        txtTo.Text = ""
        txtprogram.Text = ""

        drpPeriod.Items.Remove("SELECT")
        drpPeriod.DataBind()
        drpPeriod.Items.Insert(0, New ListItem("SELECT"))
        drpPeriod.SelectedIndex = 0
    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
        If txtfrom.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Enter from time!!')", True)
            Exit Sub
        End If

        If txtTo.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Enter to time!!')", True)
            Exit Sub
        End If

        Dim strStart As String = txtfrom.Text
        Dim strEnd As String = txtTo.Text

        Dim DifInSecs As Long = DateDiff(DateInterval.Second, CDate(strStart), CDate(strEnd))
        Dim spanFromSeconds As TimeSpan = New TimeSpan(0, 0, CInt(DifInSecs))

        Dim DiffHour As String = ""
        Dim Minsss As String = ""
        Dim senss As String = ""

        DiffHour = spanFromSeconds.Hours.ToString
        Minsss = spanFromSeconds.Minutes
        senss = spanFromSeconds.Seconds
        txtMins.Text = ""



        If DiffHour <> 0 Then
            txtMins.Text += DiffHour & " " & "Hour"
        End If

        If Minsss <> 0 Then
            txtMins.Text += " " & Minsss & " " & "Mins"
        End If

        If senss <> 0 Then
            txtMins.Text += " " & senss & " " & "Seconds"
        End If

    End Sub
End Class
