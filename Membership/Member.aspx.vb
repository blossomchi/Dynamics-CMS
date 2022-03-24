Imports System.IO
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Data
Partial Class Member
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim userName As String = User.Identity.Name

            DrpSorted.DataBind()
            DrpSorted.Items.Insert(0, New ListItem("Select"))
            DrpSorted.SelectedIndex = 0

            dropFamily.Items.Remove("Select")
            dropFamily.DataBind()
            dropFamily.Items.Insert(0, New ListItem("Select"))
            dropFamily.SelectedIndex = 0

            txtcriteria.Text = ""

            GrdAscending.Visible = True
            txtcriteria.Visible = False
            GrdvSurname.Visible = False
            GrdvFirstname.Visible = False
            GrdTitle.Visible = False
            GrdvPhn.Visible = False
            GrdAuthority.Visible = False
            GrdAuthority.Visible = False
            GrdHomecell.Visible = False
            GrdService.Visible = False
            GrdState.Visible = False


          

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

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID

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


    Protected Sub btnAddFamily_Click(sender As Object, e As EventArgs) Handles btnAddFamily.Click
        If txtFamilyname.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter your Family name!!!')", True)
            Exit Sub
        End If

        If TXTFamilyFirst.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter your Family first name!!!')", True)
            Exit Sub
        End If

        'If familyMiddle.Text = "" Then
        '    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter your Family middle name!!!')", True)
        '    Exit Sub
        'End If
        Dim a As New churchmanDataContext
        Dim strDate As String = Date.Now.ToString("MM/dd/yyyy hh:mm:ss tt") 'Returns date with AM/PM'

        Dim id = From i In a.FamilyTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            lblid.Text = "FAM" & "" & z
        Else
            lblid.Text = "FAM" & "" & 1

        End If

        If madd.FamilyTables.Where(Function(f) f.FamilyName = txtFamilyname.Text AndAlso f.FamilyFirstName = TXTFamilyFirst.Text).Any Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('This Family name already exist. Please enter another!!!')", True)
            Exit Sub
        End If

        Dim savenewfamily As New FamilyTable With { _
       .Familyid = lblid.Text, _
       .FamilyName = txtFamilyname.Text.ToUpper, _
       .FamilyFirstName = TXTFamilyFirst.Text.ToUpper, _
       .FamilyMiddleName = familyMiddle.Text.ToUpper, _
       .DateCreated = Now}


        a.FamilyTables.InsertOnSubmit(savenewfamily)
        a.SubmitChanges()

        dropFamily.Items.Remove("Select")
        dropFamily.DataBind()
        dropFamily.Items.Insert(0, New ListItem("Select"))
        dropFamily.SelectedIndex = 0

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Saved!!!')", True)

        txtFamilyname.Text = ""
        TXTFamilyFirst.Text = ""
        familyMiddle.Text = ""
    End Sub

    Protected Sub btnAddperson_Click(sender As Object, e As EventArgs) Handles btnAddperson.Click
        If dropFamily.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, select Family name!!!')", True)
            Exit Sub
        Else
            Session("yourKey") = dropFamily.SelectedValue
            Response.Redirect("Addmember.aspx")
        End If


    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpSorted.SelectedIndexChanged

        If DrpSorted.SelectedValue = "Ascending" Then
            txtcriteria.Text = ""
            DownloadButton.Visible = False
            CBState.Visible = False
            CBHomeCell.Visible = False
            CBServiceUnit.Visible = False
            OtherDetailsGV.Visible = False
            GrdAscending.Visible = True
            txtcriteria.Visible = False
            GrdvSurname.Visible = False
            GrdvPhn.Visible = False
            GrdTitle.Visible = False
            GrdvPhn.Visible = False
            GrdGender.Visible = False
            GrdAuthority.Visible = False
            GrdHomecell.Visible = False
            GrdService.Visible = False
            GrdState.Visible = False
            GrdStatus.Visible = False
            GrdMembersGroups.Visible = False
            CBMembersGroups.Visible = False
            CBMonth.Visible = False
            GrdMonth.Visible = False
            CBFamily.Visible = False
            GrdAllFamily.Visible = False
        ElseIf DrpSorted.SelectedValue = "All Family" Then
            CBFamily.Visible = True
            DownloadButton.Visible = False
            CBFamily.Items.Remove("Select")
            CBFamily.DataBind()
            CBFamily.Items.Insert(0, New ListItem("Select"))
            CBFamily.SelectedIndex = 0
            GrdAllFamily.Visible = False
            txtcriteria.Text = ""
            CBHomeCell.Visible = False
            CBState.Visible = False
            CBServiceUnit.Visible = False
            GrdAscending.Visible = False
            OtherDetailsGV.Visible = False
            txtcriteria.Visible = False
            GrdvSurname.Visible = False
            GrdTitle.Visible = False
            GrdvPhn.Visible = False
            GrdGender.Visible = False
            GrdvFirstname.Visible = False
            GrdAuthority.Visible = False
            GrdHomecell.Visible = False
            GrdService.Visible = False
            GrdState.Visible = False
            GrdStatus.Visible = False
            GrdMembersGroups.Visible = False
            CBMembersGroups.Visible = False
            CBMonth.Visible = False
            GrdMonth.Visible = False
        ElseIf DrpSorted.SelectedValue = "FamilyName" Then
            txtcriteria.Text = ""
            DownloadButton.Visible = False
            GrdAllFamily.Visible = False
            CBFamily.Visible = False
            CBHomeCell.Visible = False
            CBState.Visible = False
            CBServiceUnit.Visible = False
            GrdAscending.Visible = False
            OtherDetailsGV.Visible = False
            txtcriteria.Visible = True
            GrdvSurname.Visible = True
            GrdTitle.Visible = False
            GrdvPhn.Visible = False
            GrdGender.Visible = False
            GrdvFirstname.Visible = False
            GrdAuthority.Visible = False
            GrdHomecell.Visible = False
            GrdService.Visible = False
            GrdState.Visible = False
            GrdStatus.Visible = False
            GrdMembersGroups.Visible = False
            CBMembersGroups.Visible = False
            CBMonth.Visible = False
            GrdMonth.Visible = False
        ElseIf DrpSorted.SelectedValue = "FirstName" Then
            txtcriteria.Text = ""
            DownloadButton.Visible = False
            GrdAllFamily.Visible = False
            CBFamily.Visible = False
            CBHomeCell.Visible = False
            CBState.Visible = False
            CBServiceUnit.Visible = False
            GrdAscending.Visible = False
            OtherDetailsGV.Visible = False
            txtcriteria.Visible = True
            GrdvSurname.Visible = False
            GrdTitle.Visible = False
            GrdvFirstname.Visible = True
            GrdvPhn.Visible = False
            GrdGender.Visible = False
            GrdAuthority.Visible = False
            GrdHomecell.Visible = False
            GrdService.Visible = False
            GrdState.Visible = False
            GrdStatus.Visible = False
            GrdMembersGroups.Visible = False
            CBMembersGroups.Visible = False
            CBMonth.Visible = False
            GrdMonth.Visible = False
        ElseIf DrpSorted.SelectedValue = "Phone Number" Then
            txtcriteria.Text = ""
            DownloadButton.Visible = False
            GrdAllFamily.Visible = False
            CBFamily.Visible = False
            CBHomeCell.Visible = False
            CBState.Visible = False
            CBServiceUnit.Visible = False
            GrdAscending.Visible = False
            GrdvFirstname.Visible = False
            OtherDetailsGV.Visible = False
            GrdTitle.Visible = False
            GrdvSurname.Visible = False
            txtcriteria.Visible = True
            GrdvPhn.Visible = True
            GrdGender.Visible = False
            GrdAuthority.Visible = False
            GrdHomecell.Visible = False
            GrdService.Visible = False
            GrdState.Visible = False
            GrdStatus.Visible = False
            GrdMembersGroups.Visible = False
            CBMembersGroups.Visible = False
            CBMonth.Visible = False
            GrdMonth.Visible = False
        ElseIf DrpSorted.SelectedValue = "Title" Then
            txtcriteria.Text = ""
            DownloadButton.Visible = False
            GrdAllFamily.Visible = False
            CBFamily.Visible = False
            CBHomeCell.Visible = False
            CBState.Visible = False
            CBServiceUnit.Visible = False
            GrdAscending.Visible = False
            OtherDetailsGV.Visible = False
            GrdvFirstname.Visible = False
            GrdTitle.Visible = True
            GrdvSurname.Visible = False
            txtcriteria.Visible = True
            GrdvPhn.Visible = False
            GrdGender.Visible = False
            GrdAuthority.Visible = False
            GrdHomecell.Visible = False
            GrdService.Visible = False
            GrdState.Visible = False
            GrdStatus.Visible = False
            GrdMembersGroups.Visible = False
            CBMembersGroups.Visible = False
            GrdMonth.Visible = False
        ElseIf DrpSorted.SelectedValue = "Gender" Then
            DownloadButton.Visible = False
            GrdAllFamily.Visible = False
            txtcriteria.Text = ""
            CBFamily.Visible = False
            CBHomeCell.Visible = False
            CBState.Visible = False
            CBServiceUnit.Visible = False
            GrdAscending.Visible = False
            GrdvFirstname.Visible = False
            GrdTitle.Visible = False
            GrdvSurname.Visible = False
            txtcriteria.Visible = True
            GrdvPhn.Visible = False
            GrdGender.Visible = True
            OtherDetailsGV.Visible = False
            GrdAuthority.Visible = False
            GrdHomecell.Visible = False
            GrdService.Visible = False
            GrdState.Visible = False
            GrdStatus.Visible = False
            GrdMembersGroups.Visible = False
            CBMembersGroups.Visible = False
            CBMonth.Visible = False
            GrdMonth.Visible = False
        ElseIf DrpSorted.SelectedValue = "Authority" Then
            DownloadButton.Visible = False
            GrdAllFamily.Visible = False
            txtcriteria.Text = ""
            CBFamily.Visible = False
            CBHomeCell.Visible = False
            CBState.Visible = False
            CBServiceUnit.Visible = False
            GrdAscending.Visible = False
            GrdvFirstname.Visible = False
            GrdTitle.Visible = False
            OtherDetailsGV.Visible = False
            GrdvSurname.Visible = False
            txtcriteria.Visible = True
            GrdvPhn.Visible = False
            GrdGender.Visible = False
            GrdAuthority.Visible = True
            GrdHomecell.Visible = False
            GrdService.Visible = False
            GrdState.Visible = False
            GrdStatus.Visible = False
            GrdMembersGroups.Visible = False
            CBMembersGroups.Visible = False
            CBMonth.Visible = False
            GrdMonth.Visible = False
        ElseIf DrpSorted.SelectedValue = "Homecell" Then
            DownloadButton.Visible = False
            txtcriteria.Text = ""
            CBFamily.Visible = False
            CBHomeCell.Visible = True
            GrdAllFamily.Visible = False
            CBHomeCell.Items.Remove("Select")
            CBHomeCell.DataBind()
            CBHomeCell.Items.Insert(0, New ListItem("Select"))
            CBHomeCell.SelectedIndex = 0

            CBState.Visible = False
            CBServiceUnit.Visible = False
            GrdAscending.Visible = False
            GrdvFirstname.Visible = False
            GrdTitle.Visible = False
            GrdvSurname.Visible = False
            txtcriteria.Visible = False
            GrdvPhn.Visible = False
            GrdGender.Visible = False
            GrdAuthority.Visible = False
            GrdHomecell.Visible = True
            GrdService.Visible = False
            GrdState.Visible = False
            GrdStatus.Visible = False
            GrdMembersGroups.Visible = False
            CBMembersGroups.Visible = False
            CBMonth.Visible = False
            GrdMonth.Visible = False
        ElseIf DrpSorted.SelectedValue = "SeviceUnit" Then
            DownloadButton.Visible = False
            GrdAllFamily.Visible = False
            txtcriteria.Text = ""
            CBFamily.Visible = False
            CBHomeCell.Visible = False
            CBServiceUnit.Visible = True
            CBState.Visible = False
            CBServiceUnit.Items.Remove("Select")
            CBServiceUnit.DataBind()
            CBServiceUnit.Items.Insert(0, New ListItem("Select"))
            CBServiceUnit.SelectedIndex = 0


            GrdAscending.Visible = False
            GrdvFirstname.Visible = False
            GrdTitle.Visible = False
            GrdvSurname.Visible = False
            txtcriteria.Visible = False
            GrdvPhn.Visible = False
            GrdGender.Visible = False
            OtherDetailsGV.Visible = False
            GrdAuthority.Visible = False
            GrdHomecell.Visible = True
            GrdService.Visible = False
            GrdState.Visible = False
            GrdStatus.Visible = False
            GrdMembersGroups.Visible = False
            CBMembersGroups.Visible = False
            CBMonth.Visible = False
            GrdMonth.Visible = False
        ElseIf DrpSorted.SelectedValue = "State" Then
            DownloadButton.Visible = False
            txtcriteria.Text = ""
            CBState.Visible = True
            CBHomeCell.Visible = False
            CBFamily.Visible = False
            CBState.Items.Remove("Select")
            CBState.DataBind()
            CBState.Items.Insert(0, New ListItem("Select"))
            CBState.SelectedIndex = 0
            GrdAllFamily.Visible = False
            CBServiceUnit.Visible = False
            GrdAscending.Visible = False
            GrdvFirstname.Visible = False
            GrdTitle.Visible = False
            GrdvSurname.Visible = False
            txtcriteria.Visible = False
            GrdvPhn.Visible = False
            OtherDetailsGV.Visible = False
            GrdGender.Visible = False
            GrdAuthority.Visible = False
            GrdHomecell.Visible = True
            GrdService.Visible = False
            GrdState.Visible = True
            GrdStatus.Visible = False
            GrdMembersGroups.Visible = False
            CBMembersGroups.Visible = False
            CBMonth.Visible = False
            GrdMonth.Visible = False
        ElseIf DrpSorted.SelectedValue = "Marital Status" Then
            GrdAllFamily.Visible = False
            DownloadButton.Visible = False
            txtcriteria.Text = ""
            CBFamily.Visible = False
            CBHomeCell.Visible = False
            CBState.Visible = False
            CBServiceUnit.Visible = False
            GrdAscending.Visible = False
            GrdvFirstname.Visible = False
            GrdTitle.Visible = False
            GrdvSurname.Visible = False
            txtcriteria.Visible = True
            GrdvPhn.Visible = False
            OtherDetailsGV.Visible = False
            GrdGender.Visible = False
            GrdAuthority.Visible = False
            GrdHomecell.Visible = True
            GrdService.Visible = False
            GrdState.Visible = False
            GrdStatus.Visible = True
            GrdMembersGroups.Visible = False
            CBMembersGroups.Visible = False
            CBMonth.Visible = False
            GrdMonth.Visible = False
        ElseIf DrpSorted.SelectedValue = "Members Group" Then
            GrdAllFamily.Visible = False
            DownloadButton.Visible = False
            txtcriteria.Text = ""
            CBFamily.Visible = False
            CBHomeCell.Visible = False
            CBState.Visible = False
            CBServiceUnit.Visible = False
            GrdAscending.Visible = False
            GrdvFirstname.Visible = False
            GrdTitle.Visible = False
            GrdvSurname.Visible = False
            txtcriteria.Visible = False
            GrdvPhn.Visible = False
            OtherDetailsGV.Visible = False
            GrdGender.Visible = False
            GrdAuthority.Visible = False
            GrdHomecell.Visible = False
            GrdService.Visible = False
            GrdState.Visible = False
            GrdStatus.Visible = False
            CBMembersGroups.Visible = True
            CBMembersGroups.Items.Remove("Select")
            CBMembersGroups.DataBind()
            CBMembersGroups.Items.Insert(0, New ListItem("Select"))
            CBMembersGroups.SelectedIndex = 0
            CBMonth.Visible = False
            GrdMonth.Visible = False
        ElseIf DrpSorted.SelectedValue = "Month" Then
            DownloadButton.Visible = False
            GrdAllFamily.Visible = False
            txtcriteria.Text = ""
            CBFamily.Visible = False
            CBHomeCell.Visible = False
            CBState.Visible = False
            CBServiceUnit.Visible = False
            GrdAscending.Visible = False
            GrdvFirstname.Visible = False
            GrdTitle.Visible = False
            GrdvSurname.Visible = False
            txtcriteria.Visible = False
            GrdvPhn.Visible = False
            OtherDetailsGV.Visible = False
            GrdGender.Visible = False
            GrdAuthority.Visible = False
            GrdHomecell.Visible = False
            GrdService.Visible = False
            GrdState.Visible = False
            GrdStatus.Visible = False
            CBMembersGroups.Visible = False
            CBMonth.Visible = True

            CBMonth.Items.Remove("Select")
            CBMonth.DataBind()
            CBMonth.Items.Insert(0, New ListItem("Select"))
            CBMonth.SelectedIndex = 0

            GrdMonth.Visible = False
        End If
    End Sub
    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        'Tell the compiler that the control is rendered
        'explicitly by overriding the VerifyRenderingInServerForm event.
    End Sub
    Private Sub Excel_Export()
        If txtDownloadFamily.Text = 1 Then
            ' download last name
            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=SurName.xls")
            Response.Charset = ""
            Response.ContentType = "application/vnd.ms-excel"
            Dim sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)
            GrdvSurname.AllowPaging = False
            GrdvSurname.DataBind()
            For i As Integer = 0 To GrdvSurname.Rows.Count - 1

                Dim row As GridViewRow = GrdvSurname.Rows(i)
                row.Attributes.Add("class", "textmode")

            Next
            GrdvSurname.RenderControl(hw)
            'style to format numbers to string 

            Dim style As String = "<style> .textmode " & "{ mso-number-format:\@; } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.End()

        ElseIf txtDownloadFamily.Text = 2 Then
            'download firstName
            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=FirstName.xls")
            Response.Charset = ""
            Response.ContentType = "application/vnd.ms-excel"
            Dim sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)
            GrdvFirstname.AllowPaging = False
            GrdvFirstname.DataBind()
            For i As Integer = 0 To GrdvFirstname.Rows.Count - 1

                Dim row As GridViewRow = GrdvFirstname.Rows(i)
                row.Attributes.Add("class", "textmode")

            Next
            GrdvFirstname.RenderControl(hw)
            'style to format numbers to string 

            Dim style As String = "<style> .textmode " & "{ mso-number-format:\@; } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.End()

        ElseIf txtDownloadFamily.Text = 3 Then
            'download phone
            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=Phone.xls")
            Response.Charset = ""
            Response.ContentType = "application/vnd.ms-excel"
            Dim sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)
            GrdvPhn.AllowPaging = False
            GrdvPhn.DataBind()
            For i As Integer = 0 To GrdvPhn.Rows.Count - 1

                Dim row As GridViewRow = GrdvPhn.Rows(i)
                row.Attributes.Add("class", "textmode")

            Next
            GrdvPhn.RenderControl(hw)
            'style to format numbers to string 

            Dim style As String = "<style> .textmode " & "{ mso-number-format:\@; } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.End()

        ElseIf txtDownloadFamily.Text = 4 Then
            'download title
            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=Title.xls")
            Response.Charset = ""
            Response.ContentType = "application/vnd.ms-excel"
            Dim sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)
            GrdTitle.AllowPaging = False
            GrdTitle.DataBind()
            For i As Integer = 0 To GrdTitle.Rows.Count - 1

                Dim row As GridViewRow = GrdTitle.Rows(i)
                row.Attributes.Add("class", "textmode")

            Next
            GrdTitle.RenderControl(hw)
            'style to format numbers to string 

            Dim style As String = "<style> .textmode " & "{ mso-number-format:\@; } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.End()

        ElseIf txtDownloadFamily.Text = 5 Then
            'download title
            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=Gender.xls")
            Response.Charset = ""
            Response.ContentType = "application/vnd.ms-excel"
            Dim sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)
            GrdGender.AllowPaging = False
            GrdGender.DataBind()
            For i As Integer = 0 To GrdGender.Rows.Count - 1

                Dim row As GridViewRow = GrdGender.Rows(i)
                row.Attributes.Add("class", "textmode")

            Next
            GrdGender.RenderControl(hw)
            'style to format numbers to string 

            Dim style As String = "<style> .textmode " & "{ mso-number-format:\@; } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.End()

        ElseIf txtDownloadFamily.Text = 6 Then
            'download home cell
            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=HomeCell.xls")
            Response.Charset = ""
            Response.ContentType = "application/vnd.ms-excel"
            Dim sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)
            GrdHomecell.AllowPaging = False
            GrdHomecell.DataBind()
            For i As Integer = 0 To GrdHomecell.Rows.Count - 1

                Dim row As GridViewRow = GrdHomecell.Rows(i)
                row.Attributes.Add("class", "textmode")

            Next
            GrdHomecell.RenderControl(hw)
            'style to format numbers to string 

            Dim style As String = "<style> .textmode " & "{ mso-number-format:\@; } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.End()

        ElseIf txtDownloadFamily.Text = 7 Then
            'download members group
            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=Group.xls")
            Response.Charset = ""
            Response.ContentType = "application/vnd.ms-excel"
            Dim sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)
            GrdMembersGroups.AllowPaging = False
            GrdMembersGroups.DataBind()
            For i As Integer = 0 To GrdMembersGroups.Rows.Count - 1

                Dim row As GridViewRow = GrdMembersGroups.Rows(i)
                row.Attributes.Add("class", "textmode")

            Next
            GrdMembersGroups.RenderControl(hw)
            'style to format numbers to string 

            Dim style As String = "<style> .textmode " & "{ mso-number-format:\@; } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.End()

        ElseIf txtDownloadFamily.Text = 8 Then
            'download month
            Response.Clear()
            Response.Buffer = True
            Response.AddHeader("content-disposition", "attachment;filename=Month.xls")
            Response.Charset = ""
            Response.ContentType = "application/vnd.ms-excel"
            Dim sw As New StringWriter()
            Dim hw As New HtmlTextWriter(sw)
            GrdMonth.AllowPaging = False
            GrdMonth.DataBind()
            For i As Integer = 0 To GrdMonth.Rows.Count - 1

                Dim row As GridViewRow = GrdMonth.Rows(i)
                row.Attributes.Add("class", "textmode")

            Next
            GrdMonth.RenderControl(hw)
            'style to format numbers to string 

            Dim style As String = "<style> .textmode " & "{ mso-number-format:\@; } </style>"
            Response.Write(style)
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.End()

        End If


    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If DrpSorted.SelectedValue = "FamilyName" Then
            Dim checkName = madd.FamilyTables.Where(Function(q) q.FamilyName = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                txtDownloadFamily.Text = 1
                DownloadButton.Visible = True
                GrdAscending.Visible = False
                GrdvPhn.Visible = False
                GrdvFirstname.Visible = False
                GrdvSurname.Visible = True
                GrdGender.Visible = False
                GrdAuthority.Visible = False
                GrdHomecell.Visible = False
                GrdService.Visible = False
                GrdState.Visible = False
                GrdMembersGroups.Visible = False
                GrdMonth.Visible = False
                CBServiceUnit.Visible = False
                CBState.Visible = False
                CBHomeCell.Visible = False
                CBFamily.Visible = False
                GrdAllFamily.Visible = False
            End If
        ElseIf DrpSorted.SelectedValue = "All Family" Then
            txtcriteria.Text = ""
            txtcriteria.Text = CBFamily.SelectedValue

            Dim checkFamiltImage = madd.FamilyImageTables.Where(Function(q) q.FamilyID = txtcriteria.Text).Any

            If checkFamiltImage Then
                GrdAllFamily.Visible = True

                GrdAscending.Visible = False
                GrdvPhn.Visible = False
                GrdvFirstname.Visible = False
                GrdvSurname.Visible = False
                GrdGender.Visible = False
                GrdAuthority.Visible = False
                GrdHomecell.Visible = False
                GrdService.Visible = False
                GrdState.Visible = False
                GrdMembersGroups.Visible = False
                GrdMonth.Visible = False
                CBServiceUnit.Visible = False
                CBState.Visible = False
                CBHomeCell.Visible = False
            Else

            End If

        ElseIf DrpSorted.SelectedValue = "FirstName" Then
            Dim checkName = madd.MembershipTables.Where(Function(q) q.FirstName = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                txtDownloadFamily.Text = 2
                DownloadButton.Visible = True
                CBFamily.Visible = False
                GrdAllFamily.Visible = False
                GrdAscending.Visible = False
                GrdvPhn.Visible = False
                GrdvFirstname.Visible = True
                GrdvSurname.Visible = False
                GrdGender.Visible = False
                GrdAuthority.Visible = False
                GrdHomecell.Visible = False
                GrdService.Visible = False
                GrdState.Visible = False
                GrdMembersGroups.Visible = False
                GrdMonth.Visible = False
                CBServiceUnit.Visible = False
                CBState.Visible = False
                CBHomeCell.Visible = False
            End If

        ElseIf DrpSorted.SelectedValue = "Phone Number" Then
            Dim checkName = madd.MembershipTables.Where(Function(q) q.Phone1 = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                txtDownloadFamily.Text = 3
                DownloadButton.Visible = True
                CBFamily.Visible = False
                GrdAllFamily.Visible = False
                GrdAscending.Visible = False
                GrdvPhn.Visible = True
                GrdvFirstname.Visible = False
                GrdvSurname.Visible = False
                GrdGender.Visible = False
                GrdAuthority.Visible = False
                GrdHomecell.Visible = False
                GrdService.Visible = False
                GrdState.Visible = False
                GrdMembersGroups.Visible = False
                GrdMonth.Visible = False
                CBServiceUnit.Visible = False
                CBState.Visible = False
                CBHomeCell.Visible = False
            End If
        ElseIf DrpSorted.SelectedValue = "Title" Then
            Dim checkName = madd.MembershipTables.Where(Function(q) q.Title = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                txtDownloadFamily.Text = 4
                DownloadButton.Visible = True
                CBFamily.Visible = False
                GrdAllFamily.Visible = False
                GrdAscending.Visible = False
                GrdvFirstname.Visible = False
                GrdTitle.Visible = True
                GrdvSurname.Visible = False
                txtcriteria.Visible = True
                GrdvPhn.Visible = False
                GrdGender.Visible = False
                GrdAuthority.Visible = False
                GrdHomecell.Visible = False
                GrdService.Visible = False
                GrdState.Visible = False
                GrdMembersGroups.Visible = False
                GrdMonth.Visible = False
                CBServiceUnit.Visible = False
                CBState.Visible = False
                CBHomeCell.Visible = False
            End If

        ElseIf DrpSorted.SelectedValue = "Gender" Then
            Dim checkName = madd.MembershipTables.Where(Function(q) q.Gender = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                txtDownloadFamily.Text = 5
                DownloadButton.Visible = True
                CBFamily.Visible = False
                GrdAllFamily.Visible = False
                GrdAscending.Visible = False
                GrdvFirstname.Visible = False
                GrdTitle.Visible = False
                GrdvSurname.Visible = False
                txtcriteria.Visible = True
                GrdvPhn.Visible = False
                GrdGender.Visible = True
                GrdAuthority.Visible = False
                GrdHomecell.Visible = False
                GrdService.Visible = False
                GrdState.Visible = False
                GrdMembersGroups.Visible = False
                GrdMonth.Visible = False
                CBServiceUnit.Visible = False
                CBState.Visible = False
                CBHomeCell.Visible = False
            End If

        ElseIf DrpSorted.SelectedValue = "Authority" Then
            Dim checkName = madd.MembershipTables.Where(Function(q) q.Authority = txtcriteria.Text).Any

            If Not checkName Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
            ElseIf checkName Then
                CBFamily.Visible = False
                GrdAllFamily.Visible = False
                GrdAscending.Visible = False
                GrdvFirstname.Visible = False
                GrdTitle.Visible = False
                GrdvSurname.Visible = False
                txtcriteria.Visible = True
                GrdvPhn.Visible = False
                GrdGender.Visible = False
                GrdAuthority.Visible = True
                GrdHomecell.Visible = False
                GrdService.Visible = False
                GrdState.Visible = False
                GrdMembersGroups.Visible = False
                GrdMonth.Visible = False
                CBServiceUnit.Visible = False
                CBState.Visible = False
                CBHomeCell.Visible = False
            End If

        ElseIf DrpSorted.SelectedValue = "Homecell" Then
            If CBHomeCell.SelectedValue = "Select" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, select home cell area!!!')", True)
                Exit Sub
            Else
                txtcriteria.Text = CBHomeCell.SelectedValue
                Dim checkName = madd.AreaTables.Where(Function(q) q.AreaName = txtcriteria.Text).Any

                If Not checkName Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
                ElseIf checkName Then
                    txtDownloadFamily.Text = 6
                    DownloadButton.Visible = True
                    CBFamily.Visible = False
                    GrdAllFamily.Visible = False
                    GrdAscending.Visible = False
                    GrdvFirstname.Visible = False
                    GrdTitle.Visible = False
                    GrdvSurname.Visible = False
                    txtcriteria.Visible = False
                    GrdvPhn.Visible = False
                    GrdGender.Visible = False
                    GrdAuthority.Visible = False
                    GrdHomecell.Visible = True
                    GrdService.Visible = False
                    GrdState.Visible = False
                    GrdMembersGroups.Visible = False
                    GrdMonth.Visible = False
                    CBServiceUnit.Visible = False
                    CBState.Visible = False
                End If
            End If
        ElseIf DrpSorted.SelectedValue = "SeviceUnit" Then
            If CBServiceUnit.SelectedValue = "Select" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, select service unit!!!')", True)
                Exit Sub
            Else
                txtcriteria.Text = CBServiceUnit.SelectedValue

                Dim checkName = madd.UnitTables.Where(Function(q) q.ServiceName = txtcriteria.Text).Any

                If Not checkName Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
                ElseIf checkName Then
                    CBFamily.Visible = False
                    GrdAllFamily.Visible = False
                    GrdAscending.Visible = False
                    GrdvFirstname.Visible = False
                    GrdTitle.Visible = False
                    GrdvSurname.Visible = False
                    txtcriteria.Visible = False
                    GrdvPhn.Visible = False
                    GrdGender.Visible = False
                    GrdAuthority.Visible = False
                    GrdHomecell.Visible = False
                    GrdService.Visible = True
                    GrdState.Visible = False
                    GrdMembersGroups.Visible = False
                    GrdMonth.Visible = False
                    CBState.Visible = False
                End If
            End If
        ElseIf DrpSorted.SelectedValue = "State" Then
            stateID.Text = ""
            Dim getStateID As String = ""
            If CBState.SelectedValue = "Select" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, select state !!!')", True)
                Exit Sub

            Else
                txtcriteria.Text = CBState.SelectedValue

                Dim checkId = madd.StateTables.Where(Function(v) v.State = txtcriteria.Text).Any

                If Not checkId Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('That state does not exit !!!')", True)
                    Exit Sub
                Else
                    getStateID = madd.StateTables.Where(Function(v) v.State = txtcriteria.Text).SingleOrDefault.Stateid
                    stateID.Text = getStateID
                End If



                Dim checkStateExisting = (From f In madd.MembershipTables Join
                                        w In madd.StateTables On f.StateofOrgin Equals w.Stateid
                                        Where (f.StateofOrgin = getStateID)
                                        Select f).Any


                If Not checkStateExisting Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No state exist !!!')", True)
                ElseIf checkStateExisting Then
                    CBFamily.Visible = False
                    GrdAllFamily.Visible = False
                    GrdAscending.Visible = False
                    GrdvFirstname.Visible = False
                    GrdTitle.Visible = False
                    GrdvSurname.Visible = False
                    txtcriteria.Visible = False
                    GrdvPhn.Visible = False
                    GrdGender.Visible = False
                    GrdAuthority.Visible = False
                    GrdHomecell.Visible = False
                    GrdService.Visible = False
                    GrdState.Visible = True
                    GrdMembersGroups.Visible = False
                    GrdMonth.Visible = False
                    CBServiceUnit.Visible = False
                End If

            End If
           
        ElseIf DrpSorted.SelectedValue = "Members Group" Then
            If CBMembersGroups.SelectedValue = "Select" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Select group !!!')", True)
                Exit Sub
            Else
                Dim groupID = madd.MembersGroups.Where(Function(d) d.GroupName = CBMembersGroups.SelectedValue).SingleOrDefault.ID

                Dim checkGroup = madd.MembershipTables.Where(Function(q) q.MemberssGroup = groupID).Any

                If Not checkGroup Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)
                ElseIf checkGroup Then
                    txtDownloadFamily.Text = 7
                    DownloadButton.Visible = True
                    CBFamily.Visible = False
                    GrdAllFamily.Visible = False
                    GrdMembersGroups.Visible = True
                    txtcriteria.Text = CBMembersGroups.SelectedValue
                    GrdAscending.Visible = False
                    GrdvFirstname.Visible = False
                    GrdTitle.Visible = False
                    GrdvSurname.Visible = False
                    GrdvPhn.Visible = False
                    OtherDetailsGV.Visible = False
                    GrdGender.Visible = False
                    GrdAuthority.Visible = False
                    GrdHomecell.Visible = False
                    GrdService.Visible = False
                    GrdState.Visible = False
                    GrdStatus.Visible = False
                    GrdMonth.Visible = False
                    CBServiceUnit.Visible = False
                    CBState.Visible = False
                End If
            End If
        ElseIf DrpSorted.SelectedValue = "Month" Then
            If CBMonth.SelectedValue = "" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Select month !!!')", True)
                Exit Sub
            Else
                Dim checkMonth = madd.MembershipTables.Where(Function(q) q.DOB.Value.Month = CBMonth.SelectedValue).Any
                If Not checkMonth Then
                    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('No record !!!')", True)

                Else
                    txtDownloadFamily.Text = 8
                    DownloadButton.Visible = True
                    CBFamily.Visible = False
                    GrdAllFamily.Visible = False
                    txtcriteria.Text = CBMonth.SelectedValue
                    GrdAscending.Visible = False
                    GrdvFirstname.Visible = False
                    GrdTitle.Visible = False
                    GrdvSurname.Visible = False
                    GrdMonth.Visible = True
                    GrdvPhn.Visible = False
                    OtherDetailsGV.Visible = False
                    GrdGender.Visible = False
                    GrdAuthority.Visible = False
                    GrdHomecell.Visible = False
                    GrdService.Visible = False
                    GrdState.Visible = False
                    GrdStatus.Visible = False
                    CBMembersGroups.Visible = False
                    CBServiceUnit.Visible = False
                    CBState.Visible = False

                End If
            End If
        End If

    End Sub

    'Protected Sub GrdAscending_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GrdAscending.RowCommand

    '    If e.CommandName = "DeleteM" Then
    '        If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
    '            'Get raised id
    '            Dim Membersn As Integer = Convert.ToInt32(e.CommandArgument)

    '            'get expense group id
    '            Dim getMemberid = (From s In madd.MembershipTables
    '                        Where s.SN = Membersn
    '                        Select s).SingleOrDefault.Memberid



    '            Dim getFamilyID = (From s In madd.MembershipTables
    '                       Where s.SN = Membersn
    '                       Select s).SingleOrDefault.FamilyID



    '            Dim checkmembership = (From s In madd.MembershipTables
    '                          Where s.Memberid = getMemberid AndAlso s.FamilyID = getFamilyID
    '                         Select s).Any



    '            If checkmembership = True Then
    '                Dim deletePar = (From s In madd.MembershipTables
    '                                                Where (s.Memberid = getMemberid AndAlso s.FamilyID = getFamilyID)
    '                                                Select s).SingleOrDefault()

    '                madd.MembershipTables.DeleteOnSubmit(deletePar)
    '                madd.SubmitChanges()

    '                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Information was deleted!.')", True)
    '            End If



    '            Dim checkmemberimage = (From s In madd.MemberImageTables
    '                          Where s.MemberID = getMemberid
    '                         Select s).Any



    '            If checkmemberimage = True Then
    '                Dim deleteimg = (From s In madd.MemberImageTables
    '                                                Where (s.MemberID = getMemberid)
    '                                                Select s).SingleOrDefault()

    '                madd.MemberImageTables.DeleteOnSubmit(deleteimg)
    '                madd.SubmitChanges()

    '                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Information was deleted!.')", True)
    '            End If


    '        End If

    '    End If



    'End Sub
    Protected Sub GrdAscending_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GrdAscending.SelectedIndexChanged
        Dim getID = GrdAscending.SelectedRow.Cells(0).Text

        Session("MemberID") = getID

        Response.Redirect("memberselect.aspx")

    End Sub


    Protected Sub GrdTitle_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GrdTitle.SelectedIndexChanged
        Dim getID = GrdTitle.SelectedRow.Cells(0).Text

        Session("MemberID") = getID

        Response.Redirect("memberselect.aspx")

    End Sub

    Protected Sub GrdvPhn_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GrdvPhn.SelectedIndexChanged
        Dim getID = GrdvPhn.SelectedRow.Cells(0).Text

        Session("MemberID") = getID

        Response.Redirect("memberselect.aspx")

    End Sub

    Protected Sub GrdvFirstname_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GrdvFirstname.SelectedIndexChanged
        Dim getID = GrdvFirstname.SelectedRow.Cells(0).Text

        Session("MemberID") = getID

        Response.Redirect("memberselect.aspx")

    End Sub

    Protected Sub GrdvSurname_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GrdvSurname.SelectedIndexChanged
        Dim getID = GrdvSurname.SelectedRow.Cells(0).Text

        Session("MemberID") = getID

        Response.Redirect("memberselect.aspx")

    End Sub

    Protected Sub txtcriteria_TextChanged(sender As Object, e As EventArgs) Handles txtcriteria.TextChanged

    End Sub

    Protected Sub BtnEdit_Click(sender As Object, e As EventArgs) Handles BtnEdit.Click
        If txtFamilyname.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Family name cannot be empty!!!')", True)
            Exit Sub
        End If

        If TXTFamilyFirst.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter name!!!')", True)
            Exit Sub
        End If

        If dropEditFamily.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select a family name!!!')", True)
            Exit Sub
        End If

        If madd.FamilyTables.Where(Function(f) f.FamilyName = txtFamilyname.Text AndAlso f.FamilyFirstName = TXTFamilyFirst.Text _
                               AndAlso f.FamilyMiddleName = familyMiddle.Text).Any Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Family name already exit!!!')", True)
            Exit Sub

        Else
            'edit family name
            Dim editFamilyName = madd.FamilyTables.Where(Function(r) r.Familyid = dropEditFamily.SelectedValue).SingleOrDefault()

            editFamilyName.FamilyName = txtFamilyname.Text.ToUpper
            editFamilyName.FamilyFirstName = TXTFamilyFirst.Text.ToUpper
            editFamilyName.FamilyMiddleName = familyMiddle.Text.ToUpper

            madd.SubmitChanges()

            Dim checkFamilyOnMembership = madd.MembershipTables.Where(Function(r) r.FamilyID = dropEditFamily.SelectedValue).Any

            If checkFamilyOnMembership Then ' membership exit
                Dim editMemberFamilyName = From c In madd.MembershipTables
                                           Where (c.FamilyID = dropEditFamily.SelectedValue)
                                           Select c

                For Each mem In editMemberFamilyName
                    mem.LastName = txtFamilyname.Text.ToUpper
                Next

                madd.SubmitChanges()

            End If


            txtFamilyname.Text = ""
            TXTFamilyFirst.Text = ""
            familyMiddle.Text = ""

            dropEditFamily.Items.Remove("Select")
            dropEditFamily.DataBind()
            dropEditFamily.Items.Insert(0, New ListItem("Select"))
            dropEditFamily.SelectedIndex = 0


        End If

        btnAddFamily.Enabled = True
    End Sub

    Protected Sub CBMembersGroups_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CBMembersGroups.SelectedIndexChanged
        txtcriteria.Text = ""
    End Sub
 
    Protected Sub CBState_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CBState.SelectedIndexChanged

    End Sub
    Protected Sub ImageButton20_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton20.Click
        'select family name for edit
        dropEditFamily.Visible = True

        dropEditFamily.Items.Remove("Select")
        dropEditFamily.DataBind()
        dropEditFamily.Items.Insert(0, New ListItem("Select"))
        dropEditFamily.SelectedIndex = 0

        txtFamilyname.Text = ""
        TXTFamilyFirst.Text = ""
        familyMiddle.Text = ""
        btnAddFamily.Enabled = False
    End Sub
    Protected Sub dropEditFamily_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dropEditFamily.SelectedIndexChanged
        txtFamilyname.Text = madd.FamilyTables.Where(Function(w) w.Familyid = dropEditFamily.SelectedValue).SingleOrDefault.FamilyName
        TXTFamilyFirst.Text = madd.FamilyTables.Where(Function(w) w.Familyid = dropEditFamily.SelectedValue).SingleOrDefault.FamilyFirstName
        familyMiddle.Text = madd.FamilyTables.Where(Function(w) w.Familyid = dropEditFamily.SelectedValue).SingleOrDefault.FamilyMiddleName

        dropEditFamily.Visible = False
    End Sub

    Protected Sub DownloadButton_Click(sender As Object, e As EventArgs) Handles DownloadButton.Click
        Excel_Export()
    End Sub
End Class
