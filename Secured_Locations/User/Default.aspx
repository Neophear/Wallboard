<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Secured_Locations_User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" CellPadding="10" DataSourceID="sdsProducts" BackColor="#CCCCCC" Font-Bold="True" Font-Strikeout="False" ForeColor="#333399">
            <Columns>
                <asp:TemplateField HeaderText="Produkt">
                    <ItemTemplate>
                        <asp:Label ID="lblProductName" CssClass='<%# (bool)Eval("IsFocus") ? "focusProduct" : "" %>' runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        <asp:HiddenField ID="hdnfldProductID" Value='<%# Eval("ProductID") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Antal solgt">
                    <ItemTemplate>
                        <asp:Label ID="lblSold" Width="100%" CssClass='<%# "targets, level" + Eval("LevelComplete").ToString() %>' runat="server" Text='<%# Eval("Current") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mål">
                    <ItemTemplate>
                        <asp:Label ID="lblTarget" runat="server" CssClass="targets" Text='<%# Eval("Target") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Sæt">
                    <ItemTemplate>
                        <asp:Button ID="btnDown" runat="server" CommandArgument='<%# Eval("ProductID") %>' BackColor="#FF5F5F" Text="-" Width="25" OnClick="btnDown_Click" />
                        <asp:Button ID="btnUp" runat="server" CommandArgument='<%# Eval("ProductID") %>' BackColor="#5EFF5E" Text="+" Width="25" OnClick="btnUp_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="GetUserTargetsTable" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="btnUpdate" runat="server" Text="Opdater" OnClick="btnUpdate_Click" Width="150px" />
    </center>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="cphNavigation">
    <asp:Button ID="btnWallboard" runat="server" Text="Wallboard" OnClick="btnWallboard_Click" Width="150px" />
</asp:Content>
