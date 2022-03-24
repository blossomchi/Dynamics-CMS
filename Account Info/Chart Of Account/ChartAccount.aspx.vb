
Partial Class ChartAccount
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext


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

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID
            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName


            drpAssets.Items.Remove("Select")
            drpAssets.DataBind()
            drpAssets.Items.Insert(0, New ListItem("Select"))
            drpAssets.SelectedIndex = 0


            drpCash.Items.Remove("Select")
            drpCash.DataBind()
            drpCash.Items.Insert(0, New ListItem("Select"))
            drpCash.SelectedIndex = 0


            drpCurrent.Items.Remove("Select")
            drpCurrent.DataBind()
            drpCurrent.Items.Insert(0, New ListItem("Select"))
            drpCurrent.SelectedIndex = 0


            drpExpenses.Items.Remove("Select")
            drpExpenses.DataBind()
            drpExpenses.Items.Insert(0, New ListItem("Select"))
            drpExpenses.SelectedIndex = 0

            drpReport.Items.Remove("Select")
            drpReport.DataBind()
            drpReport.Items.Insert(0, New ListItem("Select"))
            drpReport.SelectedIndex = 0
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


        If txtaccount.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter an Account name!!!')", True)
            Exit Sub
        End If

        If drpAssets.SelectedValue = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select an Assets!!!')", True)
            Exit Sub
        End If



        Dim strDate As Date
        strDate = Now

        Dim saveAccount As New ChartAccountTable With { _
       .Accountname = txtaccount.Text, _
       .Asset_Liabilityid = drpAssets.SelectedValue, _
       .cash_bank_relationshipid = drpCash.SelectedValue, _
       .Income_expenditureid = drpExpenses.SelectedValue, _
       .Current_noncurrentid = drpCurrent.SelectedValue, _
       .Reportid = drpReport.SelectedValue, _
       .Updatedby = txtMembername.Text, _
       .Updatedate = strDate, _
       .Description = txtDesp.Text, _
       .Createdby = txtMembername.Text, _
       .CreateDate = strDate}

        a.ChartAccountTables.InsertOnSubmit(saveAccount)
        a.SubmitChanges()

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Account has been saved!!!')", True)


        drpAssets.Items.Remove("Select")
        drpAssets.DataBind()
        drpAssets.Items.Insert(0, New ListItem("Select"))
        drpAssets.SelectedIndex = 0


        drpCash.Items.Remove("Select")
        drpCash.DataBind()
        drpCash.Items.Insert(0, New ListItem("Select"))
        drpCash.SelectedIndex = 0


        drpCurrent.Items.Remove("Select")
        drpCurrent.DataBind()
        drpCurrent.Items.Insert(0, New ListItem("Select"))
        drpCurrent.SelectedIndex = 0


        drpExpenses.Items.Remove("Select")
        drpExpenses.DataBind()
        drpExpenses.Items.Insert(0, New ListItem("Select"))
        drpExpenses.SelectedIndex = 0

        drpReport.Items.Remove("Select")
        drpReport.DataBind()
        drpReport.Items.Insert(0, New ListItem("Select"))
        drpReport.SelectedIndex = 0

        txtaccount.Text = ""

        txtDesp.Text = ""
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("ViewAccountchart.aspx")
    End Sub

End Class
