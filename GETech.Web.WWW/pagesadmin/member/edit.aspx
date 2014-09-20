<%@ Page Title="用户编辑" Language="C#" MasterPageFile="~/templates/PagesadminMasterPage.master"
    AutoEventWireup="true" CodeFile="edit.aspx.cs" Inherits="pagesadmin_member_edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <fieldset>
        <legend>用户编辑</legend>
        <form runat="server">
        <table>
            <tr>
                <td>
                    用户名：
                </td>
                <td>
                    <asp:TextBox ID="txtUserName" Enabled="false" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    是否审核
                </td>
                <td>
                    <asp:CheckBox ID="cbIsPass" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="保存" />
                </td>
            </tr>
        </table>
        </form>
    </fieldset>
</asp:Content>
