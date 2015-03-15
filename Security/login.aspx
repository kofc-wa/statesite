<%@ Page Language="VB" MasterPageFile="~/KofCWSC.master" AutoEventWireup="false"
    CodeFile="login.aspx.vb" Inherits="Login" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    &nbsp;<table border="0" style="width: 100%; height: 100%">
        <tr>
        <td colspan="3" valign="top">
                <asp:Login ID="Login1" runat="server" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderPadding="4"
                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
                    ForeColor="#333333" TextLayout="TextOnTop" CreateUserText="Create an Account"  PasswordRecoveryText="Forgot your password?"
                     PasswordRecoveryUrl="~/Security/PasswordRecovery.aspx"
                    CreateUserUrl="~/Security/CreateAccount.aspx" UserNameLabelText="Member ID:" Width="187px">
                    <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <TextBoxStyle Font-Size="0.8em" />
                    <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px"
                        Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
                </asp:Login>
            </td>
        </tr>
        <tr>
            <td style="height: 22px" colspan="3">
                &nbsp;<table style="width: 100%; height: 100%">
                    <tr>
                        <td align="center" style="width: 100%" valign="middle">
                            <asp:Label ID="LoginErrorDetails" runat="server" Font-Bold="True" ForeColor="Red"
                                Width="884px"></asp:Label></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
