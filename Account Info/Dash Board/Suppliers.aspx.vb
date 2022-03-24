
Partial Class Suppliers
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


            txtchurchid.Text = ""


            If lbChurchName.Text = "" Then
                 Response.Redirect("Login.aspx")
                Exit Sub
            End If

            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            txtchurchid.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID

            drpAccount.Items.Remove("Select")
            drpAccount.DataBind()
            drpAccount.Items.Insert(0, New ListItem("Select"))
            drpAccount.SelectedIndex = 0

            drpBank.Items.Remove("Select")
            drpBank.DataBind()
            drpBank.Items.Insert(0, New ListItem("Select"))
            drpBank.SelectedIndex = 0

        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim a As New churchmanDataContext

        Dim strDate As Date
        strDate = Now
        If drpBank.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Select Suppliers Bank!!!')", True)
            Exit Sub
        End If

        Dim checkSupplier = madd.SupplierTables.Where(Function(q) q.CompanyName = txtCompanyname.Text).Any
        If checkSupplier = True Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Company name already exist!!!')", True)
            Exit Sub
        End If

        Dim savesuppliers As New SupplierTable With { _
       .CompanyName = txtCompanyname.Text.ToUpper, _
       .Address1 = txtAddress1.Text.ToUpper, _
       .Phone1 = txtPhone1.Text, _
       .Phone2 = txtPhone2.Text, _
       .Bankname = drpBank.SelectedValue, _
       .AccountNo = txtAcountNo.Text, _
       .Accounttype = drpAccount.SelectedValue, _
       .AccountName = txtAccountName.Text, _
       .Supply = txtSupplyItem.Text.ToUpper, _
       .Datecreated = strDate, _
       .createdby = txtMembername.Text, _
       .Updatedby = txtMembername.Text, _
       .churchid = txtchurchid.Text, _
       .Updateddated = strDate}

        a.SupplierTables.InsertOnSubmit(savesuppliers)
        a.SubmitChanges()

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Suppliers has been saved!!!')", True)


        txtCompanyname.Text = ""

        txtAddress1.Text = ""

        txtPhone1.Text = ""
        txtPhone2.Text = ""
        txtBank.Text = ""
        txtAcountNo.Text = ""
        txtAccountName.Text = ""
    

        drpAccount.Items.Remove("Select")
        drpAccount.DataBind()
        drpAccount.Items.Insert(0, New ListItem("Select"))
        drpAccount.SelectedIndex = 0

        drpBank.Items.Remove("Select")
        drpBank.DataBind()
        drpBank.Items.Insert(0, New ListItem("Select"))
        drpBank.SelectedIndex = 0


    End Sub

   
    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("ViewSupplier.aspx")
    End Sub
End Class
