
Partial Class BranchDetails
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            DrpChurch.Items.Remove("SELECT")
            DrpChurch.DataBind()
            DrpChurch.Items.Insert(0, New ListItem("SELECT"))
            DrpChurch.SelectedIndex = 0

            Dropcountry.Items.Remove("SELECT")
            Dropcountry.DataBind()
            Dropcountry.Items.Insert(0, New ListItem("SELECT"))
            Dropcountry.SelectedIndex = 0


            DrpState.Items.Remove("SELECT")
            DrpState.DataBind()
            DrpState.Items.Insert(0, New ListItem("SELECT"))
            DrpState.SelectedIndex = 0


            DrpLocation.Items.Remove("SELECT")
            DrpLocation.DataBind()
            DrpLocation.Items.Insert(0, New ListItem("SELECT"))
            DrpLocation.SelectedIndex = 0

            txtDes.Text = ""
            txtState.Text = ""
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

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        If txtchurchname.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter church name!!!')", True)
            Exit Sub
        End If

        If DrpChurch.SelectedValue = "SELECT" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, Select Church Designation !!!')", True)
            Exit Sub
        End If

        If Dropcountry.SelectedValue = "SELECT" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, Select a Country !!!')", True)
            Exit Sub
        End If

        If DrpState.SelectedValue = "SELECT" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, Select a State !!!')", True)
            Exit Sub
        End If


        If DrpLocation.SelectedValue = "SELECT" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, Select a Location !!!')", True)
            Exit Sub
        End If

        Dim a As New churchmanDataContext
        Dim strDate As String = Date.Now.ToString("MM/dd/yyyy hh:mm:ss tt") 'Returns date with AM/PM'

        Dim id = From i In a.ChurchDetailTables
                 Select i
        If id.Count > 0 Then

            Dim latest As String = id.OrderByDescending(Function(i) i.Sn).FirstOrDefault.Sn
            Dim z = (CInt(latest) + 1)
            Lblid.Text = "ChuB" & "" & z
        Else
            Lblid.Text = "ChuB" & "" & 1

        End If



        Dim saveBranch As New ChurchDetailTable With { _
       .ChurchDetailID = Lblid.Text, _
       .ChurchDesgID = DrpChurch.SelectedValue, _
       .ChurchName = txtchurchname.Text, _
       .Country = Dropcountry.SelectedValue, _
       .Assign = False, _
       .Stateid = DrpState.SelectedValue, _
       .Locationid = DrpLocation.SelectedValue, _
       .Address = txtaddress.Text, _
       .Datecreated = strDate}

        a.ChurchDetailTables.InsertOnSubmit(saveBranch)
        a.SubmitChanges()




        Dim saveBran As New ChurchvaluesTable With { _
         .ChurchDetailID = Lblid.Text, _
         .ChurchDesgID = DrpChurch.SelectedValue}

        a.ChurchvaluesTables.InsertOnSubmit(saveBran)
        a.SubmitChanges()




        txtaddress.Text = ""
        txtchurchname.Text = ""

        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Saved!!!')", True)


    End Sub

   
    Protected Sub DrpChurch_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpChurch.SelectedIndexChanged
        txtDes.Text = DrpChurch.SelectedValue
    End Sub

 
End Class
