
Partial Class RaiseExpView
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


            txtchurchID.Text = ""


            If lbChurchName.Text = "" Then
                 Response.Redirect("Login.aspx")
                Exit Sub
            End If




            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID

        End If

    End Sub
    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("RaiseExpenses.aspx")
    End Sub

    Protected Sub gridAscending_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gridAscending.RowCommand
       
        If e.CommandName = "DeleteM" Then
            If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
                'Get raised id
                Dim RaiseexpID As Integer = Convert.ToInt32(e.CommandArgument)

                'get expense group id
                Dim getExpenHid = (From s In madd.RaiseExpensesHdTables
                            Where s.ID = RaiseexpID
                            Select s).SingleOrDefault.ExpenseHead

                Dim checkpayment = (From s In madd.RaiseExpenPaymentTables
                              Where s.RaiseexpHdid = RaiseexpID AndAlso s.Expenseid = getExpenHid
                             Select s).Any


                If checkpayment = True Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Sorry payment has been made can not be deleted!.')", True)
                    Exit Sub

                End If

                'check PV
                Dim checkpv = (From s In madd.PaymentVoucherTables
                               Where s.RaiseExpenseId = RaiseexpID AndAlso s.RaiseExpenseId = getExpenHid
                              Select s).Any

                If checkpv = True Then
                    Dim deletePar = (From s In madd.PaymentVoucherTables
                                                    Where (s.RaiseExpenseId = RaiseexpID)
                                                    Select s).SingleOrDefault()

                    madd.PaymentVoucherTables.DeleteOnSubmit(deletePar)
                    madd.SubmitChanges()



                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Information was deleted!.')", True)
                End If

                Dim checkBankdetails = (From s In madd.RaiseBankPaymentTables
                                       Where s.RaiseExpenHdid = RaiseexpID
                                      Select s).Any

                If checkBankdetails = True Then

                    Dim deleteP = (From s In madd.RaiseBankPaymentTables
                                                    Where (s.RaiseExpenHdid = RaiseexpID)
                                                    Select s).SingleOrDefault()

                    madd.RaiseBankPaymentTables.DeleteOnSubmit(deleteP)
                    madd.SubmitChanges()

                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Information was deleted!.')", True)
                End If



                'do check for raise details TB
                Dim checkraisedetails = (From s In madd.RaiseExpensedDetailTables
                                     Where s.RasieHeadid = RaiseexpID
                                    Select s).Any

                If checkraisedetails = True Then

                    Dim deletedetails = From c In madd.RaiseExpensedDetailTables
                                                 Where (c.RasieHeadid = RaiseexpID)
                                                 Select c

                    For Each q As RaiseExpensedDetailTable In deletedetails
                        madd.RaiseExpensedDetailTables.DeleteOnSubmit(q)
                    Next
                    Try
                        madd.SubmitChanges()
                    Catch ex As Exception
                    End Try
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Information was deleted!.')", True)

                End If
                'delete


                Dim checkheader = (From s In madd.RaiseExpensesHdTables
                                   Where s.ID = RaiseexpID AndAlso s.ExpenseHead = getExpenHid
                                  Select s).Any


                If checkheader = True Then
                    Dim deleteheader = (From s In madd.RaiseExpensesHdTables
                                                    Where (s.ID = RaiseexpID AndAlso s.ExpenseHead = getExpenHid)
                                                    Select s).SingleOrDefault()

                    madd.RaiseExpensesHdTables.DeleteOnSubmit(deleteheader)
                    madd.SubmitChanges()


                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Information was deleted!.')", True)
                End If


                gridAscending.DataBind()
            End If
        End If
        If e.CommandName = "DeleteD" Then
            If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
                'Get raised id
                Dim RaiseexpID As Integer = Convert.ToInt32(e.CommandArgument)

                Session("Raiseid") = RaiseexpID

                Response.Redirect("~/Account Info/Raised Expenses/RaiseExpenEdit.aspx")
            End If
        End If
    End Sub

    Protected Sub gridAscending_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gridAscending.SelectedIndexChanged
        Dim getID = gridAscending.SelectedRow.Cells(0).Text


        Dim getpvid = (From s In madd.RaiseExpensesHdTables
                    Where s.ID = getID
                    Select s).SingleOrDefault.ExpenseHead



        Session("Expenseid") = getpvid



        Session("raisedid") = getID

        printReciept()





    End Sub
    Public Sub printReciept()
        Dim url As String = "PaymentVoucher.aspx"

        Dim s As String = "window.open('" & url + "', 'popup_window', 'width=300,height=1000,left=100,top=100,resizable=yes,scrollbars=1');"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", s, True)
    End Sub
End Class
