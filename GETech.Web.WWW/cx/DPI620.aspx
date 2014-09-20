<%@ Page Title="��³��DPI620��DPI610/615ϵ�����������ʱ�����" Language="C#" MasterPageFile="~/cx/MasterPage.master"
    AutoEventWireup="true" CodeFile="DPI620.aspx.cs" Inherits="cx_DPI620" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        body
        {
            background: #999999;
        }
        .box
        {
            display: none;
        }
    </style>

    <script type="text/javascript">
        function showSuccessDialog() {
            $('#box').dialog({
                title: '��ϲ�������ѳɹ��ύ',
                modal: true,
                width: 600,
                height: 300,
                beforeClose: function(event, ui) {
                    if (window.confirm('����û�в������Ŷ��\r\n�Ƿ�Ҫ�رգ�')) {
                        return true;
                    }
                    return false;
                },
                close: function() {
                    window.location.href = '/cx/dpi620.aspx';
                }
            })
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">
    <div class="content2">
        <h2>
            ��³��DPI620��DPI610/615ϵ�����������ʱ�����</h2>
        <p>
            ���ڻ�ڼ乺���³��DPI620��DPI610/615��Ʒ��������ѻ�ü�ֵԼ3000����ҵ������������μ��н��ʴ�Ӯȡ���Ʒ��</p>
    </div>
    <div class="xinxi2">
        <p>
            ����д���������Ϣ����ѡ������Ҫ�Ĳ�Ʒ��</p>
        <table width="771" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#f8981d"
            style="margin-top: 12px; font-family: ������Բ��;">
            <tr>
                <td width="120" height="25" bgcolor="#fee7cb">
                    &nbsp;��&nbsp;����
                </td>
                <td width="260" height="25" bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtRealname"></asp:TextBox><asp:RequiredFieldValidator
                        runat="server" ControlToValidate="txtRealname" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td width="124" height="25" bgcolor="#fee7cb">
                    &nbsp;��&nbsp;����
                </td>
                <td width="254" bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtMobile"></asp:TextBox><asp:RequiredFieldValidator
                        runat="server" ControlToValidate="txtMobile" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td height="25" bgcolor="#fee7cb">
                    &nbsp;��˾���ƣ�
                </td>
                <td height="25" bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtCompany"></asp:TextBox><asp:RequiredFieldValidator
                        runat="server" ControlToValidate="txtCompany" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td height="25" bgcolor="#fee7cb">
                    &nbsp;ְ&nbsp;��
                </td>
                <td bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtPosition"></asp:TextBox><asp:RequiredFieldValidator
                        runat="server" ControlToValidate="txtPosition" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td height="25" bgcolor="#fee7cb">
                    &nbsp;�������ţ�
                </td>
                <td height="25" bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtDepartment"></asp:TextBox><asp:RequiredFieldValidator
                        runat="server" ControlToValidate="txtDepartment" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td height="25" bgcolor="#fee7cb">
                    &nbsp;�칫�绰��
                </td>
                <td bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtPhone"></asp:TextBox><asp:RequiredFieldValidator
                        runat="server" ControlToValidate="txtPhone" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td height="25" bgcolor="#fee7cb">
                    &nbsp;Email��
                </td>
                <td height="25" bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtEmail"></asp:TextBox><asp:RequiredFieldValidator
                        runat="server" ControlToValidate="txtEmail" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ControlToValidate="txtEmail" Display="Dynamic" runat="server"
                        ErrorMessage="��ʽ����ȷ" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td height="25" bgcolor="#fee7cb">
                    &nbsp;������Ϣ��Դ��
                </td>
                <td height="25" bgcolor="#FFFFFF">
                    <asp:DropDownList ID="ddlfrom" runat="server">
                        <asp:ListItem>��վ���</asp:ListItem>
                        <asp:ListItem>��־���</asp:ListItem>
                        <asp:ListItem>����</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </div>
    <div class="xinxi2">
        <p>
            �����Ʒ�ɹ�ѡ��</p>
        <table width="771" border="0" align="center" cellpadding="0" cellspacing="0" style="line-height: 20px;
            font-family: ������Բ��;">
            <tr>
                <td width="47" align="center" bgcolor="#fee7cb">
                    <asp:CheckBox runat="server" ID="cbP1" />
                </td>
                <td width="32" height="30" align="center" bgcolor="#fee7cb" style="color: #f8981d;
                    font-weight: 600; font-size: 22px; font-family: ������Բ��;">
                    ��
                </td>
                <td width="311" height="60" align="left" bgcolor="#fee7cb">
                    ��³��DPI620�๦�ܹ����ź�У����
                </td>
                <td width="65" align="center" bgcolor="#fee7cb">
                    ����̨��
                </td>
                <td width="107" align="left" bgcolor="#fee7cb">
                    <asp:DropDownList ID="ddlP1PC" runat="server">
                        <asp:ListItem>1̨</asp:ListItem>
                        <asp:ListItem>2̨</asp:ListItem>
                        <asp:ListItem>3̨</asp:ListItem>
                        <asp:ListItem>����3̨</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td width="120" align="right" bgcolor="#fee7cb">
                    ���¹���ʱ��
                </td>
                <td width="90" align="right" bgcolor="#fee7cb">
                    <asp:TextBox runat="server" ID="txtP1DateTime" Width="80"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="7" align="center" bgcolor="#fee7cb">
                    <img src="images/xian.jpg" width="772" height="1" />
                </td>
            </tr>
            <tr>
                <td width="47" align="center" valign="middle" bgcolor="#fee7cb">
                    &nbsp;
                </td>
                <td width="32" height="30" align="center" valign="middle" bgcolor="#fee7cb" style="color: #f8981d;
                    font-weight: 600; font-size: 22px; font-family: ������Բ��;">
                    ��
                </td>
                <td height="60" colspan="5" align="left" valign="middle" bgcolor="#fee7cb">
                    DPI620�����<br />
                    DPI620�ɳ��﮵��
                </td>
            </tr>
        </table>
        <table width="771" border="0" align="center" cellpadding="0" cellspacing="0" style="line-height: 20px;
            margin-top: 15px; font-family: ������Բ��;">
            <tr>
                <td width="42" align="center" bgcolor="#fee7cb">
                    <asp:CheckBox runat="server" ID="cbP2" />
                </td>
                <td width="36" height="30" align="center" bgcolor="#fee7cb" style="color: #f8981d;
                    font-weight: 600; font-size: 22px; font-family: ������Բ��;">
                    ��
                </td>
                <td width="312" height="60" align="left" bgcolor="#fee7cb">
                    ��³��DPI620��ѹ��������ѹ��ģ��
                </td>
                <td width="65" align="center" bgcolor="#fee7cb">
                    ����̨��
                </td>
                <td width="107" align="left" bgcolor="#fee7cb">
                    <asp:DropDownList ID="ddlP2PC" runat="server">
                        <asp:ListItem>1̨</asp:ListItem>
                        <asp:ListItem>2̨</asp:ListItem>
                        <asp:ListItem>3̨</asp:ListItem>
                        <asp:ListItem>����3̨</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td width="120" align="right" bgcolor="#fee7cb">
                    ���¹���ʱ��
                </td>
                <td width="90" align="right" bgcolor="#fee7cb">
                    <asp:TextBox runat="server" ID="txtP2DateTime" Width="80"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="7" align="center" bgcolor="#fee7cb">
                    <img src="images/xian.jpg" width="772" height="1" />
                </td>
            </tr>
            <tr>
                <td width="42" align="center" valign="middle" bgcolor="#fee7cb">
                    &nbsp;
                </td>
                <td width="36" height="30" align="center" valign="middle" bgcolor="#fee7cb" style="color: #f8981d;
                    font-weight: 600; font-size: 22px; font-family: ������Բ��;">
                    ��
                </td>
                <td height="60" colspan="5" align="left" valign="middle" bgcolor="#fee7cb">
                    610-100��ѹ�ܺ�ת����ͷ�׼�<br />
                    IO620-CASE-3ѹ��������Я��
                </td>
            </tr>
        </table>
        <table width="771" border="0" align="center" cellpadding="0" cellspacing="0" style="line-height: 20px;
            margin-top: 15px; font-family: ������Բ��;">
            <tr>
                <td width="44" align="center" bgcolor="#fee7cb">
                    <asp:CheckBox runat="server" ID="cbP3" />
                </td>
                <td width="33" height="30" align="center" bgcolor="#fee7cb" style="color: #f8981d;
                    font-weight: 600; font-size: 22px; font-family: ������Բ��;">
                    ��
                </td>
                <td width="313" height="60" align="left" bgcolor="#fee7cb">
                    ��³��DPI610/615ϵ��
                </td>
                <td width="65" align="center" bgcolor="#fee7cb">
                    ����̨��
                </td>
                <td width="107" align="left" bgcolor="#fee7cb">
                    <asp:DropDownList ID="ddlP3PC" runat="server">
                        <asp:ListItem>1̨</asp:ListItem>
                        <asp:ListItem>2̨</asp:ListItem>
                        <asp:ListItem>3̨</asp:ListItem>
                        <asp:ListItem>����3̨</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td width="120" align="right" bgcolor="#fee7cb">
                    ���¹���ʱ��
                </td>
                <td width="90" align="right" bgcolor="#fee7cb">
                    <asp:TextBox runat="server" ID="txtP3DateTime" Width="80"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="7" align="center" bgcolor="#fee7cb">
                    <img src="images/xian.jpg" width="772" height="1" />
                </td>
            </tr>
            <tr>
                <td width="44" align="center" valign="middle" bgcolor="#fee7cb">
                    &nbsp;
                </td>
                <td width="33" height="30" align="center" valign="middle" bgcolor="#fee7cb" style="color: #f8981d;
                    font-weight: 600; font-size: 22px; font-family: ������Բ��;">
                    ��
                </td>
                <td height="60" colspan="5" align="left" valign="middle" bgcolor="#fee7cb">
                    610-100��ѹ�ܺ�ת����ͷ�׼�<br />
                    �ɳ���غͳ����
                </td>
            </tr>
        </table>
    </div>
    <div style="background: #fff; padding-top: 20px; text-align: center;">
        <table border="0" cellspacing="0" cellpadding="0" align="center" width="980">
            <tr>
                <td>
                    <div align="center">
                        <asp:Button runat="server" ID="btnOK" Text="�����ύ" OnClientClick="if(!checkForm()) return false;" />
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div style="height: 30px; background: #fff; width: 980px;">
    </div>
    <div class="box" id="box">
        <p>
            ���Ѿ��ɹ��ύ��Ϣ���������ٺ�Ϊ<%=trackId %>, �˺����ѷ�������ע���������,���ǻ���ר������������������ϵ�㡣�뱣����ĸ��ٺţ��Ա����ѯ���ȡ�������������ѯ�й��ͻ��������ģ�800-915-9966</p>
        <div style="margin-top: 12px;">
            <table width="388" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="142" align="center">
                        <a href="DPI620Survey.aspx?k=<%=encryptTrackId %>">�����н�����</a>
                    </td>
                    <td width="246">
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <script type="text/javascript">
        $(function() {
            var datepickerOption = {
                dateFormat: 'yy-mm-dd',
                minDate: new Date(2012, 4 - 1, 16),
                maxDate: new Date(2012, 7 - 1, 16)
            };
            $("#<%=txtP1DateTime.ClientID %>").datepicker(datepickerOption);
            $("#<%=txtP2DateTime.ClientID %>").datepicker(datepickerOption);
            $("#<%=txtP3DateTime.ClientID %>").datepicker(datepickerOption);
        })
        function checkForm() {
            var cbNames = ['<%=cbP1.ClientID %>', '<%=cbP2.ClientID %>', '<%=cbP3.ClientID %>'],current = 0;
            for (i in cbNames) {
                if ($('#'+cbNames[i]).attr('checked')) {
                    current++;
                }
            }
            if (current == 0) {
                alert('��������ѡ��һ����Ʒ');
                return false;
            }
            return true;
        }
    </script>

</asp:Content>
