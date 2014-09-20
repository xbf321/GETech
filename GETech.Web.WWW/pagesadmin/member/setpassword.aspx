<%@ Page Title="重置密码" Language="C#" MasterPageFile="~/templates/PagesadminMasterPage.master" AutoEventWireup="true" CodeFile="setpassword.aspx.cs" Inherits="pagesadmin_member_setpassword" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" Runat="Server">
<form id="Form1" runat="server">
    <fieldset>
        <legend>重置密码</legend>
        <table cellpadding="4" cellspacing="0">
            <tr>
                <td>
                    旧密码：
                </td>
                <td>
                    <asp:TextBox ID="txtUserPwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator3" ControlToValidate="txtUserPwd" SetFocusOnError="true"
                        runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    新密码：
                </td>
                <td>
                    <asp:TextBox ID="txtNewUserPwd" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" ControlToValidate="txtNewUserPwd" SetFocusOnError="true"
                        runat="server" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    新密码：
                </td>
                <td>
                    <asp:TextBox ID="txtNewConfirmUserPwd" runat="server" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2" ControlToValidate="txtNewConfirmUserPwd" SetFocusOnError="true"
                        runat="server" Display="Dynamic" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator><asp:CompareValidator
                            ID="CompareValidator1" ControlToCompare="txtNewUserPwd" ControlToValidate="txtNewConfirmUserPwd" runat="server" ErrorMessage="CompareValidator"></asp:CompareValidator>
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

