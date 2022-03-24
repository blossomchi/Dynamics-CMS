Imports System.IO
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Data
Partial Class BaptismEdit
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'put your code 

            Dim userName As String = User.Identity.Name

            Dim getMemberID = madd.AuthenticalTables.Where(Function(f) f.Username = userName).SingleOrDefault.Memberid

            Dim name = madd.MembershipTables.Where(Function(d) d.Memberid = getMemberID).SingleOrDefault.FirstName

            Dim getChurch = (From y In madd.MembershipTables Join
                                h1 In madd.ChurchDetailTables On y.ChurchDetailID Equals h1.ChurchDetailID
                                Where y.Memberid = getMemberID
                                Select h1).SingleOrDefault.ChurchName


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


            txtchurchid.Text = ""


            If lbChurchName.Text = "" Then
                 Response.Redirect("Login.aspx")
                Exit Sub
            End If
            txtMemID.Text = Session("BaptismID")



            Dim getAllInfo = madd.BaptismTables.Where(Function(l) l.SN = txtMemID.Text).SingleOrDefault

            txtStaffID.Text = Session("StaffID")
            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName
            txtLocation.Text = madd.Locations.Where(Function(s) s.Name = lbLocation.Text).SingleOrDefault.Locationid
            txtchurchid.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID

            lblid.Text = getAllInfo.Baptismid
            txtfirstname.Text = getAllInfo.FirstName
            txtlastname.Text = getAllInfo.LastName
            txtPhone1.Text = getAllInfo.PhoneNo
            txtParents.Text = getAllInfo.Parents
            txtBirth.Text = getAllInfo.DOB
            txtBaptismDate.Text = getAllInfo.BaptismDate
            txtAddress.Text = getAllInfo.ResidentAddress
            txtPOB.Text = getAllInfo.POB
         
            Dim h As String = String.Empty
            h = getAllInfo.Gender
            If h = String.Empty Then
                DropGender.DataBind()
                DropGender.Items.Insert(0, New ListItem("Select"))
                DropGender.SelectedIndex = 0
            ElseIf h <> String.Empty Then
                DropGender.DataBind()
                DropGender.SelectedValue = h
            End If

            Dim b As String = String.Empty
            b = getAllInfo.Pastor
            If b = String.Empty Then
                DropMinister.DataBind()
                DropMinister.Items.Insert(0, New ListItem("Select"))
                DropMinister.SelectedIndex = 0
            ElseIf b <> String.Empty Then
                DropMinister.DataBind()
                DropMinister.SelectedValue = b
            End If



            Dim checkImage = madd.BaptismImageTables.Where(Function(k) k.BaptismID = lblid.Text).Any

            If checkImage Then
                Dim ImageID As String = ""
                Dim getAllInfoImage = madd.BaptismImageTables.Where(Function(l) l.BaptismID = lblid.Text).SingleOrDefault
                ImageID = getAllInfoImage.ID

                Memberimage.ImageUrl = "BaptismHandler.ashx?id=" + ImageID
                btnchange.Text = "Change Picture"
            Else
                Memberimage.ImageUrl = ""
                btnchange.Text = "Upload Picture"
            End If



        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim updateMember = madd.BaptismTables.Where(Function(h) h.SN = txtMemID.Text).SingleOrDefault

        updateMember.FirstName = txtfirstname.Text
        updateMember.LastName = txtlastname.Text
        updateMember.PhoneNo = txtPhone1.Text
        updateMember.Gender = DropGender.SelectedValue
        updateMember.Parents = txtParents.Text
        updateMember.Phone = txtPhone3.Text
        updateMember.BaptismDate = txtBaptismDate.Text
        updateMember.Pastor = DropMinister.SelectedValue
        updateMember.ResidentAddress = txtAddress.Text
        updateMember.POB = txtPOB.Text
        madd.SubmitChanges()

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Has been Edited!!!')", True)


       






       


    End Sub

    Protected Sub Upload_Click(sender As Object, e As EventArgs) Handles Upload.Click
        Dim Maxlenght As Decimal = 81920 ' size of passort

        Dim checkImage = madd.BaptismImageTables.Where(Function(k) k.BaptismID = lblid.Text).Any
        If checkImage Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Member passport already exist!!!')", True)
            Exit Sub

        ElseIf Not checkImage Then

            If FileUpload1.PostedFile.ContentLength >= Maxlenght Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('File size cannot be greater than 80KB.');", True)
                Exit Sub
            End If

            'upload and update picture
            Dim filePath As String = FileUpload1.PostedFile.FileName
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
                Dim fs As Stream = FileUpload1.PostedFile.InputStream
                Dim br As New BinaryReader(fs)
                Dim bytes As Byte() = br.ReadBytes(fs.Length)


                'get applicant id
                Dim BaptismID = lblid.Text


                Dim strQuery As String = "insert into BaptismImageTable(BaptismID, ScanName, ScanType, SourceDocumentScan) " & _
                                         " values (@BaptismID, @ScanName, @ScanType, @SourceDocumentScan)"

                Dim cmd As New SqlCommand(strQuery)
                cmd.Parameters.Add("@BaptismID", SqlDbType.VarChar).Value = BaptismID
                cmd.Parameters.Add("@ScanName", SqlDbType.VarChar).Value = filename
                cmd.Parameters.Add("@ScanType", SqlDbType.VarChar).Value = contenttype
                cmd.Parameters.Add("@SourceDocumentScan", SqlDbType.Binary).Value = bytes
                InsertUpdateData(cmd)


                'get the id of the filename
                Dim st As String = ConfigurationManager.ConnectionStrings("ChurchdbConnectionString").ToString : Dim con As New Data.SqlClient.SqlConnection(st)
                con.Open()
                Dim q As String = "SELECT * FROM BaptismImageTable where ScanName=  '" & filename & "'"
                Dim com As New Data.SqlClient.SqlCommand(q, con)
                Dim reader As Data.SqlClient.SqlDataReader
                reader = com.ExecuteReader
                While reader.Read
                    picTextBox.Text = reader.Item(0).ToString
                End While
                con.Close()

                Memberimage.ImageUrl = "BaptismHandler.ashx?id=" + picTextBox.Text

            Else
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('File format not recognised.Upload Image formats');", True)

            End If
        End If
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

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles btnchange.Click

        If btnchange.Text = "Upload Picture" Then

            If FileUpload1.FileName <> "" Then
                Upload_Click(sender, e)
            End If
        ElseIf btnchange.Text = "Change Picture" Then
            Dim checkImage = madd.BaptismImageTables.Where(Function(k) k.BaptismID = lblid.Text).Any

            If checkImage Then
                Select Case MsgBox("Are you sure ?", MsgBoxStyle.YesNo, "Delete")
                    Case MsgBoxResult.Yes
                        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Work in progress!!!')", True)
                    Case MsgBoxResult.No
                        ' Do something if no
                End Select
            Else
                If FileUpload1.FileName <> "" Then
                    Upload_Click(sender, e)
                End If
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Image uploaded!!!')", True)
            End If

        End If

    End Sub

    Protected Sub btnViewRec_Click(sender As Object, e As EventArgs) Handles btnViewRec.Click
        Response.Redirect("ViewBaptism.aspx")
    End Sub
End Class
