Imports System.IO
Imports System.Web
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Linq
Partial Class AssignChurch
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

            txtchurchID.Text = madd.ChurchDetailTables.Where(Function(s) s.ChurchName = lbChurchName.Text).SingleOrDefault.ChurchDetailID
            txtMembername.Text = madd.MembershipTables.Where(Function(s) s.FirstName = AdminLabel.Text).SingleOrDefault.FirstName




            drpselected.DataBind()
            drpselected.Items.Insert(0, New ListItem("Select"))
            drpselected.SelectedIndex = 0

            LBID.Text = Session("AssignedID")
            If LBID.Text = "" Then
                Response.Redirect("Location.aspx")
                Exit Sub
            End If

            'Headquaters
            Dim hier = (From f In madd.ChurchDetailTables Join
                       t In madd.ChurchDesignationTables On f.ChurchDesgID Equals t.ChurchDesgID
                       Where f.SN = LBID.Text
                       Select t).SingleOrDefault.Branch

            If hier = "Headquaters" Then
                ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please you can't assign a church to Headquaters!!!')")
            Else
                txtSelected.Text = madd.ChurchDetailTables.Where(Function(t) t.SN = LBID.Text).SingleOrDefault.ChurchName.ToUpper
                drpselected.Enabled = True
                drpselected.DataBind()
                drpselected.Items.Insert(0, New ListItem("Select"))
                drpselected.SelectedIndex = 0
            End If


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
        If txtSelected.Text = "" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please enter Church Division!!!')", True)
            Exit Sub
        End If

        If drpselected.SelectedValue = "Select" Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('Please, select church!')", True)
            Exit Sub
        End If
        Dim a As New churchmanDataContext
        Dim Childmess, Parentmess As String
        Childmess = txtSelected.Text.ToLower

        Parentmess = madd.ChurchDetailTables.Where(Function(w) w.ChurchDetailID = drpselected.SelectedValue).SingleOrDefault.ChurchName.ToLower

        Dim strDate As String = Date.Now.ToString("MM/dd/yyyy hh:mm:ss tt") 'Returns date with AM/PM'

        lbCDetails.Text = madd.ChurchDetailTables.Where(Function(k) k.ChurchName = txtSelected.Text).SingleOrDefault.ChurchDetailID

        Dim checkChurch = madd.ChurchHierachies.Where(Function(q) q.ChurchChildren = lbCDetails.Text AndAlso q.ChurchParent = drpselected.SelectedValue).Any

        If Not checkChurch Then
            Dim saveHierachy As New ChurchHierachy With { _
           .ChurchChildren = lbCDetails.Text, _
           .ChurchParent = drpselected.SelectedValue, _
           .DateCreated = Now}
            a.ChurchHierachies.InsertOnSubmit(saveHierachy)
            a.SubmitChanges()

            Dim updateChurchDetails = madd.ChurchDetailTables.Where(Function(f) f.SN = LBID.Text).SingleOrDefault()

            updateChurchDetails.Assign = True
            madd.SubmitChanges()

            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('saved!!!')", True)
        ElseIf checkChurch = True Then
            ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('" & Parentmess & " has already been assign to " & Childmess & "!')", True)
            txtSelected.Text = ""
            drpselected.DataBind()
            drpselected.Items.Insert(0, New ListItem("Select"))
            drpselected.SelectedIndex = 0
        End If


        ClientScript.RegisterStartupScript(Me.[GetType](), "alert", "alert('saved!!!')", True)
        Response.Redirect("Location.aspx")
    End Sub
End Class
