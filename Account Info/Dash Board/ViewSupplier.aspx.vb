Imports System.IO
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Data

Partial Class ViewSupplier
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
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("Suppliers.aspx")
    End Sub

    Protected Sub DrpCriteria_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpCriteria.SelectedIndexChanged
        If DrpCriteria.SelectedValue = "Ascending" Then
            GVAllMinister.Visible = True
            DrpCriteria2.Visible = False
            GVTitle.Visible = False
        ElseIf DrpCriteria.SelectedValue = "Company's Name" Then
            GVAllMinister.Visible = False
            DrpCriteria2.Visible = True

            DrpCriteria2.Items.Remove("Select")
            DrpCriteria2.DataBind()
            DrpCriteria2.Items.Insert(0, New ListItem("Select"))
            DrpCriteria2.SelectedIndex = 0

        End If
    End Sub

    Protected Sub DrpCriteria2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpCriteria2.SelectedIndexChanged
        GVTitle.Visible = True
    End Sub

    Protected Sub GVAllMinister_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GVAllMinister.RowCommand
        If e.CommandName = "DeleteItem" Then

            If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
                Dim ID As Integer = Convert.ToInt32(e.CommandArgument)


                Dim st As String = ConfigurationManager.ConnectionStrings("ChurchdbConnectionString").ToString : Dim con As New Data.SqlClient.SqlConnection(st)
                con.Open()
                Dim cmd As New SqlCommand("DELETE FROM SupplierTable WHERE ( Supplerid = @ID)", con)
                cmd.Parameters.AddWithValue("@ID", ID)
                cmd.ExecuteNonQuery()
                con.Close()
                GVAllMinister.DataBind()
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Deleted!')", True)

            End If
        End If
    End Sub

    Protected Sub GVAllMinister_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVAllMinister.SelectedIndexChanged

    End Sub
End Class
