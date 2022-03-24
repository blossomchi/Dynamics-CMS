
Partial Class ViewAttendance
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

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("Attendance.aspx")
    End Sub

    Protected Sub DrpSorted_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpSorted.SelectedIndexChanged
        txtSelectedDate.Text = ""
        If DrpSorted.SelectedValue = "Date" Then
            DrpDate.Visible = True
            GVAllAttendance.Visible = False
            dridMonth.Visible = False
            Dim OrderDate = From y In madd.AttendanceTables
                            Group By y.Date Into gr = Group
                                    Select [Date] Order By [Date] Ascending

            DrpDate.DataSource = OrderDate
            DrpDate.DataBind()
            DrpDate.Items.Insert(0, New ListItem("Select"))
            DrpDate.SelectedIndex = 0

        ElseIf DrpSorted.SelectedValue = "Ascending" Then
            DrpDate.Visible = False
            GVAllAttendance.Visible = True
            gridDate.Visible = False
            dridMonth.Visible = False
        ElseIf DrpSorted.SelectedValue = "Month" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Work in Progress!!!')", True)
            'DrpDate.Visible = True
            'GVAllAttendance.Visible = False
            'gridDate.Visible = False
            'dridMonth.Visible = False

            'Dim services = From y In madd.AttendanceTables
            '               Group By y.Topic Into gr = Group
            '                       Select [Topic] Order By [Topic] Ascending

            ''Dim services = madd.OrderServiceTables.Select(Function(f) f.ServicesName).Distinct

            'DrpDate.DataSource = services
            'DrpDate.DataBind()
            'DrpDate.Items.Insert(0, New ListItem("Select"))
            'DrpDate.SelectedIndex = 0
        End If
    End Sub

    Protected Sub DrpDate_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpDate.SelectedIndexChanged
        Dim dateSelected As Date
        If DrpSorted.SelectedValue = "" Then
            'message
            Exit Sub
        ElseIf DrpSorted.SelectedValue = "Date" Then
            dateSelected = CDate(DrpDate.SelectedValue)
            txtSelectedDate.Text = Format(dateSelected, "yyyy-MM-dd")

            gridDate.Visible = True
            GVAllAttendance.Visible = False
        End If
    End Sub

    Protected Sub GVAllAttendance_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GVAllAttendance.RowCommand

        'If e.CommandName = "DeleteM" Then
        '    If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
        '        'Get raised id
        '        Dim RaiseexpID As Integer = Convert.ToInt32(e.CommandArgument)


        If e.CommandName = "DeleteM" Then

            'Get raised id
            Dim AttendanceID As String = Convert.ToString(e.CommandArgument)

            Dim checkpv = (From s In madd.AttendanceTables
                           Where s.Attendanceid = AttendanceID
                          Select s).Any

            If checkpv = True Then
                Dim deletePar = (From s In madd.AttendanceTables
                                                               Where s.Attendanceid = AttendanceID
                                                              Select s).SingleOrDefault()

                madd.AttendanceTables.DeleteOnSubmit(deletePar)
                madd.SubmitChanges()


                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Information was deleted!.')", True)
                GVAllAttendance.DataBind()

            End If



        End If

    End Sub
    Protected Sub GVAllAttendance_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVAllAttendance.SelectedIndexChanged
        'edit minister
        TXTSN.Text = GVAllAttendance.SelectedRow.Cells(0).Text
        Session("AttendanceID") = TXTSN.Text
        Response.Redirect("EditAttendance.aspx")
    End Sub
End Class
