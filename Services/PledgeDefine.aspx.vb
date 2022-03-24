
Partial Class PledgeDefine
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
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

        Dim checkDuty = (From f In a.ProjectTables
                            Where f.Projectname = txtName.Text
                            Select f).Any

        If checkDuty = True Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Existing Project Name !!!')", True)
            Exit Sub
        End If


        If txtName.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter Project Name!!!')", True)
            Exit Sub
        End If


        Dim strDate As Date
        strDate = Now

        Dim id = From i In a.ProjectTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            Lblid.Text = "Dut" & "" & z
        Else
            Lblid.Text = "Dut" & "" & 1

        End If

        Dim saveProject As New ProjectTable With { _
           .Projectid = Lblid.Text, _
           .Projectname = txtName.Text, _
           .ProjectDescrip = txtdesp.Text, _
           .Updatedby = txtMembername.Text, _
           .Churchid = txtchurchID.Text, _
           .datecreated = strDate}

        a.ProjectTables.InsertOnSubmit(saveProject)
        a.SubmitChanges()

        txtName.Text = ""
        txtdesp.Text = ""

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('saved!!!')", True)

        gridPledge.DataBind()
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Lblid.Text = ""
        txtName.Text = ""
        txtdesp.Text = ""
    End Sub
End Class
