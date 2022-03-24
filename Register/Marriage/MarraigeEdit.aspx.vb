
Partial Class MarraigeEdit
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

            txtMemID.Text = Session("marriageID")

            Dim getAllInfo = madd.MarriageTables.Where(Function(l) l.SN = txtMemID.Text).SingleOrDefault

            DrpHusband.DataBind()
            DrpHusband.Items.Insert(0, New ListItem("Select"))
            DrpHusband.SelectedIndex = 0

            DrpWife.DataBind()
            DrpWife.Items.Insert(0, New ListItem("Select"))
            DrpWife.SelectedIndex = 0


            lblid.Text = getAllInfo.Marriageid
            txtFirstname.Text = getAllInfo.Hfirstname
            txtLastName.Text = getAllInfo.Hlastname
            txtPhone.Text = getAllInfo.Hphone
            txtDOB.Text = getAllInfo.Hdob
            txtHParentsAddress.Text = getAllInfo.HparentsAd
            txtHParentsNo.Text = getAllInfo.HparentsNo
            txtWfirtsname.Text = getAllInfo.Wfirstname
            txtWlastname.Text = getAllInfo.Wlastnamae
            txtphone2.Text = getAllInfo.Wphone
            txtWDob.Text = getAllInfo.Wdob
            txtWparents.Text = getAllInfo.Wparents
            txtWparentAd.Text = getAllInfo.Wparentsad
            txtWphone.Text = getAllInfo.Wphone
            txtfulname.Text = getAllInfo.Pastor
            witness1.Text = getAllInfo.Witness1
            witness2.Text = getAllInfo.Witness2
            txtsponsor.Text = getAllInfo.Sponsor
            txtMarriage.Text = getAllInfo.MarriageDate
            txtAddress.Text = getAllInfo.ResidentAddress
            txtVenue.Text = getAllInfo.venue
            txtParents.Text = getAllInfo.Hparents

        End If

    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim updateMember = madd.MarriageTables.Where(Function(h) h.SN = txtMemID.Text).SingleOrDefault

        updateMember.Hfirstname = txtFirstname.Text
        updateMember.Hlastname = txtLastName.Text
        updateMember.Hphone = txtPhone.Text
        updateMember.Hdob = txtDOB.Text
        updateMember.HparentsAd = txtHParentsAddress.Text
        updateMember.HparentsNo = txtHParentsNo.Text
        updateMember.Wfirstname = txtWfirtsname.Text
        updateMember.Wlastnamae = txtWlastname.Text
        updateMember.Wphone = txtphone2.Text
        updateMember.Wdob = txtWDob.Text
        updateMember.Pastor = txtfulname.Text
        updateMember.Wparents = txtWparents.Text
        updateMember.Wparentsad = txtWparentAd.Text
        updateMember.Wphone = txtWphone.Text
        updateMember.Witness1 = witness1.Text
        updateMember.Witness2 = witness2.Text
        updateMember.Sponsor = txtsponsor.Text
        updateMember.MarriageDate = txtMarriage.Text
        updateMember.ResidentAddress = txtAddress.Text
        updateMember.venue = txtVenue.Text
        updateMember.Hparents = txtParents.Text
        madd.SubmitChanges()

        'This Code is Displaying Saved Message and Reload/Refresh The Page
        Dim message As String = "Marriage Record, Edit Successfully!"
        Dim url As String = "ViewMarriage.aspx" ' The page tobe refreshed here!
        Dim script As String = "window.onload = function(){ alert('"
        script += message
        script += "');"
        script += "window.location = '"
        script += url
        script += "'; }"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)


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
End Class
