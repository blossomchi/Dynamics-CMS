
Partial Class Marriage
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub btnViewRec_Click(sender As Object, e As EventArgs) Handles btnViewRec.Click
        Response.Redirect("ViewMarriage.aspx")
    End Sub
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

            DrpHusband.DataBind()
            DrpHusband.Items.Insert(0, New ListItem("Select"))
            DrpHusband.SelectedIndex = 0

            DrpWife.DataBind()
            DrpWife.Items.Insert(0, New ListItem("Select"))
            DrpWife.SelectedIndex = 0

            DropMinister.Items.Remove("Select")
            DropMinister.DataBind()
            DropMinister.Items.Insert(0, New ListItem("Select"))
            DropMinister.SelectedIndex = 0

            ddlMonth.Items.Remove("Select")
            ddlMonth.DataBind()
            ddlMonth.Items.Insert(0, New ListItem("Select"))
            ddlMonth.SelectedIndex = 0

            txtVenue.Text = lbChurchName.Text
        End If

    End Sub

    Protected Sub DrpHusband_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpHusband.SelectedIndexChanged

        Dim getFirstName = (From s In madd.MembershipTables
                               Where s.SN = DrpHusband.SelectedValue
                               Select s).SingleOrDefault.FirstName

        Dim getLastName = (From s In madd.MembershipTables
                               Where s.SN = DrpHusband.SelectedValue
                               Select s).SingleOrDefault.LastName


        Dim getNumber = (From s In madd.MembershipTables
                               Where s.SN = DrpHusband.SelectedValue
                               Select s).SingleOrDefault.Phone1

        Dim getDOB = (From s In madd.MembershipTables
                              Where s.SN = DrpHusband.SelectedValue
                              Select s).SingleOrDefault.DOB



        txtFirstname.Text = getFirstName
        txtLastName.Text = getLastName
        txtPhone.Text = getNumber
        txtDOB.Text = getDOB
    End Sub

    Protected Sub DrpWife_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpWife.SelectedIndexChanged
        Dim getFirstName = (From s In madd.MembershipTables
                            Where s.SN = DrpWife.SelectedValue
                            Select s).SingleOrDefault.FirstName

        Dim getLastName = (From s In madd.MembershipTables
                               Where s.SN = DrpWife.SelectedValue
                               Select s).SingleOrDefault.LastName


        Dim getNumber = (From s In madd.MembershipTables
                               Where s.SN = DrpWife.SelectedValue
                               Select s).SingleOrDefault.Phone1

        Dim getDOB = (From s In madd.MembershipTables
                              Where s.SN = DrpWife.SelectedValue
                              Select s).SingleOrDefault.DOB



        txtWfirtsname.Text = getFirstName
        txtWlastname.Text = getLastName
        txtphone2.Text = getNumber
        txtWDob.Text = getDOB

    End Sub

    Protected Sub DropMinister_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropMinister.SelectedIndexChanged

        Dim getFirstName = (From s In madd.MinisterTables
                         Where s.SN = DropMinister.SelectedValue
                         Select s).SingleOrDefault.Name


        Dim getNumber = (From s In madd.MinisterTables
                               Where s.SN = DropMinister.SelectedValue
                               Select s).SingleOrDefault.PhoneNo



        txtfulname.Text = getFirstName
        txtMphone.Text = getNumber

    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext



        Dim strDate As Date
        strDate = Now

        Dim id = From i In a.MarriageTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            lblid.Text = "MAR" & "" & z
        Else
            lblid.Text = "MAR" & "" & 1

        End If


        If txtFirstname.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter the Husband's name!!!')", True)
        End If

        If txtWfirtsname.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter the Wife's name!!!')", True)
        End If

        If txtMarriage.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter the Marriage date!!!')", True)
        End If

        If witness1.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter one of the Witness!!!')", True)
        End If


        Dim savemarriage As New MarriageTable With { _
       .Marriageid = lblid.Text, _
       .Hfirstname = txtFirstname.Text, _
       .Hlastname = txtLastName.Text, _
       .Hphone = txtPhone.Text, _
       .Hdob = txtDOB.Text, _
       .Hparents = txtParents.Text, _
       .HparentsAd = txtHParentsAddress.Text, _
       .HparentsNo = txtHParentsNo.Text, _
       .Wfirstname = txtWfirtsname.Text, _
       .Wlastnamae = txtWlastname.Text, _
       .Wphone = txtphone2.Text, _
       .Wdob = txtWDob.Text, _
       .Wparents = txtWparents.Text, _
       .Wparentsad = txtWparentAd.Text, _
       .Wparentsno = txtWphone.Text, _
       .Pastor = txtfulname.Text, _
       .Witness1 = witness1.Text, _
       .Witness2 = witness2.Text, _
       .Sponsor = txtsponsor.Text, _
       .Month = ddlMonth.SelectedValue, _
       .MarriageDate = txtMarriage.Text, _
       .ResidentAddress = txtAddress.Text, _
       .Updatedby = txtMembername.Text, _
       .venue = txtVenue.Text, _
       .Churchid = txtchurchID.Text, _
       .Datecreated = strDate}

        a.MarriageTables.InsertOnSubmit(savemarriage)
        a.SubmitChanges()

        'This Code is Displaying Saved Message and Reload/Refresh The Page
        Dim message As String = "Marriage Record, Added Successfully!"
        Dim url As String = "Marriage.aspx" ' The page tobe refreshed here!
        Dim script As String = "window.onload = function(){ alert('"
        script += message
        script += "');"
        script += "window.location = '"
        script += url
        script += "'; }"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)

    End Sub

    Protected Sub btnBrowse_Click(sender As Object, e As EventArgs) Handles btnBrowse.Click
        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Work in progress!!!')", True)
    End Sub
End Class
