Imports System.IO
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Web.Services
Imports System.Data
Partial Class Children
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Dim maxlen As Integer = 51200
    Shared imageName As String = ""
    Shared imagePath As String = ""
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim userName As String = User.Identity.Name

            If Request.InputStream.Length > 0 Then
                Using reader As New StreamReader(Request.InputStream)
                    Dim hexString As String = Server.UrlEncode(reader.ReadToEnd())
                    imageName = DateTime.Now.ToString("dd-MM-yy hh-mm-ss")
                    imagePath = String.Format("/Captures/{0}.jpg", imageName)
                    File.WriteAllBytes(Server.MapPath(imagePath), ConvertHexToBytes(hexString))
                    MemberAddImage.ImageUrl = Server.MapPath(imagePath)
                    '  txtPictureName.Text = Path.GetFileName(imagePath)
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

            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID


            drpFamily.DataBind()
            drpFamily.Items.Insert(0, New ListItem("Select"))
            drpFamily.SelectedIndex = 0

            drpGender.DataBind()
            drpGender.Items.Insert(0, New ListItem("Select"))
            drpGender.SelectedIndex = 0

            DrpFunctional.DataBind()
            DrpFunctional.Items.Insert(0, New ListItem("Select"))
            DrpFunctional.SelectedIndex = 0

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
    Protected Sub drpFamily_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpFamily.SelectedIndexChanged
        If drpFamily.SelectedValue = "Select" Then
            'do nothing
            txtFirstname.Text = ""
            txtLastname.Text = ""
            txtPhone.Text = ""
        Else
            Dim FirstName As String = ""
            Dim middleName As String = ""
            Dim getLastName = (From s In madd.FamilyTables
                                   Where s.Familyid = drpFamily.SelectedValue
                                   Select s).SingleOrDefault.FamilyName


            txtLastname.Text = getLastName

            FirstName = (From s In madd.FamilyTables
                         Where s.Familyid = drpFamily.SelectedValue
                         Select s).SingleOrDefault.FamilyFirstName

            middleName = (From s In madd.FamilyTables
                          Where s.Familyid = drpFamily.SelectedValue
                          Select s).SingleOrDefault.FamilyMiddleName

            txtParents.Text = txtLastname.Text & " " & FirstName & " " & middleName

            Dim checkExisting = madd.MembershipTables.Where(Function(s) s.FirstName = FirstName AndAlso s.LastName = getLastName AndAlso s.FamilyID = drpFamily.SelectedValue).Any

            If checkExisting Then
                txtParentsNo.Text = madd.MembershipTables.Where(Function(s) s.FirstName = FirstName AndAlso s.LastName = getLastName AndAlso s.FamilyID = drpFamily.SelectedValue).SingleOrDefault.Phone1
                txtAddress.Text = madd.MembershipTables.Where(Function(s) s.FirstName = FirstName AndAlso s.LastName = getLastName AndAlso s.FamilyID = drpFamily.SelectedValue).SingleOrDefault.Address
            Else
                txtParentsNo.Text = ""
                txtAddress.Text = ""
            End If
        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim a As New churchmanDataContext

        Dim strDate As Date
        strDate = Now


        Dim id = From i In a.ChildrenTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            Lblid.Text = "Chld" & "" & z
        Else
            Lblid.Text = "Chld" & "" & 1

        End If


        Dim savechildren As New ChildrenTable With {
            .Childrenid = Lblid.Text,
          .Familyname = drpFamily.SelectedValue,
          .Firstname = txtFirstname.Text.ToUpper,
          .Lastname = txtLastname.Text.ToUpper,
          .Gender = drpGender.SelectedValue,
          .DOB = txtDob.Text,
          .Address = txtAddress.Text.ToUpper,
          .Phone = txtPhone.Text,
          .FunctiongroupID = DrpFunctional.SelectedValue,
          .ParentNo = txtParentsNo.Text,
          .Parents = txtParents.Text,
          .Datecreated = strDate,
          .Updatedby = txtMembername.Text,
          .Churchid = txtchurchID.Text}


        a.ChildrenTables.InsertOnSubmit(savechildren)
        a.SubmitChanges()

        If FileUpload1.FileName <> "" Then
            Upload_Click(sender, e)
        ElseIf FileUpload1.FileName = "" Then
            Upload_Click(sender, e)
        End If

        ChildDatePicker.Clear()
        txtFirstname.Text = ""
        txtLastname.Text = ""
        txtDob.Text = ""
        txtAddress.Text = ""
        txtPhone.Text = ""
        txtParentsNo.Text = ""
        txtParents.Text = ""
        txtMembername.Text = ""
        txtAge.Text = ""

        drpFamily.DataBind()
        drpFamily.Items.Insert(0, New ListItem("Select"))
        drpFamily.SelectedIndex = 0

        drpGender.DataBind()
        drpGender.Items.Insert(0, New ListItem("Select"))
        drpGender.SelectedIndex = 0

        DrpFunctional.DataBind()
        DrpFunctional.Items.Insert(0, New ListItem("Select"))
        DrpFunctional.SelectedIndex = 0

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('A Child Added Successfully!!!')", True)

        Response.Redirect("ChildrenView.aspx")


    End Sub
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
    Protected Sub Upload_Click(sender As Object, e As EventArgs) Handles Upload.Click
        'upload 
        Dim CHECKPassport = madd.ChildrenImageTables.Where(Function(q) q.Childrenid = Lblid.Text).Any

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
                Dim fs As FileStream = New FileStream(filePath, FileMode.Open, FileAccess.ReadWrite)
                Dim br As BinaryReader = New BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(CType(fs.Length, Int32))
                br.Close()
                fs.Close()

                'get applicant id
                Dim MemberID = Lblid.Text


                Dim strQuery As String = "insert into ChildrenImageTable(Childrenid, ScanName, ScanType, SourceDocumentScan) " &
                                         " values (@Childrenid, @ScanName, @ScanType, @SourceDocumentScan)"

                Dim cmd As New SqlCommand(strQuery)
                cmd.Parameters.Add("@Childrenid", SqlDbType.VarChar).Value = MemberID
                cmd.Parameters.Add("@ScanName", SqlDbType.VarChar).Value = filename
                cmd.Parameters.Add("@ScanType", SqlDbType.VarChar).Value = contenttype
                cmd.Parameters.Add("@SourceDocumentScan", SqlDbType.Binary).Value = bytes
                InsertUpdateData(cmd)

                'save into family image table
                Dim FullName As String = txtFirstname.Text.ToUpper & " " & txtLastname.Text.ToUpper

                Dim FamilyQuery As String = "insert into FamilyImageTable(FamilyID, MemberChildID, FullName, SourceDocumentScan) " &
                                         " values (@FamilyID, @MemberChildID, @FullName, @SourceDocumentScan)"

                Dim cmd1 As New SqlCommand(FamilyQuery)
                cmd1.Parameters.Add("@FamilyID", SqlDbType.VarChar).Value = drpFamily.SelectedValue
                cmd1.Parameters.Add("@MemberChildID", SqlDbType.VarChar).Value = MemberID
                cmd1.Parameters.Add("@FullName", SqlDbType.VarChar).Value = FullName
                cmd1.Parameters.Add("@SourceDocumentScan", SqlDbType.Binary).Value = bytes
                InsertUpdateData1(cmd1)

                'get the id of the filename
                Dim st As String = ConfigurationManager.ConnectionStrings("ChurchdbConnectionString").ToString : Dim con As New Data.SqlClient.SqlConnection(st)
                con.Open()
                Dim q As String = "SELECT * FROM ChildrenImageTable where ScanName=  '" & filename & "'"
                Dim com As New Data.SqlClient.SqlCommand(q, con)
                Dim reader As Data.SqlClient.SqlDataReader
                reader = com.ExecuteReader
                While reader.Read
                    picTextBox.Text = reader.Item(0).ToString
                End While
                con.Close()

                MemberAddImage.ImageUrl = "ChildrenHandler.ashx?id=" + picTextBox.Text

            ElseIf FileUpload1.FileName <> "" Then
                Dim fs As Stream = FileUpload1.PostedFile.InputStream
                Dim br As New BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(fs.Length)


                'get applicant id
                Dim MemberID = Lblid.Text


                Dim strQuery As String = "insert into ChildrenImageTable(Childrenid, ScanName, ScanType, SourceDocumentScan) " &
                                         " values (@Childrenid, @ScanName, @ScanType, @SourceDocumentScan)"

                Dim cmd As New SqlCommand(strQuery)
                cmd.Parameters.Add("@Childrenid", SqlDbType.VarChar).Value = MemberID
                cmd.Parameters.Add("@ScanName", SqlDbType.VarChar).Value = filename
                cmd.Parameters.Add("@ScanType", SqlDbType.VarChar).Value = contenttype
                cmd.Parameters.Add("@SourceDocumentScan", SqlDbType.Binary).Value = bytes
                InsertUpdateData(cmd)

                'save into family image table
                Dim FullName As String = txtFirstname.Text.ToUpper & " " & txtLastname.Text.ToUpper

                Dim FamilyQuery As String = "insert into FamilyImageTable(FamilyID, MemberChildID, FullName, SourceDocumentScan) " &
                                         " values (@FamilyID, @MemberChildID, @FullName, @SourceDocumentScan)"

                Dim cmd1 As New SqlCommand(FamilyQuery)
                cmd1.Parameters.Add("@FamilyID", SqlDbType.VarChar).Value = drpFamily.SelectedValue
                cmd1.Parameters.Add("@MemberChildID", SqlDbType.VarChar).Value = MemberID
                cmd1.Parameters.Add("@FullName", SqlDbType.VarChar).Value = FullName
                cmd1.Parameters.Add("@SourceDocumentScan", SqlDbType.Binary).Value = bytes
                InsertUpdateData1(cmd1)

                'get the id of the filename
                Dim st As String = ConfigurationManager.ConnectionStrings("ChurchdbConnectionString").ToString : Dim con As New Data.SqlClient.SqlConnection(st)
                con.Open()
                Dim q As String = "SELECT * FROM ChildrenImageTable where ScanName=  '" & filename & "'"
                Dim com As New Data.SqlClient.SqlCommand(q, con)
                Dim reader As Data.SqlClient.SqlDataReader
                reader = com.ExecuteReader
                While reader.Read
                    picTextBox.Text = reader.Item(0).ToString
                End While
                con.Close()

                MemberAddImage.ImageUrl = "ChildrenHandler.ashx?id=" + picTextBox.Text
            End If


        Else
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('File format not recognised.Upload Image formats');", True)

        End If
    End Sub
    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Response.Redirect("ChildrenView.aspx")
    End Sub

    Protected Sub ChildDatePicker_SelectedDateChanged(sender As Object, e As Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs) Handles ChildDatePicker.SelectedDateChanged
        Dim DOb As Date
        Dim newdate As Date = Now
        Dim age As Integer = 0
        Dim nowyear As Integer = 0
        Dim dobyear As Integer = 0

        txtDob.Text = ChildDatePicker.SelectedDate

        DOb = CDate(txtDob.Text)

        dobyear = Microsoft.VisualBasic.DateAndTime.Year(DOb)

        nowyear = Microsoft.VisualBasic.DateAndTime.Year(newdate)

        If dobyear > nowyear Then

        ElseIf dobyear <= nowyear Then
            age = nowyear - dobyear
            txtAge.Text = age
        End If

    End Sub
End Class
