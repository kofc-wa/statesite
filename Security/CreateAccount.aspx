<%@ Page Language="VB" MasterPageFile="~/KofCWSC.master" AutoEventWireup="false"
    CodeFile="CreateAccount.aspx.vb" Inherits="Default2" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="text-align: center">
        <table border="0" style="width: 720px" align=center>
            <tr>
                <td style="width: 360px; height: 290px;" valign="top">
                    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" BackColor="#FFFBD6" BorderColor="#FFDFAD"
                        BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em"
                        ContinueDestinationPageUrl="~/Default.aspx" CancelDestinationPageUrl="~/Default.aspx"
                        UserNameLabelText="K of C Member Number:" Width="360px" 
                        UserNameRequiredErrorMessage="K of C Member Number is required." 
                        DuplicateUserNameErrorMessage="Username already setup. Please contact webmaster@kofc-wa.org">
                        <WizardSteps>
                            <asp:CreateUserWizardStep runat="server">
                            </asp:CreateUserWizardStep>
                            <asp:CompleteWizardStep runat="server">
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                        <SideBarStyle BackColor="#990000" Font-Size="0.9em" VerticalAlign="Top" />
                        <TitleTextStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <SideBarButtonStyle ForeColor="White" />
                        <NavigationButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid"
                            BorderWidth="1px" Font-Names="Verdana" ForeColor="#990000" />
                        <HeaderStyle BackColor="#FFCC66" BorderColor="#FFFBD6" BorderStyle="Solid" BorderWidth="2px"
                            Font-Bold="True" Font-Size="0.9em" ForeColor="#333333" HorizontalAlign="Center" />
                        <CreateUserButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid"
                            BorderWidth="1px" Font-Names="Verdana" ForeColor="#990000" />
                        <ContinueButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid"
                            BorderWidth="1px" Font-Names="Verdana" ForeColor="#990000" />
                    </asp:CreateUserWizard>
                    <asp:Label ID="errMsg" runat="server" CssClass="ErrText" Width="100%"></asp:Label>
                </td>
                <td align="center" valign="top" width=360 style="height: 290px">
                    <asp:Label ID="lblCreateAccountHelp" runat="server" CssClass="HelpText" Height="269px" Text="You must us a valid Knights of Columbus, Washington Juristiction, Member Number."
                        Width="320px"></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Content>
