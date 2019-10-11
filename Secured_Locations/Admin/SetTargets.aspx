<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SetTargets.aspx.cs" Inherits="Secured_Locations_Admin_SetTargets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" lang="javascript">
        function uncheckOthers(id)
        {
            var elm = document.getElementsByTagName('input');

            for(var i = 0; i < elm.length; i++)
            {            
                if(elm.item(i).type == "checkbox" && elm.item(i)!=id)
                    elm.item(i).checked = false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <table style="background-color:silver;">
            <tr>
                <td>
                    <asp:Label ID="lblProductTargetingTitle" runat="server" Text="Sæt produkt targets"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblUserTargetingTitle" runat="server" Text="Sæt ekstra targets"></asp:Label> 
                    <asp:DropDownList ID="ddlUser" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlUser_SelectedIndexChanged" DataValueField="ProviderUserKey" DataTextField="UserName" AppendDataBoundItems="True">
                        <asp:ListItem Selected="True" Value="">--Vælg bruger--</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvProductTargeting" runat="server" AutoGenerateColumns="False" CellPadding="10" OnRowDataBound="gvProductTargeting_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Produkt">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    <asp:HiddenField ID="hdnfldProductID" Value='<%# Eval("ID") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Antal">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtCount" runat="server" TextMode="Number" Text='<%# Eval("TargetCount") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fokus">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkbxFocus" Checked='<%# (bool)Eval("IsFocus") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="btnSetTargets" runat="server" Text="Opdater" OnClick="btnSetTargets_Click" BackColor="White" BorderColor="Gray" BorderStyle="Outset" ForeColor="#333399" Width="150px" />
                </td>
                <td>
                    <asp:GridView ID="gvUserTargeting" runat="server" AutoGenerateColumns="False" CellPadding="10">
                        <Columns>
                            <asp:TemplateField HeaderText="Produkt">
                                <ItemTemplate>
                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                    <asp:HiddenField ID="hdnfldProductID" Value='<%# Eval("ID") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Antal">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtCount" runat="server" TextMode="Number" Text='<%# Eval("Extra") %>'></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="btnSetUserTargeting" runat="server" Visible="false" Text="Sæt mål" OnClick="btnSetUserTargeting_Click" BackColor="White" BorderColor="Gray" BorderStyle="Outset" ForeColor="#333399" Width="150px" />
                </td>
            </tr>
        </table>
    </center>
</asp:Content>

