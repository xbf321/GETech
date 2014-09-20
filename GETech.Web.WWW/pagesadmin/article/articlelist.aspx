<%@ Page Title="文章管理" Language="C#" MasterPageFile="~/templates/PagesadminMasterPage.master"
    AutoEventWireup="true" CodeFile="articlelist.aspx.cs" Inherits="pagesadmin_article_articlelist" %>

<%@ Register TagPrefix="uc" Namespace="GETech.Control" Assembly="GETech.Core" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <form runat="server">
    <fieldset>
        <legend>文章管理</legend>
        <table>
            <tr>
                <td>
                    <uc:DropDownTreeList ID="ddlcategoryList" runat="server" Visible="true"></uc:DropDownTreeList>
                </td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="查询" />
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="4" cellspacing="0" border="0">
            <tr>
                <th align="left">
                    标题
                </th>
                <th width="10%" align="center">
                    发布时间
                </th>
                <th width="10%" align="center">
                    操作
                </th>
            </tr>
            <asp:Repeater ID="rptList" runat="server" DataSourceID="SqlDataSource_rptList">
                <ItemTemplate>
                    <tr>
                        <td align="left">
                            <%#Eval("Title") %>
                        </td>
                        <td align="center">
                            <%#Eval("PublishDate", "{0:yyyy/MM/dd}")%>
                        </td>
                        <td align="center">
                            <a href="postarticle.aspx?articleid=<%#Eval("ArticleId") %>&categoryId=<%#Eval("CategoryId") %>">编辑</a>&nbsp;|&nbsp;<a href="###" onclick="deleteArticle(<%#Eval("ArticleId") %>)">删除</a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <Goodspeed:SqlDataPageSource ID="SqlDataSource_rptList" runat="server" Sort=" PublishDate DESC "
            PageBarID="PagerBarBottom" SelectCommand="SELECT * FROM Articles 
WHERE CategoryId = CASE @CategoryId WHEN 0 THEN CategoryId ELSE @CategoryId END">
            <SelectParameters>
                <asp:Parameter Name="CategoryId" DefaultValue="0" />
            </SelectParameters>
        </Goodspeed:SqlDataPageSource>
        <table cellpadding="4" cellspacing="0">
            <tr>
                <td><Goodspeed:PageBar ID="PagerBarBottom" runat="server" Size="20" /></td>
            </tr>
        </table>
        
    </fieldset>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpFooterScript" runat="Server">
    <script type="text/javascript">
        function deleteArticle(id) {
            if (window.confirm('确定要删除吗？\r\n\r\n请谨慎操作!')) {
                window.location.href = 'postarticle.aspx?articleid='+id+'&action=del';
            }
        }
    </script>
</asp:Content>
