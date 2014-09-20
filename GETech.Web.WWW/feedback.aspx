<%@ Page Title="" Language="C#" MasterPageFile="~/templates/BaseMasterPage.master"
    AutoEventWireup="true" CodeFile="feedback.aspx.cs" ValidateRequest="false" Inherits="feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <fieldset>
        <legend>在线留言</legend>
        <form runat="server">
        <table cellpadding="4" cellspacing="0">
            <tr>
                <td align="right">
                    姓名：
                </td>
                <td>
                    <asp:TextBox ID="txtRealName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" SetFocusOnError="true" ControlToValidate="txtRealName"
                        runat="server" ErrorMessage="必填"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    电话：
                </td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator2" SetFocusOnError="true" ControlToValidate="txtPhone"
                        runat="server" ErrorMessage="必填"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    Email：
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator3" SetFocusOnError="true" ControlToValidate="txtEmail"
                        runat="server" ErrorMessage="必填" Display="Dynamic"></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1" ValidationExpression="^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$"
                            runat="server" ErrorMessage="Email格式不正确" ControlToValidate="txtEmail" SetFocusOnError="true"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td valign="top" align="right">
                    内容：
                </td>
                <td>
                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Width="400" Height="200"></asp:TextBox><br />
                    (不支持Html)<asp:RequiredFieldValidator ID="RequiredFieldValidator4" SetFocusOnError="true"
                        ControlToValidate="txtContent" runat="server" ErrorMessage="必填"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    验证码：
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtCode" Width="50px" MaxLength="4"></asp:TextBox>
                    <asp:Image runat="server" ID="imageCode" />
                    <Goodspeed:ValidateCode runat="server" ControlToValidate="txtCode" ID="ValidateCodeControl" Text="验证码不正确">
                    </Goodspeed:ValidateCode>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnPost" runat="server" Text="写好了,我要留言" />
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <font color="red">
                        <asp:Literal ID="ltMsg" runat="server"></asp:Literal></font>
                </td>
            </tr>
        </table>
        </form>
    </fieldset>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpFooterScript" runat="Server">
</asp:Content>
