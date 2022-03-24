
Partial Class NonMember
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

            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID

            txtLocation.Text = madd.Locations.Where(Function(s) s.Name = lbLocation.Text).SingleOrDefault.Locationid


            drpstate.DataBind()
            drpstate.Items.Insert(0, New ListItem("Select"))
            drpstate.SelectedIndex = 0


            drpDesignation.DataBind()
            drpDesignation.Items.Insert(0, New ListItem("Select"))
            drpDesignation.SelectedIndex = 0

            DrpQuestion.DataBind()
            DrpQuestion.Items.Insert(0, New ListItem("Select"))
            DrpQuestion.SelectedIndex = 0


            DrpQuestion2.DataBind()
            DrpQuestion2.Items.Insert(0, New ListItem("Select"))
            DrpQuestion2.SelectedIndex = 0


            Dropmarital.DataBind()
            Dropmarital.Items.Insert(0, New ListItem("Select"))
            Dropmarital.SelectedIndex = 0

            drpGender.DataBind()
            drpGender.Items.Insert(0, New ListItem("Select"))
            drpGender.SelectedIndex = 0

        End If
    End Sub
    Protected Sub drpstate_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpstate.SelectedIndexChanged
        txtst.Text = drpstate.SelectedValue

        DropChurch.Items.Remove("Select")
        DropChurch.DataBind()
        DropChurch.Items.Insert(0, New ListItem("Select"))
        DropChurch.SelectedIndex = 0
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
  
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext

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
            Exit Sub
        End If


        'save family table
        Dim strDate As Date
        strDate = Now

        If txtFamilyname.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter your Last name!!!')", True)
            Exit Sub
        End If

        Dim id = From i In a.FamilyTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            Lblid1.Text = "NFAM" & "" & z
        Else
            Lblid1.Text = "NFAM" & "" & 1

        End If

        Dim savenewfamily As New FamilyTable With { _
       .Familyid = Lblid1.Text, _
       .FamilyName = txtFamilyname.Text, _
       .DateCreated = strDate}


        a.FamilyTables.InsertOnSubmit(savenewfamily)
        a.SubmitChanges()

        'save member table


        If txtFirstname.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter your first name!!!')", True)
            Exit Sub
        End If

        Dim checkPhoneno = (From f In a.MembershipTables
                            Where f.Phone1 = txtPhone1.Text
                            Select f).Any

        If checkPhoneno = True Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Existing contact !!!')", True)
            Exit Sub
        End If


        Dim idi = From i In a.MembershipTables
                 Select i
        If idi.Count > 0 Then

            Dim latest As String = idi.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            Lblid.Text = "NMEB" & "" & z
        Else
            Lblid.Text = "NMEB" & "" & 1

        End If


        Dim savenewmember As New MembershipTable With { _
        .FamilyID = Lblid1.Text, _
        .Memberid = Lblid.Text, _
        .FirstName = txtFirstname.Text, _
        .LastName = txtFamilyname.Text, _
        .MartialStatus = Dropmarital.SelectedValue, _
        .Phone1 = txtPhone1.Text, _
        .Gender = drpGender.SelectedValue, _
        .Address = txtAdress.Text, _
        .DOB = txtDOB.Text, _
        .ChurchDetailID = DropChurch.SelectedValue, _
        .Updatedby = txtMembername.Text, _
        .Locationid = txtLocation.Text, _
        .DateCreated = strDate}

        a.MembershipTables.InsertOnSubmit(savenewmember)
        a.SubmitChanges()


        'save user table

        If Lblid.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please check your information !!!')", True)
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


        If txtAns2.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Existing contact !!!')", True)
            Exit Sub
        End If

        Dim getChurchID = (From s In madd.MembershipTables
                       Where s.Memberid = Lblid.Text
                       Select s).SingleOrDefault.ChurchDetailID

        Dim getStateID = (From g In madd.MembershipTables Join
                        w In madd.ChurchDetailTables On g.ChurchDetailID Equals w.ChurchDetailID
                        Where g.Memberid = Lblid.Text AndAlso w.ChurchDetailID = getChurchID
                        Select w).SingleOrDefault.Stateid


        Dim getLcation = (From g In madd.MembershipTables Join
                        w In madd.ChurchDetailTables On g.ChurchDetailID Equals w.ChurchDetailID
                        Where g.Memberid = Lblid.Text AndAlso w.ChurchDetailID = getChurchID
                        Select w).SingleOrDefault.Locationid

        'save query  tostaff table

        Dim saveuser As New UserTable With { _
        .RoleID = drpDesignation.SelectedValue, _
        .Memberid = Lblid.Text, _
        .Churchid = getChurchID, _
        .Stateid = getStateID, _
        .Locationid = getLcation, _
        .DateCreated = strDate}

        a.UserTables.InsertOnSubmit(saveuser)
        a.SubmitChanges()


        'save to authentication tb

        Dim saveauth As New AuthenticalTable With { _
       .Memberid = Lblid.Text, _
       .Username = txtUsername.Text, _
       .Password = txtPassword.Text, _
       .Question1 = DrpQuestion.SelectedValue, _
        .Answer = txtAns.Text, _
       .Question2 = DrpQuestion2.SelectedValue, _
       .Answer2 = txtAns2.Text, _
       .DateCreated = strDate}

        a.AuthenticalTables.InsertOnSubmit(saveauth)
        a.SubmitChanges()

        '-------------------------------------------------
        'save to Asp.net TB
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
        '----------------------------------------------
        Dim message As String

        message = "Username" & ":" & txtUsername.Text & "," & "Password" & ":" & txtPassword.Text

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Save. Your" & message & "!')", True)





        txtFamilyname.Text = ""
        txtUsername.Text = ""
        txtPassword.Text = ""
        txtAns2.Text = ""
        txtFirstname.Text = ""
        txtPhone1.Text = ""
        txtAdress.Text = ""

        drpstate.DataBind()
        drpstate.Items.Insert(0, New ListItem("Select"))
        drpstate.SelectedIndex = 0

        drpGender.DataBind()
        drpGender.Items.Insert(0, New ListItem("Select"))
        drpGender.SelectedIndex = 0

        drpDesignation.DataBind()
        drpDesignation.Items.Insert(0, New ListItem("Select"))
        drpDesignation.SelectedIndex = 0

        DrpQuestion.DataBind()
        DrpQuestion.Items.Insert(0, New ListItem("Select"))
        DrpQuestion.SelectedIndex = 0

        DropChurch.DataBind()
        DropChurch.Items.Insert(0, New ListItem("Select"))
        DropChurch.SelectedIndex = 0

        Dropmarital.DataBind()
        Dropmarital.Items.Insert(0, New ListItem("Select"))
        Dropmarital.SelectedIndex = 0



    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("DefineUser.aspx")
    End Sub
End Class
