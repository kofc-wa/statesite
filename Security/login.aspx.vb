Imports System.Configuration.ConfigurationManager
Partial Class Login
    Inherits System.Web.UI.Page


    Protected Sub Login1_LoginError(ByVal sender As Object, ByVal e As System.EventArgs) Handles Login1.LoginError
        'There was a problem logging in the user
        Try


            'See if this user exists in the database
            Dim userInfo As MembershipUser = Membership.GetUser(Login1.UserName)

            If userInfo Is Nothing Then
                'The user entered an invalid username...
                LoginErrorDetails.Text = "There is no user in the database with the username " & Login1.UserName
            Else
                'See if the user is locked out or not approved
                If Not userInfo.IsApproved Then
                    LoginErrorDetails.Text = "Your account has not yet been approved by the site's administrators. Please try again later..."
                ElseIf userInfo.IsLockedOut Then
                    LoginErrorDetails.Text = "Your account has been locked out because of a maximum number of incorrect login attempts. You will NOT be able to login until you contact a site administrator and have your account unlocked."
                Else
                    'The password was incorrect (don't show anything, the Login control already describes the problem)
                    LoginErrorDetails.Text = String.Empty
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
        Try

            Dim sUN As String = Login1.UserName
            Dim sPWD As String = Login1.Password
            Dim sSYS As svcSYS.SysService = New svcSYS.SysService

            If sSYS.IsMemberNoValid(ConnectionStrings("KofCDSN").ToString, sUN) Then
                If System.Web.Security.Membership.ValidateUser(sUN, sPWD) Then
                    e.Authenticated = True

                End If
            Else

                LoginErrorDetails.Text = "You must use a valid KofC Member Number to login"
                e.Authenticated = False
            End If
        Catch ex As Exception
            LoginErrorDetails.Text = "Server is currently unavailable! Please try again later."
            e.Authenticated = False
        End Try

    End Sub
    

End Class
