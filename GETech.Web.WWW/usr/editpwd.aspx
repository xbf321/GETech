<%@ Page Title="修改密码" Language="C#" MasterPageFile="~/templates/UsrMasterPage.master"
    AutoEventWireup="true" CodeFile="editpwd.aspx.cs" Inherits="usr_editpwd" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <div class="usr-nav">
        <ul>
            <li><a href="index.aspx">用户中心</a></li>
            <li class="on"><a href="editpwd.aspx">修改密码</a></li>
        </ul>
    </div>
    <form id="Form1" runat="server">
    <table cellpadding="0" cellspacing="6" border="0">
        <tr>
            <td align="right">
                旧密码：
            </td>
            <td>
                <asp:TextBox ID="txtOldPwd" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator1" ControlToValidate="txtOldPwd" runat="server" ErrorMessage="必填"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                新密码：
            </td>
            <td>
                <asp:TextBox ID="txtNewPwd" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" ControlToValidate="txtNewPwd" runat="server" ErrorMessage="必填"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                确认新密码：
            </td>
            <td>
                <asp:TextBox ID="txtConfirmNewPwd" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator3" ControlToValidate="txtConfirmNewPwd" runat="server"
                    ErrorMessage="必填"></asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator1"
                        ControlToCompare="txtNewPwd" ControlToValidate="txtConfirmNewPwd" runat="server"
                        ErrorMessage="新密码不一致"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btn_Update" runat="server" Text="更新" /><br />
                <font color="red">
                    <asp:Literal ID="ltMsg" runat="server"></asp:Literal></font>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>
