
Partial Class Default2
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

            Dim strDate As Date
            strDate = Now


            DrpDay.Items.Remove("Select")
            DrpDay.DataBind()
            DrpDay.Items.Insert(0, New ListItem("Select"))
            DrpDay.SelectedIndex = 0


            drpWeek.Items.Remove("Select")
            drpWeek.DataBind()
            drpWeek.Items.Insert(0, New ListItem("Select"))
            drpWeek.SelectedIndex = 0



        End If
    End Sub
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext

        Dim strDate As Date
        strDate = Now

        Dim id = From i In a.AttendanceTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            Lblid.Text = "Att" & "" & z
        Else
            Lblid.Text = "Att" & "" & 1

        End If

        If txtchurchID.Text = "" Then
            Response.Redirect("Login.aspx")
            Exit Sub
        End If


        Dim savemember As New AttendanceTable With {
       .Attendanceid = Lblid.Text,
       .Date = CDate(txtdate.Text),
       .Day = DrpDay.SelectedValue,
       .Week = drpWeek.SelectedValue,
       .MainSacAdultMale = If(txtFirstValue.Text <> "", txtFirstValue.Text, "0"),
       .MainSacAdultFemale = If(txtSecondValue.Text <> "", txtSecondValue.Text, "0"),
        .MainSacTeenMale = If(txtThirdValue.Text <> "", txtThirdValue.Text, "0"),
        .MainSacTeenFemale = If(txtFourthValue.Text <> "", txtFourthValue.Text, "0"),
        .MainSacChildrenMale = If(txtFifthValue.Text <> "", txtFifthValue.Text, "0"),
        .MainSacChildrenFemale = If(txtChildBoy.Text <> "", txtChildBoy.Text, "0"),
        .VisitorMale = If(txtSixthValue.Text <> "", txtSixthValue.Text, "0"),
        .VisitorFemale = If(txtVisitorFemale.Text <> "", txtVisitorFemale.Text, "0"),
        .TeenAdultMale = If(txtTeenAdultMale.Text <> "", txtTeenAdultMale.Text, "0"),
        .TeenAdultFemale = If(txtTeenAdultFemale.Text <> "", txtTeenAdultFemale.Text, "0"),
        .TeenMale = If(txtTeenMale.Text <> "", txtTeenMale.Text, "0"),
        .TeenFemale = If(txtTeenFemale.Text <> "", txtTeenFemale.Text, "0"),
        .TeenChidMale = If(txtTeenChildMale.Text <> "", txtTeenChildMale.Text, "0"),
        .TeenChildFemale = If(txtTeenChildFemale.Text <> "", txtTeenChildFemale.Text, "0"),
        .ChildAdultMale = If(txtChildChurchAMale.Text <> "", txtChildChurchAMale.Text, "0"),
        .ChildAdultFemale = If(txtChildChurchAFemale.Text <> "", txtChildChurchAFemale.Text, "0"),
        .ChildTeenMale = If(txtChildChurchTMale.Text <> "", txtChildChurchTMale.Text, "0"),
        .ChildTeenFemale = If(txtChildChurchTFemale.Text <> "", txtChildChurchTFemale.Text, "0"),
        .ChildMale = If(txtChildChurchMale.Text <> "", txtChildChurchMale.Text, "0"),
        .ChildFemale = If(txtChildChurchFemale.Text <> "", txtChildChurchFemale.Text, "0"),
        .Total = txtTotal.Text,
       .Createdby = txtStaffID.Text,
       .Churchid = txtchurchID.Text,
       .Datecreated = strDate}

        a.AttendanceTables.InsertOnSubmit(savemember)
        a.SubmitChanges()


        Dim saveTotal As New AttendanceTotalTable With {
            .Attendanceid = Lblid.Text,
            .TotalAdult = CInt(If(txtFirstValue.Text <> "", txtFirstValue.Text, "0")) + CInt(If(txtSecondValue.Text <> "", txtSecondValue.Text, "0")) + CInt(If(txtTeenAdultMale.Text <> "", txtTeenAdultMale.Text, "0")) + CInt(If(txtTeenAdultFemale.Text <> "", txtTeenAdultFemale.Text, "0")) + CInt(If(txtChildChurchAMale.Text <> "", txtChildChurchAMale.Text, "0")) + CInt(If(txtChildChurchAFemale.Text <> "", txtChildChurchAFemale.Text, "0")),
            .TotalTeen = CInt(If(txtThirdValue.Text <> "", txtThirdValue.Text, "0")) + CInt(If(txtFourthValue.Text <> "", txtFourthValue.Text, "0")) + CInt(If(txtTeenMale.Text <> "", txtTeenMale.Text, "0")) + CInt(If(txtTeenFemale.Text <> "", txtTeenFemale.Text, "0")) + CInt(If(txtChildChurchTMale.Text <> "", txtChildChurchTMale.Text, "0")) + CInt(If(txtChildChurchTFemale.Text <> "", txtChildChurchTFemale.Text, "0")),
            .TotalChildren = CInt(If(txtFifthValue.Text <> "", txtFifthValue.Text, "0")) + CInt(If(txtChildBoy.Text <> "", txtChildBoy.Text, "0")) + CInt(If(txtTeenChildMale.Text <> "", txtTeenChildMale.Text, "0")) + CInt(If(txtTeenChildFemale.Text <> "", txtTeenChildFemale.Text, "0")) + CInt(If(txtChildChurchMale.Text <> "", txtChildChurchMale.Text, "0")) + CInt(If(txtChildChurchFemale.Text <> "", txtChildChurchFemale.Text, "0")),
            .TotalVisitors = CInt(If(txtSixthValue.Text <> "", txtSixthValue.Text, "0")) + CInt(If(txtVisitorFemale.Text <> "", txtVisitorFemale.Text, "0")),
            .TotalMale = CInt(If(txtFirstValue.Text <> "", txtFirstValue.Text, "0")) + CInt(If(txtThirdValue.Text <> "", txtThirdValue.Text, "0")) + CInt(If(txtFifthValue.Text <> "", txtFifthValue.Text, "0")) + CInt(If(txtSixthValue.Text <> "", txtSixthValue.Text, "0")) + CInt(If(txtTeenAdultMale.Text <> "", txtTeenAdultMale.Text, "0")) + CInt(If(txtTeenMale.Text <> "", txtTeenMale.Text, "0")) + CInt(If(txtTeenChildMale.Text <> "", txtTeenChildMale.Text, "0")) + CInt(If(txtChildChurchAMale.Text <> "", txtChildChurchAMale.Text, "0")) + CInt(If(txtChildChurchTMale.Text <> "", txtChildChurchTMale.Text, "0")) + CInt(If(txtChildChurchMale.Text <> "", txtChildChurchMale.Text, "0")),
            .TotalFemale = CInt(If(txtSecondValue.Text <> "", txtSecondValue.Text, "0")) + CInt(If(txtFourthValue.Text <> "", txtFourthValue.Text, "0")) + CInt(If(txtChildBoy.Text <> "", txtChildBoy.Text, "0")) + CInt(If(txtVisitorFemale.Text <> "", txtVisitorFemale.Text, "0")) + CInt(If(txtTeenAdultFemale.Text <> "", txtTeenAdultFemale.Text, "0")) + CInt(If(txtTeenFemale.Text <> "", txtTeenFemale.Text, "0")) + CInt(If(txtTeenChildFemale.Text <> "", txtTeenChildFemale.Text, "0")) + CInt(If(txtChildChurchAFemale.Text <> "", txtChildChurchAFemale.Text, "0")) + CInt(If(txtChildChurchTFemale.Text <> "", txtChildChurchTFemale.Text, "0")) + CInt(If(txtChildChurchFemale.Text <> "", txtChildChurchFemale.Text, "0"))
            }
        a.AttendanceTotalTables.InsertOnSubmit(saveTotal)
        a.SubmitChanges()

        TotalAdult.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = Lblid.Text).SingleOrDefault.TotalAdult
        TotalTeen.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = Lblid.Text).SingleOrDefault.TotalTeen
        TotalChildren.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = Lblid.Text).SingleOrDefault.TotalChildren
        TotalVisitors.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = Lblid.Text).SingleOrDefault.TotalVisitors
        TotalMale.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = Lblid.Text).SingleOrDefault.TotalMale
        TotalFemale.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = Lblid.Text).SingleOrDefault.TotalFemale
        GrandAttendance.Text = txtTotal.Text

        Dim message As String = "Church Attendance, Record Successfully!"
        Dim url As String = "Attendance.aspx" ' The page tobe refreshed here!
        Dim script As String = "window.onload = function(){ alert('"
        script += message
        script += "');"
        script += "window.location = '"
        script += url
        script += "'; }"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)

    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("ViewAttendance.aspx")
    End Sub
  
End Class
