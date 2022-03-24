Imports System.Data.SqlClient
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Diagnostics
Imports System.IO



Partial Class Invoice
    Inherits System.Web.UI.Page
    Dim con As SqlConnection
    Dim cmd As SqlCommand
    Dim dataSet As New DataSet
    Private grdTotal As Decimal = 0
    Shared newValue As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Label2.Text = Session("Order")
        End If
    End Sub
   
End Class
