<%@ Page Title=" DPI 620, DPI 610/615有奖竞答" Language="C#" MasterPageFile="~/cx/MasterPage.master"
    AutoEventWireup="true" CodeFile="DPI620Survey.aspx.cs" Inherits="cx_DPI620Survey" %>

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
            DPI 620, DPI 610/615有奖竞答</h2>
        <p>
            本次活动旨在让更多的用户了解GE检测控制技术的产品，竞赛问题的答案来源于网络，只要您用心寻找，一定能找到答案。对答对所有问题的用户进行电脑随机抽取，凡是参与活动就会有奖品。相关信息可查看相关网站：www.ge-mcs.com/zh</p>
        <p style="font-size: 16px;">
            活动日期：4月16日-7月15日（以确认购买促销活动产品的订单日为准）， 9月20日公布获奖名单：<br />
            活动对象：凡是在7月15日前确认购买促销产品的订单，并在订单日起2个月内完成付款的用户。</p>
        <p>
            <img src="images/gift-1.jpg" /></p>
    </div>
    <div class="Answer">
        <table width="895" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="40">
                    <strong>1．压力校验的精度是多少？ </strong>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButtonList ID="q1" runat="server" RepeatColumns="5">
                        <asp:ListItem>0.02%</asp:ListItem>
                        <asp:ListItem>0.01%</asp:ListItem>
                        <asp:ListItem>0.1%</asp:ListItem>
                        <asp:ListItem>0.5%</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
        <table width="895" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="40">
                    <strong>2．DPI620 有哪些功能： </strong>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBoxList ID="q2" runat="server" RepeatColumns="5">
                        <asp:ListItem>压力校验</asp:ListItem>
                        <asp:ListItem>HART手抄器</asp:ListItem>
                        <asp:ListItem>多功能过程信号校验仪</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
        </table>
        <table width="895" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="30">
                    <strong>3．DPI620有本质安全型吗？</strong>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButtonList ID="q3" runat="server" RepeatColumns="5">
                        <asp:ListItem>有</asp:ListItem>
                        <asp:ListItem>无</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
        <table width="895" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <strong>4．DPI620的气压泵最高可产生多少压力？</strong>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButtonList ID="q4" runat="server" RepeatColumns="5">
                        <asp:ListItem>2MPa</asp:ListItem>
                        <asp:ListItem>4MPa</asp:ListItem>
                        <asp:ListItem>6MPa</asp:ListItem>
                        <asp:ListItem>10MPa</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
        <table width="895" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td height="40">
                    <strong>5．DPI620最多可同时能操作几个通道进行测量和校验？</strong>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButtonList ID="q5" runat="server" RepeatColumns="5">
                        <asp:ListItem>2个</asp:ListItem>
                        <asp:ListItem>3个</asp:ListItem>
                        <asp:ListItem>4个</asp:ListItem>
                        <asp:ListItem>6个</asp:ListItem>
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
