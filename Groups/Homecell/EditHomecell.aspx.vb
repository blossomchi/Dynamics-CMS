
Partial Class Homecell
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'put your code 

            txHomeSN.Text = Session("SNNN")
            If txHomeSN.Text = "" Then
                Response.Redirect("ViewHomecell.aspx")
                Exit Sub
            End If
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


            Dim getAllHomeInfo = madd.HomecellTables.Where(Function(w) w.SN = txHomeSN.Text).SingleOrDefault()
            Dim zzz As String
            zzz = getAllHomeInfo.ZoneSN
            If zzz = "" Then
                CBZones.Items.Remove("Select")
                CBZones.DataBind()
                CBZones.Items.Insert(0, New ListItem("Select"))
                CBZones.SelectedIndex = 0
            ElseIf zzz = "Select" Then
                CBZones.Items.Remove("Select")
                CBZones.DataBind()
                CBZones.Items.Insert(0, New ListItem("Select"))
                CBZones.SelectedIndex = 0
            Else
                CBZones.DataBind()
                CBZones.SelectedValue = zzz
            End If
            Dim lo As String
            lo = getAllHomeInfo.locationid
            If lo = "" Then
                drpTown.Items.Remove("Select")
                drpTown.DataBind()
                drpTown.Items.Insert(0, New ListItem("Select"))
                drpTown.SelectedIndex = 0
            ElseIf lo = "Select" Then
                drpTown.Items.Remove("Select")
                drpTown.DataBind()
                drpTown.Items.Insert(0, New ListItem("Select"))
                drpTown.SelectedIndex = 0
            Else
                drpTown.DataBind()
                drpTown.SelectedValue = lo
            End If

            Dim are As String
            are = getAllHomeInfo.AreaId
            If are = "" Then
                drpArea.Items.Remove("Select")
                drpArea.DataBind()
                drpArea.Items.Insert(0, New ListItem("Select"))
                drpArea.SelectedIndex = 0
            ElseIf are = "Select" Then
                drpArea.Items.Remove("Select")
                drpArea.DataBind()
                drpArea.Items.Insert(0, New ListItem("Select"))
                drpArea.SelectedIndex = 0
            Else
                drpArea.DataBind()
                drpArea.SelectedValue = are
            End If

            txtHomecell.Text = getAllHomeInfo.Name
            txtCelladdress.Text = getAllHomeInfo.Adress
            txtfulname.Text = getAllHomeInfo.CellMinister

            If txtfulname.Text = "" Then
                drpLeader.Items.Remove("Select")
                drpLeader.DataBind()
                drpLeader.Items.Insert(0, New ListItem("Select"))
                drpLeader.SelectedIndex = 0
            Else
                Dim getFLName = (From s In madd.MembershipTables
                                       Where s.FirstName & " " & s.LastName = txtfulname.Text
                                       Select s).SingleOrDefault.SN

                drpLeader.DataBind()
                drpLeader.SelectedValue = getFLName
            End If

            
            txtMinisterAdd.Text = getAllHomeInfo.MinsterAdd
            txtphone1.Text = getAllHomeInfo.Phone
         

            btnSave.Text = "Edit"
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
        If btnSave.Text = "Edit" Then
            'Edit information
            Dim UpdateInformations = madd.HomecellTables.Where(Function(r) r.SN = txHomeSN.Text).SingleOrDefault

            UpdateInformations.AreaId = drpArea.SelectedValue
            UpdateInformations.Name = txtHomecell.Text
            UpdateInformations.locationid = drpTown.SelectedValue
            UpdateInformations.Adress = txtCelladdress.Text
            UpdateInformations.CellMinister = txtfulname.Text
            UpdateInformations.MinsterAdd = txtMinisterAdd.Text
            UpdateInformations.Phone = txtphone1.Text
           
            madd.SubmitChanges()

            'This Code is Displaying Saved Message and Reload/Refresh The Page
            Dim message As String = "House Fellowship, Edited Successfully!"
            Dim url As String = "ViewHomecell.aspx" ' The page tobe refreshed here!
            Dim script As String = "window.onload = function(){ alert('"
            script += message
            script += "');"
            script += "window.location = '"
            script += url
            script += "'; }"
            ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)

        End If
        

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
