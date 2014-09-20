<%@ Page Title="德鲁克DPI620、DPI610/615系列真情回馈限时促销活动" Language="C#" MasterPageFile="~/cx/MasterPage.master"
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
                title: '恭喜您，您已成功提交',
                modal: true,
                width: 600,
                height: 300,
                beforeClose: function(event, ui) {
                    if (window.confirm('您还没有参与调查哦！\r\n是否要关闭？')) {
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
            德鲁克DPI620、DPI610/615系列真情回馈限时促销活动</h2>
        <p>
            凡在活动期间购买德鲁克DPI620或DPI610/615产品，即可免费获得价值约3000人民币的相关配件，并参加有奖问答赢取丰厚奖品。</p>
    </div>
    <div class="xinxi2">
        <p>
            请填写以下相关信息，并选择你需要的产品：</p>
        <table width="771" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#f8981d"
            style="margin-top: 12px; font-family: 汉仪中圆简;">
            <tr>
                <td width="120" height="25" bgcolor="#fee7cb">
                    &nbsp;姓&nbsp;名：
                </td>
                <td width="260" height="25" bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtRealname"></asp:TextBox><asp:RequiredFieldValidator
                        runat="server" ControlToValidate="txtRealname" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td width="124" height="25" bgcolor="#fee7cb">
                    &nbsp;手&nbsp;机：
                </td>
                <td width="254" bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtMobile"></asp:TextBox><asp:RequiredFieldValidator
                        runat="server" ControlToValidate="txtMobile" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td height="25" bgcolor="#fee7cb">
                    &nbsp;公司名称：
                </td>
                <td height="25" bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtCompany"></asp:TextBox><asp:RequiredFieldValidator
                        runat="server" ControlToValidate="txtCompany" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td height="25" bgcolor="#fee7cb">
                    &nbsp;职&nbsp;务：
                </td>
                <td bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtPosition"></asp:TextBox><asp:RequiredFieldValidator
                        runat="server" ControlToValidate="txtPosition" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td height="25" bgcolor="#fee7cb">
                    &nbsp;所属部门：
                </td>
                <td height="25" bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtDepartment"></asp:TextBox><asp:RequiredFieldValidator
                        runat="server" ControlToValidate="txtDepartment" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td height="25" bgcolor="#fee7cb">
                    &nbsp;办公电话：
                </td>
                <td bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtPhone"></asp:TextBox><asp:RequiredFieldValidator
                        runat="server" ControlToValidate="txtPhone" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td height="25" bgcolor="#fee7cb">
                    &nbsp;Email：
                </td>
                <td height="25" bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtEmail"></asp:TextBox><asp:RequiredFieldValidator
                        runat="server" ControlToValidate="txtEmail" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ControlToValidate="txtEmail" Display="Dynamic" runat="server"
                        ErrorMessage="格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td height="25" bgcolor="#fee7cb">
                    &nbsp;促销信息来源：
                </td>
                <td height="25" bgcolor="#FFFFFF">
                    <asp:DropDownList ID="ddlfrom" runat="server">
                        <asp:ListItem>网站广告</asp:ListItem>
                        <asp:ListItem>杂志广告</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    </div>
    <div class="xinxi2">
        <p>
            多项产品可供选择：</p>
        <table width="771" border="0" align="center" cellpadding="0" cellspacing="0" style="line-height: 20px;
            font-family: 汉仪中圆简;">
            <tr>
                <td width="47" align="center" bgcolor="#fee7cb">
                    <asp:CheckBox runat="server" ID="cbP1" />
                </td>
                <td width="32" height="30" align="center" bgcolor="#fee7cb" style="color: #f8981d;
                    font-weight: 600; font-size: 22px; font-family: 汉仪中圆简;">
                    买
                </td>
                <td width="311" height="60" align="left" bgcolor="#fee7cb">
                    德鲁克DPI620多功能过程信号校验仪
                </td>
                <td width="65" align="center" bgcolor="#fee7cb">
                    购买台数
                </td>
                <td width="107" align="left" bgcolor="#fee7cb">
                    <asp:DropDownList ID="ddlP1PC" runat="server">
                        <asp:ListItem>1台</asp:ListItem>
                        <asp:ListItem>2台</asp:ListItem>
                        <asp:ListItem>3台</asp:ListItem>
                        <asp:ListItem>大于3台</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td width="120" align="right" bgcolor="#fee7cb">
                    大致购买时间
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
                    font-weight: 600; font-size: 22px; font-family: 汉仪中圆简;">
                    送
                </td>
                <td height="60" colspan="5" align="left" valign="middle" bgcolor="#fee7cb">
                    DPI620充电座<br />
                    DPI620可充电锂电池
                </td>
            </tr>
        </table>
        <table width="771" border="0" align="center" cellpadding="0" cellspacing="0" style="line-height: 20px;
            margin-top: 15px; font-family: 汉仪中圆简;">
            <tr>
                <td width="42" align="center" bgcolor="#fee7cb">
                    <asp:CheckBox runat="server" ID="cbP2" />
                </td>
                <td width="36" height="30" align="center" bgcolor="#fee7cb" style="color: #f8981d;
                    font-weight: 600; font-size: 22px; font-family: 汉仪中圆简;">
                    买
                </td>
                <td width="312" height="60" align="left" bgcolor="#fee7cb">
                    德鲁克DPI620的压力基座和压力模块
                </td>
                <td width="65" align="center" bgcolor="#fee7cb">
                    购买台数
                </td>
                <td width="107" align="left" bgcolor="#fee7cb">
                    <asp:DropDownList ID="ddlP2PC" runat="server">
                        <asp:ListItem>1台</asp:ListItem>
                        <asp:ListItem>2台</asp:ListItem>
                        <asp:ListItem>3台</asp:ListItem>
                        <asp:ListItem>大于3台</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td width="120" align="right" bgcolor="#fee7cb">
                    大致购买时间
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
                    font-weight: 600; font-size: 22px; font-family: 汉仪中圆简;">
                    送
                </td>
                <td height="60" colspan="5" align="left" valign="middle" bgcolor="#fee7cb">
                    610-100引压管和转换接头套件<br />
                    IO620-CASE-3压力基座便携包
                </td>
            </tr>
        </table>
        <table width="771" border="0" align="center" cellpadding="0" cellspacing="0" style="line-height: 20px;
            margin-top: 15px; font-family: 汉仪中圆简;">
            <tr>
                <td width="44" align="center" bgcolor="#fee7cb">
                    <asp:CheckBox runat="server" ID="cbP3" />
                </td>
                <td width="33" height="30" align="center" bgcolor="#fee7cb" style="color: #f8981d;
                    font-weight: 600; font-size: 22px; font-family: 汉仪中圆简;">
                    买
                </td>
                <td width="313" height="60" align="left" bgcolor="#fee7cb">
                    德鲁克DPI610/615系列
                </td>
                <td width="65" align="center" bgcolor="#fee7cb">
                    购买台数
                </td>
                <td width="107" align="left" bgcolor="#fee7cb">
                    <asp:DropDownList ID="ddlP3PC" runat="server">
                        <asp:ListItem>1台</asp:ListItem>
                        <asp:ListItem>2台</asp:ListItem>
                        <asp:ListItem>3台</asp:ListItem>
                        <asp:ListItem>大于3台</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td width="120" align="right" bgcolor="#fee7cb">
                    大致购买时间
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
                    font-weight: 600; font-size: 22px; font-family: 汉仪中圆简;">
                    送
                </td>
                <td height="60" colspan="5" align="left" valign="middle" bgcolor="#fee7cb">
                    610-100引压管和转换接头套件<br />
                    可充电电池和充电器
                </td>
            </tr>
        </table>
    </div>
    <div style="background: #fff; padding-top: 20px; text-align: center;">
        <table border="0" cellspacing="0" cellpadding="0" align="center" width="980">
            <tr>
                <td>
                    <div align="center">
                        <asp:Button runat="server" ID="btnOK" Text="立即提交" OnClientClick="if(!checkForm()) return false;" />
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div style="height: 30px; background: #fff; width: 980px;">
    </div>
    <div class="box" id="box">
        <p>
            您已经成功提交信息，订单跟踪号为<%=trackId %>, 此号码已发送至您注册的邮箱内,我们会有专人在两个工作日内联系你。请保存你的跟踪号，以便今后查询进度。如有问题请咨询中国客户服务中心：800-915-9966</p>
        <div style="margin-top: 12px;">
            <table width="388" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="142" align="center">
                        <a href="DPI620Survey.aspx?k=<%=encryptTrackId %>">参与有奖竞答</a>
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
                alert('请您至少选择一个产品');
                return false;
            }
            return true;
        }
    </script>

</asp:Content>
