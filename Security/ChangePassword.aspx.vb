Imports clsUtil
Partial Class Security_ChangePassword
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.Header.Title = BuildPageTitle("Change Password")
    End Sub
End Class
