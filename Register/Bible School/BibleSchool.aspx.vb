
Partial Class BibleSchool

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

            drpBibleclass.DataBind()
            drpBibleclass.Items.Insert(0, New ListItem("Select"))
            drpBibleclass.SelectedIndex = 0

            DrpNewConvert.DataBind()
            DrpNewConvert.Items.Insert(0, New ListItem("Select"))
            DrpNewConvert.SelectedIndex = 0

            DrpWeek.DataBind()
            DrpWeek.Items.Insert(0, New ListItem("Select"))
            DrpWeek.SelectedIndex = 0

            DrpSession.DataBind()
            DrpSession.Items.Insert(0, New ListItem("Select"))
            DrpSession.SelectedIndex = 0
        End If
    End Sub


    Protected Sub drpBibleclass_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpBibleclass.SelectedIndexChanged

        Dim getDescrip = (From s In madd.EventTables
                               Where s.Sn = drpBibleclass.SelectedValue
                               Select s).SingleOrDefault.Descrip

        Dim getfirstTime = (From s In madd.EventTables
                               Where s.Sn = drpBibleclass.SelectedValue
                               Select s).SingleOrDefault.StartDate


        Dim getNumber = (From s In madd.EventTables
                               Where s.Sn = drpBibleclass.SelectedValue
                               Select s).SingleOrDefault.EndDate


        Dim geteventName = (From s In madd.EventTables
                             Where s.Sn = drpBibleclass.SelectedValue
                             Select s).SingleOrDefault.NewEvent



        txtname.Text = geteventName

        txtDescp.Text = getDescrip

        txtFrom.Text = getfirstTime

        txtTo.Text = getNumber


    End Sub

    Protected Sub DrpNewConvert_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpNewConvert.SelectedIndexChanged



        Dim getFirstName = (From s In madd.AddvisitorTables
                             Where s.SN = DrpNewConvert.SelectedValue
                             Select s).SingleOrDefault.Firstname

        Dim getLastName = (From s In madd.AddvisitorTables
                               Where s.SN = DrpNewConvert.SelectedValue
                               Select s).SingleOrDefault.Lastname

        Dim getNumber = (From s In madd.AddvisitorTables
                               Where s.SN = DrpNewConvert.SelectedValue
                               Select s).SingleOrDefault.Phone


        txtfirstname2.Text = getFirstName
        txtfirstname3.Text = getLastName
        txtPhone.Text = getNumber
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext

        Dim strDate As Date
        strDate = Now

        Dim id = From i In a.ClassTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            Lblid.Text = "Bib" & "" & z
        Else
            Lblid.Text = "Bib" & "" & 1

        End If

        Dim saveclass As New ClassTable With { _
                .ClassId = Lblid.Text, _
                .Classname = txtname.Text, _
                .Details = txtDescp.Text, _
                .FirstName = txtfirstname2.Text, _
                .LastName = txtfirstname3.Text, _
                .Phone = txtPhone.Text, _
                .Datefrom = txtFrom.Text, _
                .Dateto = txtTo.Text, _
                .Week = DrpWeek.SelectedValue, _
                .Session = DrpSession.SelectedValue, _
                .Datecreated = strDate}

        a.ClassTables.InsertOnSubmit(saveclass)
        a.SubmitChanges()

        'This Code is Displaying Saved Message and Reload/Refresh The Page
        Dim message As String = "School of the bible record, added Successfully!"
        Dim url As String = "BibleSchool.aspx" ' The page tobe refreshed here!
        Dim script As String = "window.onload = function(){ alert('"
        script += message
        script += "');"
        script += "window.location = '"
        script += url
        script += "'; }"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)


    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("ViewSchool.aspx")
    End Sub

    Protected Sub txtDescp_TextChanged(sender As Object, e As EventArgs) Handles txtDescp.TextChanged

    End Sub
End Class
