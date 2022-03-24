
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

            PastorType.Items.Remove("Select")
            PastorType.DataBind()
            PastorType.Items.Insert(0, New ListItem("Select"))
            PastorType.SelectedIndex = 0

            CBZones.Items.Remove("Select")
            CBZones.DataBind()
            CBZones.Items.Insert(0, New ListItem("Select"))
            CBZones.SelectedIndex = 0

            CBZones.Enabled = False
            txtenter.Enabled = False
            PastorType.Enabled = False
            txtName.Enabled = False
            TxtPhones.Enabled = False
            Zones.Text = ""
            Zones.Enabled = True
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
            If txtName.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter pastor name!!')", True)
                Exit Sub
            End If

            If TxtPhones.Text = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter pastors number!!')", True)
                Exit Sub
            End If

            If PastorType.SelectedValue = "Select" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select pastor type!')", True)
                Exit Sub
            End If

            If CBZones.SelectedValue = "Select" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select zones!')", True)
                Exit Sub
            End If
            Dim id = From i In a.UnitTables
                     Select i

            Dim saveunit As New HomeCellZonesPastorsTable With { _
           .ZoneSN = CBZones.SelectedValue, _
           .PastorType = PastorType.SelectedValue, _
           .Pastor = txtName.Text.ToUpper, _
           .PastorsNumber = TxtPhones.Text, _
           .EnterBy = txtenter.Text, _
           .DateCreated = Now}

            a.HomeCellZonesPastorsTables.InsertOnSubmit(saveunit)
            a.SubmitChanges()

            TxtPhones.Text = ""
            txtName.Text = ""

            PastorType.Items.Remove("Select")
            PastorType.DataBind()
            PastorType.Items.Insert(0, New ListItem("Select"))
            PastorType.SelectedIndex = 0

            CBZones.Items.Remove("Select")
            CBZones.DataBind()
            CBZones.Items.Insert(0, New ListItem("Select"))
            CBZones.SelectedIndex = 0

            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Zonal Pastors has been saved!!!')", True)

            GridUnit.DataBind()

        ElseIf btnSave.Text = "Edit" Then

            Dim updatePastor = madd.HomeCellZonesPastorsTables.Where(Function(d) d.SN = txtServicesId.Text).SingleOrDefault()

            updatePastor.ZoneSN = CBZones.SelectedValue
            updatePastor.PastorType = PastorType.SelectedValue
            updatePastor.Pastor = txtName.Text.ToUpper
            updatePastor.PastorsNumber = TxtPhones.Text

            madd.SubmitChanges()

            
            TxtPhones.Text = ""
            txtName.Text = ""

            PastorType.Items.Remove("Select")
            PastorType.DataBind()
            PastorType.Items.Insert(0, New ListItem("Select"))
            PastorType.SelectedIndex = 0

            CBZones.Items.Remove("Select")
            CBZones.DataBind()
            CBZones.Items.Insert(0, New ListItem("Select"))
            CBZones.SelectedIndex = 0


            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Updated!')", True)

            GridUnit.DataBind()

            btnSave.Text = "Save"
        End If

    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Server.Transfer("HomeCellZones.aspx")
    End Sub



    Protected Sub GridUnit_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridUnit.SelectedIndexChanged
        btnSave.Text = "Edit"
        Dim SNID = GridUnit.SelectedRow.Cells(0).Text
        txtServicesId.Text = SNID

        CBZones.DataBind()
        CBZones.SelectedValue = madd.HomeCellZonesPastorsTables.Where(Function(s) s.SN = SNID).SingleOrDefault.ZoneSN
        PastorType.DataBind()
        PastorType.SelectedValue = madd.HomeCellZonesPastorsTables.Where(Function(s) s.SN = SNID).SingleOrDefault.PastorType

        txtName.Text = madd.HomeCellZonesPastorsTables.Where(Function(s) s.SN = SNID).SingleOrDefault.Pastor
        TxtPhones.Text = madd.HomeCellZonesPastorsTables.Where(Function(s) s.SN = SNID).SingleOrDefault.PastorsNumber
    End Sub

    Protected Sub NextBnt_Click(sender As Object, e As EventArgs) Handles NextBnt.Click
        If Zones.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter zones!!')", True)
            Exit Sub
        End If

        Dim checkZones = madd.HomeCellZonesTables.Where(Function(q) q.Zones = Zones.Text).Any
      
        If checkZones Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('zone already exist!!')", True)
            Zones.Text = ""
            Exit Sub
        End If
        Dim saveunit As New HomeCellZonesTable With { _
        .Zones = Zones.Text.ToUpper, _
       .EnterBy = txtenter.Text, _
       .DateCreated = Now}

        madd.HomeCellZonesTables.InsertOnSubmit(saveunit)
        madd.SubmitChanges()
        Zones.Text = ""
        Zones.Enabled = False
        CBZones.Items.Remove("Select")
        CBZones.DataBind()
        CBZones.Items.Insert(0, New ListItem("Select"))
        CBZones.SelectedIndex = 0
        btnSave.Enabled = True
        btnCancel.Enabled = True
        CBZones.Enabled = True
        txtenter.Enabled = True
        PastorType.Enabled = True
        txtName.Enabled = True
        TxtPhones.Enabled = True
    End Sub

    Protected Sub btnCancel0_Click(sender As Object, e As EventArgs) Handles btnCancel0.Click
        Zones.Text = ""
        Zones.Enabled = False
        CBZones.Items.Remove("Select")
        CBZones.DataBind()
        CBZones.Items.Insert(0, New ListItem("Select"))
        CBZones.SelectedIndex = 0

        CBZones.Enabled = True
        txtenter.Enabled = True
        PastorType.Enabled = True
        txtName.Enabled = True
        TxtPhones.Enabled = True

        btnSave.Enabled = True
        btnCancel.Enabled = True
    End Sub

    Protected Sub NextBnt0_Click(sender As Object, e As EventArgs) Handles NextBnt0.Click
        Zones.Enabled = True
        Zones.Text = ""
        CBZones.Items.Remove("Select")
        CBZones.DataBind()
        CBZones.Items.Insert(0, New ListItem("Select"))
        CBZones.SelectedIndex = 0

        btnSave.Enabled = False
        btnCancel.Enabled = False
        CBZones.Enabled = False
        txtenter.Enabled = False
        PastorType.Enabled = False
        txtName.Enabled = False
        TxtPhones.Enabled = False
    End Sub
End Class
