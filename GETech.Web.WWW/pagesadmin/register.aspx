<%@ Page Title="管理员注册" Language="C#" MasterPageFile="~/templates/EmptyMasterPageWithoutForm.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="pagesadmin_register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        body{font-size:12px;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" Runat="Server">
<form runat="server">
    <table cellpadding="4" cellspacing="0">
        <tr>
            <td align="right">用户名：</td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" SetFocusOnError="true"
                    ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">密码：</td>
            <td>
                <asp:TextBox ID="txtUserPwd" TextMode="Password" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserPwd" SetFocusOnError="true"
                    ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">确认密码：</td>
            <td>
                <asp:TextBox ID="txtConfirmUserPwd" TextMode="Password" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator4" Display="Dynamic" runat="server" ControlToValidate="txtConfirmUserPwd" SetFocusOnError="true"
                    ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator><asp:CompareValidator
                        ID="CompareValidator1" ControlToCompare="txtUserPwd" ControlToValidate="txtConfirmUserPwd" SetFocusOnError="true" runat="server" ErrorMessage="两次输入的密码不同"></asp:CompareValidator></td>
        </tr>
        <tr>
            <td align="right">Email：</td>
            <td>
                <asp:TextBox ID="txtUserEmail" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtUserEmail" SetFocusOnError="true"
                    ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnRegister" runat="server" Text="注册" /></td>
        </tr>
        <tr>
            <td></td>
            <td><a href="login.aspx">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="findpwd.aspx">找回密码</a></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <font color="red"><asp:Literal ID="ltMsg" runat="server"></asp:Literal></font></td>
        </tr>
    </table>
</form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpFooterScript" Runat="Server">
</asp:Content>

