<%@ Page Title="用户登录" Language="C#" MasterPageFile="~/templates/BaseMasterPage.master"
    AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <form runat="server">
    <h2>
        用户登录</h2>
    <table>
        <tr>
            <td align="right">
                用户名：
            </td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" ControlToValidate="txtUserName" runat="server" ErrorMessage="必填"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                密码：
            </td>
            <td>
                <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" ControlToValidate="txtPwd" runat="server" ErrorMessage="必填"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btn_Login" runat="server" Text="登录" />&nbsp;&nbsp;<a href="register.aspx">注册</a>&nbsp;&nbsp;<a
                    href="findpwd.aspx">找回密码</a><br />
                <font color="red">
                    <asp:Literal ID="ltMsg" runat="server"></asp:Literal></font>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
