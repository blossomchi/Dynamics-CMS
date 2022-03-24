
Partial Class AddMinisters
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtCHID.Text = ""
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

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID
            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            'get miniter information
            TXTSN.Text = Session("MinistersID")

            If TXTSN.Text = "" Then
                Response.Redirect("ViewMinister.aspx")
                Exit Sub
            Else
                Dim getAllInfo = madd.MinisterTables.Where(Function(w) w.SN = TXTSN.Text).SingleOrDefault

                CBType.DataBind()
                CBType.SelectedValue = getAllInfo.PastorsTypes

                '************************
                txtfulname.Text = getAllInfo.Name

                If CBType.SelectedValue = "Church Member" Then
                    ChurchMember.Visible = True
                    NonChurchMember.Visible = False

                    drpTitle.DataBind()
                    drpTitle.SelectedValue = getAllInfo.Title
                    txtname.Text = drpTitle.SelectedValue

                    DrpName.DataBind()
                    DrpName.SelectedValue = madd.MembershipTables.Where(Function(s) s.ChurchDetailID = txtchurchID.Text _
                                                                            AndAlso s.FirstName & " " & s.LastName = txtfulname.Text).SingleOrDefault.SN
                    PastorName.Text = txtfulname.Text

                ElseIf CBType.SelectedValue = "None Church Member" Then
                    ChurchMember.Visible = False
                    NonChurchMember.Visible = True

                    CBHierarchy.DataBind()
                    CBHierarchy.SelectedValue = getAllInfo.ChurchDesigID

                    txtCHID.Text = CBHierarchy.SelectedValue

                    CBChurch.DataBind()
                    CBChurch.SelectedValue = getAllInfo.ChurchDetailID

                    PastorName.Text = txtfulname.Text

                End If

                txtPhone.Text = getAllInfo.PhoneNo

                drpServices.DataBind()
                drpServices.SelectedValue = getAllInfo.Services

                DrpPost.DataBind()
                DrpPost.SelectedValue = getAllInfo.Post


            End If
        End If
    End Sub

    Protected Sub Button6_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        'Update ministers

        Dim strDate As Date
        strDate = Now

        Dim churchHierarchyID As String = ""
        Dim churchDetailsID As String = ""
        Dim PastorsTitle As String = ""
        txtfulname.Text = ""

        If CBType.SelectedValue = "Church Member" Then
            churchHierarchyID = madd.ChurchDetailTables.Where(Function(s) s.ChurchDetailID = txtchurchID.Text).SingleOrDefault.ChurchDesgID
            churchDetailsID = txtchurchID.Text
            PastorsTitle = drpTitle.SelectedValue

            Dim getFirstName = (From s In madd.MembershipTables
                             Where s.SN = DrpName.SelectedValue
                             Select s).SingleOrDefault.FirstName

            Dim getLastName = (From s In madd.MembershipTables
                                   Where s.SN = DrpName.SelectedValue
                                   Select s).SingleOrDefault.LastName


            txtfulname.Text = getFirstName & " " & getLastName

        ElseIf CBType.SelectedValue = "None Church Member" Then
            churchHierarchyID = CBHierarchy.SelectedValue
            churchDetailsID = CBChurch.SelectedValue
            PastorsTitle = CBType.SelectedValue
            txtfulname.Text = PastorName.Text

        End If

        Dim updateMinisters = madd.MinisterTables.Where(Function(r) r.SN = TXTSN.Text).SingleOrDefault()
        updateMinisters.PastorsTypes = CBType.SelectedValue
        updateMinisters.ChurchDesigID = churchHierarchyID
        updateMinisters.ChurchDetailID = churchDetailsID
        updateMinisters.Title = PastorsTitle
        updateMinisters.Name = txtfulname.Text.ToUpper
        updateMinisters.PhoneNo = txtPhone.Text
        updateMinisters.Post = DrpPost.SelectedValue
        updateMinisters.Services = drpServices.SelectedValue
        updateMinisters.DateCreated = Now

        madd.SubmitChanges()

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Ministers was updated!!!')", True)

        txtPhone.Text = ""
        PastorName.Text = ""

        CBHierarchy.Items.Remove("Select")
        CBHierarchy.DataBind()
        CBHierarchy.Items.Insert(0, New ListItem("Select"))
        CBHierarchy.SelectedIndex = 0

        CBChurch.Items.Remove("Select")
        CBChurch.DataBind()
        CBChurch.Items.Insert(0, New ListItem("Select"))
        CBChurch.SelectedIndex = 0



        CBType.Items.Remove("Select")
        CBType.DataBind()
        CBType.Items.Insert(0, New ListItem("Select"))
        CBType.SelectedIndex = 0

        drpTitle.Items.Remove("Select")
        drpTitle.DataBind()
        drpTitle.Items.Insert(0, New ListItem("Select"))
        drpTitle.SelectedIndex = 0

        DrpPost.Items.Remove("Select")
        DrpPost.DataBind()
        DrpPost.Items.Insert(0, New ListItem("Select"))
        DrpPost.SelectedIndex = 0

        drpServices.Items.Remove("Select")
        drpServices.DataBind()
        drpServices.Items.Insert(0, New ListItem("Select"))
        drpServices.SelectedIndex = 0

        DrpName.Items.Remove("Select")
        DrpName.DataBind()
        DrpName.Items.Insert(0, New ListItem("Select"))
        DrpName.SelectedIndex = 0

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

    Protected Sub drpTitle_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpTitle.SelectedIndexChanged
        txtname.Text = drpTitle.SelectedValue

        DrpName.Items.Remove("Select")
        DrpName.DataBind()
        DrpName.Items.Insert(0, New ListItem("Select"))
        DrpName.SelectedIndex = 0
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("ViewMinister.aspx")
    End Sub

    Protected Sub CBType_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CBType.SelectedIndexChanged
        If CBType.SelectedValue = "Church Member" Then
            ChurchMember.Visible = True
            NonChurchMember.Visible = False

            drpTitle.Items.Remove("Select")
            drpTitle.DataBind()
            drpTitle.Items.Insert(0, New ListItem("Select"))
            drpTitle.SelectedIndex = 0

            DrpPost.Items.Remove("Select")
            DrpPost.DataBind()
            DrpPost.Items.Insert(0, New ListItem("Select"))
            DrpPost.SelectedIndex = 0

            DrpName.Items.Remove("Select")
            DrpName.DataBind()
            DrpName.Items.Insert(0, New ListItem("Select"))
            DrpName.SelectedIndex = 0
        ElseIf CBType.SelectedValue = "None Church Member" Then
            ChurchMember.Visible = False
            NonChurchMember.Visible = True
        ElseIf CBType.SelectedValue = "Select" Then
            ChurchMember.Visible = False
            NonChurchMember.Visible = False
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, select member type!')", True)
            Exit Sub
        End If

    End Sub

  
    Protected Sub CBHierarchy_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CBHierarchy.SelectedIndexChanged

        txtCHID.Text = CBHierarchy.SelectedValue

        CBChurch.Items.Remove("Select")
        CBChurch.DataBind()
        CBChurch.Items.Insert(0, New ListItem("Select"))
        CBChurch.SelectedIndex = 0
    End Sub
End Class
