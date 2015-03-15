<%@ Page Title="" Language="VB" MasterPageFile="~/nKOFCWA.master" AutoEventWireup="false" CodeFile="nPasswordRecovery.aspx.vb" Inherits="Security_nPasswordRecovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table style="width: 50%">
        <tr>
            <td class="TDNB">
    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" BackColor="#FFFBD6" BorderColor="#FFDFAD"
        BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana"
        Font-Size="0.8em" UserNameInstructionText="Enter your Member Number  to receive your password." UserNameLabelText="Member Number:">
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <SuccessTextStyle Font-Bold="True" ForeColor="#990000" />
        <TextBoxStyle Font-Size="0.8em" />
        <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        <SubmitButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px"
            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
        <MailDefinition CC="webmaster@kofc-wa.org" From="noreply@kofc-wa.org" Priority="High"
            Subject="Your Password for the State Website">
        </MailDefinition>
    </asp:PasswordRecovery>
            </td>
        </tr>
        <tr>
            <td class="TDNB" style="border-right: black thin solid; border-top: black thin solid;
                border-left: black thin solid; border-bottom: black thin solid; text-align: left">
                <span style="color: red">Note:&nbsp; Your password will be reset to a random set of
                    characters and delivered to the email address listed when you created your account.&nbsp;
                    When you receive the email, go back to the Login screen and use the new password
                    to login.&nbsp;
                    <br />
                    <br />
                    Remember that, once logged in, you can go to the Members Only menu and Change Your
                    Password back to whatever you want it to be.</span></td>
        </tr>
    </table>

</asp:Content>

