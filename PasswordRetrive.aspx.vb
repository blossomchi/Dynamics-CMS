
Partial Class PasswordRetrive
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtUsername.Text = Session("username")
            txtPMemberid.Text = Session("memberid")

            If txtUsername.Text = "" Then
                Response.Redirect("Login.aspx")
                Exit Sub
            End If

            If txtPMemberid.Text = "" Then
                Response.Redirect("Login.aspx")
                Exit Sub
            End If




            'Dim getpayeeid = (From s In madd.RaiseExpensesHdTables
            '            Where s.ID = txtRaisedid.Text AndAlso s.ExpenseHead = txtExpensesHead.Text
            '            Select s).SingleOrDefault.Supplerid
        End If

    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        If txtPassword.Text <> txtConfirmP.Text Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('The  password are not the same!!!')", True)

        ElseIf txtPassword.Text = txtConfirmP.Text Then
            Dim oldpassword As String
            Dim emailAddress As String = "you@yahoo.com"

            oldpassword = madd.AuthenticalTables.Where(Function(h) h.Memberid = txtPMemberid.Text).SingleOrDefault.Password

            'update with new password
            Dim updatepassword = madd.AuthenticalTables.Where(Function(h) h.Memberid = txtPMemberid.Text).SingleOrDefault
            updatepassword.Password = txtPassword.Text
            madd.SubmitChanges()

            'Udate asp.net table
            '------------------------------------------------------------------
            'Update email and password
            Dim u As MembershipUser = Membership.GetUser(txtUsername.Text)

            u.Email = emailAddress
            u.ChangePassword(oldpassword, txtPassword.Text)

            Membership.UpdateUser(u)



            Dim message As String = "Password change suceessfully"
            Dim url As String = "Login.aspx" ' The page tobe refreshed here!
            Dim script As String = "window.onload = function(){ alert('"
            script += message
            script += "');"
            script += "window.location = '"
            script += url
            script += "'; }"
            ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)

        End If

       

    End Sub
End Class
