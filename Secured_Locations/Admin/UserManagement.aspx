<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="UserManagement.aspx.cs" Inherits="Secured_Locations_Admin_UserManagement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <cc1:TabContainer ID="tcUserManagement" runat="server" Width="350px">
            <cc1:TabPanel ID="tpOnline" BackColor="Silver" runat="server">
                <HeaderTemplate>
                    <asp:Label runat="server" CssClass="tabHeader">
                        Sæt Online/Admin
                    </asp:Label>
                </HeaderTemplate>
                <ContentTemplate>
                    <asp:Label ID="lblMsg" runat="server" Visible="false" Text="lblMsg"></asp:Label>
                    <asp:GridView ID="grdvwManageUsers" ShowFooter="true" runat="server" AutoGenerateColumns="False" CellPadding="10" OnRowDataBound="grdvwManageUsers_RowDataBound" style="text-align: center" Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="Bruger">
                                <ItemTemplate>
                                    <asp:Label ID="lblUsername" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Button ID="btnSave" runat="server" Text="Gem" OnClick="btnSave_Click" Width="150px" />
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Online">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkbxOnline" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Admin">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkbxAdmin" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </cc1:TabPanel>
            <cc1:TabPanel ID="tpCreateUser" BorderStyle="Solid" BorderColor="Gray" BorderWidth="1px" BackColor="Silver" runat="server">
                <HeaderTemplate>
                    <asp:Label runat="server" CssClass="tabHeader">
                        Opret bruger
                    </asp:Label>
                </HeaderTemplate>
                <ContentTemplate>
                    <br />
                    <asp:CreateUserWizard ID="cuwCreateUser" runat="server" LoginCreatedUser="False" OnCreatedUser="cuwCreateUser_CreatedUser" OnCreatingUser="cuwCreateUser_CreatingUser" RequireEmail="False" Width="300px" NavigationStyle-HorizontalAlign="Center">
                        <WizardSteps>
                            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" Title="">
                            </asp:CreateUserWizardStep>
                            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                    </asp:CreateUserWizard>
                </ContentTemplate>
            </cc1:TabPanel>
            <cc1:TabPanel ID="tpChangePassword" BorderStyle="Solid" BorderColor="Gray" BorderWidth="1px"  BackColor="Silver" runat="server">
                <HeaderTemplate>
                    <asp:Label runat="server" ToolTip="Skift password eller slet bruger" CssClass="tabHeader">
                        Rediger bruger
                    </asp:Label>
                </HeaderTemplate>
                <ContentTemplate>
                    <br />
                    <asp:Table ID="tblChangePassword" runat="server" CellPadding="5">
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                                <asp:Label ID="lblChangePasswordTitle" CssClass="title" runat="server" Text="Skift password"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2">
                                <asp:Label ID="lblPasswordMsg" runat="server" CssClass="error" Text="lblError" Visible="false"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">
                                Bruger:                        
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlChangePasswordUser" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">
                                Password:                        
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">
                                Gentag password:                        
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:TextBox ID="txtPassword2" runat="server" TextMode="Password"></asp:TextBox>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                                <asp:Button ID="btnChangePassword" runat="server" Text="Skift password" OnClick="btnChangePassword_Click" Width="150px" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                    <br />
                    <hr style="border-style: none;background-color:gray; height:1px;"/>
                    <asp:Table ID="tblDeleteUser" runat="server" CellPadding="5">
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                                <asp:Label ID="lblDeleteUserTitle" CssClass="title" runat="server" Text="Slet bruger"></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell HorizontalAlign="Right">
                                Bruger:                        
                            </asp:TableCell>
                            <asp:TableCell>
                                <asp:DropDownList ID="ddlDeleteUser" DataValueField="ProviderUserKey" DataTextField="UserName" runat="server"></asp:DropDownList>
                            </asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                                <asp:Button ID="btnDeleteUser" runat="server" Text="Slet bruger" OnClick="btnDeleteUser_Click" OnClientClick="return confirm('Er du sikker på at du vil slette denne bruger?');" Width="150px" />
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </ContentTemplate>
            </cc1:TabPanel>
        </cc1:TabContainer>
    </center>
</asp:Content>
