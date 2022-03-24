
Partial Class Mainboard
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

            Dim memberCount = Aggregate cust In madd.MembershipTables
                              Where cust.SN
                              Into Count()


            Label1.Text = memberCount - 1


            Dim malemembers = Aggregate cust In madd.MembershipTables
                              Where cust.Gender = "Male"
                              Into Count()

            Label6.Text = malemembers - 1


            Dim femalemembers = Aggregate cust In madd.MembershipTables
                           Where cust.Gender = "Female"
                           Into Count()

            Label8.Text = femalemembers

            Dim tenagersmembers As Integer = Aggregate cust In madd.ChildrenTables
                                              Where cust.SN
                                              Into Count()

            Label4.Text = tenagersmembers





            Dim maletenagers = Aggregate cust In madd.ChildrenTables
                            Where cust.Gender = "Male"
                            Into Count()

            Label10.Text = maletenagers


            Dim femaletenagers = Aggregate cust In madd.ChildrenTables
                           Where cust.Gender = "Female"
                           Into Count()

            Label12.Text = femaletenagers



            Label14.Text = (memberCount + tenagersmembers) - 1
        End If

    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
        Response.Redirect("Membership\Member.aspx")
    End Sub

    Protected Sub ImageButton2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("Location\Location.aspx")
    End Sub
    Protected Sub ImageButton3_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton3.Click
        Response.Redirect("Visitors\ViewVisitor.aspx")
    End Sub

    Protected Sub ImageButton4_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton4.Click
        Response.Redirect("Minister\ViewMinister.aspx")
    End Sub

    Protected Sub ImageButton5_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton5.Click
        Response.Redirect("Register\Register Board\RegisterBoard.aspx")
    End Sub

    Protected Sub ImageButton6_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton6.Click
        Response.Redirect("Event\Event Board\EventBoard.aspx")
    End Sub

    Protected Sub ImageButton8_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton8.Click
        Response.Redirect("Groups\Group Board\GroupBoard.aspx")
    End Sub

    Protected Sub ImageButton7_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton7.Click
        Response.Redirect("Sermon\ViewSermon.aspx")
    End Sub

    Protected Sub ImageButton9_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton9.Click
        Response.Redirect("Giving\Giving Board\GivingBoard.aspx")
    End Sub

    Protected Sub ImageButton10_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton10.Click
        Response.Redirect("Children\ChildrenView.aspx")
    End Sub

    Protected Sub ImageButton12_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton12.Click
        Response.Redirect("Define User\DefineUser.aspx")
    End Sub

    Protected Sub ImageButton11_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton11.Click
        Response.Redirect("Services\OtherService.aspx")
    End Sub
    Protected Sub ImageButton13_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton13.Click
        Response.Redirect("Account Info\Dash Board\AccountBoard.aspx")
    End Sub
End Class
