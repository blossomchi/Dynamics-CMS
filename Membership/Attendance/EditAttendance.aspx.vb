
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

            txtAttendanceID.Text = Session("AttendanceID")

            If txtAttendanceID.Text = "" Then
                Response.Redirect("ViewAttendance.aspx")
                Exit Sub
            End If

            Dim getAllInfo = madd.AttendanceTables.Where(Function(l) l.Attendanceid = txtAttendanceID.Text).SingleOrDefault

            'count sum attendance
            'Dim SumAdultMembers = Aggregate cust In madd.AttendanceTables
            '                          Where cust.Gender = "Male"
            '                          Into Count()

            drpWeek.DataBind()
            drpWeek.SelectedValue = getAllInfo.Week

            txtdate.Text = getAllInfo.Date
            DrpDay.DataBind()
            DrpDay.SelectedValue = getAllInfo.Day

            If getAllInfo.MainSacAdultMale.HasValue Then
                txtFirstValue.Text = getAllInfo.MainSacAdultMale
            ElseIf Not getAllInfo.MainSacAdultMale.HasValue Then
                txtFirstValue.Text = ""
            End If

            If getAllInfo.MainSacAdultFemale.HasValue Then
                txtSecondValue.Text = getAllInfo.MainSacAdultFemale
            ElseIf Not getAllInfo.MainSacAdultFemale.HasValue Then
                txtSecondValue.Text = ""
            End If

            If getAllInfo.MainSacTeenMale.HasValue Then
                txtThirdValue.Text = getAllInfo.MainSacTeenMale
            ElseIf Not getAllInfo.MainSacTeenMale.HasValue Then
                txtThirdValue.Text = ""
            End If

            If getAllInfo.MainSacTeenFemale.HasValue Then
                txtFourthValue.Text = getAllInfo.MainSacTeenFemale
            ElseIf Not getAllInfo.MainSacTeenFemale.HasValue Then
                txtFourthValue.Text = ""
            End If

            If getAllInfo.MainSacChildrenMale.HasValue Then
                txtFifthValue.Text = getAllInfo.MainSacChildrenMale
            ElseIf Not getAllInfo.MainSacChildrenMale.HasValue Then
                txtFifthValue.Text = ""
            End If

            If getAllInfo.MainSacChildrenFemale.HasValue Then
                txtChildBoy.Text = getAllInfo.MainSacChildrenFemale
            ElseIf Not getAllInfo.MainSacChildrenFemale.HasValue Then
                txtChildBoy.Text = ""
            End If

            If getAllInfo.VisitorMale.HasValue Then
                txtSixthValue.Text = getAllInfo.VisitorMale
            ElseIf Not getAllInfo.VisitorMale.HasValue Then
                txtSixthValue.Text = ""
            End If

            If getAllInfo.VisitorFemale.HasValue Then
                txtVisitorFemale.Text = getAllInfo.VisitorFemale
            ElseIf Not getAllInfo.VisitorFemale.HasValue Then
                txtVisitorFemale.Text = ""
            End If

            If getAllInfo.TeenAdultMale.HasValue Then
                txtTeenAdultMale.Text = getAllInfo.TeenAdultMale
            ElseIf Not getAllInfo.TeenAdultMale.HasValue Then
                txtTeenAdultMale.Text = ""
            End If

            If getAllInfo.TeenAdultFemale.HasValue Then
                txtTeenAdultFemale.Text = getAllInfo.TeenAdultFemale
            ElseIf Not getAllInfo.TeenAdultFemale.HasValue Then
                txtTeenAdultFemale.Text = ""
            End If

            If getAllInfo.TeenMale.HasValue Then
                txtTeenMale.Text = getAllInfo.TeenMale
            ElseIf Not getAllInfo.TeenMale.HasValue Then
                txtTeenMale.Text = ""
            End If

            If getAllInfo.TeenFemale.HasValue Then
                txtTeenFemale.Text = getAllInfo.TeenFemale
            ElseIf Not getAllInfo.TeenFemale.HasValue Then
                txtTeenFemale.Text = ""
            End If

            If getAllInfo.TeenChidMale.HasValue Then
                txtTeenChildMale.Text = getAllInfo.TeenChidMale
            ElseIf Not getAllInfo.TeenChidMale.HasValue Then
                txtTeenChildMale.Text = ""
            End If

            If getAllInfo.TeenChildFemale.HasValue Then
                txtTeenChildFemale.Text = getAllInfo.TeenChildFemale
            ElseIf Not getAllInfo.TeenChildFemale.HasValue Then
                txtTeenChildFemale.Text = ""
            End If

            If getAllInfo.ChildAdultMale.HasValue Then
                txtChildChurchAMale.Text = getAllInfo.ChildAdultMale
            ElseIf Not getAllInfo.ChildAdultMale.HasValue Then
                txtChildChurchAMale.Text = ""
            End If

            If getAllInfo.ChildAdultFemale.HasValue Then
                txtChildChurchAFemale.Text = getAllInfo.ChildAdultFemale
            ElseIf Not getAllInfo.ChildAdultFemale.HasValue Then
                txtChildChurchAFemale.Text = ""
            End If

            If getAllInfo.ChildTeenMale.HasValue Then
                txtChildChurchTMale.Text = getAllInfo.ChildTeenMale
            ElseIf Not getAllInfo.ChildTeenMale.HasValue Then
                txtChildChurchTMale.Text = ""
            End If

            If getAllInfo.ChildTeenFemale.HasValue Then
                txtChildChurchTFemale.Text = getAllInfo.ChildTeenFemale
            ElseIf Not getAllInfo.ChildTeenFemale.HasValue Then
                txtChildChurchTFemale.Text = ""
            End If

            If getAllInfo.ChildMale.HasValue Then
                txtChildChurchMale.Text = getAllInfo.ChildMale
            ElseIf Not getAllInfo.ChildMale.HasValue Then
                txtChildChurchMale.Text = ""
            End If

            If getAllInfo.ChildFemale.HasValue Then
                txtChildChurchFemale.Text = getAllInfo.ChildFemale
            ElseIf Not getAllInfo.ChildFemale.HasValue Then
                txtChildChurchFemale.Text = ""
            End If

            txtTotal.Text = getAllInfo.Total

            TotalAdult.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = txtAttendanceID.Text).SingleOrDefault.TotalAdult
            TotalTeen.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = txtAttendanceID.Text).SingleOrDefault.TotalTeen
            TotalChildren.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = txtAttendanceID.Text).SingleOrDefault.TotalChildren
            TotalVisitors.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = txtAttendanceID.Text).SingleOrDefault.TotalVisitors
            TotalMale.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = txtAttendanceID.Text).SingleOrDefault.TotalMale
            TotalFemale.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = txtAttendanceID.Text).SingleOrDefault.TotalFemale
            GrandAttendance.Text = txtTotal.Text

        End If
    End Sub
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        Dim UpdateInfo = madd.AttendanceTables.Where(Function(l) l.Attendanceid = txtAttendanceID.Text).SingleOrDefault

        UpdateInfo.Week = drpWeek.SelectedValue
        UpdateInfo.Date = txtdate.Text
        UpdateInfo.Day = DrpDay.SelectedValue
        UpdateInfo.MainSacAdultMale = If(txtFirstValue.Text <> "", txtFirstValue.Text, "0")
        UpdateInfo.MainSacAdultFemale = If(txtSecondValue.Text <> "", txtSecondValue.Text, "0")
        UpdateInfo.MainSacTeenMale = If(txtThirdValue.Text <> "", txtThirdValue.Text, "0")
        UpdateInfo.MainSacTeenFemale = If(txtFourthValue.Text <> "", txtFourthValue.Text, "0")
        UpdateInfo.MainSacChildrenMale = If(txtFifthValue.Text <> "", txtFifthValue.Text, "0")
        UpdateInfo.MainSacChildrenFemale = If(txtChildBoy.Text <> "", txtChildBoy.Text, "0")
        UpdateInfo.VisitorMale = If(txtSixthValue.Text <> "", txtSixthValue.Text, "0")
        UpdateInfo.VisitorFemale = If(txtVisitorFemale.Text <> "", txtVisitorFemale.Text, "0")
        UpdateInfo.TeenAdultMale = If(txtTeenAdultMale.Text <> "", txtTeenAdultMale.Text, "0")
        UpdateInfo.TeenAdultFemale = If(txtTeenAdultFemale.Text <> "", txtTeenAdultFemale.Text, "0")
        UpdateInfo.TeenMale = If(txtTeenMale.Text <> "", txtTeenMale.Text, "0")
        UpdateInfo.TeenFemale = If(txtTeenFemale.Text <> "", txtTeenFemale.Text, "0")
        UpdateInfo.TeenChidMale = If(txtTeenChildMale.Text <> "", txtTeenChildMale.Text, "0")
        UpdateInfo.TeenChildFemale = If(txtTeenChildFemale.Text <> "", txtTeenChildFemale.Text, "0")
        UpdateInfo.ChildAdultMale = If(txtChildChurchAMale.Text <> "", txtChildChurchAMale.Text, "0")
        UpdateInfo.ChildAdultFemale = If(txtChildChurchAFemale.Text <> "", txtChildChurchAFemale.Text, "0")
        UpdateInfo.ChildTeenMale = If(txtChildChurchTMale.Text <> "", txtChildChurchTMale.Text, "0")
        UpdateInfo.ChildTeenFemale = If(txtChildChurchTFemale.Text <> "", txtChildChurchTFemale.Text, "0")
        UpdateInfo.ChildMale = If(txtChildChurchMale.Text <> "", txtChildChurchMale.Text, "0")
        UpdateInfo.ChildFemale = If(txtChildChurchFemale.Text <> "", txtChildChurchFemale.Text, "0")
        UpdateInfo.Total = txtTotal.Text

        madd.SubmitChanges()

        Dim updateTotalAttendance = madd.AttendanceTotalTables.Where(Function(l) l.Attendanceid = txtAttendanceID.Text).SingleOrDefault

        updateTotalAttendance.TotalAdult = CInt(If(txtFirstValue.Text <> "", txtFirstValue.Text, "0")) + CInt(If(txtSecondValue.Text <> "", txtSecondValue.Text, "0")) + CInt(If(txtTeenAdultMale.Text <> "", txtTeenAdultMale.Text, "0")) + CInt(If(txtTeenAdultFemale.Text <> "", txtTeenAdultFemale.Text, "0")) + CInt(If(txtChildChurchAMale.Text <> "", txtChildChurchAMale.Text, "0")) + CInt(If(txtChildChurchAFemale.Text <> "", txtChildChurchAFemale.Text, "0"))
        updateTotalAttendance.TotalTeen = CInt(If(txtThirdValue.Text <> "", txtThirdValue.Text, "0")) + CInt(If(txtFourthValue.Text <> "", txtFourthValue.Text, "0")) + CInt(If(txtTeenMale.Text <> "", txtTeenMale.Text, "0")) + CInt(If(txtTeenFemale.Text <> "", txtTeenFemale.Text, "0")) + CInt(If(txtChildChurchTMale.Text <> "", txtChildChurchTMale.Text, "0")) + CInt(If(txtChildChurchTFemale.Text <> "", txtChildChurchTFemale.Text, "0"))
        updateTotalAttendance.TotalChildren = CInt(If(txtFifthValue.Text <> "", txtFifthValue.Text, "0")) + CInt(If(txtChildBoy.Text <> "", txtChildBoy.Text, "0")) + CInt(If(txtTeenChildMale.Text <> "", txtTeenChildMale.Text, "0")) + CInt(If(txtTeenChildFemale.Text <> "", txtTeenChildFemale.Text, "0")) + CInt(If(txtChildChurchMale.Text <> "", txtChildChurchMale.Text, "0")) + CInt(If(txtChildChurchFemale.Text <> "", txtChildChurchFemale.Text, "0"))
        updateTotalAttendance.TotalVisitors = CInt(If(txtSixthValue.Text <> "", txtSixthValue.Text, "0")) + CInt(If(txtVisitorFemale.Text <> "", txtVisitorFemale.Text, "0"))
        updateTotalAttendance.TotalMale = CInt(If(txtFirstValue.Text <> "", txtFirstValue.Text, "0")) + CInt(If(txtThirdValue.Text <> "", txtThirdValue.Text, "0")) + CInt(If(txtFifthValue.Text <> "", txtFifthValue.Text, "0")) + CInt(If(txtSixthValue.Text <> "", txtSixthValue.Text, "0")) + CInt(If(txtTeenAdultMale.Text <> "", txtTeenAdultMale.Text, "0")) + CInt(If(txtTeenMale.Text <> "", txtTeenMale.Text, "0")) + CInt(If(txtTeenChildMale.Text <> "", txtTeenChildMale.Text, "0")) + CInt(If(txtChildChurchAMale.Text <> "", txtChildChurchAMale.Text, "0")) + CInt(If(txtChildChurchTMale.Text <> "", txtChildChurchTMale.Text, "0")) + CInt(If(txtChildChurchMale.Text <> "", txtChildChurchMale.Text, "0"))
        updateTotalAttendance.TotalFemale = CInt(If(txtSecondValue.Text <> "", txtSecondValue.Text, "0")) + CInt(If(txtFourthValue.Text <> "", txtFourthValue.Text, "0")) + CInt(If(txtChildBoy.Text <> "", txtChildBoy.Text, "0")) + CInt(If(txtVisitorFemale.Text <> "", txtVisitorFemale.Text, "0")) + CInt(If(txtTeenAdultFemale.Text <> "", txtTeenAdultFemale.Text, "0")) + CInt(If(txtTeenFemale.Text <> "", txtTeenFemale.Text, "0")) + CInt(If(txtTeenChildFemale.Text <> "", txtTeenChildFemale.Text, "0")) + CInt(If(txtChildChurchAFemale.Text <> "", txtChildChurchAFemale.Text, "0")) + CInt(If(txtChildChurchTFemale.Text <> "", txtChildChurchTFemale.Text, "0")) + CInt(If(txtChildChurchFemale.Text <> "", txtChildChurchFemale.Text, "0"))
        madd.SubmitChanges()

        TotalAdult.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = txtAttendanceID.Text).SingleOrDefault.TotalAdult
        TotalTeen.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = txtAttendanceID.Text).SingleOrDefault.TotalTeen
        TotalChildren.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = txtAttendanceID.Text).SingleOrDefault.TotalChildren
        TotalVisitors.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = txtAttendanceID.Text).SingleOrDefault.TotalVisitors
        TotalMale.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = txtAttendanceID.Text).SingleOrDefault.TotalMale
        TotalFemale.Text = madd.AttendanceTotalTables.Where(Function(s) s.Attendanceid = txtAttendanceID.Text).SingleOrDefault.TotalFemale
        GrandAttendance.Text = txtTotal.Text

        Dim message As String = "Church Attendance, Updated Successfully!"
        Dim url As String = "EditAttendance.aspx" ' The page redirect!
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
