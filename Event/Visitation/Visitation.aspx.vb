
Partial Class Visitation
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
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

                txtLocation.Text = madd.Locations.Where(Function(s) s.Name = lbLocation.Text).SingleOrDefault.Locationid

                DrpMember.DataBind()
                DrpMember.Items.Insert(0, New ListItem("Select"))
                DrpMember.SelectedIndex = 0

                drpMember1.Items.Remove("Select")
                drpMember1.DataBind()
                drpMember1.Items.Insert(0, New ListItem("Select"))
                drpMember1.SelectedIndex = 0


                DropMinister.Items.Remove("Select")
                DropMinister.DataBind()
                DropMinister.Items.Insert(0, New ListItem("Select"))
                DropMinister.SelectedIndex = 0
            End If


        End If

    End Sub

    Protected Sub DrpMember_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpMember.SelectedIndexChanged
        Dim getFirstName = (From s In madd.MembershipTables
                           Where s.SN = DrpMember.SelectedValue
                           Select s).SingleOrDefault.FirstName

        Dim getLastName = (From s In madd.MembershipTables
                               Where s.SN = DrpMember.SelectedValue
                               Select s).SingleOrDefault.LastName


        Dim getNumber = (From s In madd.MembershipTables
                               Where s.SN = DrpMember.SelectedValue
                               Select s).SingleOrDefault.Phone1

        Dim getAddress = (From s In madd.MembershipTables
                              Where s.SN = DrpMember.SelectedValue
                              Select s).SingleOrDefault.Address


        txtfirstname.Text = getFirstName & " " & getLastName
        txtphone.Text = getNumber


        txtAddress.Text = getAddress
    End Sub

    Protected Sub drpMember1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpMember1.SelectedIndexChanged
        Dim getfName = (From s In madd.MembershipTables
                           Where s.SN = drpMember1.SelectedValue
                           Select s).SingleOrDefault.FirstName

        Dim getlName = (From s In madd.MembershipTables
                               Where s.SN = drpMember1.SelectedValue
                               Select s).SingleOrDefault.LastName


        Dim getNumber = (From s In madd.MembershipTables
                               Where s.SN = drpMember1.SelectedValue
                               Select s).SingleOrDefault.Phone1




        txtfullname.Text = getfName & " " & getlName

        txtPhone1.Text = getNumber

    End Sub

    Protected Sub DropMinister_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropMinister.SelectedIndexChanged

        Dim getFirstName = (From s In madd.MembershipTables
                         Where s.SN = DropMinister.SelectedValue
                         Select s).SingleOrDefault.FirstName

        Dim getLastName = (From s In madd.MembershipTables
                               Where s.SN = DropMinister.SelectedValue
                               Select s).SingleOrDefault.LastName


        Dim getNumber = (From s In madd.MembershipTables
                               Where s.SN = DropMinister.SelectedValue
                               Select s).SingleOrDefault.Phone1



        txtpastorname.Text = getFirstName & " " & getLastName

        txtPhone2.Text = getNumber
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext

        Dim strDate As Date
        strDate = Now

        Dim id = From i In a.VisitationTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            lblid.Text = "VI" & "" & z
        Else
            lblid.Text = "VI" & "" & 1

        End If

        If txtchurchID.Text = "" Then
            Response.Redirect("Login.aspx")
            Exit Sub
        End If


        Dim savevisitation As New VisitationTable With { _
       .Address = txtAddress.Text, _
       .DateUpdated = strDate, _
       .Name = txtfirstname.Text, _
        .Others = txtOthers.Text, _
       .Pastor = txtpastorname.Text, _
       .Phone = txtphone.Text, _
       .Phone1 = txtPhone2.Text, _
        .Reason = txtreason.Text, _
       .Staffid = txtStaffID.Text, _
        .Updatedby = txtStaffID.Text, _
       .Visitedby = txtfullname.Text, _
        .Visitorid = lblid.Text, _
       .Churchid = txtchurchID.Text, _
       .Datecreated = strDate}
        a.VisitationTables.InsertOnSubmit(savevisitation)
        a.SubmitChanges()

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Saved!!!')", True)


        txtOthers.Text = ""
        txtfirstname.Text = ""
        txtfullname.Text = ""
        txtAddress.Text = ""
        txtphone.Text = ""
        txtPhone2.Text = ""
        txtreason.Text = ""


        DrpMember.DataBind()
        DrpMember.Items.Insert(0, New ListItem("Select"))
        DrpMember.SelectedIndex = 0

        drpMember1.Items.Remove("Select")
        drpMember1.DataBind()
        drpMember1.Items.Insert(0, New ListItem("Select"))
        drpMember1.SelectedIndex = 0


        DropMinister.Items.Remove("Select")
        DropMinister.DataBind()
        DropMinister.Items.Insert(0, New ListItem("Select"))
        DropMinister.SelectedIndex = 0

    End Sub

    Protected Sub btnViewRec_Click(sender As Object, e As EventArgs) Handles btnViewRec.Click
        Response.Redirect("ViewVisitation.aspx")
    End Sub
End Class
