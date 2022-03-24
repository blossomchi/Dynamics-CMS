Imports System.IO
Imports System.Data.SqlClient
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Data
Partial Class Baptism
    Inherits System.Web.UI.Page
    Dim madd As New churchmanDataContext
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'put your code 

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


            txtchurchid.Text = ""


            If lbChurchName.Text = "" Then
                 Response.Redirect("Login.aspx")
                Exit Sub
            End If

            txtStaffID.Text = Session("StaffID")
            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName
            txtLocation.Text = madd.Locations.Where(Function(s) s.Name = lbLocation.Text).SingleOrDefault.Locationid
            txtchurchid.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID

            DropGender.DataBind()
            DropGender.Items.Insert(0, New ListItem("Select"))
            DropGender.SelectedIndex = 0

            dropAuthority.DataBind()
            dropAuthority.Items.Insert(0, New ListItem("Select"))
            dropAuthority.SelectedIndex = 0

            drpbaptismname.DataBind()
            drpbaptismname.Items.Insert(0, New ListItem("Select"))
            drpbaptismname.SelectedIndex = 0

            DropMinister.DataBind()
            DropMinister.Items.Insert(0, New ListItem("Select"))
            DropMinister.SelectedIndex = 0

        End If
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



        Dim checkPhoneno = (From f In a.MembershipTables
                            Where f.Phone1 = txtPhone1.Text
                            Select f).Any

        If checkPhoneno = True Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Existing contact !!!')", True)
            Exit Sub
        End If

        If txtAge.Text <> "18" Then

            Dim id = From i In a.BaptismTables
                    Select i
            If id.Count > 0 Then

                Dim latest As String = id.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
                Dim z = (CInt(latest) + 1)
                lblid.Text = "Bap" & "" & z
            Else
                lblid.Text = "Bap" & "" & 1

            End If


            Dim savemember As New BaptismTable With { _
            .Baptismid = lblid.Text, _
            .FirstName = txtfirstname.Text.ToUpper, _
            .LastName = txtlastname.Text.ToUpper, _
            .Phone = txtPhone1.Text, _
            .Churchid = txtchurchid.Text, _
            .DateCreation = strDate, _
            .DOB = txtBirth.Text, _
            .Gender = DropGender.SelectedValue, _
            .Parents = txtParents.Text.ToUpper, _
            .Pastor = txtfulname.Text.ToUpper, _
            .POB = txtPOB.Text, _
            .BaptismDate = txtBaptismDate.Text, _
            .PhoneNo = txtPhone3.Text, _
            .ResidentAddress = txtAddress.Text}

            a.BaptismTables.InsertOnSubmit(savemember)
            a.SubmitChanges()

            If FileUpload1.FileName <> "" Then
                Upload_Click(sender, e)
            End If

        ElseIf txtAge.Text >= "18" Then

            Dim checkname = madd.FamilyTables.Where(Function(q) q.FamilyName = txtlastname.Text).Any

            If checkname = True Then
                Dim getMemeid = (From s In madd.FamilyTables
                                      Where s.FamilyName = txtlastname.Text
                                      Select s).SingleOrDefault.Familyid

                Dim tit As Integer
                tit = 0

                Dim ed = From i In a.MembershipTables
                Select i
                If ed.Count > 0 Then

                    Dim latest As String = ed.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
                    Dim z = (CInt(latest) + 1)
                    lblid.Text = "MEB" & "" & z
                Else
                    lblid.Text = "MEB" & "" & 1

                End If


                Dim savenewmember As New MembershipTable With { _
                .FamilyID = getMemeid, _
                .Memberid = lblid.Text, _
                .FirstName = txtfirstname.Text.ToUpper, _
                .LastName = txtlastname.Text.ToUpper, _
                .Phone1 = txtPhone1.Text, _
                .Gender = DropGender.SelectedValue, _
                .Authority = If(dropAuthority.SelectedValue = "Select", Nothing, dropAuthority.SelectedValue), _
                .Address = txtAddress.Text.ToUpper, _
                .TitheId = tit, _
                .DateBaptism = txtBaptismDate.Text, _
                .DOB = txtBirth.Text, _
                .ChurchDetailID = txtchurchid.Text, _
                .Updatedby = txtMembername.Text, _
                .Locationid = txtLocation.Text, _
                .DateCreated = strDate}

                a.MembershipTables.InsertOnSubmit(savenewmember)
                a.SubmitChanges()


            ElseIf checkname = False Then
                Dim fid = From i In a.FamilyTables
                Select i
                If fid.Count > 0 Then

                    Dim latest As String = fid.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
                    Dim z = (CInt(latest) + 1)
                    txtfamilyid.Text = "FAM" & "" & z
                Else
                    txtfamilyid.Text = "FAM" & "" & 1

                End If


                Dim savenewfamily As New FamilyTable With { _
               .Familyid = txtfamilyid.Text, _
                .FamilyName = txtlastname.Text.ToUpper, _
                .DateCreated = strDate}


                a.FamilyTables.InsertOnSubmit(savenewfamily)
                a.SubmitChanges()

                Dim tit As Integer
                tit = 0

                Dim ed = From i In a.MembershipTables
                Select i
                If ed.Count > 0 Then

                    Dim latest As String = ed.OrderByDescending(Function(i) i.SN).FirstOrDefault.SN
                    Dim z = (CInt(latest) + 1)
                    txtmemberid.Text = "MEB" & "" & z
                Else
                    txtmemberid.Text = "MEB" & "" & 1

                End If


                Dim savenewmember As New MembershipTable With { _
                .FamilyID = txtfamilyid.Text, _
                .Memberid = txtmemberid.Text, _
                .FirstName = txtfirstname.Text.ToUpper, _
                .LastName = txtlastname.Text.ToUpper, _
                .Phone1 = txtPhone1.Text, _
                .TitheId = tit, _
                .Gender = DropGender.SelectedValue, _
                .Authority = If(dropAuthority.SelectedValue = "Select", Nothing, dropAuthority.SelectedValue), _
                .Address = txtAddress.Text.ToUpper, _
                .DateBaptism = txtBaptismDate.Text, _
                .DOB = txtBirth.Text, _
                .ChurchDetailID = txtchurchid.Text, _
                .Updatedby = txtMembername.Text, _
                .Locationid = txtLocation.Text, _
                .DateCreated = strDate}

                a.MembershipTables.InsertOnSubmit(savenewmember)
                a.SubmitChanges()


            End If


        End If


        'This Code is Displaying Saved Message and Reload/Refresh The Page
        Dim message As String = "Baptism Record, Added Successfully!"
        Dim url As String = "Baptism.aspx" ' The page tobe refreshed here!
        Dim script As String = "window.onload = function(){ alert('"
        script += message
        script += "');"
        script += "window.location = '"
        script += url
        script += "'; }"
        ClientScript.RegisterStartupScript(Me.GetType(), "Redirect", script, True)


    End Sub

    Protected Sub DropMinister_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropMinister.SelectedIndexChanged


        Dim getName = (From s In madd.MinisterTables
                          Where s.SN = DropMinister.SelectedValue
                          Select s).SingleOrDefault.Name

        Dim getNumber = (From s In madd.MinisterTables
                               Where s.SN = DropMinister.SelectedValue
                               Select s).SingleOrDefault.PhoneNo


        txtfulname.Text = getName

    End Sub

    Protected Sub btnViewRec_Click(sender As Object, e As EventArgs) Handles btnViewRec.Click
        Response.Redirect("ViewBaptism.aspx")
    End Sub
    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles drpbaptismname.SelectedIndexChanged



        Dim getFirstName = (From s In madd.ClassTables
                             Where s.SN = drpbaptismname.SelectedValue
                             Select s).SingleOrDefault.FirstName

        Dim getLastName = (From s In madd.ClassTables
                               Where s.SN = drpbaptismname.SelectedValue
                               Select s).SingleOrDefault.LastName

        Dim getNumber = (From s In madd.ClassTables
                               Where s.SN = drpbaptismname.SelectedValue
                               Select s).SingleOrDefault.Phone

        txtlastname.Text = getLastName

        txtfirstname.Text = getFirstName

        txtPhone1.Text = getNumber
    End Sub
    Protected Sub txtBirth_TextChanged(sender As Object, e As EventArgs) Handles txtBirth.TextChanged
        Dim DOb As Date
        Dim newdate As Date = Now
        Dim age As Integer = 0
        Dim nowyear As Integer = 0
        Dim dobyear As Integer = 0

        DOb = CDate(txtBirth.Text)

        dobyear = Microsoft.VisualBasic.DateAndTime.Year(DOb)

        nowyear = Microsoft.VisualBasic.DateAndTime.Year(newdate)

        If dobyear > nowyear Then

        ElseIf dobyear <= nowyear Then
            age = nowyear - dobyear
            txtAge.Text = age
        End If

    End Sub

    Protected Sub Upload_Click(sender As Object, e As EventArgs) Handles Upload.Click

        Dim Maxlenght As Decimal = 81920 ' size of Cerificate

        Dim checkImage = madd.BaptismImageTables.Where(Function(k) k.BaptismID = lblid.Text).Any
        If checkImage Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Baptism certificate already exist!!!')", True)
            Exit Sub

        ElseIf Not checkImage Then

            If FileUpload1.PostedFile.ContentLength >= Maxlenght Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('File size cannot be greater than 80KB.Please, resize and upload again.');", True)
                Exit Sub
            End If

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

                MemberImage.ImageUrl = "BaptismHandler.ashx?id=" + picTextBox.Text

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
