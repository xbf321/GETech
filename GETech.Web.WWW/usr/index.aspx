<%@ Page Title="用户中心" Language="C#" MasterPageFile="~/templates/UsrMasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="usr_index" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <div class="usr-nav">
        <ul>
            <li class="on"><a href="index.aspx">用户中心</a></li>
            <li><a href="editpwd.aspx">修改密码</a></li>
        </ul>
    </div>
    <form id="Form1" runat="server">
    <table cellpadding="0" cellspacing="6" border="0">
        <tr>
            <td align="right">
                Email：
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><asp:RequiredFieldValidator
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
                <asp:Button ID="btn_Update" runat="server" Text="更新" /><br />
                <font color="red">
                    <asp:Literal ID="ltMsg" runat="server"></asp:Literal></font>
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

