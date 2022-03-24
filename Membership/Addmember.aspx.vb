Imports System.IO
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Web.Services
Imports System.Data
Partial Class Addmember
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Dim maxlen As Integer = 51200
    Shared imageName As String = ""
    Shared imagePath As String = ""
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim userName As String = User.Identity.Name
            LocTXT.Text = ""
            Marriage.Visible = False
            MarrigeDatePicker.Visible = False
            If Request.InputStream.Length > 0 Then
                Using reader As New StreamReader(Request.InputStream)
                    Dim hexString As String = Server.UrlEncode(reader.ReadToEnd())
                    imageName = DateTime.Now.ToString("dd-MM-yy hh-mm-ss")
                    imagePath = String.Format("/Captures/{0}.jpg", imageName)
                    File.WriteAllBytes(Server.MapPath(imagePath), ConvertHexToBytes(hexString))
                    'MemberAddImage.ImageUrl = Server.MapPath(imagePath)
                    'txtPictureName.Text = Path.GetFileName(imagePath)
                    Session("CapturedImage") = ResolveUrl(imagePath)

                End Using


            End If
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

            txtLocation.Text = madd.Locations.Where(Function(s) s.Name = lbLocation.Text).SingleOrDefault.Locationid

            '  Dim yourKey As String = CType(Session.Item("yourKey"), String)
            Dim famIDS As String = Session("yourKey")

            If famIDS Is Nothing Then
                Response.Redirect("Member.aspx")
                Exit Sub
            Else
                lblFamid.Text = Session("yourKey")
                TXTState.Visible = False
                LaState.Visible = False
                txtlastname.Text = madd.FamilyTables.Where(Function(t) t.Familyid = lblFamid.Text).SingleOrDefault.FamilyName
                txtFirstname.Text = madd.FamilyTables.Where(Function(t) t.Familyid = lblFamid.Text).SingleOrDefault.FamilyFirstName
                ' txtAdress.Text = ""
                drpStateO.DataBind()
                drpStateO.Items.Insert(0, New ListItem("Select"))
                drpStateO.SelectedIndex = 0


                DropServiceunit.DataBind()
                DropServiceunit.Items.Insert(0, New ListItem("Select"))
                DropServiceunit.SelectedIndex = 0


                drpTown.DataBind()
                drpTown.Items.Insert(0, New ListItem("Select"))
                drpTown.SelectedIndex = 0

                dropGender.DataBind()
                dropGender.Items.Insert(0, New ListItem("Select"))
                dropGender.SelectedIndex = 0

                CBLocation.DataBind()
                CBLocation.Items.Insert(0, New ListItem("Select"))
                CBLocation.SelectedIndex = 0

                drpArea.DataBind()
                drpArea.Items.Insert(0, New ListItem("Select"))
                drpArea.SelectedIndex = 0

                DrpTitle.DataBind()
                DrpTitle.Items.Insert(0, New ListItem("Select"))
                DrpTitle.SelectedIndex = 0

                Dropmarital.DataBind()
                Dropmarital.Items.Insert(0, New ListItem("Select"))
                Dropmarital.SelectedIndex = 0

                dropAuthority.DataBind()
                dropAuthority.Items.Insert(0, New ListItem("Select"))
                dropAuthority.SelectedIndex = 0

                cbMemGroup.DataBind()
                cbMemGroup.Items.Insert(0, New ListItem("Select"))
                cbMemGroup.SelectedIndex = 0

                ddlCountry.DataBind()
                ddlCountry.Items.Insert(0, New ListItem("Select"))
                ddlCountry.SelectedIndex = 0
                ' GridView1.Visible = False
                txtst.Text = ""
                txtAreaID.Text = ""


            End If
            txtPictureName.Text = ""

        End If
    End Sub
    Private Shared Function ConvertHexToBytes(hex As String) As Byte()
        Dim bytes As Byte() = New Byte(hex.Length / 2 - 1) {}
        For i As Integer = 0 To hex.Length - 1 Step 2
            bytes(i / 2) = Convert.ToByte(hex.Substring(i, 2), 16)
        Next
        Return bytes
    End Function
    <WebMethod(EnableSession:=True)>
    Public Shared Function GetCapturedImage() As String
        Dim url As String = HttpContext.Current.Session("CapturedImage").ToString()
        HttpContext.Current.Session("CapturedImage") = Nothing
        Return url
    End Function

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        'Dim MaxLeng As Decimal

        Dim a As New churchmanDataContext

        Dim strDate As Date
        strDate = Now


        If txtFirstname.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter your first name!!!')", True)
            Exit Sub
        End If

        If dropGender.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select your gender!!!')", True)
            Exit Sub
        End If

        If ddlCountry.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select your country!!!')", True)
            Exit Sub
        End If

        If drpStateO.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select your state of origin!!!')", True)
            Exit Sub
        End If

        If dropAuthority.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select your place in the family!!!')", True)
            Exit Sub
        End If

        If Dropmarital.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please select your martial status!!!')", True)
            Exit Sub
        End If

        If txtDOB.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter your date of birth in this format: DD/MM/YYYY !!!')", True)
            Exit Sub
        End If
        'If txtPhone1.Text = "" Then
        '    ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter phone number!!!')", True)
        '    Exit Sub
        'End If
        If txtTithe.Text = "" Then
            txtTithe.Text = 0
        End If

        If cbMemGroup.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, select group!!!')", True)
            Exit Sub
        End If

        If FileUpload1.PostedFile.ContentLength >= maxlen Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('File size cannot be greater than 24KB.');", True)
            Exit Sub
        End If

        Dim checkPhoneno = (From f In a.MembershipTables
                            Where f.FirstName = txtFirstname.Text AndAlso f.LastName = txtlastname.Text AndAlso f.DOB = CDate(txtDOB.Text)
                            Select f).Any

        If checkPhoneno = True Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Existing member !!!')", True)
            Exit Sub
        End If


        Dim id = From i In a.MembershipTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            lblid.Text = "MEB" & "" & z
        Else
            lblid.Text = "MEB" & "" & 1

        End If

        Dim MarriageAni As String = ""
        If Dropmarital.SelectedValue = "Married" Then
            MarriageAni = MarrigeDatePicker.SelectedDate
        Else
            MarriageAni = ""
        End If

        Dim savenewmember As New MembershipTable With {
        .FamilyID = lblFamid.Text,
        .Memberid = lblid.Text,
        .FirstName = txtFirstname.Text.ToUpper,
        .LastName = txtlastname.Text.ToUpper,
        .MiddleName = txtMiddle.Text.ToUpper,
        .MartialStatus = Dropmarital.SelectedValue,
        .MarriageAniversity = If(MarriageAni = "", Nothing, MarriageAni),
        .Occupation = txtoccupa.Text.ToUpper,
        .Phone1 = txtPhone1.Text,
        .Phone2 = txtphone2.Text,
        .Email = txtEmail.Text,
        .Gender = dropGender.SelectedValue.ToUpper,
        .Title = If(DrpTitle.SelectedValue = "Select", Nothing, DrpTitle.SelectedValue),
        .Authority = If(dropAuthority.SelectedValue = "Select", Nothing, dropAuthority.SelectedValue),
        .Address = txtAdress.Text.ToUpper,
        .TitheId = txtTithe.Text,
        .StateofOrgin = If(drpStateO.SelectedValue = "Select", Nothing, drpStateO.SelectedValue),
        .Nationality = If(ddlCountry.SelectedValue = "Select", Nothing, ddlCountry.SelectedValue),
        .Language1 = txtlang1.Text.ToUpper,
        .Language2 = txtlang2.Text.ToUpper,
        .Languag3 = txtlang3.Text.ToUpper,
        .MemberssGroup = If(cbMemGroup.SelectedValue = "Select", Nothing, cbMemGroup.SelectedValue),
        .DateBaptism = txtDateBap.Text,
        .Town = If(drpTown.SelectedValue = "Select", Nothing, drpTown.SelectedValue),
        .Area = If(drpArea.SelectedValue = "Select", Nothing, drpArea.SelectedValue),
        .HomeCellAddress = If(CBLocation.SelectedValue = "Select", Nothing, CBLocation.SelectedValue),
        .DateConverted = txtDateCon.Text,
        .DOB = txtDOB.Text,
        .ChurchDetailID = txtchurchID.Text,
        .Updatedby = txtStaffID.Text,
        .Createdby = txtStaffID.Text,
        .Locationid = txtLocation.Text,
        .DateCreated = strDate}

        a.MembershipTables.InsertOnSubmit(savenewmember)
        a.SubmitChanges()


        'save service unit information
        Dim gelAll = From t In madd.PendingSavingUnits
                     Where t.CreatedBy = AdminLabel.Text
                     Select t

        For Each w In gelAll
            Dim saveIntow As New MembersUnit With {
            .Memberid = lblid.Text,
            .ServiceUnitID = w.ServiceID
                }
            madd.MembersUnits.InsertOnSubmit(saveIntow)
            madd.SubmitChanges()

        Next

        Dim deleteUnit = (From s In madd.PendingSavingUnits
                          Where (s.CreatedBy = AdminLabel.Text)
                          Select s)

        For Each q As PendingSavingUnit In deleteUnit
            madd.PendingSavingUnits.DeleteOnSubmit(q)
        Next
        Try
            madd.SubmitChanges()
        Catch ex As Exception
        End Try


        If FileUpload1.FileName <> "" Then
            Upload_Click(sender, e)
        ElseIf FileUpload1.FileName = "" Then
            Upload_Click(sender, e)
        End If



        '.HomeCell = If(drophomecell.SelectedValue = "Select", Nothing, drophomecell.SelectedValue), _
        txtFirstname.Text = ""
        txtFirstname.Text = ""
        txtoccupa.Text = ""
        txtPhone1.Text = ""
        txtlang1.Text = ""
        txtlang2.Text = ""
        txtlang3.Text = ""
        txtPhone1.Text = ""
        txtphone2.Text = ""
        txtEmail.Text = ""
        txtAdress.Text = ""
        txtTithe.Text = ""
        txtMiddle.Text = ""
        drpStateO.DataBind()
        drpStateO.Items.Insert(0, New ListItem("Select"))
        drpStateO.SelectedIndex = 0


        DropServiceunit.DataBind()
        DropServiceunit.Items.Insert(0, New ListItem("Select"))
        DropServiceunit.SelectedIndex = 0

        dropAuthority.DataBind()
        dropAuthority.Items.Insert(0, New ListItem("Select"))
        dropAuthority.SelectedIndex = 0

        drpArea.DataBind()
        drpArea.Items.Insert(0, New ListItem("Select"))
        drpArea.SelectedIndex = 0

        DrpTitle.DataBind()
        DrpTitle.Items.Insert(0, New ListItem("Select"))
        DrpTitle.SelectedIndex = 0

        Dropmarital.DataBind()
        Dropmarital.Items.Insert(0, New ListItem("Select"))
        Dropmarital.SelectedIndex = 0

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Church member has been saved!!!')", True)
        Response.Redirect("Member.aspx")


    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        Response.Redirect("Member.aspx")
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles btnViewRec.Click
        Response.Redirect("Member.aspx")
    End Sub


    Protected Sub txtDOB_TextChanged(sender As Object, e As EventArgs) Handles txtDOB.TextChanged
        Dim DOb As Date
        Dim newdate As Date = Now
        Dim age As Integer = 0
        Dim nowyear As Integer = 0
        Dim dobyear As Integer = 0

        DOb = CDate(txtDOB.Text)

        dobyear = Microsoft.VisualBasic.DateAndTime.Year(DOb)

        nowyear = Microsoft.VisualBasic.DateAndTime.Year(newdate)

        If dobyear > nowyear Then

        ElseIf dobyear <= nowyear Then
            age = nowyear - dobyear
            txtAge.Text = age
        End If

    End Sub


    Protected Sub Upload_Click(sender As Object, e As EventArgs) Handles Upload.Click
        'upload 
        Dim CHECKPassport = madd.MemberImageTables.Where(Function(q) q.MemberID = lblid.Text).Any

        If CHECKPassport Then
            Exit Sub
        End If
        Dim filePath As String = ""

        If FileUpload1.FileName = "" Then
            'taking using live camera
            filePath = Server.MapPath(imagePath)
        ElseIf FileUpload1.FileName <> "" Then
            'uploaded from file directory
            filePath = FileUpload1.PostedFile.FileName
        End If

        If filePath = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, select a passport.')", True)
            Exit Sub
        End If


        Dim filename As String = Path.GetFileName(filePath)
        Dim ext As String = Path.GetExtension(filename)
        Dim contenttype As String = String.Empty

        'Set the contenttype based on File Extension
        Select Case ext
            Case ".JPEG"
                contenttype = "image/JPEG"
                Exit Select
            Case ".jpeg"
                contenttype = "image/jpeg"
                Exit Select
            Case ".jpg"
                contenttype = "image/jpg"
                Exit Select
            Case ".JPG"
                contenttype = "image/JPG"
                Exit Select
            Case ".PNG"
                contenttype = "image/PNG"
                Exit Select
            Case ".png"
                contenttype = "image/png"
                Exit Select

        End Select

        If contenttype <> String.Empty Then
            If FileUpload1.FileName = "" Then
                'upload from web camera
                Dim fs As FileStream = New FileStream(filePath, FileMode.Open, FileAccess.ReadWrite)
                Dim br As BinaryReader = New BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Int32))
                br.Close()
                fs.Close()

                'get applicant id
                Dim MemberID = lblid.Text


                Dim strQuery As String = "insert into MemberImageTable(MemberID, ScanName, ScanType, SourceDocumentScan) " &
                                         " values (@MemberID, @ScanName, @ScanType, @SourceDocumentScan)"

                Dim cmd As New SqlCommand(strQuery)
                cmd.Parameters.Add("@MemberID", SqlDbType.VarChar).Value = MemberID
                cmd.Parameters.Add("@ScanName", SqlDbType.VarChar).Value = filename
                cmd.Parameters.Add("@ScanType", SqlDbType.VarChar).Value = contenttype
                cmd.Parameters.Add("@SourceDocumentScan", SqlDbType.Binary).Value = bytes
                InsertUpdateData(cmd)

                'save into family image table
                Dim FullName As String = txtFirstname.Text.ToUpper & " " & txtMiddle.Text.ToUpper & " " & txtlastname.Text.ToUpper

                Dim FamilyQuery As String = "insert into FamilyImageTable(FamilyID, MemberChildID, FullName, SourceDocumentScan) " &
                                         " values (@FamilyID, @MemberChildID, @FullName, @SourceDocumentScan)"

                Dim cmd1 As New SqlCommand(FamilyQuery)
                cmd1.Parameters.Add("@FamilyID", SqlDbType.VarChar).Value = lblFamid.Text
                cmd1.Parameters.Add("@MemberChildID", SqlDbType.VarChar).Value = MemberID
                cmd1.Parameters.Add("@FullName", SqlDbType.VarChar).Value = FullName
                cmd1.Parameters.Add("@SourceDocumentScan", SqlDbType.Binary).Value = bytes
                InsertUpdateData1(cmd1)

                'get the id of the filename
                Dim st As String = ConfigurationManager.ConnectionStrings("ChurchdbConnectionString").ToString : Dim con As New Data.SqlClient.SqlConnection(st)
                con.Open()
                Dim q As String = "SELECT * FROM MemberImageTable where ScanName=  '" & filename & "'"
                Dim com As New Data.SqlClient.SqlCommand(q, con)
                Dim reader As Data.SqlClient.SqlDataReader
                reader = com.ExecuteReader
                While reader.Read
                    picTextBox.Text = reader.Item(0).ToString
                End While
                con.Close()

                MemberAddImage.ImageUrl = "MemberHandler.ashx?id=" + picTextBox.Text

            ElseIf FileUpload1.FileName <> "" Then
                'upload from directory
                Dim fs As Stream = FileUpload1.PostedFile.InputStream
                Dim br As New BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(fs.Length)


                'get applicant id
                Dim MemberID = lblid.Text


                Dim strQuery As String = "insert into MemberImageTable(MemberID, ScanName, ScanType, SourceDocumentScan) " &
                                         " values (@MemberID, @ScanName, @ScanType, @SourceDocumentScan)"

                Dim cmd As New SqlCommand(strQuery)
                cmd.Parameters.Add("@MemberID", SqlDbType.VarChar).Value = MemberID
                cmd.Parameters.Add("@ScanName", SqlDbType.VarChar).Value = filename
                cmd.Parameters.Add("@ScanType", SqlDbType.VarChar).Value = contenttype
                cmd.Parameters.Add("@SourceDocumentScan", SqlDbType.Binary).Value = bytes
                InsertUpdateData(cmd)

                'save into family image table
                Dim FullName As String = txtFirstname.Text.ToUpper & " " & txtMiddle.Text.ToUpper & " " & txtlastname.Text.ToUpper

                Dim FamilyQuery As String = "insert into FamilyImageTable(FamilyID, MemberChildID, FullName, SourceDocumentScan) " &
                                         " values (@FamilyID, @MemberChildID, @FullName, @SourceDocumentScan)"

                Dim cmd1 As New SqlCommand(FamilyQuery)
                cmd1.Parameters.Add("@FamilyID", SqlDbType.VarChar).Value = lblFamid.Text
                cmd1.Parameters.Add("@MemberChildID", SqlDbType.VarChar).Value = MemberID
                cmd1.Parameters.Add("@FullName", SqlDbType.VarChar).Value = FullName
                cmd1.Parameters.Add("@SourceDocumentScan", SqlDbType.Binary).Value = bytes
                InsertUpdateData1(cmd1)

                'get the id of the filename
                Dim st As String = ConfigurationManager.ConnectionStrings("ChurchdbConnectionString").ToString : Dim con As New Data.SqlClient.SqlConnection(st)
                con.Open()
                Dim q As String = "SELECT * FROM MemberImageTable where ScanName=  '" & filename & "'"
                Dim com As New Data.SqlClient.SqlCommand(q, con)
                Dim reader As Data.SqlClient.SqlDataReader
                reader = com.ExecuteReader
                While reader.Read
                    picTextBox.Text = reader.Item(0).ToString
                End While
                con.Close()

                MemberAddImage.ImageUrl = "MemberHandler.ashx?id=" + picTextBox.Text

            End If
        Else
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('File format not recognised.Upload Image formats');", True)

        End If
    End Sub
    Public Function InsertUpdateData1(ByVal cmd1 As SqlCommand) As Boolean
        Dim st As String = ConfigurationManager.ConnectionStrings("ChurchdbConnectionString").ToString
        Dim con As New Data.SqlClient.SqlConnection(st)
        cmd1.CommandType = CommandType.Text
        cmd1.Connection = con
        Try
            con.Open()
            cmd1.ExecuteNonQuery()

            Return True
        Catch ex As Exception

            Response.Write(ex.Message)

            Return False

        Finally

            con.Close()

            con.Dispose()

        End Try

    End Function
    Public Function InsertUpdateData(ByVal cmd As SqlCommand) As Boolean
        Dim st As String = ConfigurationManager.ConnectionStrings("ChurchdbConnectionString").ToString
        Dim con As New Data.SqlClient.SqlConnection(st)
        cmd.CommandType = CommandType.Text
        cmd.Connection = con
        Try
            con.Open()
            cmd.ExecuteNonQuery()

            Return True
        Catch ex As Exception

            Response.Write(ex.Message)

            Return False

        Finally

            con.Close()

            con.Dispose()

        End Try

    End Function
    Protected Sub DropServiceunit_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropServiceunit.SelectedIndexChanged
        Dim savenewmember As New PendingSavingUnit With { _
        .ServiceID = If(DropServiceunit.SelectedValue = "Select", Nothing, DropServiceunit.SelectedValue), _
        .CreatedBy = AdminLabel.Text}
        madd.PendingSavingUnits.InsertOnSubmit(savenewmember)
        madd.SubmitChanges()


        GridView1.DataBind()
        GridView1.Visible = True

        DropServiceunit.DataBind()
        DropServiceunit.Items.Insert(0, New ListItem("Select"))
        DropServiceunit.SelectedIndex = 0
    End Sub

    Protected Sub drpTown_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpTown.SelectedIndexChanged
        LocTXT.Text = drpTown.SelectedValue

        drpArea.Items.Remove("Select")
        drpArea.DataBind()
        drpArea.Items.Insert(0, New ListItem("Select"))
        drpArea.SelectedIndex = 0

        txtAreaID.Text = ""
        CBLocation.DataBind()
        CBLocation.Items.Insert(0, New ListItem("Select"))
        CBLocation.SelectedIndex = 0

    End Sub

    Protected Sub drpArea_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpArea.SelectedIndexChanged
        txtAreaID.Text = drpArea.SelectedValue

        CBLocation.Items.Remove("Select")
        CBLocation.DataBind()
        CBLocation.Items.Insert(0, New ListItem("Select"))
        CBLocation.SelectedIndex = 0
    End Sub
    Protected Sub GridView1_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "DeleteServiceID" Then
            If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
                Dim SNID As Integer = Convert.ToInt32(e.CommandArgument)

                Dim checkMini = (From s In madd.PendingSavingUnits
                                 Where (s.ID = SNID)
                                 Select s).Any

                If checkMini Then
                    Dim deleteInfo = (From s In madd.PendingSavingUnits
                                      Where (s.ID = SNID)
                                      Select s).SingleOrDefault

                    madd.PendingSavingUnits.DeleteOnSubmit(deleteInfo)
                    madd.SubmitChanges()
                End If

                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Deleted.');", True)
                GridView1.DataBind()
                ' End If

            End If
        End If
    End Sub
    Protected Sub drpStateO_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpStateO.SelectedIndexChanged
        Dim othersName As String = String.Empty

        othersName = madd.StateTables.Where(Function(q) q.Stateid = drpStateO.SelectedValue).SingleOrDefault.State

        If othersName = "Others" Then
            TXTState.Visible = True
            LaState.Visible = True
        Else
            TXTState.Visible = False
            LaState.Visible = False
        End If

    End Sub
    Public Sub AppendToSateTable()
        If TXTState.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, enter state.');", True)
            TXTState.Visible = False
            LaState.Visible = False

            drpStateO.DataBind()
            drpStateO.Items.Insert(0, New ListItem("Select"))
            drpStateO.SelectedIndex = 0
            Exit Sub
        End If

        Dim checkstate = madd.StateTables.Where(Function(f) f.State = TXTState.Text).Any

        If checkstate = True Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('State Exist.');", True)
            TXTState.Visible = False
            LaState.Visible = False

            drpStateO.DataBind()
            drpStateO.Items.Insert(0, New ListItem("Select"))
            drpStateO.SelectedIndex = 0

            Exit Sub
        End If

        Dim staeID As String = ""
        Dim id = From i In madd.StateTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            staeID = "sta" & "" & z
        Else
            staeID = "sta" & "" & 1

        End If

        Dim saveState As New StateTable With {
            .Stateid = staeID,
            .State = TXTState.Text
            }

        madd.StateTables.InsertOnSubmit(saveState)
        madd.SubmitChanges()

        drpStateO.DataBind()
        drpStateO.SelectedValue = staeID
        TXTState.Text = ""

        TXTState.Visible = False
        LaState.Visible = False
    End Sub
    Protected Sub TXTState_TextChanged(sender As Object, e As EventArgs) Handles TXTState.TextChanged
        Call AppendToSateTable()
    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

    End Sub
    Protected Sub Dropmarital_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Dropmarital.SelectedIndexChanged
        If Dropmarital.SelectedValue = "Married" Then
            Marriage.Visible = True
            MarrigeDatePicker.Visible = True
            MarrigeDatePicker.Clear()
        Else
            Marriage.Visible = False
            MarrigeDatePicker.Visible = False
        End If
    End Sub
End Class
