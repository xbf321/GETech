<%@ Page Title="检测科技网站管理系统" Language="C#" MasterPageFile="~/templates/EmptyMasterPageWithoutForm.master"
    AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="pagesadmin_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link href="css/pagesadmin.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        if (top != self) {
            top.location = self.location;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <form runat="server">
    <div id="loginBar">
        <div class="loginTitle">
            <img src="images/loginTitle.gif" width="359" height="60" /></div>
        <div class="loginUser">
            <ul>
                <li><strong>用户名：</strong><br />
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="loginInput"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" SetFocusOnError="true"
                        Display="Dynamic" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </li>
                <li><strong>密&nbsp;&nbsp;&nbsp; 码：</strong><br />
                    <asp:TextBox ID="txtUserPwd" runat="server" CssClass="loginInput" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                        Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserPwd"
                        SetFocusOnError="true" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </li>
                <li>
                    <asp:Button ID="btnLogin" runat="server" Text="登录" />&nbsp;&nbsp;<a href="register.aspx">注册</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                        href="findpwd.aspx">找回密码</a></li>
                <li><font color="red">
                    <asp:Literal ID="ltMsg" runat="server"></asp:Literal></font></li>
            </ul>
        </div>
    </div>
    </form>
</asp:Content>
