Imports System.Data.SqlClient
Imports System.IO
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Data
Partial Class Designation
    Inherits System.Web.UI.Page
    Public Shared Value8 As String = ""
    Public Shared value4 As String = ""
    Public Shared CodeText As String = ""
    Public Shared value12 As String = ""
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


            'lbChurchName.Text = "Welcome to Church of God Mission Management System"

            'AdminLabel.Text = name.ToUpper

            'lbChurchName.Text = getChurch.ToUpper

            'lbState.Text = state.ToUpper
            'lbLocation.Text = Location.ToUpper


            'txtchurchid.Text = ""


            'If lbChurchName.Text = "" Then
            '     Response.Redirect("Login.aspx")
            '    Exit Sub
            'End If

            gridLocation.DataBind()
        End If
    End Sub
    Public Function PCase(ByVal strInput As String) As String
        Dim I As Integer
        Dim CurrentChar, PrevChar As Char
        Dim strOutput As String

        PrevChar = ""
        strOutput = ""

        For I = 1 To Len(strInput)
            CurrentChar = Mid(strInput, I, 1)

            Select Case PrevChar
                Case "", " ", ".", "-", ",", """", "'"
                    strOutput = strOutput & UCase(CurrentChar)
                Case Else
                    strOutput = strOutput & LCase(CurrentChar)
            End Select

            PrevChar = CurrentChar
        Next I

        PCase = strOutput
    End Function
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
    Public Sub MakeCode()
        'generate codes
        Dim p1, p2, p3, p4, p5, K As Integer
        Dim L(3) As String
        p1 = 9 * Rnd() : p2 = 9 * Rnd() : p3 = 9 * Rnd() : p4 = 9 * Rnd() : p5 = 9 * Rnd()

        L(0) = Int(26 * Rnd()) : L(1) = Int(26 * Rnd()) : L(2) = Int(26 * Rnd()) : L(3) = Int(26 * Rnd())
        'convert to letters
        For K = 0 To 3
            If L(K) = "0" Then L(K) = "Z"
            If L(K) = "1" Then L(K) = "A"
            If L(K) = "2" Then L(K) = "B"
            If L(K) = "3" Then L(K) = "C"
            If L(K) = "4" Then L(K) = "D"
            If L(K) = "5" Then L(K) = "E"
            If L(K) = "6" Then L(K) = "F"
            If L(K) = "7" Then L(K) = "G"
            If L(K) = "8" Then L(K) = "H"
            If L(K) = "9" Then L(K) = "I"
            If L(K) = "10" Then L(K) = "J"
            If L(K) = "11" Then L(K) = "K"
            If L(K) = "12" Then L(K) = "L"
            If L(K) = "13" Then L(K) = "M"
            If L(K) = "14" Then L(K) = "N"
            If L(K) = "15" Then L(K) = "N"
            If L(K) = "16" Then L(K) = "P"
            If L(K) = "17" Then L(K) = "Q"
            If L(K) = "18" Then L(K) = "R"
            If L(K) = "19" Then L(K) = "S"
            If L(K) = "20" Then L(K) = "T"
            If L(K) = "21" Then L(K) = "U"
            If L(K) = "22" Then L(K) = "V"
            If L(K) = "23" Then L(K) = "W"
            If L(K) = "24" Then L(K) = "X"
            If L(K) = "25" Then L(K) = "Y"
        Next K
        If L(2) = "3" Then L(2) = "C"
        CodeText = p1 & L(0) & p5 & L(7)
      
    End Sub
    Public Sub GenerateRandomString8()
        Dim rand As New Random()

        Dim allowableChars() As Char = "abcdefghighlmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".ToCharArray()
        Dim final As String = ""

        For i As Integer = 0 To 8 - 1
            final += allowableChars(rand.Next(allowableChars.Length - 1))
        Next

        Value8 = final
    End Sub
    Public Sub GenerateRandomString4()
        Dim rand As New Random()

        Dim allowableChars() As Char = "abcdefghighlmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".ToCharArray()
        Dim final As String = ""

        For i As Integer = 0 To 5 - 1
            final += allowableChars(rand.Next(allowableChars.Length - 1))
        Next

        value4 = final
    End Sub
    Public Sub GenerateRandomString12()
        Dim rand As New Random()

        Dim allowableChars() As Char = "abcdefghighlmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".ToCharArray()
        Dim final As String = ""

        For i As Integer = 0 To 13 - 1
            final += allowableChars(rand.Next(allowableChars.Length - 1))
        Next

        value12 = final
    End Sub
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext
        If btnSave.Text = "Save" Then
            Dim checkname = (From f In a.RoleTables
                           Where f.Role = txtName.Text
                           Select f).Any

            If checkname = True Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Existing Name !!!')", True)
                Exit Sub
            End If


            Dim strDate As Date
            strDate = Now

            Dim id = From i In a.RoleTables
                     Select i
            If id.Count > 0 Then

                Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
                Dim z = (CInt(latest) + 1)
                Lblid.Text = "Rol" & "" & z
            Else
                Lblid.Text = "Rol" & "" & 1

            End If


            'GenerateRandomString8()
            'GenerateRandomString4()
            'MakeCode()
            'GenerateRandomString12()
            'Randomize()

            'Dim p1, p2, p3, p4, p5, p6, p7, p8, P9, P10, P11, P12, P13, P14, P15, P16, P17, P18 As Integer
            'Dim value As String

            'p1 = CInt(Int((9 * Rnd()) + 1)) : p2 = CInt(Int((9 * Rnd()) + 1)) : p3 = CInt(Int((9 * Rnd()) + 1))
            'p4 = CInt(Int((9 * Rnd()) + 1)) : p5 = CInt(Int((9 * Rnd()) + 1)) : p6 = CInt(Int((9 * Rnd()) + 1))
            'p7 = CInt(Int((9 * Rnd()) + 1)) : p8 = CInt(Int((9 * Rnd()) + 1)) : P9 = CInt(Int((9 * Rnd()) + 1))
            'P10 = CInt(Int((9 * Rnd()) + 1)) : P11 = CInt(Int((9 * Rnd()) + 1)) : P12 = CInt(Int((9 * Rnd()) + 1))
            'P13 = CInt(Int((9 * Rnd()) + 1)) : P14 = CInt(Int((9 * Rnd()) + 1)) : P15 = CInt(Int((9 * Rnd()) + 1))
            'P18 = CInt(Int((9 * Rnd()) + 1)) : P17 = CInt(Int((9 * Rnd()) + 1)) : P16 = CInt(Int((9 * Rnd()) + 1))

            'value = Value8 & "-" & p2 & p1 & P9 & P13 & "-" & value4 & "-" & CodeText & "-" & value12



            Dim sGUID As String
            sGUID = System.Guid.NewGuid.ToString()
            '  MessageBox.Show(sGUID)



            Dim saveroles As New RoleTable With { _
               .Roleid = Lblid.Text, _
               .Role = txtName.Text, _
               .Descrp = txtDescp.Text, _
               .DateCreated = strDate}

            a.RoleTables.InsertOnSubmit(saveroles)
            a.SubmitChanges()

            'add role to Asp.net security table
            '==============================================
            Dim ApplicationID = (From f In a.aspnet_Applications
                                Select f).SingleOrDefault.ApplicationId


            'save into role table
            Dim SaveRole As New aspnet_Role With { _
                .ApplicationId = ApplicationID, _
                .RoleId = Guid.Parse(sGUID), _
                .RoleName = PCase(txtName.Text), _
                .LoweredRoleName = txtName.Text.ToLower}
            a.aspnet_Roles.InsertOnSubmit(SaveRole)
            a.SubmitChanges()

            ' ==============================================


            txtName.Text = ""
            txtDescp.Text = ""

            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('saved!!!')", True)

            gridLocation.DataBind()

        ElseIf btnSave.Text = "Edit" Then

            Dim updateServicess = madd.RoleTables.Where(Function(d) d.SN = txtServicesId.Text).SingleOrDefault()

            updateServicess.Role = txtName.Text
            updateServicess.Descrp = txtDescp.Text

            madd.SubmitChanges()


            Dim CountName = madd.RoleTables.Where(Function(q) q.Role = txtName.Text).Count

            If CountName = 1 Then
                'do nothing
                'update the asp.net role table
                '==============================================
                Dim RoleID = madd.aspnet_Roles.Where(Function(q) q.RoleName = txtPendingServices.Text).SingleOrDefault.RoleId

                Dim ApplicationID = (From f In a.aspnet_Applications
                                    Select f).SingleOrDefault.ApplicationId

                Dim uPdateRole = madd.aspnet_Roles.Where(Function(q) q.RoleId = RoleID AndAlso q.ApplicationId = ApplicationID).SingleOrDefault()

                uPdateRole.RoleName = PCase(txtName.Text)
                uPdateRole.LoweredRoleName = txtName.Text.ToLower
 
                madd.SubmitChanges()
                ' ==============================================
            ElseIf CountName <> 1 Then
                Dim updateGroups1 = madd.RoleTables.Where(Function(d) d.SN = txtServicesId.Text).SingleOrDefault()

                updateGroups1.Role = txtPendingServices.Text
                updateGroups1.Descrp = txtDescp.Text

                madd.SubmitChanges()

            End If


            txtName.Text = ""
            txtDescp.Text = ""


            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Service Unit was updated!')", True)

            gridLocation.DataBind()

            btnSave.Text = "Save"
        End If
       
    End Sub
    Protected Sub gridLocation_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridLocation.SelectedIndexChanged
        btnSave.Text = "Edit"

        Dim ServicesID = gridLocation.SelectedRow.Cells(0).Text
        txtServicesId.Text = ServicesID

        txtName.Text = gridLocation.SelectedRow.Cells(1).Text
        txtPendingServices.Text = txtName.Text

        '  txtRoleID.Text = madd.aspnet_Roles.Where(Function(q) q.RoleName = txtPendingServices.Text).SingleOrDefault.RoleId
        txtDescp.Text = gridLocation.SelectedRow.Cells(2).Text
    End Sub
End Class
