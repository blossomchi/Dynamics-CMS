
Partial Class ViewSermon
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

            DrpCriteria.DataBind()
            DrpCriteria.Items.Insert(0, New ListItem("Select"))
            DrpCriteria.SelectedIndex = 0


            GridSermon.Visible = True
            txtcriteria.Visible = False
            GridDate.Visible = False
            GrideTitle.Visible = False
            GridKeyword.Visible = False
            GridPastor.Visible = False
        End If
    End Sub

    Protected Sub DrpCriteria_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpCriteria.SelectedIndexChanged
        If DrpCriteria.SelectedValue = "Ascending" Then
            txtcriteria.Text = ""
            GridSermon.Visible = True
            txtcriteria.Visible = False
            GridDate.Visible = False
            GrideTitle.Visible = False
            GridKeyword.Visible = False
            GridPastor.Visible = False
            GridIdentifier.Visible = True
            DatePicker.Visible = False
        ElseIf DrpCriteria.SelectedValue = "Sermon Title" Then
            txtcriteria.Text = ""
            GridSermon.Visible = False
            txtcriteria.Visible = True
            GridDate.Visible = False
            GrideTitle.Visible = True
            GridKeyword.Visible = False
            GridPastor.Visible = False
            GridIdentifier.Visible = True
            DatePicker.Visible = False
        ElseIf DrpCriteria.SelectedValue = "Pastor" Then
            txtcriteria.Text = ""
            GridSermon.Visible = False
            txtcriteria.Visible = True
            GridDate.Visible = False
            GrideTitle.Visible = False
            GridKeyword.Visible = False
            GridPastor.Visible = True
            GridIdentifier.Visible = True
            DatePicker.Visible = False
        ElseIf DrpCriteria.SelectedValue = "Keywords" Then
            txtcriteria.Text = ""
            GridSermon.Visible = False
            txtcriteria.Visible = True
            GridDate.Visible = False
            GrideTitle.Visible = False
            GridKeyword.Visible = True
            GridPastor.Visible = False
            GridIdentifier.Visible = True
            DatePicker.Visible = False
        ElseIf DrpCriteria.SelectedValue = "Date" Then
            txtcriteria.Text = ""
            GridSermon.Visible = False
            txtcriteria.Visible = False
            DatePicker.Visible = True
            DatePicker.Clear()
            GridDate.Visible = False
            GrideTitle.Visible = False
            GridKeyword.Visible = False
            GridPastor.Visible = False
            GridIdentifier.Visible = True
        ElseIf DrpCriteria.SelectedValue = "Identifier" Then
            txtcriteria.Text = ""
            DatePicker.Visible = False
            GridSermon.Visible = False
            txtcriteria.Visible = True
            GridDate.Visible = False
            GrideTitle.Visible = False
            GridKeyword.Visible = False
            GridPastor.Visible = False
            GridIdentifier.Visible = True
        End If
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        If DrpCriteria.SelectedValue = "Sermon Title" Then
            Dim checkName = madd.SermonTables.Where(Function(q) q.SermonTitle = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                GridSermon.Visible = False
                txtcriteria.Visible = True
                GrideTitle.Visible = True
       
            End If

        ElseIf DrpCriteria.SelectedValue = "Pastor" Then
            Dim checkName = madd.SermonTables.Where(Function(q) q.Pastor = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                GridSermon.Visible = False
                txtcriteria.Visible = True
                GridPastor.Visible = True
            End If

        ElseIf DrpCriteria.SelectedValue = "Keywords" Then
            Dim checkName = madd.SermonTables.Where(Function(q) q.Keyword = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                GridSermon.Visible = False
                txtcriteria.Visible = True
                GridKeyword.Visible = True
            End If

        ElseIf DrpCriteria.SelectedValue = "Date" Then
            GridSermon.Visible = False
            txtcriteria.Visible = False
            GridDate.Visible = True
           

        ElseIf DrpCriteria.SelectedValue = "Identifier" Then
            GridSermon.Visible = False
            txtcriteria.Visible = True
            GridIdentifier.Visible = True
        End If
    End Sub

    Protected Sub txtcriteria_TextChanged(sender As Object, e As EventArgs) Handles txtcriteria.TextChanged
        'Dim dateSelected As Date
        'If DrpCriteria.SelectedValue = "" Then
        '    'message
        '    Exit Sub
        'ElseIf DrpCriteria.SelectedValue = "Date" Then
        '    dateSelected = CDate(txtcriteria.Text)
        '    txtcriteria.Text = Format(dateSelected, "yyyy-MM-dd")

        '    GridSermon.Visible = False
        '    txtcriteria.Visible = True
        '    GridDate.Visible = True
        'End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("Sermon.aspx")
    End Sub

    Protected Sub GridSermon_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridSermon.SelectedIndexChanged
        Dim getID = GridSermon.SelectedRow.Cells(1).Text

        Session("IdentifierID") = getID

        Response.Redirect("EditSermon.aspx")

    End Sub

    Protected Sub GrideTitle_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GrideTitle.SelectedIndexChanged
        Dim getID = GrideTitle.SelectedRow.Cells(1).Text

        Session("IdentifierID") = getID

        Response.Redirect("EditSermon.aspx")
    End Sub

    Protected Sub GridPastor_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridPastor.SelectedIndexChanged
        Dim getID = GridPastor.SelectedRow.Cells(1).Text

        Session("IdentifierID") = getID

        Response.Redirect("EditSermon.aspx")
    End Sub

    Protected Sub GridKeyword_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridKeyword.SelectedIndexChanged
        Dim getID = GridKeyword.SelectedRow.Cells(1).Text

        Session("IdentifierID") = getID

        Response.Redirect("EditSermon.aspx")
    End Sub

    Protected Sub GridDate_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridDate.SelectedIndexChanged
        Dim getID = GridDate.SelectedRow.Cells(1).Text

        Session("IdentifierID") = getID

        Response.Redirect("EditSermon.aspx")
    End Sub

    Protected Sub GridIdentifier_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridIdentifier.SelectedIndexChanged
        Dim getID = GridIdentifier.SelectedRow.Cells(1).Text

        Session("IdentifierID") = getID

        Response.Redirect("EditSermon.aspx")
    End Sub
    Protected Sub DatePicker_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles DatePicker.SelectedDateChanged
       
        txtcriteria.Text = Format(DatePicker.SelectedDate, "yyyy-MM-dd")

      

    End Sub
End Class
