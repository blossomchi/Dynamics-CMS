
Partial Class PrintingForm
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            Label2.Text = Session("Order")

        End If

    End Sub

  

End Class
