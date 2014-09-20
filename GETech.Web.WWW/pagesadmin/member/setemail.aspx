<%@ Page Title="重置Email" Language="C#" MasterPageFile="~/templates/PagesadminMasterPage.master"
    AutoEventWireup="true" CodeFile="setemail.aspx.cs" Inherits="pagesadmin_member_setemail" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <form runat="server">
    <fieldset>
        <legend>重置Email</legend>
        <table cellpadding="4" cellspacing="0">
            <tr>
                <td>
                    旧Email：
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" Enabled="false" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    新Email：
                </td>
                <td>
                    <asp:TextBox ID="txtNewEmail" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" ControlToValidate="txtNewEmail" SetFocusOnError="true"
                        runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="保存" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <font color="red"><asp:Literal ID="ltMsg" runat="server"></asp:Literal></font>
                </td>
            </tr>
        </table>
    </fieldset>
    </form>
</asp:Content>
