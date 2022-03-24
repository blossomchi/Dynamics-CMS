
Partial Class AddVisitor
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

        
        End If
    End Sub
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext

        If txtfirstname.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter first name!!!')", True)
            Exit Sub
        End If

        If txtlastname.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter last name!!!')", True)
            Exit Sub
        End If

        Dim checkPhoneno = (From f In a.AddvisitorTables
                            Where f.Phone = txtphone.Text
                            Select f).Any

        If checkPhoneno = True Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Existing Contact, Just Follow up with the Contact !!!')", True)
            Exit Sub
        End If


        Dim strDate As Date
        strDate = Now


        Dim id = From i In a.AddvisitorTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            Lblid.Text = "VIS" & "" & z
        Else
            Lblid.Text = "VIS" & "" & 1

        End If

        Dim checkno = (From f In a.AddvisitorTables
                             Where f.Phone = txtphone.Text
                             Select f).Any

        If checkno = True Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Existing contact, so he/she need follow up !!!')", True)
            Exit Sub
        End If



        Dim savevisitor As New AddvisitorTable With { _
          .Vistorid = Lblid.Text, _
          .Firstname = txtfirstname.Text, _
          .Lastname = txtlastname.Text, _
          .Address = txtaddress.Text, _
          .Visitor = DropVisitor.SelectedValue, _
          .Phone = txtphone.Text, _
          .UpdatedBy = txtMembername.Text, _
          .Gender = DropGender.SelectedValue, _
          .Nationality = ddlCountry.SelectedValue, _
          .Respond = DropRespond.SelectedValue, _
          .ChurchDetailID = txtchurchID.Text, _
          .Datecreated = strDate}


        a.AddvisitorTables.InsertOnSubmit(savevisitor)
        a.SubmitChanges()

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Church member has been saved!!!')", True)


        txtfirstname.Text = ""
        txtlastname.Text = ""
        txtaddress.Text = ""
        txtphone.Text = ""

        DropGender.DataBind()
        DropGender.Items.Insert(0, New ListItem("Select"))
        DropGender.SelectedIndex = 0

        DropRespond.DataBind()
        DropRespond.Items.Insert(0, New ListItem("Select"))
        DropRespond.SelectedIndex = 0

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Data Saved !!!')", True)

    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Response.Redirect("ViewVisitor.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("ViewVisitor.aspx")
    End Sub
End Class
