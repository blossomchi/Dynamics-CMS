
Partial Class PrintingForm2
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Redirect("ViewEvent.aspx")
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim today As DateTime = System.DateTime.Today

            DayPilotCalendar1.StartDate = today

        End If
    End Sub
End Class
