Imports CGM
Partial Class AttendanceReport
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
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


            ' txtchurchID.Text = ""


            If lbChurchName.Text = "" Then
                Response.Redirect("Login.aspx")
                Exit Sub
            End If

            Dim rs As New ReportingService2010

            rs.Url = "http://172.31.210.253/reportserver/reportservice2010.asmx?wsdl"
            rs.Credentials = New System.Net.NetworkCredential("USER PC", "cgm2017cms", "USER")

            Dim items As CatalogItem() = rs.ListChildren("/REPORTCHURCH", True)
            Dim defaultRPT = items.Where(Function(t) t.TypeName = "Report").Select(Function(n) n.Name).OrderBy _
                             (Function(o) o).FirstOrDefault

            Dim srcString = "http://172.31.210.253/ReportServer/Pages/ReportViewer.aspx?%2fREPORTCHURCH%2f" + _
                            defaultRPT + "&rs:Command=Render"

            frReports.Attributes.Add("src", srcString)

            'lbReports.SelectedIndex = 0

            If Not IsPostBack Then
                ddReports.Items.Remove("SELECT")
                ddReports.DataBind()
                ddReports.Items.Insert(0, New ListItem("SELECT"))
                ddReports.SelectedIndex = 0

                For Each rpt In items.Where(Function(t) t.TypeName = "Report").Select(Function(n) n.Name)
                    ddReports.Items.Add(rpt)

                Next


            End If
        End If
    End Sub

    Protected Sub ddReports_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddReports.SelectedIndexChanged
        Dim str1 = "http://172.31.210.253/ReportServer/Pages/ReportViewer.aspx?%2fREPORTCHURCH%2f"
        Dim str2 = "&rs:Command=Render"
        Dim str = str1 + ddReports.SelectedValue + str2

        frReports.Attributes.Add("src", str)
    End Sub
End Class
