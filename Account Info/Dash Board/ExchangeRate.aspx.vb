
Partial Class ExchangeRate
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


        If btnSave.Text = "Edit" Then
            Dim getexchange = gridExchangerate.SelectedRow.Cells(0).Text

            Dim updateservice = madd.Exchange_RateTables.Where(Function(l) l.id = getexchange).SingleOrDefault

            updateservice.Exchange_Rate = txtExchangeRate.Text
            updateservice.Updatedby = txtMembername.Text

            madd.SubmitChanges()

            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Currency has been Edited!!!')", True)

            gridExchangerate.DataBind()

            txtExchangeRate.Text = ""

            DrpLoaction.Items.Remove("Select")
            DrpLoaction.DataBind()
            DrpLoaction.Items.Insert(0, New ListItem("Select"))
            DrpLoaction.SelectedIndex = 0

        ElseIf btnSave.Text = "Save" Then
            If DrpLoaction.SelectedValue = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please pick a Currency!!!')", True)
                Exit Sub
            End If

            Dim strDate As Date
            strDate = Now


            Dim savecurrency As New Exchange_RateTable With { _
               .Currency_Code = DrpLoaction.SelectedValue, _
               .Exchange_Rate = txtExchangeRate.Text, _
               .DateUpdated = strDate, _
               .Staffid = txtStaffID.Text, _
               .Datecreated = strDate}

            a.Exchange_RateTables.InsertOnSubmit(savecurrency)
            a.SubmitChanges()

            txtExchangeRate.Text = ""

            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('saved!!!')", True)

            gridExchangerate.DataBind()


            DrpLoaction.Items.Remove("Select")
            DrpLoaction.DataBind()
            DrpLoaction.Items.Insert(0, New ListItem("Select"))
            DrpLoaction.SelectedIndex = 0

        End If




    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("Currency.aspx")
    End Sub

    Protected Sub gridExchangerate_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridExchangerate.SelectedIndexChanged
        Dim getexchange = gridExchangerate.SelectedRow.Cells(0).Text

        Dim rateInfo = madd.Exchange_RateTables.Where(Function(l) l.id = getexchange).SingleOrDefault

        txtExchangeRate.Text = rateInfo.Exchange_Rate

        Dim h As String = String.Empty
        h = rateInfo.Currency_Code
        If h = String.Empty Then
            DrpLoaction.DataBind()
            DrpLoaction.Items.Insert(0, New ListItem("Select"))
            DrpLoaction.SelectedIndex = 0
        ElseIf h <> String.Empty Then
            DrpLoaction.DataBind()
            DrpLoaction.SelectedValue = h
        End If



       

        txtStaffID.Text = rateInfo.Updatedby

        DrpLoaction.Enabled = False
        btnSave.Text = "Edit"
    End Sub

End Class
