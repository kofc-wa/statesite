Imports System.Configuration.ConfigurationManager
Imports clsUtil
Partial Class Security_nCreateAccount
    Inherits System.Web.UI.Page

    Protected Sub CreateUserWizard1_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizard1.CreatedUser
        Try
            Roles.AddUserToRole(CreateUserWizard1.UserName, "Member")

            ' TODO use this area to fetch data from offices/groups and then
            ' add additional roles...
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Protected Sub CreateUserWizard1_CreatingUser(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.LoginCancelEventArgs) Handles CreateUserWizard1.CreatingUser
        Try
            Dim sSYS As svcSYS.SysService = New svcSYS.SysService
            ConfigWebSvc(sSYS)
            Dim sUN As String = CreateUserWizard1.UserName
            Dim sEmail As String = CreateUserWizard1.Email

            If sEmail.EndsWith("aol.com") Then
                errMsg.BorderStyle = BorderStyle.Double
                errMsg.BorderColor = Drawing.Color.Red
                errMsg.Text = "AOL Email Addresses will not allow email forwarding and so are not allowed"
                e.Cancel = True
            Else



                ' strip any leading 0's....
                If Left(sUN, 1) <> "0" Then
                    If sUN.Length = 6 Or sUN.Length = 7 Then
                        If IsNumeric(CreateUserWizard1.UserName) Then
                            Dim iID As Integer = CType(CreateUserWizard1.UserName, Integer)

                            If Not sSYS.IsMemberNoValid(ConnectionStrings("KofCDSN").ToString, iID.ToString) Then
                                errMsg.BorderStyle = BorderStyle.Double
                                errMsg.BorderColor = Drawing.Color.Red
                                errMsg.Text = "Member ID was not found in our database. Please send an email to <a href=mailto:webmaster@kofc-wa.org>Webmaster</a> requesting that it be added.  Be sure to include your name, council, and member ID."
                                e.Cancel = True
                            Else
                                e.Cancel = False
                            End If
                        Else
                            errMsg.BorderStyle = BorderStyle.Double
                            errMsg.BorderColor = Drawing.Color.Red
                            errMsg.Text = "Member ID must be numeric!"
                            e.Cancel = True
                        End If
                    Else
                        errMsg.BorderStyle = BorderStyle.Double
                        errMsg.BorderColor = Drawing.Color.Red
                        errMsg.Text = "Member ID must be 6 or 7 digits with no leading 0!"
                        e.Cancel = True
                    End If
                Else
                    errMsg.BorderStyle = BorderStyle.Double
                    errMsg.BorderColor = Drawing.Color.Red
                    errMsg.Text = "Member ID must NOT begin with a 0!"
                    e.Cancel = True
                End If
            End If
        Catch ex As Exception
            Throw
        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            Page.Header.Title = BuildPageTitle("Create Account")
            If IsPostBack Then
                errMsg.Text = ""
                errMsg.BorderStyle = BorderStyle.None
                errMsg.BorderColor = Drawing.Color.White
            End If
            Dim sMess As String = "Please use your Knights of Columbus, Washington State Juristiction, Member Number. "
            sMess = sMess & "This will be verified and an account will be setup using basic member permissions. <br><br> "
            sMess = sMess & "If you need access to more of the site, please send an email request to <a href=mailto:webmaster@kofc-wa.org>"
            sMess = sMess & "Webmaster</a>"
            lblCreateAccountHelp.Text = sMess
        Catch ex As Exception
            Throw
        End Try
    End Sub

End Class
