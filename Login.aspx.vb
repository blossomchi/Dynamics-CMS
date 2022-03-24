
Partial Class Login
    Inherits System.Web.UI.Page
    Dim MD As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Not Page.IsPostBack Then
                ' DropAllData()
                lblid.Text = ""
                MigrateChildrenToAgape()
                If Request.IsAuthenticated AndAlso Not String.IsNullOrEmpty(Request.QueryString("ReturnUrl")) Then
                    ' This is an unauthorized, authenticated request...
                    Response.Redirect("~/UnauthorizedAccess.aspx")
                Else
                    '  Response.Redirect("~/index.aspx")

                End If
            End If
        End If

    End Sub
    Public Sub MigrateChildrenToAgape()
        'get all children information
        Dim DYear As Integer = 0
        Dim nowYear As Integer = 0
        Dim age As Integer = 0

        Dim getAll18Year = From d In MD.ChildrenTables
                           Select New With { _
                               d.Childrenid, _
                               d.Familyname, _
                               d.Firstname, _
                               d.Lastname, _
                               d.Gender, _
                               d.DOB, _
                               d.Address, _
                               d.Phone, _
                               d.FunctiongroupID
                               }

        For Each q In getAll18Year
            Dim dob = q.DOB
            Dim famID = q.Familyname
            Dim FirstName = q.Firstname
            Dim LastName = q.Lastname
            Dim Phone = q.Phone
            Dim Sex = q.Gender
            Dim address = q.Address
            Dim childID = q.Childrenid

            DYear = Microsoft.VisualBasic.DateAndTime.Year(dob)
            nowYear = Microsoft.VisualBasic.DateAndTime.Year(Now)

            age = nowYear - DYear

            If age >= 18 Then
                If Phone = "" Then
                    Dim checkPhoneno = (From f In MD.MembershipTables
                                   Where f.FirstName = FirstName AndAlso f.LastName = LastName AndAlso f.Gender = Sex AndAlso f.FamilyID = famID
                                   Select f).Any

                    If checkPhoneno = True Then
                        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Existing member !!!')", True)
                        Exit Sub
                    Else

                        Dim id = From i In MD.MembershipTables
                        Select i
                        If id.Count > 0 Then

                            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
                            Dim z = (CInt(latest) + 1)
                            lblid.Text = "MEB" & "" & z
                        Else
                            lblid.Text = "MEB" & "" & 1
                        End If
                        'ffffffffffff
                        Dim SOO = MD.MembershipTables.Where(Function(s) s.FamilyID = famID).FirstOrDefault.StateofOrgin
                        Dim Nationality = MD.MembershipTables.Where(Function(s) s.FamilyID = famID).FirstOrDefault.Nationality
                        Dim MembersGroupID = MD.MembersGroups.Where(Function(s) s.GroupName = "AGAPE FELLOWSHIP").SingleOrDefault.ID
                        Dim FTown = MD.MembershipTables.Where(Function(s) s.FamilyID = famID).FirstOrDefault.Town
                        Dim FArea = MD.MembershipTables.Where(Function(s) s.FamilyID = famID).FirstOrDefault.Area
                        Dim FChurchDetailID = MD.MembershipTables.Where(Function(s) s.FamilyID = famID).FirstOrDefault.ChurchDetailID
                        Dim LocationID = MD.MembershipTables.Where(Function(s) s.FamilyID = famID).FirstOrDefault.Locationid
                        Dim StaffID = MD.MembershipTables.Where(Function(s) s.FamilyID = famID).FirstOrDefault.Createdby

                        Dim savenewmember As New MembershipTable With { _
                           .FamilyID = famID, _
                           .Memberid = lblid.Text, _
                           .FirstName = FirstName.ToUpper, _
                           .LastName = LastName.ToUpper, _
                           .MiddleName = "", _
                           .MartialStatus = "Single", _
                           .Occupation = "STUDENT", _
                           .Phone1 = Phone, _
                           .Email = "", _
                           .Gender = Sex, _
                           .Title = "Member", _
                           .Authority = "Child", _
                           .Address = address.ToUpper, _
                           .TitheId = 0, _
                           .StateofOrgin = SOO, _
                           .Nationality = Nationality, _
                           .Language1 = "ENGLISH", _
                           .Language2 = "", _
                           .Languag3 = "", _
                           .MemberssGroup = MembersGroupID, _
                           .DateBaptism = "", _
                           .Town = FTown, _
                           .Area = FArea, _
                           .DateConverted = "", _
                           .DOB = dob, _
                           .ChurchDetailID = FChurchDetailID, _
                           .Updatedby = StaffID, _
                           .Createdby = StaffID, _
                           .Locationid = LocationID, _
                           .DateCreated = Now}

                        MD.MembershipTables.InsertOnSubmit(savenewmember)
                        MD.SubmitChanges()

                        Dim deleteChild = (From s In MD.ChildrenTables
                                  Where (s.Childrenid = childID)
                                  Select s)

                        For Each q1 As ChildrenTable In deleteChild
                            MD.ChildrenTables.DeleteOnSubmit(q1)
                        Next
                        Try
                            MD.SubmitChanges()
                        Catch ex As Exception
                        End Try
                    End If
                ElseIf Phone <> "" Then
                    Dim checkPhoneno = (From f In MD.MembershipTables
                                                   Where f.Phone1 = Phone AndAlso f.FirstName = FirstName AndAlso f.LastName = LastName AndAlso f.Gender = Sex _
                                                   AndAlso f.FamilyID = famID
                                                   Select f).Any

                    If checkPhoneno = True Then
                        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Existing member !!!')", True)
                        Exit Sub
                    Else
                        Dim id = From i In MD.MembershipTables
                        Select i
                        If id.Count > 0 Then

                            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
                            Dim z = (CInt(latest) + 1)
                            lblid.Text = "MEB" & "" & z
                        Else
                            lblid.Text = "MEB" & "" & 1
                        End If

                        'ffff
                        'ffffffffffff
                        Dim SOO = MD.MembershipTables.Where(Function(s) s.FamilyID = famID).FirstOrDefault.StateofOrgin
                        Dim Nationality = MD.MembershipTables.Where(Function(s) s.FamilyID = famID).FirstOrDefault.Nationality
                        Dim MembersGroupID = MD.MembersGroups.Where(Function(s) s.GroupName = "AGAPE FELLOWSHIP").SingleOrDefault.ID
                        Dim FTown = MD.MembershipTables.Where(Function(s) s.FamilyID = famID).FirstOrDefault.Town
                        Dim FArea = MD.MembershipTables.Where(Function(s) s.FamilyID = famID).FirstOrDefault.Area
                        Dim FChurchDetailID = MD.MembershipTables.Where(Function(s) s.FamilyID = famID).FirstOrDefault.ChurchDetailID
                        Dim LocationID = MD.MembershipTables.Where(Function(s) s.FamilyID = famID).FirstOrDefault.Locationid
                        Dim StaffID = MD.MembershipTables.Where(Function(s) s.FamilyID = famID).FirstOrDefault.Createdby

                        Dim savenewmember As New MembershipTable With { _
                           .FamilyID = famID, _
                           .Memberid = lblid.Text, _
                           .FirstName = FirstName.ToUpper, _
                           .LastName = LastName.ToUpper, _
                           .MiddleName = "", _
                           .MartialStatus = "Single", _
                           .Occupation = "STUDENT", _
                           .Phone1 = Phone, _
                           .Email = "", _
                           .Gender = Sex, _
                           .Title = "Member", _
                           .Authority = "Child", _
                           .Address = address.ToUpper, _
                           .TitheId = 0, _
                           .StateofOrgin = SOO, _
                           .Nationality = Nationality, _
                           .Language1 = "ENGLISH", _
                           .Language2 = "", _
                           .Languag3 = "", _
                           .MemberssGroup = MembersGroupID, _
                           .DateBaptism = "", _
                           .Town = FTown, _
                           .Area = FArea, _
                           .DateConverted = "", _
                           .DOB = dob, _
                           .ChurchDetailID = FChurchDetailID, _
                           .Updatedby = StaffID, _
                           .Createdby = StaffID, _
                           .Locationid = LocationID, _
                           .DateCreated = Now}

                        MD.MembershipTables.InsertOnSubmit(savenewmember)
                        MD.SubmitChanges()

                        Dim deleteChild = (From s In MD.ChildrenTables
                                 Where (s.Childrenid = childID)
                                 Select s)

                        For Each q1 As ChildrenTable In deleteChild
                            MD.ChildrenTables.DeleteOnSubmit(q1)
                        Next
                        Try
                            MD.SubmitChanges()
                        Catch ex As Exception
                        End Try

                    End If
                End If

            End If
        Next
    End Sub
    Public Sub DropAllData()
        'Delete cash book
        Dim checkCash_BookTables = (From h In MD.Cash_BookTables
                                   Select h).Any

        If checkCash_BookTables = True Then
            Dim DeleteCashAccount = From c In MD.Cash_BookTables
                                      Select c

            For Each q As Cash_BookTable In DeleteCashAccount
                MD.Cash_BookTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try

        End If

        'Delete income account
        Dim checkIncomeAccountTables = (From g In MD.IncomeAccountTables
                                       Select g).Any

        If checkIncomeAccountTables = True Then
            Dim DeleteIncomeAccount = From c In MD.IncomeAccountTables
                                      Select c

            For Each q As IncomeAccountTable In DeleteIncomeAccount
                MD.IncomeAccountTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try

        End If

        'delete income bank 
        Dim checkIncomeBankPaymentTables = (From d In MD.IncomeBankPaymentTables
                                           Select d).Any

        If checkIncomeBankPaymentTables = True Then
            Dim DeleteIncomeBank = From c In MD.IncomeBankPaymentTables
                                         Select c

            For Each q As IncomeBankPaymentTable In DeleteIncomeBank
                MD.IncomeBankPaymentTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete income payment
        Dim checkIncomePaymentTables = (From f In MD.IncomePaymentTables
                                        Select f).Any

        If checkIncomePaymentTables = True Then
            Dim DeleteIncomePayment = From c In MD.IncomePaymentTables
                                            Select c

            For Each q As IncomePaymentTable In DeleteIncomePayment
                MD.IncomePaymentTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try

        End If

        'delete income offering 
        Dim checkIncomeOffTables = (From g In MD.IncomeOffTables
                                   Select g).Any


        If checkIncomeOffTables = True Then
            Dim DeleteIncomeOffering = From c In MD.IncomeOffTables
                                               Select c

            For Each q As IncomeOffTable In DeleteIncomeOffering
                MD.IncomeOffTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try

        End If

        'delete other incomes account
        Dim checkOther_incomeAccountTables = (From s In MD.Other_incomeAccountTables
                                              Select s).Any

        If checkOther_incomeAccountTables = True Then
            Dim DeleteIncomeOthers = From c In MD.Other_incomeAccountTables
                                         Select c

            For Each q As Other_incomeAccountTable In DeleteIncomeOthers
                MD.Other_incomeAccountTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If



        'delete account receivable 
        Dim checkAccountRecivableTables = (From d In MD.AccountRecivableTables
                                          Select d).Any

        If checkAccountRecivableTables = True Then
            Dim DeleteCustomerAccount = From c In MD.AccountRecivableTables
                                       Select c

            For Each q As AccountRecivableTable In DeleteCustomerAccount
                MD.AccountRecivableTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete account payables
        Dim checkAccountPayableTables = (From g In MD.AccountPayableTables
                                        Select g).Any

        If checkAccountPayableTables = True Then
            Dim DeletePayablesAccount = From c In MD.AccountPayableTables
                                        Select c

            For Each q As AccountPayableTable In DeletePayablesAccount
                MD.AccountPayableTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete pledge account 
        Dim checkPledgeAccountTables = (From f In MD.PledgeAccountTables
                                        Select f).Any

        If checkPledgeAccountTables = True Then
            Dim DeletePledgeAccount = From c In MD.PledgeAccountTables
                                          Select c

            For Each q As PledgeAccountTable In DeletePledgeAccount
                MD.PledgeAccountTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try

        End If

        'delete pledge bank 
        Dim checkPledgeBankPaymentTables = (From i In MD.PledgeBankPaymentTables
                                            Select i).Any

        If checkPledgeBankPaymentTables = True Then
            Dim DeletePledgeBank = From c In MD.PledgeBankPaymentTables
                                            Select c

            For Each q As PledgeBankPaymentTable In DeletePledgeBank
                MD.PledgeBankPaymentTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try

        End If

        'delete pledge payment 
        Dim checkPledgePaymentTables = (From w In MD.PledgePaymentTables
                                        Select w).Any

        If checkPledgePaymentTables = True Then
            Dim DeletePledgePayment = From c In MD.PledgePaymentTables
                                               Select c

            For Each q As PledgePaymentTable In DeletePledgePayment
                MD.PledgePaymentTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try

        End If

        'delete pledge tb
        Dim checkPledgeTables = (From d In MD.PledgeTables
                                 Select d).Any

        If checkPledgeTables = True Then
            Dim DeletePledge = From c In MD.PledgeTables
                                                   Select c

            For Each q As PledgeTable In DeletePledge
                MD.PledgeTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try

        End If



        'delete expenses account 
        Dim checkExpensesAccountTables = (From d In MD.ExpensesAccountTables
                                          Select d).Any

        If checkExpensesAccountTables = True Then
            Dim DeleteExpensesAccount = From c In MD.ExpensesAccountTables
                                             Select c

            For Each q As ExpensesAccountTable In DeleteExpensesAccount
                MD.ExpensesAccountTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If


        'delete expense bank 
        Dim checkRaiseBankPaymentTables = (From s In MD.RaiseBankPaymentTables
                                           Select s).Any

        If checkRaiseBankPaymentTables = True Then
            Dim DeleteExpenseBank = From c In MD.RaiseBankPaymentTables
                                                Select c

            For Each q As RaiseBankPaymentTable In DeleteExpenseBank
                MD.RaiseBankPaymentTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try

        End If

        'delete expense payment 
        Dim checkRaiseExpenPaymentTables = (From s In MD.RaiseExpenPaymentTables
                                            Select s).Any

        If checkRaiseExpenPaymentTables = True Then
            Dim DeleteExpensePayment = From c In MD.RaiseExpenPaymentTables
                                                  Select c

            For Each q As RaiseExpenPaymentTable In DeleteExpensePayment
                MD.RaiseExpenPaymentTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete payment voucher 
        Dim checkPaymentVoucherTables = (From s In MD.PaymentVoucherTables
                                        Select s).Any

        If checkPaymentVoucherTables = True Then
            Dim DeletePaymentVoucher = From c In MD.PaymentVoucherTables
                                                        Select c

            For Each q As PaymentVoucherTable In DeletePaymentVoucher
                MD.PaymentVoucherTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If


        'delete expense detail
        Dim checkRaiseExpensedDetailTables = (From d In MD.RaiseExpensedDetailTables
                                              Select d).Any

        If checkRaiseExpensedDetailTables = True Then
            Dim DeleteExpenseDetails = From c In MD.RaiseExpensedDetailTables
                                                     Select c

            For Each q As RaiseExpensedDetailTable In DeleteExpenseDetails
                MD.RaiseExpensedDetailTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete expense head raised
        Dim checkRaiseExpensesHdTables = (From g In MD.RaiseExpensesHdTables
                                           Select g).Any

        If checkRaiseExpensesHdTables = True Then
            Dim DeleteExpenseRaised = From c In MD.RaiseExpensesHdTables
                                                        Select c

            For Each q As RaiseExpensesHdTable In DeleteExpenseRaised
                MD.RaiseExpensesHdTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If


        'delete expense details
        Dim checkExpensesdetailsTables = (From r In MD.ExpensesdetailsTables
                                         Select r).Any

        If checkExpensesdetailsTables = True Then
            Dim DeleteExpenseGroupDetails = From c In MD.ExpensesdetailsTables
                                                           Select c

            For Each q As ExpensesdetailsTable In DeleteExpenseGroupDetails
                MD.ExpensesdetailsTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete from expense group 
        Dim checkExpensesHeadTables = (From g In MD.ExpensesHeadTables
                                      Select g).Any

        If checkExpensesHeadTables = True Then
            Dim DeleteExpenseGroup = From c In MD.ExpensesHeadTables
                                                  Select c

            For Each q As ExpensesHeadTable In DeleteExpenseGroup
                MD.ExpensesHeadTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception

            End Try
        End If

        'delete seed faith account 
        Dim checkSeedfaithaaccountTables = (From s In MD.SeedfaithaaccountTables
                                            Select s).Any

        If checkSeedfaithaaccountTables = True Then
            Dim DeleteSeedFaithAccount = From c In MD.SeedfaithaaccountTables
                                            Select c

            For Each q As SeedfaithaaccountTable In DeleteSeedFaithAccount
                MD.SeedfaithaaccountTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception

            End Try
        End If

        'delete first fruit account
        Dim checkFirstfruitaccTables = (From f In MD.FirstfruitaccTables
                                        Select f).Any

        If checkFirstfruitaccTables = True Then
            Dim DeleteFirstFruit = From c In MD.FirstfruitaccTables
                                                Select c

            For Each q In DeleteFirstFruit
                MD.FirstfruitaccTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If



        'delete loan account 
        Dim checkLoanAccountTables = (From g In MD.LoanAccountTables
                                     Select g).Any

        If checkLoanAccountTables = True Then
            Dim DeleteLoanAccount = From c In MD.LoanAccountTables
                                              Select c

            For Each q As LoanAccountTable In DeleteLoanAccount
                MD.LoanAccountTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception

            End Try

        End If


        'delete loan head 
        Dim checkLoanHeadTables = (From f In MD.LoanHeadTables
                                   Select f).Any

        If checkLoanHeadTables = True Then
            Dim DeleteLoan = From c In MD.LoanHeadTables
                                                 Select c

            For Each q As LoanHeadTable In DeleteLoan
                MD.LoanHeadTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try

        End If

        'delete tithe account
        Dim checkTitheAccountTables = (From t In MD.TitheAccountTables
                                      Select t).Any

        If checkTitheAccountTables = True Then
            Dim DeleteTitheAccount = From c In MD.TitheAccountTables
                                                 Select c

            For Each q As TitheAccountTable In DeleteTitheAccount
                MD.TitheAccountTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception

            End Try

        End If

        'delete tithe bank 
        Dim checkTitheBankPaymentTables = (From d In MD.TitheBankPaymentTables
                                          Select d).Any

        If checkTitheBankPaymentTables = True Then
            Dim DeleteTitheBank = From c In MD.TitheBankPaymentTables
                                                    Select c

            For Each q As TitheBankPaymentTable In DeleteTitheBank
                MD.TitheBankPaymentTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception

            End Try
        End If


        'delete tithe payment
        Dim checkTithePaymentTables = (From j In MD.TithePaymentTables
                                       Select j).Any

        If checkTithePaymentTables = True Then
            Dim DeleteTithePayment = From c In MD.TithePaymentTables
                                                       Select c

            For Each q As TithePaymentTable In DeleteTithePayment
                MD.TithePaymentTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception

            End Try

        End If

        'delete tithe tb
        Dim checkTitheTables = (From d In MD.TitheTables
                                Select d).Any

        If checkTitheTables = True Then
            Dim DeleteTithe = From c In MD.TitheTables
                                       Select c

            For Each q As TitheTable In DeleteTithe
                MD.TitheTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception

            End Try

        End If

        'delete vow account 
        Dim checkVowAccountTables = (From f In MD.VowAccountTables
                                    Select f).Any

        If checkVowAccountTables = True Then
            Dim DeleteVowAccount = From c In MD.VowAccountTables
                                    Select c

            For Each q As VowAccountTable In DeleteVowAccount
                MD.VowAccountTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception

            End Try
        End If

        'delete welfare account 
        Dim checkWelfareAccountTables = (From t In MD.WelfareAccountTables
                                        Select t).Any


        If checkWelfareAccountTables = True Then
            Dim DeleteWelfareAccount = From c In MD.WelfareAccountTables
                                       Select c

            For Each q As WelfareAccountTable In DeleteWelfareAccount
                MD.WelfareAccountTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception

            End Try
        End If

        'delete welfare bank
        Dim checkWelfareBankPaymentTables = (From f In MD.WelfareBankPaymentTables
                                             Select f).Any


        If checkWelfareBankPaymentTables = True Then
            Dim DeleteWelfareBank = From c In MD.WelfareBankPaymentTables
                                          Select c

            For Each q As WelfareBankPaymentTable In DeleteWelfareBank
                MD.WelfareBankPaymentTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception

            End Try
        End If

        'delete welfare payment 
        Dim checkWarefarePaymentTables = (From d In MD.WarefarePaymentTables
                                         Select d).Any


        If checkWarefarePaymentTables = True Then
            Dim DeleteWelfarePayment = From c In MD.WarefarePaymentTables
                                            Select c

            For Each q As WarefarePaymentTable In DeleteWelfarePayment
                MD.WarefarePaymentTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception

            End Try
        End If

        'delete walfare main 
        Dim checkWelfareMainTables = (From h In MD.WelfareMainTables
                                     Select h).Any

        If checkWelfareMainTables = True Then
            Dim DeleteWelfaremain = From c In MD.WelfareMainTables
                                               Select c

            For Each q As WelfareMainTable In DeleteWelfaremain
                MD.WelfareMainTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception

            End Try
        End If


        'delete visitor 
        Dim checkVisitationTables = (From s In MD.VisitationTables
                                     Select s).Any

        If checkVisitationTables = True Then
            Dim DeleteVisitors = From c In MD.VisitationTables
                                                   Select c

            For Each q As VisitationTable In DeleteVisitors
                MD.VisitationTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete add visitor 
        Dim checkAddvisitorTables = (From f In MD.AddvisitorTables
                                      Select f).Any

        If checkAddvisitorTables Then
            Dim DeleteAddVisitors = From c In MD.AddvisitorTables
                                                      Select c

            For Each q As AddvisitorTable In DeleteAddVisitors
                MD.AddvisitorTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try

        End If


        'delete supplier id
        Dim checkSupplierTables = (From s In MD.SupplierTables
                                    Select s).Any

        If checkSupplierTables = True Then
            Dim DeleteSupplier = From c In MD.SupplierTables
                                              Select c

            For Each q As SupplierTable In DeleteSupplier
                MD.SupplierTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete from sermon
        Dim checkSermonTables = (From d In MD.SermonTables
                                 Select d).Any

        If checkSermonTables = True Then
            Dim DeleteSemon = From c In MD.SermonTables
                                                  Select c

            For Each q As SermonTable In DeleteSemon
                MD.SermonTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If


        'delete order of services
        Dim checkOrderServiceTables = (From s In MD.OrderServiceTables
                                         Select s).Any

        If checkOrderServiceTables = True Then
            Dim DeleteOrderServices = From c In MD.OrderServiceTables
                                                      Select c

            For Each q As OrderServiceTable In DeleteOrderServices
                MD.OrderServiceTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete minister tb
        Dim checkMinisterTables = (From g In MD.MinisterTables
                                   Select g).Any

        If checkMinisterTables = True Then
            Dim DeleteMinister = From c In MD.MinisterTables
                                                         Select c

            For Each q As MinisterTable In DeleteMinister
                MD.MinisterTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        ' delete marriage 
        Dim checkMarriageTables = (From f In MD.MarriageTables
                                   Select f).Any

        If checkMarriageTables = True Then
            Dim DeleteMarriage = From c In MD.MarriageTables
                                                            Select c

            For Each q As MarriageTable In DeleteMarriage
                MD.MarriageTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If


        'delete from home cell 
        Dim checkHomecellTables = (From d In MD.HomecellTables
                                  Select d).Any


        If checkHomecellTables = True Then
            Dim DeleteHomeCell = From c In MD.HomecellTables
                                                Select c

            For Each q As HomecellTable In DeleteHomeCell
                MD.HomecellTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete fxnal group
        Dim checkFunctionalGroupTables = (From d In MD.FunctionalGroupTables
                                         Select d).Any

        If checkFunctionalGroupTables = True Then
            Dim DeleteFxnal = From c In MD.FunctionalGroupTables
                                                          Select c

            For Each q As FunctionalGroupTable In DeleteFxnal
                MD.FunctionalGroupTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try

        End If

        'delete event tb
        Dim checkEventTables = (From d In MD.EventTables
                               Select d).Any

        If checkEventTables = True Then
            Dim Deleteevent = From c In MD.EventTables
                                         Select c

            For Each q As EventTable In Deleteevent
                MD.EventTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete duty 
        Dim checkDutyTables = (From d In MD.DutyTables
                               Select d).Any

        If checkDutyTables = True Then
            Dim DeleteDuty = From c In MD.DutyTables
                                             Select c

            For Each q As DutyTable In DeleteDuty
                MD.DutyTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try

        End If

        'delete dedication image 
        Dim checkDedicationImageTables = (From f In MD.DedicationImageTables
                                         Select f).Any


        If checkDedicationImageTables = True Then
            Dim DeleteDImage = From c In MD.DedicationImageTables
                                                Select c

            For Each q As DedicationImageTable In DeleteDImage
                MD.DedicationImageTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete dedication
        Dim checkDedicationTables = (From d In MD.DedicationTables
                                     Select d).Any

        If checkDedicationTables = True Then
            Dim DeleteDedidaction = From c In MD.DedicationTables
                                                  Select c

            For Each q As DedicationTable In DeleteDedidaction
                MD.DedicationTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try

        End If

        'delete exchange rate  
        Dim checkExchange_RateTables = (From d In MD.Exchange_RateTables
                                        Select d).Any

        If checkExchange_RateTables = True Then
            Dim DeleteRate = From c In MD.Exchange_RateTables
                                                   Select c

            For Each q As Exchange_RateTable In DeleteRate
                MD.Exchange_RateTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception

            End Try

        End If

        'delete currency code 
        Dim checkCurrency_CodeTables = (From g In MD.Currency_CodeTables
                                        Select g).Any

        If checkCurrency_CodeTables Then
            Dim DeleteCode = From c In MD.Currency_CodeTables
                                                       Select c

            For Each q As Currency_CodeTable In DeleteCode
                MD.Currency_CodeTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete class
        Dim checkClassTables = (From g In MD.ClassTables
                                Select g).Any

        If checkClassTables Then
            Dim DeleteClass = From c In MD.ClassTables
                                              Select c

            For Each q As ClassTable In DeleteClass
                MD.ClassTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try

        End If

        'delete children 
        Dim checkChildrenTables = (From f In MD.ChildrenTables
                                    Select f).Any

        If checkChildrenTables = True Then
            Dim DeleteChild = From c In MD.ChildrenTables
                                                  Select c

            For Each q As ChildrenTable In DeleteChild
                MD.ChildrenTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete baptism image
        Dim checkBaptismImageTables = (From g In MD.BaptismImageTables
                                      Select g).Any
        If checkBaptismImageTables Then

            Dim DeleteBapImage = From c In MD.BaptismImageTables
                                                     Select c

            For Each q As BaptismImageTable In DeleteBapImage
                MD.BaptismImageTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete bap
        Dim checkBaptismTables = (From f In MD.BaptismTables
                                  Select f).Any

        If checkBaptismTables Then
            Dim DeleteBap = From c In MD.BaptismTables
                                                       Select c

            For Each q As BaptismTable In DeleteBap
                MD.BaptismTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If


        'delete bank 
        Dim checkBankTables = (From f In MD.BankTables
                               Select f).Any

        If checkBankTables Then
            Dim DeleteBank = From c In MD.BankTables
                                       Select c

            For Each q As BankTable In DeleteBank
                MD.BankTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If

        'delete attendance 
        Dim checkAttendanceTables = (From d In MD.AttendanceTables
                                     Select d).Any

        If checkAttendanceTables Then
            Dim DeleteAttendance = From c In MD.AttendanceTables
                                          Select c

            For Each q As AttendanceTable In DeleteAttendance
                MD.AttendanceTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception

            End Try
        End If

        'delete area tb
        Dim checkAreaTables = (From f In MD.AreaTables
                                Select f).Any

        If checkAreaTables Then
            Dim DeleteArea = From c In MD.AreaTables
                                                     Select c

            For Each q As AreaTable In DeleteArea
                MD.AreaTables.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception

            End Try

        End If

        ' delete location 
        Dim checkLocations = (From d In MD.Locations
                              Select d).Any

        If checkLocations = True Then
            Dim Deletelocation = From c In MD.Locations
                                              Select c

            For Each q As Location In Deletelocation
                MD.Locations.DeleteOnSubmit(q)
            Next
            Try
                MD.SubmitChanges()
            Catch ex As Exception
            End Try
        End If


        ''delete authentication 
        'Dim checkAuthenticalTables = (From f In MD.AuthenticalTables
        '                              Where f.Username <> "Admin"
        '                              Select f).Any
        'If checkAuthenticalTables Then
        '    Dim DeleteAuthentication = From c In MD.AuthenticalTables
        '                               Where c.Username <> "Admin"
        '                                     Select c

        '    For Each q As AuthenticalTable In DeleteAuthentication
        '        MD.AuthenticalTables.DeleteOnSubmit(q)
        '    Next
        '    Try
        '        MD.SubmitChanges()
        '    Catch ex As Exception
        '    End Try
        'End If

        ''delete from user tb 
        'Dim checkUserTables = (From g In MD.UserTables
        '                           Where g.Memberid <> "MEB1"
        '                           Select g).Any

        'If checkUserTables Then
        '    Dim DeleteUser = From c In MD.UserTables
        '                                  Where c.Memberid <> "MEB1"
        '                                        Select c

        '    For Each q As UserTable In DeleteUser
        '        MD.UserTables.DeleteOnSubmit(q)
        '    Next
        '    Try
        '        MD.SubmitChanges()
        '    Catch ex As Exception
        '    End Try

        'End If

        ''delete member image 
        'Dim checkMemberImageTables = (From c In MD.MemberImageTables
        '                                Where c.MemberID <> "MEB1"
        '                                     Select c).Any

        'If checkMemberImageTables Then
        '    Dim DeleteMemberImage = From c In MD.MemberImageTables
        '                                   Where c.MemberID <> "MEB1"
        '                                         Select c

        '    For Each q As MemberImageTable In DeleteMemberImage
        '        MD.MemberImageTables.DeleteOnSubmit(q)
        '    Next
        '    Try
        '        MD.SubmitChanges()
        '    Catch ex As Exception
        '    End Try
        'End If

        ''delete memeber 
        'Dim checkMembershipTables = (From c In MD.MembershipTables
        '                              Where c.Memberid <> "MEB1"
        '                                        Select c).Any
        'If checkMembershipTables Then

        '    Dim DeleteMember = From c In MD.MembershipTables
        '                                      Where c.Memberid <> "MEB1"
        '                                            Select c

        '    For Each q As MembershipTable In DeleteMember
        '        MD.MembershipTables.DeleteOnSubmit(q)
        '    Next
        '    Try
        '        MD.SubmitChanges()
        '    Catch ex As Exception
        '    End Try
        'End If


        ''delete unit tb
        'Dim checkUnitTables = (From f In MD.UnitTables
        '                       Select f).Any

        'If checkUnitTables = True Then
        '    Dim DeleteUnit = From c In MD.UnitTables
        '                                   Select c

        '    For Each q As UnitTable In DeleteUnit
        '        MD.UnitTables.DeleteOnSubmit(q)
        '    Next
        '    Try
        '        MD.SubmitChanges()
        '    Catch ex As Exception
        '    End Try
        'End If

    End Sub
    'Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
    '    Dim checkName = MD.AuthenticalTables.Where(Function(r) r.Username = txtUsername.Text AndAlso r.Password = txtPassword.Text).Any

    '    If checkName = True Then
    '        Dim getMemberID = MD.AuthenticalTables.Where(Function(f) f.Username = txtUsername.Text AndAlso f.Password = txtPassword.Text).SingleOrDefault.Memberid

    '        Dim name = MD.MembershipTables.Where(Function(d) d.Memberid = getMemberID).SingleOrDefault.FirstName

    '        Dim getChurch = (From y In MD.MembershipTables Join
    '                            h In MD.ChurchDetailTables On y.ChurchDetailID Equals h.ChurchDetailID
    '                            Where y.Memberid = getMemberID
    '                            Select h).SingleOrDefault.ChurchName


    '        Dim Location = (From d In MD.ChurchDetailTables
    '                      Where d.ChurchName = getChurch
    '                      Select d).SingleOrDefault.Location.Name

    '        Dim state = (From d In MD.ChurchDetailTables
    '                      Where d.ChurchName = getChurch
    '                      Select d).SingleOrDefault.StateTable.State


    '        Session("State") = state.ToUpper
    '        Session("Location") = Location.ToUpper
    '        Session("Name") = name.ToUpper
    '        Session("Church") = getChurch.ToUpper
    '        Session("StaffID") = getMemberID

    '        Response.Redirect("Reminder.aspx")



    '        txtUsername.Text = ""
    '        txtPassword.Text = ""
    '        txterror.Text = ""
    '        'save any thing to memory

    '    ElseIf checkName = False Then
    '        txtUsername.Text = ""
    '        txtPassword.Text = ""
    '        txterror.Text = "Inavlid Password"
    '        btnreset.Visible = True
    '        Exit Sub
    '    End If
    'End Sub

 
    'Protected Sub btnreset_Click(sender As Object, e As EventArgs) Handles btnreset.Click
    '    Response.Redirect("Security Question.aspx")
    'End Sub

    'Protected Sub txtUsername_TextChanged(sender As Object, e As EventArgs) Handles txtUsername.TextChanged

    'End Sub

   
   
   

    'Protected Sub btnreset_Click1(sender As Object, e As EventArgs) Handles btnreset.Click
    '    Response.Redirect("Security Question.aspx")
    'End Sub

    Protected Sub btnreset_Click1(sender As Object, e As EventArgs) Handles btnreset.Click
        Response.Redirect("Security Question.aspx")
    End Sub
End Class
