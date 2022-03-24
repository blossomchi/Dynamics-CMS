
Partial Class UnauthorizedAccess
    Inherits System.Web.UI.Page

    Protected Sub ImageClose_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles ImageClose.Click
        Response.Redirect("Login.aspx")
    End Sub
End Class
