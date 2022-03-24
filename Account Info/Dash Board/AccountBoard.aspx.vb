
Partial Class AccountBoard
    Inherits System.Web.UI.Page
    Dim MADD As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Not IsPostBack Then



                Dim userName As String = User.Identity.Name

                Dim getMemberID = MADD.AuthenticalTables.Where(Function(f) f.Username = userName).SingleOrDefault.Memberid

                Dim name = MADD.MembershipTables.Where(Function(d) d.Memberid = getMemberID).SingleOrDefault.FirstName

                Dim getChurch = (From y In MADD.MembershipTables Join
                                    h In MADD.ChurchDetailTables On y.ChurchDetailID Equals h.ChurchDetailID
                                    Where y.Memberid = getMemberID
                                    Select h).SingleOrDefault.ChurchName


                Dim Location = (From d In MADD.ChurchDetailTables
                              Where d.ChurchName = getChurch
                              Select d).SingleOrDefault.Location.Name

                Dim state = (From d In MADD.ChurchDetailTables
                              Where d.ChurchName = getChurch
                              Select d).SingleOrDefault.StateTable.State



                Session("StaffID") = getMemberID


                lbChurchName.Text = "Welcome to Church of God Mission Management System"

                AdminLabel.Text = name.ToUpper

                lbChurchName.Text = getChurch.ToUpper

                lbState.Text = state.ToUpper
                lbLocation.Text = Location.ToUpper


                '  txtchurchID.Text = ""


                If lbChurchName.Text = "" Then
                    Response.Redirect("Define User\Login.aspx")
                    Exit Sub
                End If

            End If

        End If

    End Sub
    Protected Sub ImageButton4_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton4.Click
        Response.Redirect("~\Account Info\Tithe Account\TitheAccount.aspx")
    End Sub
    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
        Response.Redirect("~\Account Info\Cash Book\CashBookView.aspx")
    End Sub
    Protected Sub ImageButton2_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton2.Click
        Response.Redirect("~\Account Info\Pledge Account\PledgeAccount.aspx")
    End Sub
    Protected Sub ImageButton3_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton3.Click
        Response.Redirect("~\Account Info\Chart Of Account\ViewAccountchart.aspx")
    End Sub
    Protected Sub ImageButton5_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton5.Click
        Response.Redirect("~\Account Info\Receivable\AccountReceivable.aspx")
    End Sub
    Protected Sub ImageButton7_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton7.Click
        Response.Redirect("~\Account Info\Other Income\OtherIncome.aspx")
    End Sub
    Protected Sub ImageButton6_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton6.Click
        Response.Redirect("~\Account Info\Offering Account\OfferingAccount.aspx")
    End Sub
    Protected Sub ImageButton9_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton9.Click
        Response.Redirect("~\Account Info\Dash Board\AccountInfo.aspx")
    End Sub
    Protected Sub ImageButton8_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton8.Click
        Response.Redirect("~\Account Info\Expenses\ExpensesView.aspx")
    End Sub

    Protected Sub ImageButton10_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton10.Click
        Response.Redirect("~\Account Info\Welfare\WelfareAccount.aspx")
    End Sub
    Protected Sub ImageButton11_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton11.Click
        Response.Redirect("~\Account Info\Loan\LoanView.aspx")
    End Sub
    Protected Sub ImageButton12_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton12.Click
        Response.Redirect("~\Account Info\Raised Expenses\RaiseExpView.aspx")
    End Sub
    Protected Sub ImageButton13_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton13.Click
        Response.Redirect("~\Account Info\Church Reports\Report.aspx")
    End Sub

    Protected Sub ImageButton14_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton14.Click
        Response.Redirect("~\Account Info\Pastors Tithe Account\PastorTitheAccount.aspx")
    End Sub

    Protected Sub ImageButton15_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton15.Click
        Response.Redirect("~\Account Info\Hierarchy Tithe Account\HierarchiesTitheAccount.aspx")
    End Sub

    Protected Sub ImageButton16_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton16.Click
        Response.Redirect("~\Account Info\Pension Account\PensionAccount.aspx")
    End Sub

    Protected Sub ImageButton18_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton18.Click
        Response.Redirect("~\Account Info\Expense Account\ExpensesAccount.aspx")
    End Sub
    Protected Sub ImageButton19_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton19.Click
        'view pension
        Response.Redirect("~\Account Info\Pension\ViewPension.aspx")
    End Sub
End Class