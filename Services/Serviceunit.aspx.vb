
Partial Class Serviceunit
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
            btnSave.Text = "Save"
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


            ' txtchurchid.Text = ""
            txtenter.Text = name.ToUpper

            If lbChurchName.Text = "" Then
                Response.Redirect("Login.aspx")
                Exit Sub
            End If
        End If
    End Sub
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext

        If btnSave.Text = "Save" Then
            If txtservice.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter service unit!!!')", True)
                Exit Sub
            End If



            Dim id = From i In a.UnitTables
                     Select i
            If id.Count > 0 Then

                Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
                Dim z = (CInt(latest) + 1)
                Lblid.Text = "SER" & "" & z
            Else
                Lblid.Text = "SER" & "" & 1

            End If

            Dim saveunit As New UnitTable With { _
           .ServiceId = Lblid.Text, _
           .ServiceName = txtservice.Text, _
           .SeviceDescrip = txtdesp.Text, _
           .Enterby = txtenter.Text, _
           .Datecreated = Now}

            a.UnitTables.InsertOnSubmit(saveunit)
            a.SubmitChanges()

            txtservice.Text = ""
            txtdesp.Text = ""


            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Service Unit has been saved!!!')", True)

            GridUnit.DataBind()
        ElseIf btnSave.Text = "Edit" Then

            Dim updateServicess = madd.UnitTables.Where(Function(d) d.SN = txtServicesId.Text).SingleOrDefault()

            updateServicess.ServiceName = txtservice.Text.ToUpper
            updateServicess.SeviceDescrip = txtdesp.Text.ToUpper

            madd.SubmitChanges()

            Dim CountName = madd.UnitTables.Where(Function(q) q.ServiceName = txtservice.Text).Count

            If CountName = 1 Then
                'do nothing
            ElseIf CountName <> 1 Then
                Dim updateGroups1 = madd.UnitTables.Where(Function(d) d.SN = txtServicesId.Text).SingleOrDefault()

                updateGroups1.ServiceName = txtPendingServices.Text.ToUpper
                updateGroups1.SeviceDescrip = txtdesp.Text.ToUpper

                madd.SubmitChanges()

            End If


            txtservice.Text = ""
            txtdesp.Text = ""


            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Service Unit was updated!')", True)

            GridUnit.DataBind()

            btnSave.Text = "Save"
        End If
      
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Server.Transfer("Addmember.aspx")
    End Sub

    

    Protected Sub GridUnit_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridUnit.SelectedIndexChanged
        btnSave.Text = "Edit"
        Dim ServicesID = GridUnit.SelectedRow.Cells(0).Text
        txtServicesId.Text = ServicesID

        txtservice.Text = GridUnit.SelectedRow.Cells(1).Text
        txtPendingServices.Text = txtservice.Text
        txtdesp.Text = GridUnit.SelectedRow.Cells(2).Text
    End Sub
End Class
