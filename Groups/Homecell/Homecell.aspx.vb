
Partial Class Homecell
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
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

            txtLocation.Text = madd.Locations.Where(Function(s) s.Name = lbLocation.Text).SingleOrDefault.Locationid

            drpLeader.Items.Remove("Select")
            drpLeader.DataBind()
            drpLeader.Items.Insert(0, New ListItem("Select"))
            drpLeader.SelectedIndex = 0

            drpArea.Items.Remove("Select")
            drpArea.DataBind()
            drpArea.Items.Insert(0, New ListItem("Select"))
            drpArea.SelectedIndex = 0

            drpTown.Items.Remove("Select")
            drpTown.DataBind()
            drpTown.Items.Insert(0, New ListItem("Select"))
            drpTown.SelectedIndex = 0


            CBZones.Items.Remove("Select")
            CBZones.DataBind()
            CBZones.Items.Insert(0, New ListItem("Select"))
            CBZones.SelectedIndex = 0
        End If

    End Sub
    Protected Sub drpLeader_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpLeader.SelectedIndexChanged

        If drpLeader.SelectedValue <> "Select" Then

            Dim getFirstName = (From s In madd.MembershipTables
                                    Where s.SN = drpLeader.SelectedValue
                                    Select s).SingleOrDefault.FirstName

            Dim getLastName = (From s In madd.MembershipTables
                                   Where s.SN = drpLeader.SelectedValue
                                   Select s).SingleOrDefault.LastName



            Dim getAddress = (From s In madd.MembershipTables
                                   Where s.SN = drpLeader.SelectedValue
                                   Select s).SingleOrDefault.Address

            Dim getNumber = (From s In madd.MembershipTables
                                   Where s.SN = drpLeader.SelectedValue
                                   Select s).SingleOrDefault.Phone1


            txtfulname.Text = getFirstName & " " & getLastName

            txtMinisterAdd.Text = getAddress

            txtphone1.Text = getNumber
        ElseIf drpLeader.SelectedValue = "Select" Then
            txtfulname.Text = ""
            txtMinisterAdd.Text = ""
            txtphone1.Text = ""

        End If
    End Sub
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        If CBZones.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please zones!!!')", True)
            Exit Sub
        End If
        If txtHomecell.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter Homecell name!!!')", True)
            Exit Sub
        End If

        If drpTown.SelectedValue = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select a town!!!')", True)
            Exit Sub
        End If


        Dim a As New churchmanDataContext
        Dim strDate As Date
        strDate = Now

        Dim id = From i In a.HomecellTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            lblhm.Text = "HF" & "" & z
        Else
            lblhm.Text = "HF" & "" & 1

        End If

        Dim savehomecell As New HomecellTable With { _
       .id = lblhm.Text, _
       .ZoneSN = CBZones.SelectedValue, _
       .AreaId = drpArea.SelectedValue, _
       .Name = txtHomecell.Text.ToUpper, _
       .locationid = drpTown.SelectedValue, _
       .Adress = txtCelladdress.Text.ToUpper, _
       .CellMinister = txtfulname.Text, _
       .MinsterAdd = txtMinisterAdd.Text.ToUpper, _
       .Phone = txtphone1.Text, _
       .Updateby = txtMembername.Text, _
       .ChurchDetailID = txtchurchID.Text, _
       .Celldescription = txtdesp.Text, _
       .Datecreated = strDate
     }

        a.HomecellTables.InsertOnSubmit(savehomecell)
        a.SubmitChanges()

        'This Code is Displaying Saved Message and Reload/Refresh The Page
        Dim message As String = "House Fellowship, Added Successfully!"
        Dim url As String = "Homecell.aspx" ' The page tobe refreshed here!
        Dim script As String = "window.onload = function(){ alert('"
        script += message
        script += "');"
        script += "window.location = '"
        script += url
        script += "'; }"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("ViewHomecell.aspx")
    End Sub
    Protected Sub drpTown_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpTown.SelectedIndexChanged
        If drpTown.SelectedValue <> "Select" Then
            drpArea.Items.Remove("Select")
            drpArea.DataBind()
            drpArea.Items.Insert(0, New ListItem("Select"))
            drpArea.SelectedIndex = 0
        End If
    End Sub
End Class
