<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Secured_Locations_Admin_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <br />
    <br />
    <asp:Button ID="btnResetTargets" runat="server" Text="Nulstil Tavle" BackColor="Red" OnClick="btnResetTargets_Click" BorderColor="Gray" Font-Bold="True" ForeColor="White" Width="150px" /><br />
    <br />
    <br />
    <br />
    <asp:Button ID="btnTargetset" runat="server" Text="Target Management" OnClick="btnTargetset_Click" Width="150" /><br />
    <asp:Button ID="btnUserManagement" runat="server" Text="Bruger Management" OnClick="btnUserManagement_Click" Width="150" /><br />
    <asp:Button ID="btnProductManagement" runat="server" Text="Produkt Management" OnClick="btnProductManagement_Click" Width="150" /><br />
    <br />
    <asp:Button ID="btnWallboard" runat="server" Text="Wallboard" Width="150" OnClick="btnWallboard_Click" />
</asp:Content>

