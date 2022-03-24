Imports System.IO
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Data
Partial Class DedicationEdit
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            txtMemID.Text = String.Empty

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

            txtStaffID.Text = Session("StaffID")

            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID

            txtMemID.Text = Session("DedicationID")

            Dim getAllInfo = madd.DedicationTables.Where(Function(l) l.SN = txtMemID.Text).SingleOrDefault


            lblid.Text = getAllInfo.DedicationId
            Ffirstname.Text = getAllInfo.FFirstname
            Fsurname.Text = getAllInfo.Flastname
            Fphone.Text = getAllInfo.Fphone
            bfirstname.Text = getAllInfo.BFirstname
            Bsurname.Text = getAllInfo.BLastname
            txtDob.Text = getAllInfo.DOB
            txtDedi.Text = getAllInfo.DateDedication
            Msurname.Text = getAllInfo.Mlastname
            Mfirstname.Text = getAllInfo.BFirstname
            Mphone.Text = getAllInfo.MPhone
            txtplacebirth.Text = getAllInfo.Placeofbirth
            txtAdress.Text = getAllInfo.ParentAddress
            Pastorname.Text = getAllInfo.Pastor
            OtherNames.Text = getAllInfo.BOtherNames
            drpFather.Items.Remove("Select")
            drpFather.DataBind()
            drpFather.Items.Insert(0, New ListItem("Select"))
            drpFather.SelectedIndex = 0



            DropGender.Items.Remove("Select")
            DropGender.DataBind()
            DropGender.Items.Insert(0, New ListItem("Select"))
            DropGender.SelectedIndex = 0


            drpMother.Items.Remove("Select")
            drpMother.DataBind()
            drpMother.Items.Insert(0, New ListItem("Select"))
            drpMother.SelectedIndex = 0


            ddlMonth.Items.Remove("Select")
            ddlMonth.DataBind()
            ddlMonth.Items.Insert(0, New ListItem("Select"))



            Dim checkImage = madd.DedicationImageTables.Where(Function(k) k.DedicationID = lblid.Text).Any

            If checkImage Then
                Dim ImageID As String = ""
                Dim getAllInfoImage = madd.DedicationImageTables.Where(Function(l) l.DedicationID = lblid.Text).SingleOrDefault
                ImageID = getAllInfoImage.ID
                'MemberImage
                MemberImage.ImageUrl = "DedicationHandler.ashx?id=" + ImageID

                btnchange.Text = "Change Picture"
            Else
                MemberImage.ImageUrl = ""
                btnchange.Text = "Upload Picture"
            End If

        End If
    End Sub

    Protected Sub Upload_Click(sender As Object, e As EventArgs) Handles Upload.Click
        'upload 
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
            Dim DedicationID = lblid.Text


            Dim strQuery As String = "insert into DedicationImageTable(DedicationID, ScanName, ScanType, SourceDocumentScan) " & _
                                     " values (@DedicationID, @ScanName, @ScanType, @SourceDocumentScan)"

            Dim cmd As New SqlCommand(strQuery)
            cmd.Parameters.Add("@DedicationID", SqlDbType.VarChar).Value = DedicationID
            cmd.Parameters.Add("@ScanName", SqlDbType.VarChar).Value = filename
            cmd.Parameters.Add("@ScanType", SqlDbType.VarChar).Value = contenttype
            cmd.Parameters.Add("@SourceDocumentScan", SqlDbType.Binary).Value = bytes
            InsertUpdateData(cmd)


            'get the id of the filename
            Dim st As String = ConfigurationManager.ConnectionStrings("ChurchdbConnectionString").ToString : Dim con As New Data.SqlClient.SqlConnection(st)
            con.Open()
            Dim q As String = "SELECT * FROM DedicationImageTable where ScanName=  '" & filename & "'"
            Dim com As New Data.SqlClient.SqlCommand(q, con)
            Dim reader As Data.SqlClient.SqlDataReader
            reader = com.ExecuteReader
            While reader.Read
                picTextBox.Text = reader.Item(0).ToString
            End While
            con.Close()

            MemberImage.ImageUrl = "DedicationHandler.ashx?id=" + picTextBox.Text

        Else
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('File format not recognised.Upload Image formats');", True)

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

    Protected Sub btnViewRec_Click(sender As Object, e As EventArgs) Handles btnViewRec.Click
        Response.Redirect("ViewDedication.aspx")
    End Sub

    
    Protected Sub btnchange_Click(sender As Object, e As EventArgs) Handles btnchange.Click

        If btnchange.Text = "Upload Picture" Then

            If FileUpload1.FileName <> "" Then
                Upload_Click(sender, e)
            End If
        ElseIf btnchange.Text = "Change Picture" Then
            Dim checkImage = madd.DedicationImageTables.Where(Function(k) k.DedicationID = lblid.Text).Any

            If checkImage Then
                Select Case MsgBox("Are you sure ?", MsgBoxStyle.YesNo, "Delete")
                    Case MsgBoxResult.Yes
                        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Working in progress');", True)
                    Case MsgBoxResult.No
                        ' Do something if no
                End Select
            Else
                If FileUpload1.FileName <> "" Then
                    Upload_Click(sender, e)
                End If
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Working in progress');", True)

                Response.Redirect("ViewDedication.aspx")

            End If

        End If
    End Sub
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

    End Sub
End Class
