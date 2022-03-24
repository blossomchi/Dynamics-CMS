
Partial Class DefineUser
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            btnSave.Text = "Save"
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
            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID

            txtLocation.Text = madd.Locations.Where(Function(s) s.Name = lbLocation.Text).SingleOrDefault.Locationid


            drpMember.DataBind()
            drpMember.Items.Insert(0, New ListItem("Select"))
            drpMember.SelectedIndex = 0

            drpDesignation.DataBind()
            drpDesignation.Items.Insert(0, New ListItem("Select"))
            drpDesignation.SelectedIndex = 0

            DrpQuestion.DataBind()
            DrpQuestion.Items.Insert(0, New ListItem("Select"))
            DrpQuestion.SelectedIndex = 0

            DrpQuestion2.DataBind()
            DrpQuestion2.Items.Insert(0, New ListItem("Select"))
            DrpQuestion2.SelectedIndex = 0

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
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        If btnSave.Text = "Save" Then
            If drpMember.SelectedValue = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please Select a member !!!')", True)
                Exit Sub
            End If

            If drpDesignation.SelectedValue = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please Select a Designation !!!')", True)
                Exit Sub
            End If


            If DrpQuestion.SelectedValue = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please Select a Question !!!')", True)
                Exit Sub
            End If

            If DrpQuestion2.SelectedValue = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please Select a Question !!!')", True)
                Exit Sub
            End If

            If txtAns.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter an Answer to the Question !!!')", True)
                Exit Sub
            End If

            If txtAns2.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter an Answer to the Question !!!')", True)
                Exit Sub
            End If

            If txtPassword.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter a password!!!')", True)
                Exit Sub
            End If

            If txtUsername.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter a username!!!')", True)
                Exit Sub
            End If

            Dim checkuser = (From p In madd.AuthenticalTables
                              Where p.Username = txtUsername.Text
                              Select p).Any

            If checkuser = True Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Username has been used !!!')", True)
                txtUsername.Text = ""
                txtPassword.Text = ""
            ElseIf checkuser = False Then

                Dim getChurchID = (From s In madd.MembershipTables
                          Where s.Memberid = drpMember.SelectedValue
                          Select s).SingleOrDefault.ChurchDetailID

                Dim getStateID = (From g In madd.MembershipTables Join
                                w In madd.ChurchDetailTables On g.ChurchDetailID Equals w.ChurchDetailID
                                Where g.Memberid = drpMember.SelectedValue AndAlso w.ChurchDetailID = getChurchID
                                Select w).SingleOrDefault.Stateid


                Dim getLcation = (From g In madd.MembershipTables Join
                                w In madd.ChurchDetailTables On g.ChurchDetailID Equals w.ChurchDetailID
                                Where g.Memberid = drpMember.SelectedValue AndAlso w.ChurchDetailID = getChurchID
                                Select w).SingleOrDefault.Locationid

                'save query  tostaff table

                Dim a As New churchmanDataContext

                Dim strDate As Date
                strDate = Now

                Dim saveuser As New UserTable With { _
                .RoleID = drpDesignation.SelectedValue, _
                .Memberid = drpMember.SelectedValue, _
                .Churchid = getChurchID, _
                .Stateid = getStateID, _
                .Locationid = getLcation, _
                .DateCreated = strDate}

                a.UserTables.InsertOnSubmit(saveuser)
                a.SubmitChanges()


                'save to authentication tb

                Dim saveauth As New AuthenticalTable With { _
               .Memberid = drpMember.SelectedValue, _
               .Username = txtUsername.Text, _
               .Password = txtPassword.Text, _
                .Question1 = DrpQuestion.SelectedValue, _
                .Answer = txtAns.Text, _
               .Question2 = DrpQuestion2.SelectedValue, _
               .Answer2 = txtAns2.Text, _
               .DateCreated = strDate}

                a.AuthenticalTables.InsertOnSubmit(saveauth)
                a.SubmitChanges()


                ' -------------------------------------
                'save to Asp.net TB
                Dim emailAddress As String = ""
                emailAddress = "You@yahoo.com"

                Membership.CreateUser(txtUsername.Text, txtPassword.Text, emailAddress)

                Dim DesName = (From d In madd.RoleTables
                              Where d.Roleid = drpDesignation.SelectedValue
                              Select d).SingleOrDefault.Role

                'get role id from Asp.net TB

                Dim GetRoleID = (From f In madd.aspnet_Roles
                                Where f.RoleName.ToUpper = DesName.ToUpper
                                Select f).SingleOrDefault.RoleId


                'get userID 
                Dim GetUserID = (From h In madd.aspnet_Users
                                 Where h.UserName = txtUsername.Text
                                 Select h).SingleOrDefault.UserId


                'save into user in role TB
                Dim saveUserInRole As New aspnet_UsersInRole With { _
                    .RoleId = GetRoleID, _
                    .UserId = GetUserID}

                madd.aspnet_UsersInRoles.InsertOnSubmit(saveUserInRole)
                madd.SubmitChanges()

                '====================================
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('User was succesfully created!!Welcome to Church Waatch Software!!!')", True)

                txtUsername.Text = ""
                txtPassword.Text = ""
                txtAns.Text = ""
                txtAns2.Text = ""

                drpMember.DataBind()
                drpMember.Items.Insert(0, New ListItem("Select"))
                drpMember.SelectedIndex = 0


                drpDesignation.DataBind()
                drpDesignation.Items.Insert(0, New ListItem("Select"))
                drpDesignation.SelectedIndex = 0

                DrpQuestion.DataBind()
                DrpQuestion.Items.Insert(0, New ListItem("Select"))
                DrpQuestion.SelectedIndex = 0



                gridLocation.DataBind()

            End If

        ElseIf btnSave.Text = "Edit" Then

            If drpMember.SelectedValue = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please Select a member !!!')", True)
                Exit Sub
            End If

            If drpDesignation.SelectedValue = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please Select a Designation !!!')", True)
                Exit Sub
            End If


            If DrpQuestion.SelectedValue = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please Select a Question !!!')", True)
                Exit Sub
            End If

            If DrpQuestion2.SelectedValue = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please Select a Question !!!')", True)
                Exit Sub
            End If

            If txtAns.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter an Answer to the Question !!!')", True)
                Exit Sub
            End If

            If txtAns2.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter an Answer to the Question !!!')", True)
                Exit Sub
            End If

            If txtPassword.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter a password!!!')", True)
                Exit Sub
            End If

            If txtUsername.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter a username!!!')", True)
                Exit Sub
            End If

            Dim checkuser = (From p In madd.AuthenticalTables
                              Where p.Username = txtUsername.Text
                              Select p).Any

            Dim getChurchID = (From s In madd.MembershipTables
                          Where s.Memberid = drpMember.SelectedValue
                          Select s).SingleOrDefault.ChurchDetailID

                Dim getStateID = (From g In madd.MembershipTables Join
                                w In madd.ChurchDetailTables On g.ChurchDetailID Equals w.ChurchDetailID
                                Where g.Memberid = drpMember.SelectedValue AndAlso w.ChurchDetailID = getChurchID
                                Select w).SingleOrDefault.Stateid


                Dim getLcation = (From g In madd.MembershipTables Join
                                w In madd.ChurchDetailTables On g.ChurchDetailID Equals w.ChurchDetailID
                                Where g.Memberid = drpMember.SelectedValue AndAlso w.ChurchDetailID = getChurchID
                                Select w).SingleOrDefault.Locationid

                'save query  tostaff table

                Dim a As New churchmanDataContext

                Dim strDate As Date
                strDate = Now

                'edit user information
                Dim EditUserTB = madd.UserTables.Where(Function(a1) a1.Memberid = txtMeID.Text).SingleOrDefault
                EditUserTB.RoleID = drpDesignation.SelectedValue
                EditUserTB.Memberid = drpMember.SelectedValue
                EditUserTB.Churchid = getChurchID
                EditUserTB.Stateid = getStateID
                EditUserTB.Locationid = getLcation
                EditUserTB.DateCreated = Now

                madd.SubmitChanges()

                'edit authentication tb

                Dim EditAuthenticationTB = madd.AuthenticalTables.Where(Function(a1) a1.Memberid = txtMeID.Text).SingleOrDefault
                EditAuthenticationTB.Memberid = drpMember.SelectedValue
                EditAuthenticationTB.Username = txtUsername.Text
                EditAuthenticationTB.Password = txtPassword.Text
                EditAuthenticationTB.Question1 = DrpQuestion.SelectedValue
                EditAuthenticationTB.Answer = txtAns.Text
                EditAuthenticationTB.Question2 = DrpQuestion2.SelectedValue
                EditAuthenticationTB.Answer2 = txtAns2.Text
                EditAuthenticationTB.DateCreated = Now

                madd.SubmitChanges()

                'Udate asp.net table
                '------------------------------------------------------------------
                Dim emailAddress As String = ""
                emailAddress = "You@yahoo.com"

                'update email and password
                Dim u As MembershipUser = Membership.GetUser(txtUsername.Text)
                u.Email = emailAddress
                u.ChangePassword(txtPassword.Text, txtPassword.Text)

                Membership.UpdateUser(u)

                'update username
                Dim UpdateUserName = (From s In madd.aspnet_Users
                                     Where s.UserName = txtUsername.Text
                                     Select s).SingleOrDefault()

                UpdateUserName.UserName = PCase(txtUsername.Text)
                UpdateUserName.LoweredUserName = txtUsername.Text.ToLower

                madd.SubmitChanges()

                Dim getUserID = (From d In madd.aspnet_Users
                                   Where d.UserName = txtUsername.Text
                                   Select d).SingleOrDefault.UserId

                'get designation 
            Dim DesName = (From d In madd.RoleTables
                                     Where d.Roleid = drpDesignation.SelectedValue
                                     Select d).SingleOrDefault.Role

                'get role id from aspnet table
                Dim GetRoleID = (From f In madd.aspnet_Roles
                                Where f.RoleName = DesName
                                Select f).SingleOrDefault.RoleId


                'get userID from asp.net table
                Dim checkOldUserID = madd.aspnet_Users.Where(Function(s) s.UserName = txtUsername.Text).Any

                '  If checkOldUserID Then


                'delete from user in role asp.net table
                Dim deleteUserInRole = (From s In madd.aspnet_UsersInRoles
                                       Where (s.UserId = getUserID)
                                       Select s).SingleOrDefault()

                madd.aspnet_UsersInRoles.DeleteOnSubmit(deleteUserInRole)
                madd.SubmitChanges()

                ' End If


                'save into user in role table
                Dim SaveUserInRole As New aspnet_UsersInRole With { _
                    .RoleId = GetRoleID, _
                    .UserId = getUserID}
                madd.aspnet_UsersInRoles.InsertOnSubmit(SaveUserInRole)
                madd.SubmitChanges()

                '----------------------------------------------------------------------
                '====================================
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('User was succesfully updated!!Welcome to Church Waatch Software!!!')", True)

                txtUsername.Text = ""
                txtPassword.Text = ""
                txtAns.Text = ""
                txtAns2.Text = ""

                drpMember.DataBind()
                drpMember.Items.Insert(0, New ListItem("Select"))
                drpMember.SelectedIndex = 0


                drpDesignation.DataBind()
                drpDesignation.Items.Insert(0, New ListItem("Select"))
                drpDesignation.SelectedIndex = 0

                DrpQuestion.DataBind()
                DrpQuestion.Items.Insert(0, New ListItem("Select"))
                DrpQuestion.SelectedIndex = 0

            DrpQuestion2.DataBind()
            DrpQuestion2.Items.Insert(0, New ListItem("Select"))
            DrpQuestion2.SelectedIndex = 0

                gridLocation.DataBind()
            btnSave.Text = "Save"


            End If





    End Sub
    
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("NonMember.aspx")
    End Sub

    Protected Sub gridLocation_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gridLocation.RowCommand
        'If e.CommandName = "DeleteM" Then
        '    If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
        '        'Get Membersn id
        '        Dim Membersn As Integer = Convert.ToInt32(e.CommandArgument)


        '        Dim getMemberid = (From s In madd.UserTables
        '                    Where s.SN = Membersn
        '                    Select s).SingleOrDefault.Memberid


        '        Dim getnonMemberid = (From s In madd.UserTables
        '                    Where s.SN = Membersn
        '                    Select s).SingleOrDefault.Memberid


        '        Dim checkuser = (From s In madd.UserTables
        '                      Where s.Memberid = getMemberid
        '                     Select s).Any



        '        If checkuser = True Then
        '            Dim deletePar = (From s In madd.UserTables
        '                                            Where (s.Memberid = getMemberid)
        '                                            Select s).SingleOrDefault()

        '            madd.UserTables.DeleteOnSubmit(deletePar)
        '            madd.SubmitChanges()

        '            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Information was deleted!.')", True)
        '        End If



        '        Dim checkAuth = (From s In madd.AuthenticalTables
        '                  Where s.Memberid = getMemberid
        '                 Select s).Any



        '        If checkAuth = True Then
        '            Dim deleteau = (From s In madd.AuthenticalTables
        '                                            Where (s.Memberid = getMemberid)
        '                                            Select s).SingleOrDefault()

        '            madd.AuthenticalTables.DeleteOnSubmit(deleteau)
        '            madd.SubmitChanges()

        '            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Information was deleted!.')", True)
        '        End If
        '        gridLocation.DataBind()
        '    End If
        'End If

    End Sub

    Protected Sub gridLocation_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridLocation.SelectedIndexChanged
        Dim MemSN = gridLocation.SelectedRow.Cells(0).Text

        txtMeID.Text = madd.UserTables.Where(Function(s) s.SN = MemSN).SingleOrDefault.Memberid
        drpMember.DataBind()
        drpMember.SelectedValue = txtMeID.Text

        Dim ggg = (From g In madd.UserTables Join
                                        s In madd.RoleTables On g.RoleID Equals s.Roleid
                                        Where g.Memberid = txtMeID.Text
                                        Select s).SingleOrDefault.Roleid
        drpDesignation.DataBind()
        drpDesignation.SelectedValue = ggg

        txtUsername.Text = madd.AuthenticalTables.Where(Function(s) s.Memberid = txtMeID.Text).SingleOrDefault.Username

        txtPassword.Text = madd.AuthenticalTables.Where(Function(s) s.Memberid = txtMeID.Text).SingleOrDefault.Password
        txtPassword.TextMode = TextBoxMode.SingleLine

        DrpQuestion.DataBind()
        DrpQuestion.SelectedValue = madd.AuthenticalTables.Where(Function(s) s.Memberid = txtMeID.Text).SingleOrDefault.Question1

        txtAns.Text = madd.AuthenticalTables.Where(Function(s) s.Memberid = txtMeID.Text).SingleOrDefault.Answer

        DrpQuestion2.DataBind()
        DrpQuestion2.SelectedValue = madd.AuthenticalTables.Where(Function(s) s.Memberid = txtMeID.Text).SingleOrDefault.Question2

        txtAns2.Text = madd.AuthenticalTables.Where(Function(s) s.Memberid = txtMeID.Text).SingleOrDefault.Answer2

        btnSave.Text = "Edit"
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Response.Redirect("DefineUser.aspx")
    End Sub

    Protected Sub AccessCon_Click(sender As Object, e As EventArgs) Handles AccessCon.Click
        If User.IsInRole("Administrator") Or User.IsInRole("Bishop") Then
            '  Response.Redirect("http://localhost:2005")
            Response.Redirect("http://localhost/WebSiteAdminCP/default.aspx?applicationPhysicalPath=C:\inetpub\wwwroot\CHURCH\&applicationUrl=/CHURCH")
        Else
            Response.Redirect("~/UnauthorizedAccess.aspx")

        End If
    End Sub
End Class
