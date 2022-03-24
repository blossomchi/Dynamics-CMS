
Partial Class FunctionalGroup
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
            'put your code 

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



            drpCommitteA.DataBind()
            drpCommitteA.Items.Insert(0, New ListItem("Select"))
            drpCommitteA.SelectedIndex = 0


            DrpName.DataBind()
            DrpName.Items.Insert(0, New ListItem("Select"))
            DrpName.SelectedIndex = 0


            DrpGroup.DataBind()
            DrpGroup.Items.Insert(0, New ListItem("Select"))
            DrpGroup.SelectedIndex = 0





        End If
    End Sub

    Protected Sub DrpName_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpName.SelectedIndexChanged
        Dim getFirstName = (From s In madd.MembershipTables
                            Where s.SN = DrpName.SelectedValue
                            Select s).SingleOrDefault.FirstName

        Dim getLastName = (From s In madd.MembershipTables
                               Where s.SN = DrpName.SelectedValue
                               Select s).SingleOrDefault.LastName


        Dim getNumber = (From s In madd.MembershipTables
                               Where s.SN = DrpName.SelectedValue
                               Select s).SingleOrDefault.Phone1


        txtfulname.Text = getFirstName & " " & getLastName

        txtPhone.Text = getNumber
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Response.Redirect("ViewFunGroup.aspx")
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Dim a As New churchmanDataContext

        Dim strDate As String = Date.Now.ToString("MM/dd/yyyy hh:mm:ss tt") 'Returns date with AM/PM'

        Dim id = From i In a.FunctionalGroupTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            Lblid.Text = "Fun" & "" & z
        Else
            Lblid.Text = "Fun" & "" & 1

        End If

        Dim saveGroup As New FunctionalGroupTable With { _
             .Churchid = txtchurchID.Text, _
             .Updateby = txtMembername.Text, _
             .ComId = drpCommitteA.SelectedValue, _
             .FuctionGid = Lblid.Text, _
             .MemberGroupID = DrpGroup.SelectedValue, _
             .Name = txtfulname.Text, _
             .PhoneNumber = txtPhone.Text, _
            .DateCreated = strDate}

        a.FunctionalGroupTables.InsertOnSubmit(saveGroup)
        a.SubmitChanges()

        txtPhone.Text = ""


        drpCommitteA.Items.Remove("Select")
        drpCommitteA.DataBind()
        drpCommitteA.Items.Insert(0, New ListItem("Select"))
        drpCommitteA.SelectedIndex = 0

        DrpName.Items.Remove("Select")
        DrpName.DataBind()
        DrpName.Items.Insert(0, New ListItem("Select"))
        DrpName.SelectedIndex = 0


        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Added!!!')", True)
    End Sub

 
    Protected Sub DrpGroup_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpGroup.SelectedIndexChanged
        'Dim getname = (From s In madd.MembersGroups
        '                     Where s.ID = DrpGroup.SelectedValue
        '                     Select s).SingleOrDefault.GroupName


        'txtgroupname.Text = getname
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext
        Dim strDate As Date
        strDate = Now

        Dim id = From i In a.FunctionalGroupTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            Lblid.Text = "Fun" & "" & z
        Else
            Lblid.Text = "Fun" & "" & 1

        End If

        Dim saveGroup As New FunctionalGroupTable With { _
            .Churchid = txtchurchID.Text, _
            .Updateby = txtMembername.Text, _
            .ComId = drpCommitteA.SelectedValue, _
            .FuctionGid = Lblid.Text, _
            .MemberGroupID = DrpGroup.SelectedValue, _
            .Name = txtfulname.Text, _
            .PhoneNumber = txtPhone.Text, _
           .DateCreated = strDate}

        a.FunctionalGroupTables.InsertOnSubmit(saveGroup)
        a.SubmitChanges()
        txtPhone.Text = ""
        drpCommitteA.Items.Remove("Select")
        drpCommitteA.DataBind()
        drpCommitteA.Items.Insert(0, New ListItem("Select"))
        drpCommitteA.SelectedIndex = 0

        DrpName.Items.Remove("Select")
        DrpName.DataBind()
        DrpName.Items.Insert(0, New ListItem("Select"))
        DrpName.SelectedIndex = 0

        DrpGroup.Items.Remove("Select")
        DrpGroup.DataBind()
        DrpGroup.Items.Insert(0, New ListItem("Select"))
        DrpGroup.SelectedIndex = 0

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('saved!!!')", True)
    End Sub
End Class


