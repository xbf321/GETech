<%@ Page Title="找回密码" Language="C#" MasterPageFile="~/templates/BaseMasterPage.master"
    AutoEventWireup="true" CodeFile="findpwd.aspx.cs" Inherits="findpwd" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <h2>
        找回密码</h2>
    <form runat="server">
    <table cellpadding="0" cellspacing="6">
        <tr>
            <td align="right">
                用户名：
            </td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" ControlToValidate="txtUserName" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                Email：
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" ControlToValidate="txtEmail" runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btn_Ok" runat="server" Text="找回密码" />&nbsp;&nbsp;<a href="login.aspx">登录</a>&nbsp;&nbsp;<a
                    href="register.aspx">注册</a>
                <br />
                <font color="red">
                    <asp:Literal ID="ltMsg" runat="server"></asp:Literal></font>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
