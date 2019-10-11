<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" lang="javascript">
        //Sæt sekunder for refresh her:
        var sekunder = 10;

        document.onload = setTimeout("location.reload(true);",sekunder * 1000);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="gvTargets" runat="server" CellPadding="5" RowStyle-HorizontalAlign="Center" Width="100%" BackColor="Silver" CssClass="wallboard" DataSourceID="sdsTargets" OnRowDataBound="gvTargets_RowDataBound" Font-Bold="True" GridLines="Both">
        <Columns>
            <asp:TemplateField HeaderText="Bruger" SortExpression="UserRefID">
                <ItemTemplate>
                    <asp:Label ID="lblUser" runat="server" Text='<%# Membership.GetUser(Eval("UserRefID")).UserName %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsTargets" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetUsersTargets" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="cphNavigation">
    <asp:Button ID="btnUser" runat="server" Visible='<%# User.Identity.IsAuthenticated %>' Text="Bruger" Width="150px" OnClick="btnUser_Click" />
</asp:Content>

