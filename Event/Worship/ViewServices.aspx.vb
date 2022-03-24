Imports System.Data.SqlClient
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.IO
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Configuration
Imports System.Data
Imports Microsoft.Reporting.WebForms
Imports CGM
Partial Class ViewServices
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
            txtStaffID.Text = Session("StaffID")
            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID
            frReports.Visible = False

            ReportID.Visible = True
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
        Response.Redirect("OrderServices.aspx")
    End Sub

    Protected Sub DrpSorted_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpSorted.SelectedIndexChanged
        txtSelectedDate.Text = ""
        If DrpSorted.SelectedValue = "Date" Then

            Dim rs As New ReportingService2010

            rs.Url = "http://172.31.210.253/reportserver/reportservice2010.asmx?wsdl"
            rs.Credentials = New System.Net.NetworkCredential("USER PC", "cgm2017cms", "USER")

            Dim items As CatalogItem() = rs.ListChildren("/REPORTCHURCH", True)
            Dim defaultRPT = items.Where(Function(t) t.TypeName = "Report").Select(Function(n) n.Name).OrderBy _
                             (Function(o) o).FirstOrDefault

            Dim srcString = "http://172.31.210.253/ReportServer/Pages/ReportViewer.aspx?%2fREPORTCHURCH%2f" +
                            defaultRPT + "&rs:Command=Render"

            frReports.Attributes.Add("src", srcString)
            frReports.Visible = True
            ddReports.Visible = True
            ddReports.Items.Remove("SELECT")
            ddReports.DataBind()
            ddReports.Items.Insert(0, New ListItem("SELECT"))
            ddReports.SelectedIndex = 0

            For Each rpt In items.Where(Function(t) t.TypeName = "Report").Select(Function(n) n.Name)
                ddReports.Items.Add(rpt)

            Next

            DrpDate.Visible = False
            gridEvent.Visible = False
            btnPrint.Visible = False
            gridServices.Visible = False

            'Dim OrderDate = From y In madd.OrderServiceTables
            '                Group By y.Date Into gr = Group
            '                        Select [Date] Order By [Date] Ascending

            'DrpDate.DataSource = OrderDate
            'DrpDate.DataBind()
            'DrpDate.Items.Insert(0, New ListItem("Select"))
            'DrpDate.SelectedIndex = 0

        ElseIf DrpSorted.SelectedValue = "Ascending" Then
            frReports.Visible = False
            ddReports.Visible = False
            DrpDate.Visible = False
            gridEvent.Visible = True
            gridServices.Visible = False
            gridDate.Visible = False
            btnPrint.Visible = False
        ElseIf DrpSorted.SelectedValue = "Services" Then
            frReports.Visible = False
            ddReports.Visible = True
            DrpDate.Visible = True
            gridServices.Visible = True
            gridEvent.Visible = False
            gridDate.Visible = False

            Dim services = From y In madd.OrderServiceTables
                           Group By y.ServicesName Into gr = Group
                                   Select [ServicesName] Order By [ServicesName] Ascending


            DrpDate.DataSource = services
            DrpDate.DataBind()
            DrpDate.Items.Insert(0, New ListItem("Select"))
            DrpDate.SelectedIndex = 0
        End If
    End Sub

    Protected Sub DrpDate_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpDate.SelectedIndexChanged
        Dim dateSelected As Date
        If DrpSorted.SelectedValue = "" Then
            'message
            Exit Sub
        ElseIf DrpSorted.SelectedValue = "Date" Then
            dateSelected = CDate(DrpDate.SelectedValue)
            txtSelectedDate.Text = Format(dateSelected, "yyyy-MM-dd")

            gridDate.Visible = True
            gridEvent.Visible = False

            btnPrint.Visible = True
        End If
    End Sub
    Protected Sub gridEvent_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridEvent.SelectedIndexChanged
        Dim getID = gridEvent.SelectedRow.Cells(0).Text

        Session("Orderid") = getID

        Response.Redirect("ServicesEdit.aspx")

    End Sub
    Protected Sub gridServices_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridServices.SelectedIndexChanged
        Dim getID = gridServices.SelectedRow.Cells(0).Text

        Session("Orderid") = getID

        Response.Redirect("ServicesEdit.aspx")
    End Sub

    Public Sub printReciept()
        Dim url As String = "Invoice.aspx"

        Dim s As String = "window.open('" & url + "', 'popup_window', 'width=1050,height=1000,left=100,top=20,resizable=yes,scrollbars=1');"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", s, True)
    End Sub

    Protected Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click

        Session("Order") = txtSelectedDate.Text

        printReciept()

    End Sub
    Protected Sub ddReports_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddReports.SelectedIndexChanged
        Dim str1 = "http://172.31.210.253/ReportServer/Pages/ReportViewer.aspx?%2fREPORTCHURCH%2f"
        Dim str2 = "&rs:Command=Render"
        Dim str = str1 + ddReports.SelectedValue + str2

        frReports.Attributes.Add("src", str)
    End Sub
End Class
