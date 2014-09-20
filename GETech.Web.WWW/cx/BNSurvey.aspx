<%@ Page Title="Bently Nevada Scout 100/ADRE 408有奖竞答" Language="C#" MasterPageFile="~/cx/MasterPage.master"
    AutoEventWireup="true" CodeFile="BNSurvey.aspx.cs" Inherits="cx_BNSurvey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">
        .box
        {
            display: none;
        }
    </style>
<script type="text/javascript">
           function showDialog() {
               $('#box').dialog({
                   title: '成功',
                   modal: true,
                   width: 450,
                   height: 230,
                   buttons: [{
                       text: "关闭",
                       click: function() {
                       window.location.href = 'index.html';
                       }
                   }, {
                       text: "返回",
                       click: function() {
                           window.location.href = 'index.html';
                       }
}]
                   })
               }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">
    <div>
        <img src="images/banner.jpg" /></div>
    <div class="tiao">
    </div>
    <div class="container2">
        <h2>
            Bently Nevada<sup>TM</sup> Scout 100/140 、ADRE 408 有奖问答</h2>
        <p>
            本次活动旨在让更多的用户了解GE检测控制技术的产品，竞赛问题的答案来源于网络，只要您用心寻找，一定能找到答案。对答对所有问题的用户进行电脑随机抽取，凡是参与活动就会有奖品。相关信息可查看相关网站：www.ge-mcs.com/zh</p>
        <p style="font-size: 16px;">
            活动日期：4月16日-7月15日（以确认购买促销活动产品的订单日为准）， 9月20日公布获奖名单。<br />
            活动对象：凡是在7月15日前确认购买促销产品的订单，并在订单日起2个月内完成付款的用户。</p>
        <p>
            <img src="images/gift-1.jpg" /></p>
    </div>
    <div class="Answer">
        <table width="895" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="40">
                    <strong>1．Scout 100的存储空间有多大？ </strong>
                </td>
            </tr>
            <tr>
                <td width="29">
                    <asp:RadioButtonList ID="q1" runat="server" RepeatColumns="5">
                        <asp:ListItem>500MB</asp:ListItem>
                        <asp:ListItem>2 GB</asp:ListItem>
                        <asp:ListItem>800 MB</asp:ListItem>
                        <asp:ListItem>1GB</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
        <table width="895" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="40">
                    <strong>2．Scout 100有多少通道数据记录</strong>
                </td>
            </tr>
            <tr>
                <td width="29">
                    <asp:RadioButtonList ID="q2" runat="server" RepeatColumns="5">
                        <asp:ListItem>单通道</asp:ListItem>
                        <asp:ListItem>双通道</asp:ListItem>
                        <asp:ListItem>三通道</asp:ListItem>
                        <asp:ListItem>四通道</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
        <table width="895" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="30">
                    <strong>3．Scout100有哪些特征？（可多选）</strong>
                </td>
            </tr>
            <tr>
                <td width="29">
                   <asp:CheckBoxList ID="q3" runat="server" RepeatColumns="5">
                        <asp:ListItem>左右手操作模式</asp:ListItem>
                        <asp:ListItem>电池寿命达10小时</asp:ListItem>
                        <asp:ListItem>CSA 1级2区域危险场所认证</asp:ListItem>
                        <asp:ListItem>大屏幕背光LCD</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
        </table>
        <table width="895" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="40">
                    <strong>4．Scout 100的频率分辨率是多少 (FFT分辨率)？</strong>
                </td>
            </tr>
            <tr>
                <td width="29">
                    <asp:RadioButtonList ID="q4" runat="server" RepeatColumns="5">
                        <asp:ListItem>10000条谱线</asp:ListItem>
                        <asp:ListItem>12800条谱线</asp:ListItem>
                        <asp:ListItem>8000条谱线</asp:ListItem>
                        <asp:ListItem>14600条谱线</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
        <table width="895" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="40">
                    <strong>5．Scout 100 产品质保期是多少？</strong>
                </td>
            </tr>
            <tr>
                <td width="29">
                    <asp:RadioButtonList ID="q5" runat="server" RepeatColumns="5">
                        <asp:ListItem>1年</asp:ListItem>
                        <asp:ListItem>2年</asp:ListItem>
                        <asp:ListItem>3年</asp:ListItem>
                        <asp:ListItem>5年</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
        <table width="895" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="50" align="center">
                    <asp:Button runat="server" ID="btnOK" Text="提交" />
                </td>
            </tr>
        </table>
    </div>
    <div id="box" class="box">
        <p>感谢您参与本次活动，如有问题请咨询中国客服电话800-9159966</p>
    </div>
</asp:Content>
