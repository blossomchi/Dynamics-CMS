
Partial Class Areaform
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtchurchID.Text = ""
            txtLocation.Text = ""

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
            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID
            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName


            DrpLoaction.Items.Remove("Select")
            DrpLoaction.DataBind()
            DrpLoaction.Items.Insert(0, New ListItem("Select"))
            DrpLoaction.SelectedIndex = 0

        End If
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

        Dim checkArea = (From f In a.AreaTables
                            Where f.AreaName = txtAreaName.Text
                            Select f).Any

        If checkArea = True Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Existing Area !!!')", True)
            Exit Sub
        End If


        If txtAreaName.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter a Town name!!!')", True)
            Exit Sub
        End If

        Dim strDate As Date
        strDate = Now
       
        Dim id = From i In a.AreaTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            Lblid.Text = "Area" & "" & z
        Else
            Lblid.Text = "Area" & "" & 1

        End If

        Dim savearea As New AreaTable With { _
           .Areaid = Lblid.Text, _
           .AreaName = txtAreaName.Text, _
           .Description = txtdesp.Text, _
           .Updatedby = txtMembername.Text, _
           .Churchid = txtchurchID.Text, _
           .Locationid = DrpLoaction.SelectedValue, _
           .DateCreated = strDate}

        a.AreaTables.InsertOnSubmit(savearea)
        a.SubmitChanges()

        txtAreaName.Text = ""
        txtdesp.Text = ""

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('saved!!!')", True)

        gridArea.DataBind()


        DrpLoaction.Items.Remove("Select")
        DrpLoaction.DataBind()
        DrpLoaction.Items.Insert(0, New ListItem("Select"))
        DrpLoaction.SelectedIndex = 0
    End Sub
    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Response.Redirect("\Mainboard.aspx")
    End Sub
End Class
