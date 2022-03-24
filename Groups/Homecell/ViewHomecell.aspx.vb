
Partial Class ViewHomecell
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'put your code 
            Gridhomecell.DataBind()

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

            Gridhomecell.Visible = True
            txtcriteria.Text = ""
            GridName.Visible = False
            GridLeader.Visible = False
            GridArea.Visible = False
            txtcriteria.Visible = False
            btnSearch.Visible = False

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

    Protected Sub DrpSorted_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpSorted.SelectedIndexChanged
        If DrpSorted.SelectedValue = "Ascending" Then
            txtcriteria.Text = ""
            Gridhomecell.Visible = True
            txtcriteria.Visible = False
            GridName.Visible = False
            GridLeader.Visible = False
            GridArea.Visible = False
            btnSearch.Visible = False
            CBHomeCellArea.Visible = False
            CBHomeCellMinister.Visible = False
        ElseIf DrpSorted.SelectedValue = "Area" Then
            txtcriteria.Text = ""
            CBHomeCellArea.Visible = True
            CBHomeCellMinister.Visible = False
            CBHomeCellArea.Items.Remove("Select")
            CBHomeCellArea.DataBind()
            CBHomeCellArea.Items.Insert(0, New ListItem("Select"))
            CBHomeCellArea.SelectedIndex = 0


            Gridhomecell.Visible = False
            txtcriteria.Visible = False
            btnSearch.Visible = True
            GridName.Visible = False
            GridLeader.Visible = False
            GridArea.Visible = True
        ElseIf DrpSorted.SelectedValue = "Leader" Then
            txtcriteria.Text = ""
            CBHomeCellMinister.Visible = True

            CBHomeCellMinister.Items.Remove("Select")
            CBHomeCellMinister.DataBind()
            CBHomeCellMinister.Items.Insert(0, New ListItem("Select"))
            CBHomeCellMinister.SelectedIndex = 0


            Gridhomecell.Visible = False
            txtcriteria.Visible = False
            btnSearch.Visible = True
            GridName.Visible = False
            GridLeader.Visible = True
            GridArea.Visible = False
            CBHomeCellArea.Visible = False
        ElseIf DrpSorted.SelectedValue = "Home Fellowship" Then
            txtcriteria.Text = ""
            CBHomeCellMinister.Visible = False
            Gridhomecell.Visible = False
            btnSearch.Visible = True
            txtcriteria.Visible = True
            GridName.Visible = True
            GridLeader.Visible = False
            GridArea.Visible = False
            CBHomeCellArea.Visible = False
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        If DrpSorted.SelectedValue = "Area" Then
            If CBHomeCellArea.SelectedValue = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, select area!!!')", True)
                Exit Sub
            Else
                txtcriteria.Text = CBHomeCellArea.SelectedValue
                Dim checkName = madd.AreaTables.Where(Function(q) q.AreaName = txtcriteria.Text).Any

                If Not checkName Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
                ElseIf checkName Then
                    Gridhomecell.Visible = False
                    txtcriteria.Visible = False
                    btnSearch.Visible = True
                    GridName.Visible = False
                    GridLeader.Visible = False
                    GridArea.Visible = True
                    CBHomeCellMinister.Visible = False
                End If
            End If

        ElseIf DrpSorted.SelectedValue = "Leader" Then
            If CBHomeCellMinister.SelectedValue = "Select" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, select cell minster!!!')", True)
                Exit Sub
            Else
                txtcriteria.Text = CBHomeCellMinister.SelectedValue
                Dim checkName = madd.HomecellTables.Where(Function(q) q.CellMinister = txtcriteria.Text).Any

                If Not checkName Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
                ElseIf checkName Then
                    Gridhomecell.Visible = False
                    txtcriteria.Visible = False
                    btnSearch.Visible = True
                    GridName.Visible = False
                    GridLeader.Visible = True
                    GridArea.Visible = False
                    CBHomeCellArea.Visible = False
                End If
            End If

           

        ElseIf DrpSorted.SelectedValue = "Home Fellowship" Then

            Dim checkName = madd.HomecellTables.Where(Function(q) q.Name = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                Gridhomecell.Visible = False
                btnSearch.Visible = True
                txtcriteria.Visible = True
                GridName.Visible = True
                GridLeader.Visible = False
                GridArea.Visible = False
                CBHomeCellArea.Visible = False
                CBHomeCellMinister.Visible = False
            End If
        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("Homecell.aspx")
    End Sub
    Protected Sub Gridhomecell_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Gridhomecell.SelectedIndexChanged
        txtSn.Text = Gridhomecell.SelectedRow.Cells(0).Text

        Session("SNNN") = txtSn.Text

        Response.Redirect("EditHomecell.aspx")
    End Sub
End Class
