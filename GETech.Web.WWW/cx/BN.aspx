<%@ Page Title="" Language="C#" MasterPageFile="~/cx/MasterPage.master" AutoEventWireup="true"
    CodeFile="BN.aspx.cs" Inherits="cx_BN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">
body{background:#999999;}
.box{display:none;}
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
                window.location.href = '/cx/bn.aspx';
            }
        })
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">
    <asp:HiddenField ID="txtCourse" runat="server" />
    <div class="content">
        <h2>
            Bently Nevada<sup>TM</sup> Scout 100/140 、ADRE 408 真情回馈限时促销活动</h2>
        <p>
            凡在活动期间购买Scout100或ADRE 408产品，即可获得一个免费培训名额（培训地址：GE上海科技园区），价值约5000人民币，并参加有奖问答赢取丰厚奖品。</p>
    </div>
    <div class="xinxi">
        <p>
            请填写以下相关信息，并选择你需要的产品：</p>
        <table width="771" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="#711371"
            style="margin-top: 12px; font-family: 汉仪中圆简;">
            <tr>
                <td width="128" height="25" bgcolor="#d4c4da">
                    &nbsp;姓&nbsp;名：
                </td>
                <td width="252" height="25" bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtRealname"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ControlToValidate="txtRealname" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td width="130" height="25" bgcolor="#d4c4da">
                    &nbsp;手&nbsp;机：
                </td>
                <td width="248" bgcolor="#FFFFFF">
                   <asp:TextBox runat="server" ID="txtMobile"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server" ControlToValidate="txtMobile" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td height="25" bgcolor="#d4c4da">
                    &nbsp;公司名称：
                </td>
                <td height="25" bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtCompany"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        runat="server" ControlToValidate="txtCompany" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td height="25" bgcolor="#d4c4da">
                    &nbsp;职&nbsp;务：
                </td>
                <td bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtPosition"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                        runat="server" ControlToValidate="txtPosition" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td height="25" bgcolor="#d4c4da">
                    &nbsp;所属部门：
                </td>
                <td height="25" bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtDepartment"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                        runat="server" ControlToValidate="txtDepartment" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
                <td height="25" bgcolor="#d4c4da">
                    &nbsp;办公电话：
                </td>
                <td bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtPhone"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                        runat="server" ControlToValidate="txtPhone" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td height="25" bgcolor="#d4c4da">
                    &nbsp;Email：
                </td>
                <td height="25" bgcolor="#FFFFFF">
                    <asp:TextBox runat="server" ID="txtEmail"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                        runat="server" ControlToValidate="txtEmail" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtEmail" Display="Dynamic" runat="server"
                        ErrorMessage="格式不正确" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
                <td height="25" bgcolor="#d4c4da">
                    &nbsp;促销信息来源：
                </td>
                <td bgcolor="#FFFFFF">
                    <asp:DropDownList ID="ddlfrom" runat="server">
                        <asp:ListItem>网站广告</asp:ListItem>
                        <asp:ListItem>杂志广告</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        <table width="769" height="24" border="0" align="center" cellpadding="0" cellspacing="0"
            style="margin-top: 15px; font-family: 汉仪中圆简;">
            <tr>
                <td width="31" align="center" bgcolor="#e9deeb">
                    <asp:CheckBox runat="server" ID="cbP1" />
                </td>
                <td width="206" bgcolor="#e9deeb">
                    购买产品：Scout100
                </td>
                <td width="95" align="right" bgcolor="#e9deeb">
                    购买台数：
                </td>
                <td width="145" height="30" bgcolor="#e9deeb">
                    <asp:DropDownList ID="ddlP1PC" runat="server">
                        <asp:ListItem>1台</asp:ListItem>
                        <asp:ListItem>2台</asp:ListItem>
                        <asp:ListItem>3台</asp:ListItem>
                        <asp:ListItem>大于3台</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td width="141" align="right" bgcolor="#e9deeb">
                    大致购买时间：
                </td>
                <td width="151" bgcolor="#e9deeb">
                    <asp:TextBox runat="server" ID="txtP1DateTime" Width="80"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="31" align="center" bgcolor="#d4c4da">
                   <asp:CheckBox runat="server" ID="cbP2" />
                </td>
                <td width="206" bgcolor="#d4c4da">
                    购买产品：Scout100
                </td>
                <td width="95" align="right" bgcolor="#d4c4da">
                    购买台数：
                </td>
                <td width="145" height="30" bgcolor="#d4c4da">
                    <asp:DropDownList ID="ddlP2PC" runat="server">
                        <asp:ListItem>1台</asp:ListItem>
                        <asp:ListItem>2台</asp:ListItem>
                        <asp:ListItem>3台</asp:ListItem>
                        <asp:ListItem>大于3台</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td width="141" align="right" bgcolor="#d4c4da">
                    大致购买时间：
                </td>
                <td width="151" bgcolor="#d4c4da">
                    <asp:TextBox runat="server" ID="txtP2DateTime" Width="80"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="31" align="center" bgcolor="#e9deeb">
                    <asp:CheckBox runat="server" ID="cbP3" />
                </td>
                <td width="206" bgcolor="#e9deeb">
                    购买产品：Scout100
                </td>
                <td width="95" align="right" bgcolor="#e9deeb">
                    购买台数：
                </td>
                <td width="145" height="30" bgcolor="#e9deeb">
                    <asp:DropDownList ID="ddlP3PC" runat="server">
                        <asp:ListItem>1台</asp:ListItem>
                        <asp:ListItem>2台</asp:ListItem>
                        <asp:ListItem>3台</asp:ListItem>
                        <asp:ListItem>大于3台</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td width="141" align="right" bgcolor="#e9deeb">
                    大致购买时间：
                </td>
                <td width="151" bgcolor="#e9deeb">
                    <asp:TextBox runat="server" ID="txtP3DateTime" Width="80"></asp:TextBox>
                </td>
            </tr>
        </table>
    </div>
    <div class="xinxi">
        <p>
            2012年详细课程可供选择：</p>
        <table width="771" border="0" align="center" cellpadding="0" cellspacing="0" style="font-family: 汉仪中圆简;">
            <tr>
                <td width="54" height="30" bgcolor="#844385">
                    &nbsp;
                </td>
                <td width="157" align="center" bgcolor="#844385" style="color: #fff;">
                    <strong>课程编号</strong>
                </td>
                <td width="198" align="center" bgcolor="#844385" style="color: #fff;">
                    <strong>课程</strong>
                </td>
                <td width="96" align="center" bgcolor="#844385" style="color: #fff;">
                    <strong>天数</strong>
                </td>
                <td width="121" align="center" bgcolor="#844385" style="color: #fff;">
                    <strong>价格(RMB)</strong>
                </td>
                <td width="145" align="center" bgcolor="#844385" style="color: #fff;">
                    <strong>开始日期</strong>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#e9deeb">
                    <input name="cbCourse" type="checkbox" value="MCSBAS200C1201" />
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    MCSBAS200C1201
                </td>
                <td align="center" bgcolor="#e9deeb">
                    System1基础
                </td>
                <td align="center" bgcolor="#e9deeb">
                    3
                </td>
                <td align="center" bgcolor="#e9deeb">
                    4000
                </td>
                <td align="center" bgcolor="#e9deeb">
                    2012/5/16
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#d4c4da">
                    <input name="cbCourse" type="checkbox" value="MCSMDS200C1201" />
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    MCSMDS200C1201
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    机械故障诊断(MDS)
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    5
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    6000
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    2012/5/21
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#e9deeb">
                    <input name="cbCourse" type="checkbox" value="MCSBAS200C1202" />
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    MCSBAS200C1202
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    振动基础
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    2
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    3000
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    2012/6/11
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#d4c4da">
                    <input name="cbCourse" type="checkbox" value="MCSMON210C1202" />
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    MCSMON210C1202
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    3500操作与维护
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    3
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    4000
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    2012/6/13
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#e9deeb">
                    <input name="cbCourse" type="checkbox" value="MCSSYS200C1202" />
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    MCSSYS200C1202
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    System1基础
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    3
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    4000
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    2012/7/18
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#d4c4da">
                    <input name="cbCourse" type="checkbox" value="MCSMDS200C1202" />
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    MCSMDS200C1202
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    机械故障诊断(MDS)
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    5
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    6000
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    2012/7/23
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#e9deeb">
                    <input name="cbCourse" type="checkbox" value="MCSBAS200C1203" />
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    MCSBAS200C1203
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    振动基础
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    2
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    3000
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    2012/8/27
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#d4c4da">
                    <input name="cbCourse" type="checkbox" value="MCSMON210C1203" />
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    MCSMON210C1203
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    3500操作与维护
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    3
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    4000
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    2012/8/29
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#e9deeb">
                    <input name="cbCourse" type="checkbox" value="MCSSYS200C1202" />
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    MCSSYS200C1202
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    System1基础
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    3
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    4000
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    2012/10/24
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#d4c4da">
                   <input name="cbCourse" type="checkbox" value="MCSMDS200C1202" />
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    MCSMDS200C1202
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    机械故障诊断(MDS)
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    5
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    6000
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    2012/10/29
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#e9deeb">
                    <input name="cbCourse" type="checkbox" value="MCSBAS200C1204" />
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    MCSBAS200C1204
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    振动基础
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    2
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    3000
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    2012/11/19
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#d4c4da">
                    <input name="cbCourse" type="checkbox" value="MCSMON210C1204" />
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    MCSMON210C1204
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    3500操作与维护
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    3
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    4000
                </td>
                <td height="30" align="center" bgcolor="#d4c4da">
                    2012/11/21
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#e9deeb">
                    <input name="cbCourse" type="checkbox" value="MCSMON230C1201" />
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    MCSMON230C1201
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    ADRE 408
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    3
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    4000
                </td>
                <td height="30" align="center" bgcolor="#e9deeb">
                    2012/12/4
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
    <div class="box" id="box">
        <p>
            您已经成功提交信息，订单跟踪号为<%=trackId %>, 此号码已发送至您注册的邮箱内,我们会有专人在两个工作日内联系你。请保存你的跟踪号，以便今后查询进度。如有问题请咨询中国客户服务中心：800-915-9966</p>
        <div style="margin-top: 12px;">
            <table width="388" height="24" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="142" align="center">
                        <a href="BNSurvey.aspx?k=<%=encryptTrackId %>">参与有奖竞答</a>
                    </td>
                    <td width="246">
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div style="height: 30px; background: #fff; width: 980px;">
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
            var cbNames = ['<%=cbP1.ClientID %>', '<%=cbP2.ClientID %>', '<%=cbP3.ClientID %>'], current = 0, course = '', courseObj = $('#<%=txtCourse.ClientID %>');
            for (i in cbNames) {
                if ($('#'+cbNames[i]).attr('checked')) {
                    current++;
                }
            }
            if (current == 0) {
                alert('请您至少选择一个产品');
                return false;
            }
            //获得选择的课程
            $('input[name="cbCourse"]:checked').each(function() {
                course += $(this).val() + '-';
            });
            courseObj.val(course);
            return true;
        }
    </script>
</asp:Content>
