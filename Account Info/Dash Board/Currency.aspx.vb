
Partial Class Currency
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

        Dim checkCurrency = (From f In a.Currency_CodeTables
                            Where f.Currency_Code = txtCurrency.Text
                            Select f).Any

        If checkCurrency = True Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Existing Currency !!!')", True)
            Exit Sub
        End If


        If txtSymbol.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter a Symbol!!!')", True)
            Exit Sub
        End If

        Dim strDate As Date
        strDate = Now


        Dim savecurrency As New Currency_CodeTable With { _
           .Currency_Code = txtCurrency.Text, _
           .Countr_Name = DrpLoaction.SelectedValue, _
           .Sysmbol = txtSymbol.Text, _
           .Staffid = txtStaffID.Text, _
           .Datecreated = strDate}

        a.Currency_CodeTables.InsertOnSubmit(savecurrency)
        a.SubmitChanges()

        txtSymbol.Text = ""
        txtCurrency.Text = ""

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('saved!!!')", True)

        gridCurrency.DataBind()


        DrpLoaction.Items.Remove("Select")
        DrpLoaction.DataBind()
        DrpLoaction.Items.Insert(0, New ListItem("Select"))
        DrpLoaction.SelectedIndex = 0
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("ExchangeRate.aspx")
    End Sub
End Class
