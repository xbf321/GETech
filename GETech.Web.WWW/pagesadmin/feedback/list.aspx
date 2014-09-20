<%@ Page Title="留言管理" Language="C#" MasterPageFile="~/templates/PagesadminMasterPage.master" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="pagesadmin_feedback_list" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" Runat="Server">
    <fieldset>
        <legend>留言管理</legend>
        <table width="100%" cellpadding="4" cellspacing="0" border="0">
            <tr>
                <th width="10%" align="center">
                    姓名
                </th>
                <th width="10%" align="center">
                    电话
                </th>
                <th width="10%" align="center">
                    Email
                </th>                
                <th align="left">
                    内容
                </th>
                <th width="15%" align="center">
                    发表时间
                </th>
                <th width="5%" align="center">
                    操作
                </th>
            </tr>
            <asp:Repeater ID="rptList" runat="server" DataSourceID="SqlDataSource_rptList">
                <ItemTemplate>
                    <tr>
                        <td width="10%" align="center">
                            <%#Eval("RealName") %>
                        </td>
                        <td width="10%" align="center">
                            <%#Eval("Phone") %>
                        </td>
                        <td width="10%" align="center">
                            <%#Eval("Email") %>
                        </td>
                        <td align="left">
                            <%#Eval("Content") %>
                        </td>
                        <td align="center">
                            <%#Eval("CreateDateTime")%>
                        </td>
                        <td width="5%" align="center">
                            <a href="###" onclick="deleteFeedback(<%#Eval("Id") %>)">删除</a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <Goodspeed:SqlDataPageSource ID="SqlDataSource_rptList" runat="server" Sort=" CreateDateTime DESC "
            PageBarID="PagerBarBottom" SelectCommand="SELECT * FROM Feedbacks">
        </Goodspeed:SqlDataPageSource>
        <table cellpadding="4" cellspacing="0">
            <tr>
                <td><Goodspeed:PageBar ID="PagerBarBottom" runat="server" Size="20" /></td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpFooterScript" runat="Server">
    <script type="text/javascript">
        function deleteFeedback(id) {
            if (window.confirm('确定要删除吗？')) {
                window.location.href = 'list.aspx?id='+id+'&action=del';
            }
        }
    </script>
</asp:Content>

