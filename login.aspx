<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
         <asp:LoginView ID="lgnvwMain" runat="server">
            <AnonymousTemplate>
                <asp:Login ID="lgnMain" runat="server" OnLoggedIn="lgnMain_LoggedIn" BackColor="Silver" LoginButtonText="Log Ind">
                    <LoginButtonStyle BackColor="White" BorderColor="Gray" BorderStyle="Outset" />
                </asp:Login>
            </AnonymousTemplate>
            <LoggedInTemplate>
                Velkommen <asp:LoginName ID="LoginName1" runat="server" /> 
                <asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="RedirectToLoginPage" />
            </LoggedInTemplate>
        </asp:LoginView>
    </center>
</asp:Content>

