<%@ Page Title="用户注册" Language="C#" MasterPageFile="~/templates/BaseMasterPage.master"
    AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <h2>
        用户注册</h2>
    <form runat="server">
    <table cellpadding="0" cellspacing="4" border="0">
        <tr>
            <td align="right">
                用户名：
            </td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator6" runat="server" ErrorMessage="必填" ControlToValidate="txtUserName"
                    SetFocusOnError="true"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                密码：
            </td>
            <td>
                <asp:TextBox ID="txtPwd" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator7" runat="server" ErrorMessage="必填" ControlToValidate="txtPwd"
                    SetFocusOnError="true"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                确认密码：
            </td>
            <td>
                <asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator8" runat="server" ErrorMessage="必填" ControlToValidate="txtConfirmPwd"
                    SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator><asp:CompareValidator
                        ID="CompareValidator1" ControlToCompare="txtPwd" ControlToValidate="txtConfirmPwd"
                        runat="server" ErrorMessage="两次输入的密码不一致"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                Email：
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>(用于找回密码)<asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" runat="server" ErrorMessage="必填" ControlToValidate="txtEmail"
                    SetFocusOnError="true"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                姓名：
            </td>
            <td>
                <asp:TextBox ID="txtRealName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" runat="server" ErrorMessage="必填" ControlToValidate="txtRealName"
                    SetFocusOnError="true"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                公司：
            </td>
            <td>
                <asp:TextBox ID="txtCompany" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3" runat="server" ErrorMessage="必填" ControlToValidate="txtCompany"
                    SetFocusOnError="true"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                电话：
            </td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator4" runat="server" ErrorMessage="必填" ControlToValidate="txtPhone"
                    SetFocusOnError="true"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                传真：
            </td>
            <td>
                <asp:TextBox ID="txtFax" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator5" runat="server" ErrorMessage="必填" ControlToValidate="txtFax"
                    SetFocusOnError="true"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top">
                感兴趣的产品：
            </td>
            <td>
                <asp:TextBox ID="txtInterestProduct" TextMode="MultiLine" Width="200" Height="50"
                    runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                是否愿意收到我们有关新产品的邮件：
            </td>
            <td>
                <asp:CheckBox ID="cbResive" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btnReg" runat="server" Text="我填好了,注册" />&nbsp;&nbsp;<a href="login.aspx">登录</a>&nbsp;&nbsp;<a
                    href="findpwd.aspx">找回密码</a><br />
                <font color="red">
                    <asp:Literal ID="ltMsg" runat="server"></asp:Literal></font>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
