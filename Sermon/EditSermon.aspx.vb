
Partial Class Sermon
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
            IdenSN.Text = ""
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

            IdenSN.Text = Session("IdentifierID")

            If IdenSN.Text = "" Then
                Response.Redirect("ViewSermon.aspx")
                Exit Sub
            Else
                Dim strDate As Date
                strDate = Now

                txtdate.Text = strDate

                Dim getAllInfo = madd.SermonTables.Where(Function(d) d.SN = CInt(IdenSN.Text)).SingleOrDefault
                txtIdentifier.Text = getAllInfo.SermonIdentifier
                txtsermontitle.Text = getAllInfo.SermonTitle
                txtScripture.Text = getAllInfo.Scripture

                Dim minName As String = ""
                minName = getAllInfo.Pastor

                Dim checkMinisters = madd.MinisterTables.Where(Function(w) w.Name = minName AndAlso w.ChurchDetailID = txtchurchID.Text).Any
                If checkMinisters = True Then
                    Dim getMinsterID = madd.MinisterTables.Where(Function(w) w.Name = minName _
                                                                     AndAlso w.ChurchDetailID = txtchurchID.Text).SingleOrDefault.Ministerid

                    DrpName.DataBind()
                    DrpName.SelectedValue = getMinsterID
                    txtPastor.Text = madd.MinisterTables.Where(Function(w) w.Name = minName _
                                                                     AndAlso w.ChurchDetailID = txtchurchID.Text).SingleOrDefault.Name
                ElseIf checkMinisters = False Then
                    DrpName.DataBind()
                    DrpName.Items.Insert(0, New ListItem("Select"))
                    DrpName.SelectedIndex = 0

                    txtGSpecker.Text = minName
                    txtPastor.Text = txtGSpecker.Text
                End If
              
                txtDuration.Text = getAllInfo.Duration

                CKDVD.Checked = getAllInfo.SermonDvD
                CBAUDIO.Checked = getAllInfo.SermonAudio
                CKVIDEO.Checked = getAllInfo.SermonVideo
                CKMP3.Checked = getAllInfo.SermonMp3
                txtkeyword.Text = getAllInfo.Keyword



            End If
        End If
    End Sub

    Protected Sub DrpName_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpName.SelectedIndexChanged
        Dim getNumber = (From s In madd.MinisterTables
                         Where s.Ministerid = DrpName.SelectedValue
                         Select s).SingleOrDefault.PhoneNo



        txtPstNo.Text = getNumber

    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext

        Dim strDate As Date
        strDate = Format(Now, "dd/MM/yyyy")

        'Dim id = From i In a.SermonTables
        '         Select i
        'If id.Count > 0 Then

        '    Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
        '    Dim z = (CInt(latest) + 1)
        '    Lblid.Text = "Ser" & "" & z
        'Else
        '    Lblid.Text = "Ser" & "" & 1

        'End If

        If txtchurchID.Text = "" Then
            Response.Redirect("Login.aspx")
            Exit Sub
        End If

        If txtScripture.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, enter scripture!')", True)
            Exit Sub
        End If

        If txtsermontitle.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, enter topic!')", True)
            Exit Sub
        End If

        If txtDuration.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, enter duration!')", True)
            Exit Sub
        End If

        If txtIdentifier.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, enter unique identifier!')", True)
            Exit Sub
        End If

        If DrpName.SelectedValue <> "Select" Then
            Dim getFirstName = (From s In madd.MinisterTables
                         Where s.Ministerid = DrpName.SelectedValue
                         Select s).SingleOrDefault.Name

            txtPastor.Text = getFirstName

        ElseIf DrpName.SelectedValue = "Select" Then
            If txtGSpecker.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, enter guest speaker name!')", True)
                Exit Sub
            Else
                txtPastor.Text = txtGSpecker.Text
            End If
        End If

        Dim UpdateInfo = madd.SermonTables.Where(Function(r) r.SN = CInt(IdenSN.Text)).SingleOrDefault()
        UpdateInfo.SermonIdentifier = txtIdentifier.Text.ToUpper
        UpdateInfo.SermonTitle = txtsermontitle.Text.ToUpper
        UpdateInfo.Scripture = txtScripture.Text.ToUpper
        UpdateInfo.Pastor = txtPastor.Text.ToUpper
        UpdateInfo.Duration = txtDuration.Text.ToUpper
        UpdateInfo.SermonDvD = If(CKDVD.Checked = True, CKDVD.Checked, Nothing)
        UpdateInfo.SermonAudio = If(CBAUDIO.Checked = True, CBAUDIO.Checked, Nothing)
        UpdateInfo.SermonVideo = If(CKVIDEO.Checked = True, CKVIDEO.Checked, Nothing)
        UpdateInfo.SermonMp3 = If(CKMP3.Checked = True, CKMP3.Checked, Nothing)
        UpdateInfo.Keyword = txtkeyword.Text.ToUpper
      
        madd.SubmitChanges()

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Updated!!!')", True)

        DrpName.DataBind()
        DrpName.Items.Insert(0, New ListItem("Select"))
        DrpName.SelectedIndex = 0
        txtIdentifier.Text = ""
        txtPstNo.Text = ""
        txtkeyword.Text = ""
        txtPastor.Text = ""
        txtDuration.Text = ""
        txtsermontitle.Text = ""
        txtScripture.Text = ""
        txtGSpecker.Text = ""
        CBAUDIO.Checked = False
        CKDVD.Checked = False
        CKVIDEO.Checked = False
        CKMP3.Checked = False
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("ViewSermon.aspx")
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        txtPstNo.Text = ""
        txtkeyword.Text = ""
        txtPastor.Text = ""
        ' txtdate.Text = ""
        txtsermontitle.Text = ""
        txtScripture.Text = ""



        txtDuration.Text = ""
        txtsermontitle.Text = ""
        txtScripture.Text = ""
        txtGSpecker.Text = ""
        CBAUDIO.Checked = False
        CKDVD.Checked = False
        CKVIDEO.Checked = False
        CKMP3.Checked = False

        DrpName.DataBind()
        DrpName.Items.Insert(0, New ListItem("Select"))
        DrpName.SelectedIndex = 0
    End Sub

    Protected Sub CKDVD_CheckedChanged(sender As Object, e As EventArgs) Handles CKDVD.CheckedChanged
        If CKDVD.Checked = True Then
            DVD.Text = 1
        ElseIf CKDVD.Checked = False Then
            DVD.Text = ""
        End If
    End Sub
    Protected Sub CBAUDIO_CheckedChanged(sender As Object, e As EventArgs) Handles CBAUDIO.CheckedChanged
        If CBAUDIO.Checked = True Then
            Audio.Text = 1
        ElseIf CBAUDIO.Checked = False Then
            Audio.Text = ""
        End If
    End Sub

    Protected Sub CKVIDEO_CheckedChanged(sender As Object, e As EventArgs) Handles CKVIDEO.CheckedChanged
        If CKVIDEO.Checked = True Then
            video.Text = 1
        ElseIf CKVIDEO.Checked = False Then
            video.Text = ""
        End If
    End Sub

    Protected Sub CKMP3_CheckedChanged(sender As Object, e As EventArgs) Handles CKMP3.CheckedChanged
        If CKMP3.Checked = True Then
            mp.Text = 1
        ElseIf CKMP3.Checked = False Then
            mp.Text = ""
        End If
    End Sub
End Class
