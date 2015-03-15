Imports clsUtil
Partial Class Security_PasswordRecovery
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Page.Header.Title = BuildPageTitle("Password Recovery")
    End Sub
End Class
