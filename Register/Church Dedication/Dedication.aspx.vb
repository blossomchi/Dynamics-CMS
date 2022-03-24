Imports System.IO
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Data
Partial Class Dedication
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


            txtchurchID.Text = ""


            If lbChurchName.Text = "" Then
                 Response.Redirect("Login.aspx")
                Exit Sub
            End If

            txtStaffID.Text = Session("StaffID")

            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID

            drpFather.Items.Remove("Select")
            drpFather.DataBind()
            drpFather.Items.Insert(0, New ListItem("Select"))
            drpFather.SelectedIndex = 0


            drpminister.Items.Remove("Select")
            drpminister.DataBind()
            drpminister.Items.Insert(0, New ListItem("Select"))
            drpminister.SelectedIndex = 0

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
            ddlMonth.SelectedIndex = 0
        End If

    End Sub
    Protected Sub btnViewRec_Click(sender As Object, e As EventArgs) Handles btnViewRec.Click
        Response.Redirect("ViewDedication.aspx")
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim Maxlenght As Decimal = 81920 ' size of Cerificate

        If FileUpload1.FileName <> "" Then
            If FileUpload1.PostedFile.ContentLength >= Maxlenght Then ' size of certificate is less than 80kb
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('File size cannot be greater than 80KB. Please, resize and upload again.');", True)
                Exit Sub
            End If

        End If

        Dim a As New churchmanDataContext

        Dim strDate As Date
        strDate = Now

        Dim id = From i In a.DedicationTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            lblid.Text = "Did" & "" & z
        Else
            lblid.Text = "Did" & "" & 1

        End If

        If txtDedi.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, enter date for dedication!!!')", True)
            Exit Sub
        End If

        Dim ExtractDedicationMonth As Integer
        Dim MonthValue As String = ""
        Dim regDate As Date

        regDate = CDate(txtDedi.Text)

        If regDate <> Nothing Then
            ExtractDedicationMonth = Microsoft.VisualBasic.DateAndTime.Month(regDate)
        End If


        MonthValue = madd.MonthTables.Where(Function(d) d.Monthvalue = ExtractDedicationMonth).SingleOrDefault.Month
        ddlMonth.DataBind()
        ddlMonth.SelectedValue = ExtractDedicationMonth

        Dim saveDedication As New DedicationTable With {
       .DedicationId = lblid.Text,
       .FFirstname = Ffirstname.Text.ToUpper,
       .Flastname = Fsurname.Text.ToUpper,
       .Fphone = Fphone.Text,
       .MFirstname = Mfirstname.Text.ToUpper,
       .Mlastname = Msurname.Text.ToUpper,
       .MPhone = Mphone.Text,
       .BFirstname = bfirstname.Text.ToUpper,
       .Month = MonthValue,
       .BLastname = Bsurname.Text.ToUpper,
       .BOtherNames = OtherNames.Text.ToUpper,
       .DOB = txtDob.Text,
       .ParentAddress = txtAdress.Text.ToUpper,
       .DateDedication = txtDedi.Text,
       .Gender = DropGender.SelectedValue,
       .Placeofbirth = txtplacebirth.Text.ToUpper,
       .Pastor = txtpstname.Text.ToUpper,
       .Createdby = txtStaffID.Text,
       .Churchid = txtchurchID.Text,
       .datecreated = strDate}

        a.DedicationTables.InsertOnSubmit(saveDedication)
        a.SubmitChanges()

        Dim ie = From i In a.ChildrenTables
                Select i
        If ie.Count > 0 Then

            Dim latest As String = ie.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
            Dim z = (CInt(latest) + 1)
            lblid1.Text = "Chld" & "" & z
        Else
            lblid1.Text = "Chld" & "" & 1

        End If


        Dim savechildren As New ChildrenTable With {
            .Childrenid = lblid.Text,
          .Familyname = madd.MembershipTables.Where(Function(t) t.SN = drpFather.SelectedValue).SingleOrDefault.FamilyID,
          .Firstname = bfirstname.Text.ToUpper & " " & OtherNames.Text.ToUpper,
          .Lastname = Bsurname.Text.ToUpper,
          .Gender = DropGender.SelectedValue,
          .DOB = txtDob.Text,
          .Address = txtAdress.Text.ToUpper,
          .Phone = Fphone.Text,
          .FunctiongroupID = 5,
          .Parents = Fsurname.Text.ToUpper & " " & Ffirstname.Text.ToUpper,
          .Datecreated = strDate,
          .Updatedby = txtMembername.Text,
          .Churchid = txtchurchID.Text}


        a.ChildrenTables.InsertOnSubmit(savechildren)
        a.SubmitChanges()

        If FileUpload1.FileName <> "" Then
            Upload_Click(sender, e)
        End If

        'This Code is Displaying Saved Message and Reload/Refresh The Page
        Dim message As String = "Dedication, Added Successfully!"
        Dim url As String = "Dedication.aspx" ' The page tobe refreshed here!
        Dim script As String = "window.onload = function(){ alert('"
        script += message
        script += "');"
        script += "window.location = '"
        script += url
        script += "'; }"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)


    End Sub

    Protected Sub drpFather_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpFather.SelectedIndexChanged

        Dim getFirstName = (From s In madd.MembershipTables
                           Where s.SN = drpFather.SelectedValue
                           Select s).SingleOrDefault.FirstName

        Dim getLastName = (From s In madd.MembershipTables
                               Where s.SN = drpFather.SelectedValue
                               Select s).SingleOrDefault.LastName


        Dim getNumber = (From s In madd.MembershipTables
                               Where s.SN = drpFather.SelectedValue
                               Select s).SingleOrDefault.Phone1

        Dim getAdress = (From s In madd.MembershipTables
                               Where s.SN = drpFather.SelectedValue
                               Select s).SingleOrDefault.Address

        txtAdress.Text = getAdress

        Ffirstname.Text = getFirstName

        Fsurname.Text = getLastName

        Fphone.Text = getNumber


        Bsurname.Text = getLastName

    End Sub
    
  
    Protected Sub drpMother_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpMother.SelectedIndexChanged


        Dim getFirstName = (From s In madd.MembershipTables
                        Where s.SN = drpMother.SelectedValue
                        Select s).SingleOrDefault.FirstName

        Dim getLastName = (From s In madd.MembershipTables
                               Where s.SN = drpMother.SelectedValue
                               Select s).SingleOrDefault.LastName


        Dim getNumber = (From s In madd.MembershipTables
                               Where s.SN = drpMother.SelectedValue
                               Select s).SingleOrDefault.Phone1




        Mfirstname.Text = getFirstName

        Msurname.Text = getLastName

        Mphone.Text = getNumber
    End Sub
    Protected Sub drpminister_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpminister.SelectedIndexChanged

        Dim getNumber = (From s In madd.MinisterTables
                           Where s.SN = drpminister.SelectedValue
                           Select s).SingleOrDefault.PhoneNo

        Dim getFirstName = (From s In madd.MinisterTables
                      Where s.SN = drpminister.SelectedValue
                      Select s).SingleOrDefault.Name

        txtpstname.Text = getFirstName
        txtPstNo.Text = getNumber
    End Sub

    Protected Sub Upload_Click(sender As Object, e As EventArgs) Handles Upload.Click
        'upload 
        Dim Maxlenght As Decimal = 81920 ' size of Cerificate

        Dim checkImage = madd.BaptismImageTables.Where(Function(k) k.BaptismID = lblid.Text).Any
        If checkImage Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Dedication certificate already exist!!!')", True)
            Exit Sub

        ElseIf Not checkImage Then
            If FileUpload1.PostedFile.ContentLength >= Maxlenght Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('File size cannot be greater than 80KB.Please, resize and upload again.');", True)
                Exit Sub
            End If

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

End Class
