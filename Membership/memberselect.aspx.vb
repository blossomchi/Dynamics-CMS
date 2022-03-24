Imports System.IO
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Web.Services
Imports System.Data
Partial Class memberselect
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Dim maxlen As Integer = 51200
    Shared imageName As String = ""
    Shared imagePath As String = ""
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
             Dim userName As String = User.Identity.Name

            Dim getMemberID = madd.AuthenticalTables.Where(Function(f1) f1.Username = userName).SingleOrDefault.Memberid

            Dim name = madd.MembershipTables.Where(Function(d1) d1.Memberid = getMemberID).SingleOrDefault.FirstName

            Dim getChurch = (From y In madd.MembershipTables Join
                                h1 In madd.ChurchDetailTables On y.ChurchDetailID Equals h1.ChurchDetailID
                                Where y.Memberid = getMemberID
                                Select h1).SingleOrDefault.ChurchName


            Dim Location = (From d1 In madd.ChurchDetailTables
                          Where d1.ChurchName = getChurch
                          Select d1).SingleOrDefault.Location.Name

            Dim state = (From d1 In madd.ChurchDetailTables
                          Where d1.ChurchName = getChurch
                          Select d1).SingleOrDefault.StateTable.State



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

            txtLocation.Text = madd.Locations.Where(Function(s) s.Name = lbLocation.Text).SingleOrDefault.Locationid

            txtMemID.Text = Session("MemberID")

            If txtMemID.Text = "" Then
                Response.Redirect("~/Membership/Member.aspx")
                Exit Sub
            End If

            Dim getAllInfo = madd.MembershipTables.Where(Function(l) l.SN = txtMemID.Text).SingleOrDefault

            lblFamid.Text = getAllInfo.FamilyID
            lblid.Text = getAllInfo.Memberid
            txtFirstname.Text = getAllInfo.FirstName
            txtlastname.Text = getAllInfo.LastName
            txtMiddle.Text = getAllInfo.MiddleName
            Dim h As String = String.Empty
            h = getAllInfo.Gender
            If h = String.Empty Then
                dropGender.DataBind()
                dropGender.Items.Insert(0, New ListItem("Select"))
                dropGender.SelectedIndex = 0
            Else
                dropGender.DataBind()
                dropGender.SelectedValue = h
            End If
            txtDOB.Text = getAllInfo.DOB
            Dim a As String = String.Empty
            a = getAllInfo.Nationality
            If a = String.Empty Then
                ddlCountry.DataBind()
                ddlCountry.Items.Insert(0, New ListItem("Select"))
                ddlCountry.SelectedIndex = 0
            Else
                ddlCountry.DataBind()
                ddlCountry.SelectedValue = a
            End If
            Dim b As String = String.Empty
            b = getAllInfo.StateofOrgin
            If b = String.Empty Then
                drpStateO.DataBind()
                drpStateO.Items.Insert(0, New ListItem("Select"))
                drpStateO.SelectedIndex = 0
            Else
                drpStateO.DataBind()
                drpStateO.SelectedValue = b
            End If
            Dim c As String = String.Empty
            c = getAllInfo.Authority
            If c = String.Empty Then
                dropAuthority.DataBind()
                dropAuthority.Items.Insert(0, New ListItem("Select"))
                dropAuthority.SelectedIndex = 0
            Else
                dropAuthority.DataBind()
                dropAuthority.SelectedValue = c
            End If
            Dim d As String = String.Empty
            d = getAllInfo.MartialStatus

            If d = String.Empty Then
                Dropmarital.DataBind()
                Dropmarital.Items.Insert(0, New ListItem("Select"))
                Dropmarital.SelectedIndex = 0
            Else
                Dropmarital.DataBind()
                Dropmarital.SelectedValue = d
            End If

            If Dropmarital.SelectedValue = "Married" Then
                Dim marriageAni As String = ""
                marriageAni = getAllInfo.MarriageAniversity

                If marriageAni = "" Then
                    Marriage.Visible = True
                    MarrigeDatePicker.Visible = True
                    MarrigeDatePicker.Clear()
                ElseIf marriageAni <> "" Then
                    Marriage.Visible = True
                    MarrigeDatePicker.Visible = True
                    MarrigeDatePicker.SelectedDate = getAllInfo.MarriageAniversity
                End If
            Else
                Marriage.Visible = False
                MarrigeDatePicker.Visible = False
            End If

            Dim g As String = String.Empty
            g = getAllInfo.Title
            If g = String.Empty Then
                DrpTitle.DataBind()
                DrpTitle.Items.Insert(0, New ListItem("Select"))
                DrpTitle.SelectedIndex = 0
            Else
                DrpTitle.DataBind()
                DrpTitle.SelectedValue = g
            End If

            DropServiceunit.DataBind()
            DropServiceunit.Items.Insert(0, New ListItem("Select"))
            DropServiceunit.SelectedIndex = 0

            Dim checkUnit = madd.MembersUnits.Where(Function(Q) Q.Memberid = lblid.Text).Any
            If checkUnit Then
                GridView1.Visible = False
                GridView2.Visible = True
            Else
                GridView1.Visible = True
                GridView2.Visible = False
            End If

            LocTXT.Text = getAllInfo.Town

            If LocTXT.Text = String.Empty Then
                drpTown.DataBind()
                drpTown.Items.Insert(0, New ListItem("Select"))
                drpTown.SelectedIndex = 0
            Else
                drpTown.DataBind()
                drpTown.SelectedValue = LocTXT.Text
            End If


            txtAreaID.Text = getAllInfo.Area
            If txtAreaID.Text = String.Empty Then
                drpArea.DataBind()
                drpArea.Items.Insert(0, New ListItem("Select"))
                drpArea.SelectedIndex = 0
            Else
                drpArea.DataBind()
                drpArea.SelectedValue = txtAreaID.Text
            End If

            Dim LO As String = ""
            LO = getAllInfo.HomeCellAddress
            If LO = String.Empty Then
                CBLocation.DataBind()
                CBLocation.Items.Insert(0, New ListItem("Select"))
                CBLocation.SelectedIndex = 0
            Else
                CBLocation.DataBind()
                CBLocation.SelectedValue = LO
            End If

            Dim hw = getAllInfo.MemberssGroup

            If hw Is Nothing Then
                cbMemGroup.DataBind()
                cbMemGroup.Items.Insert(0, New ListItem("Select"))
                cbMemGroup.SelectedIndex = 0
            Else
                cbMemGroup.DataBind()
                cbMemGroup.SelectedValue = hw
            End If

            txtPhone1.Text = getAllInfo.Phone1
            txtphone2.Text = getAllInfo.Phone2
            txtTithe.Text = getAllInfo.TitheId
            txtoccupa.Text = getAllInfo.Occupation
            txtEmail.Text = getAllInfo.Email
            txtAdress.Text = getAllInfo.Address
            txtlang1.Text = getAllInfo.Language1
            txtlang2.Text = getAllInfo.Language2
            txtlang3.Text = getAllInfo.Languag3
            txtDateCon.Text = getAllInfo.DateConverted
            txtDateBap.Text = getAllInfo.DateBaptism
            txtDOB.Text = getAllInfo.DOB

            Dim checkImage = madd.MemberImageTables.Where(Function(k) k.MemberID = lblid.Text).Any

            If checkImage Then
                Dim ImageID As String = ""
                Dim getAllInfoImage = madd.MemberImageTables.Where(Function(l) l.MemberID = lblid.Text).SingleOrDefault
                ImageID = getAllInfoImage.ID

                Memberimage.ImageUrl = "MemberHandler.ashx?id=" + ImageID
                btnchange.Text = "Change Picture"
            Else
                Memberimage.ImageUrl = "~/Membership/Images/default-avatar.png"
                btnchange.Text = "Upload Picture"
            End If
            NewImageCapture()
        End If
    End Sub
    Public Sub NewImageCapture()
        If Request.InputStream.Length > 0 Then
            Using reader As New StreamReader(Request.InputStream)
                Dim hexString As String = Server.UrlEncode(reader.ReadToEnd())
                imageName = DateTime.Now.ToString("dd-MM-yy hh-mm-ss")

                imagePath = String.Format("/Captures/{0}.jpg", imageName)
                File.WriteAllBytes(Server.MapPath(imagePath), ConvertHexToBytes(hexString))
                Session("CapturedSelectImage") = ResolveUrl(imagePath)

            End Using


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
    Public Shared Function GetCapturedSelectImage() As String
        Dim url As String = HttpContext.Current.Session("CapturedSelectImage").ToString()
        HttpContext.Current.Session("CapturedSelectImage") = Nothing
        Return url
    End Function

    Protected Sub btnViewRec_Click(sender As Object, e As EventArgs) Handles btnViewRec.Click
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
        Dim Maxlenght As Decimal = 51200 ' size of passort

        Dim checkImage = madd.MemberImageTables.Where(Function(k) k.MemberID = lblid.Text).Any
        If checkImage Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Member passport already exist!!!')", True)
            Exit Sub
        ElseIf Not checkImage Then

            If FileUpload1.PostedFile.ContentLength >= Maxlenght Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('File size cannot be greater than 60KB.');", True)
                Exit Sub
            End If

            Dim filePath As String = ""

            If FileUpload1.FileName = "" Then
                'taking using live camera
                filePath = Server.MapPath(imagePath)
                ' filePath = Server.MapPath(imagePath)
            ElseIf FileUpload1.FileName <> "" Then
                'uploaded from file directory
                filePath = FileUpload1.PostedFile.FileName
            End If

            'upload and update picture
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

                    Dim fs As FileStream = New FileStream(filePath, FileMode.Open, FileAccess.ReadWrite)
                    Dim br As BinaryReader = New BinaryReader(fs)
                    Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Int32))
                    br.Close()
                    fs.Close()

                    'get member id
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
                    'Memberimage.ImageUrl = Server.MapPath(imagePath)
                    Memberimage.ImageUrl = "MemberHandler.ashx?id=" + picTextBox.Text


                ElseIf FileUpload1.FileName <> "" Then
                    Dim fs As Stream = FileUpload1.PostedFile.InputStream
                    Dim br As New BinaryReader(fs)
                    Dim bytes As Byte() = br.ReadBytes(fs.Length)

                    'get member id
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
                    ' Memberimage.ImageUrl = Server.MapPath(imagePath)
                    Memberimage.ImageUrl = "MemberHandler.ashx?id=" + picTextBox.Text

                End If



            Else
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('File format not recognised.Upload Image formats');", True)

            End If
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
        Dim st As String = ConfigurationManager.ConnectionStrings("ChurchdbConnectionString").ToString : Dim con As New Data.SqlClient.SqlConnection(st)
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

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'update syntax
        txtLocation.Text = madd.Locations.Where(Function(s) s.Name = lbLocation.Text).SingleOrDefault.Locationid

        Dim updateMember = madd.MembershipTables.Where(Function(h) h.SN = txtMemID.Text).SingleOrDefault

        Dim MarriageAni As String = ""

        If Dropmarital.SelectedValue = "Married" Then
            MarriageAni = MarrigeDatePicker.SelectedDate
        Else
            MarriageAni = ""
        End If

        updateMember.FirstName = txtFirstname.Text.ToUpper
        updateMember.MiddleName = txtMiddle.Text.ToUpper
        updateMember.Address = txtAdress.Text.ToUpper
        updateMember.Area = (If(drpArea.SelectedValue = "Select", Nothing, drpArea.SelectedValue))
        updateMember.HomeCellAddress = (If(CBLocation.SelectedValue = "Select", Nothing, CBLocation.SelectedValue))
        updateMember.Authority = dropAuthority.SelectedValue
        updateMember.DateBaptism = txtDateBap.Text
        updateMember.DateConverted = txtDateCon.Text
        updateMember.Phone1 = txtPhone1.Text
        updateMember.DOB = txtDOB.Text
        updateMember.Email = txtEmail.Text
        updateMember.Gender = dropGender.SelectedValue
        updateMember.Language1 = txtlang1.Text.ToUpper
        updateMember.Language2 = txtlang2.Text.ToUpper
        updateMember.Languag3 = txtlang3.Text.ToUpper
        updateMember.TitheId = txtTithe.Text
        updateMember.StateofOrgin = drpStateO.SelectedValue
        updateMember.Title = DrpTitle.SelectedValue
        updateMember.Town = drpTown.SelectedValue
        updateMember.MartialStatus = Dropmarital.SelectedValue
        updateMember.MarriageAniversity = If(MarriageAni = "", Nothing, MarriageAni)
        updateMember.Nationality = ddlCountry.SelectedValue
        updateMember.MemberssGroup = (If(cbMemGroup.SelectedValue = "Select", Nothing, cbMemGroup.SelectedValue))
        updateMember.Locationid = txtLocation.Text
        madd.SubmitChanges()


        'save service unit information
        Dim gelAll = From t In madd.PendingSavingUnits
                     Where t.CreatedBy = AdminLabel.Text
                     Select t

        For Each w In gelAll
            Dim saveIntow As New MembersUnit With { _
            .Memberid = lblid.Text, _
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

        GridView1.DataBind()
        GridView1.Visible = False
        GridView2.DataBind()
        GridView2.Visible = True
        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Has been Edited!!!')", True)


        ' updateMember.Serviceunit = (If(DropServiceunit.SelectedValue = "Select", Nothing, DropServiceunit.SelectedValue))
    End Sub

    Protected Sub btnchange_Click(sender As Object, e As EventArgs) Handles btnchange.Click
        If btnchange.Text = "Upload Picture" Then

            If FileUpload1.PostedFile.ContentLength >= maxlen Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('File size cannot be greater than 24KB.');", True)
                Exit Sub
            End If

            If FileUpload1.FileName <> "" Then
                Upload_Click(sender, e)
            ElseIf FileUpload1.FileName = "" Then
                Upload_Click(sender, e)
            End If
        ElseIf btnchange.Text = "Change Picture" Then

            If FileUpload1.PostedFile.ContentLength >= maxlen Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('File size cannot be greater than 24KB.');", True)
                Exit Sub
            End If

            Dim checkImage = madd.MemberImageTables.Where(Function(k) k.MemberID = lblid.Text).Any

            If checkImage Then
                'delete image
                Dim DeleteImage = From c In madd.MemberImageTables
                                  Where c.MemberID = lblid.Text
                                  Select c

                For Each q As MemberImageTable In DeleteImage
                    madd.MemberImageTables.DeleteOnSubmit(q)
                Next
                Try
                    madd.SubmitChanges()
                Catch ex As Exception
                End Try

                Dim DeleteImage1 = From c In madd.FamilyImageTables
                                   Where c.MemberChildID = lblid.Text
                                   Select c

                For Each q As FamilyImageTable In DeleteImage1
                    madd.FamilyImageTables.DeleteOnSubmit(q)
                Next
                Try
                    madd.SubmitChanges()
                Catch ex As Exception
                End Try

                ' and upload
                If FileUpload1.FileName <> "" Then
                    Upload_Click(sender, e)
                ElseIf FileUpload1.FileName = "" Then
                    Upload_Click(sender, e)
                End If
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Done!!!')", True)

            Else
                If FileUpload1.FileName <> "" Then
                    Upload_Click(sender, e)
                ElseIf FileUpload1.FileName = "" Then
                    Upload_Click(sender, e)
                End If
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Image was uploaded!!!')", True)
            End If
        End If
    End Sub

    Protected Sub DropServiceunit_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropServiceunit.SelectedIndexChanged
        Dim savenewmember As New PendingSavingUnit With { _
        .ServiceID = If(DropServiceunit.SelectedValue = "Select", Nothing, DropServiceunit.SelectedValue), _
        .CreatedBy = AdminLabel.Text}
        madd.PendingSavingUnits.InsertOnSubmit(savenewmember)
        madd.SubmitChanges()


        GridView1.DataBind()
        GridView1.Visible = True
        GridView2.Visible = False
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
    Protected Sub GridView2_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GridView2.RowCommand
        If e.CommandName = "DeleteServiceID" Then
            If e.CommandArgument <> Nothing And IsNumeric(e.CommandArgument) Then
                Dim SNID As Integer = Convert.ToInt32(e.CommandArgument)

                Dim checkMini = (From s In madd.MembersUnits
                                 Where (s.ID = SNID)
                                 Select s).Any

                If checkMini Then
                    Dim deleteInfo = (From s In madd.MembersUnits
                                      Where (s.ID = SNID)
                                      Select s).SingleOrDefault

                    madd.MembersUnits.DeleteOnSubmit(deleteInfo)
                    madd.SubmitChanges()
                End If

                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Deleted.');", True)
                GridView2.DataBind()
                ' End If

            End If
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
