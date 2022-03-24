
Partial Class Reminder
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Const HtmlNewLine As String = "<br />"
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtAdult.Text = ""
            txtChild.Text = ""
            txtevent.Text = ""
            txtMarriage.Text = ""

            Dim userName As String = User.Identity.Name

            Dim EmploID = (From a In madd.AuthenticalTables
                          Where a.Username = userName
                          Select a).SingleOrDefault.Memberid




            Dim name = madd.MembershipTables.Where(Function(d) d.Memberid = EmploID).SingleOrDefault.FirstName

            Dim getChurch = (From y In madd.MembershipTables Join
                                h In madd.ChurchDetailTables On y.ChurchDetailID Equals h.ChurchDetailID
                                Where y.Memberid = EmploID
                                Select h).SingleOrDefault.ChurchName


            Dim Location = (From d In madd.ChurchDetailTables
                          Where d.ChurchName = getChurch
                          Select d).SingleOrDefault.Location.Name

            Dim state = (From d In madd.ChurchDetailTables
                          Where d.ChurchName = getChurch
                          Select d).SingleOrDefault.StateTable.State


            txtchurchID.Text = ""
            AdminLabel.Text = name.ToUpper
            lbChurchName.Text = getChurch.ToUpper
            lbState.Text = state.ToUpper
            lbLocation.Text = Session("Location")

            If lbChurchName.Text = "" Then
                Response.Redirect("Login.aspx")
                Exit Sub
            End If

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID

            'Dim getAllMonthDay = From y In madd.MembershipTables
            '                     Select y

            'Dim FullNameCell As String = ""
            'LBBirthDate.Text = ""
            'For Each h In getAllMonthDay
            '    Dim DOB = h.DOB
            '    Dim firtName = h.FirstName
            '    Dim LastName = h.LastName
            '    Dim Cell = h.Phone1

            '    getDay = Microsoft.VisualBasic.DateAndTime.Day(DOB)
            '    getMonth = Microsoft.VisualBasic.DateAndTime.Month(DOB)

            '    If getDay = DayNow AndAlso getMonth = MonthNow Then
            '        FullNameCell = (firtName & " " & LastName & "  " & "|" & "  " & "  " & "PHONE :" & " " & Cell).ToUpper

            '        LBBirthDate.Text += "DATE OF BIRTH :" & " " & DOB & " " & "|" & " " & " " & FullNameCell & HtmlNewLine
            '    End If
            'Next



            'Dim getMarriageDay = From k In madd.MarriageTables
            '                     Select k

            'Dim HusFullName As String = ""
            'LBLMaDate.Text = ""
            'For Each h In getMarriageDay
            '    Dim MOB = h.MarriageDate
            '    Dim husbandName = h.Hfirstname
            '    Dim wifeName = h.Wfirstname
            '    Dim LastName = h.Hlastname
            '    Dim Cell = h.Hphone

            '    getDay = Microsoft.VisualBasic.DateAndTime.Day(MOB)
            '    getMonth = Microsoft.VisualBasic.DateAndTime.Month(MOB)

            '    If getDay = DayNow AndAlso getMonth = MonthNow Then
            '        HusFullName = (husbandName & " " & LastName & " " & "and MRS " & " " & wifeName & " " & LastName & "  " & "|" & "  " & "  " & "PHONE :" & " " & Cell).ToUpper

            '        LBLMaDate.Text += "MARRIAGE ANNIVERSARY :" & " " & MOB & " " & "|" & " " & " " & "MR " & HusFullName & HtmlNewLine
            '    End If
            'Next

            'if adult birthday
            Dim CurrentMonth As String = Now.Month

            Dim CurrentDay As String = Now.Day

            If CurrentMonth.Length <> 2 Then
                CurrentMonth = "0" & CurrentMonth
            ElseIf CurrentMonth = 2 Then
                CurrentMonth = CurrentMonth
            End If

            If CurrentDay.Length <> 2 Then
                CurrentDay = "0" & CurrentDay
            ElseIf CurrentDay = 2 Then
                CurrentDay = CurrentDay
            End If

            txtAdult.Text = CurrentMonth & "-" & CurrentDay


            'children birthday
            Dim CurrentMonthc As String = Now.Month

            Dim CurrentDayc As String = Now.Day

            If CurrentMonthc.Length <> 2 Then
                CurrentMonthc = "0" & CurrentMonthc
            ElseIf CurrentMonthc = 2 Then
                CurrentMonthc = CurrentMonthc
            End If

            If CurrentDayc.Length <> 2 Then
                CurrentDayc = "0" & CurrentDayc
            ElseIf CurrentDayc = 2 Then
                CurrentDayc = CurrentDayc
            End If

            txtChild.Text = CurrentMonthc & "-" & CurrentDayc


            'Marriage date
            Dim CurrentMonthM As String = Now.Month

            Dim CurrentDayM As String = Now.Day

            If CurrentMonthM.Length <> 2 Then
                CurrentMonthM = "0" & CurrentMonthM
            ElseIf CurrentMonthM = 2 Then
                CurrentMonthM = CurrentMonthM
            End If

            If CurrentDayM.Length <> 2 Then
                CurrentDayM = "0" & CurrentDayM
            ElseIf CurrentDay = 2 Then
                CurrentDayM = CurrentDayM
            End If

            txtMarriage.Text = CurrentMonthM & "-" & CurrentDayM

            'EVENT DATE
            Dim CurrentMonthE As String = Now.Month

            Dim CurrentDayE As String = Now.Day

            If CurrentMonthE.Length <> 2 Then
                CurrentMonthE = "0" & CurrentMonthE
            ElseIf CurrentMonthE = 2 Then
                CurrentMonthE = CurrentMonthE
            End If

            If CurrentDayE.Length <> 2 Then
                CurrentDayE = "0" & CurrentDayE
            ElseIf CurrentDayE = 2 Then
                CurrentDayE = CurrentDayE
            End If

            txtevent.Text = CurrentMonthE & "-" & CurrentDayE
        End If
    End Sub


End Class
