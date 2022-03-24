Imports System.IO
Imports System.Web
Imports System.Data
Partial Class Location
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



            'put your code 
            DrpCriteria.DataBind()
            DrpCriteria.Items.Insert(0, New ListItem("Select"))
            DrpCriteria.SelectedIndex = 0


            GVSigned.Visible = False
            GVTown.Visible = False
            GVAllChurch.Visible = True
            GVUnsigned.Visible = False
            GVState.Visible = False
            GVCriteria2.Visible = False
            DrpCriteria2.Visible = False
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

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpCriteria.SelectedIndexChanged
        txtAssigned.Text = ""
        If DrpCriteria.SelectedValue = "Church Assign" Then
            txtAssigned.Text = "True"
            GVSigned.Visible = True
            GVAllChurch.Visible = False
            GVUnsigned.Visible = False
            GVState.Visible = False
            GVTown.Visible = False
            DrpCriteria2.Visible = False
            GVCriteria2.Visible = False
            GVCriteria3.Visible = False
        ElseIf DrpCriteria.SelectedValue = "Select" Then
            GVAllChurch.Visible = True
            GVSigned.Visible = False
            GVUnsigned.Visible = False
            GVState.Visible = False
            GVTown.Visible = False
            DrpCriteria2.Visible = False
            GVCriteria2.Visible = False
            GVCriteria3.Visible = False
        ElseIf DrpCriteria.SelectedValue = "State" Then
            GVState.Visible = True
            GVAllChurch.Visible = False
            GVUnsigned.Visible = False
            GVTown.Visible = False
            DrpCriteria2.Visible = True
            GVCriteria2.Visible = False
            GVCriteria3.Visible = False

            Dim qryState = From f In madd.StateTables
                           Select f.State Order By State Ascending

            DrpCriteria2.DataSource = qryState
            DrpCriteria2.DataBind()
            DrpCriteria2.Items.Insert(0, New ListItem("Select"))
            DrpCriteria2.SelectedIndex = 0

        ElseIf DrpCriteria.SelectedValue = "Church Unassigned" Then
            txtAssigned.Text = "False"
            GVUnsigned.Visible = True
            GVAllChurch.Visible = False
            GVSigned.Visible = False
            GVState.Visible = False
            GVTown.Visible = False
            DrpCriteria2.Visible = False
            GVCriteria2.Visible = False
            GVCriteria3.Visible = False
        ElseIf DrpCriteria.SelectedValue = "Town" Then
            GVTown.Visible = True
            GVUnsigned.Visible = False
            GVAllChurch.Visible = False
            GVSigned.Visible = False
            GVState.Visible = False
            DrpCriteria2.Visible = True
            GVCriteria2.Visible = False

            Dim qryLocation = From f In madd.Locations
                        Select f.Name Order By Name Ascending

            DrpCriteria2.DataSource = qryLocation
            DrpCriteria2.DataBind()
            DrpCriteria2.Items.Insert(0, New ListItem("Select"))
            DrpCriteria2.SelectedIndex = 0

        End If
    End Sub

    Protected Sub GVUnsigned_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVUnsigned.SelectedIndexChanged
        txtAssignedID.Text = GVUnsigned.SelectedRow.Cells(0).Text
        Session("AssignedID") = txtAssignedID.Text

        Response.Redirect("AssignChurch.aspx")

    End Sub

    Protected Sub DrpCriteria2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DrpCriteria2.SelectedIndexChanged
        If DrpCriteria.SelectedValue = "State" Then

            GVSigned.Visible = False
            GVTown.Visible = False
            GVAllChurch.Visible = False
            GVUnsigned.Visible = False
            GVState.Visible = False

            Dim name = (From d In madd.StateTables
                         Where d.State = DrpCriteria2.SelectedValue
                         Select d).SingleOrDefault.Stateid

            txtCriteria2.Text = name

            GVCriteria2.Visible = True

        ElseIf DrpCriteria.SelectedValue = "Town" Then

            GVSigned.Visible = False
            GVTown.Visible = False
            GVAllChurch.Visible = False
            GVUnsigned.Visible = False
            GVState.Visible = False
            GVCriteria2.Visible = False

            Dim town = (From d In madd.Locations
                         Where d.Name = DrpCriteria2.SelectedValue
                         Select d).SingleOrDefault.Locationid

            txtCriteria3.Text = town

            GVCriteria3.Visible = True

        End If
      

    End Sub


    Protected Sub GVSigned_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVSigned.SelectedIndexChanged

    End Sub

    Protected Sub BtnSearch_Click(sender As Object, e As EventArgs) Handles BtnSearch.Click

    End Sub

    Protected Sub GVAllChurch_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVAllChurch.SelectedIndexChanged

    End Sub
End Class
