
Partial Class Security_Question
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then


            'txtchurchID.Text = ""
            'AdminLabel.Text = Session("Name")
            'lbChurchName.Text = Session("Church")
            'lbState.Text = Session("State")
            'lbLocation.Text = Session("Location")

            'If lbChurchName.Text = "" Then
            '    Response.Redirect("Login.aspx")
            '    Exit Sub
            'End If

            'txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            'txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID

            'txtLocation.Text = madd.Locations.Where(Function(s) s.Name = lbLocation.Text).SingleOrDefault.Locationid

            DrpQuestion.DataBind()
            DrpQuestion.Items.Insert(0, New ListItem("Select"))
            DrpQuestion.SelectedIndex = 0

            DrpQuestion2.DataBind()
            DrpQuestion2.Items.Insert(0, New ListItem("Select"))
            DrpQuestion2.SelectedIndex = 0

        End If

    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim checkPassword = (From p In madd.AuthenticalTables
                            Where p.Username = txtUsername.Text AndAlso p.Question1 = DrpQuestion.SelectedValue AndAlso p.Answer = txtAns.Text AndAlso p.Question2 = DrpQuestion2.SelectedValue AndAlso p.Answer2 = txtAns2.Text
                            Select p).Any

        If checkPassword = True Then
            txtPUsername.Text = madd.AuthenticalTables.Where(Function(s) s.Username = txtUsername.Text).SingleOrDefault.Username

            txtPMemberid.Text = madd.AuthenticalTables.Where(Function(s) s.Username = txtUsername.Text).SingleOrDefault.Memberid


            Session("username") = txtPUsername.Text
            Session("memberid") = txtPMemberid.Text

            Dim message As String = "Enter your new password"
            Dim url As String = "PasswordRetrive.aspx" ' The page tobe refreshed here!
            Dim script As String = "window.onload = function(){ alert('"
            script += message
            script += "');"
            script += "window.location = '"
            script += url
            script += "'; }"
            ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)

            'Response.Redirect("PasswordRetrive.aspx")
        ElseIf checkPassword = False Then
            Dim message As String = "Invalid Details! Please contact the Adiminstrator"
            Dim url As String = "Security Question.aspx" ' The page tobe refreshed here!
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
