<%@ Page Title="产品管理" Language="C#" MasterPageFile="~/templates/PagesadminMasterPage.master" AutoEventWireup="true" CodeFile="productlist.aspx.cs" Inherits="pagesadmin_product_productlist" %>
<%@ Register TagPrefix="uc" Namespace="GETech.Control" Assembly="GETech.Core" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" Runat="Server">
    <form id="Form1" runat="server">
    <fieldset>
        <legend>产品管理</legend>
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
                    产品名称
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
                            <a href="postproduct.aspx?productid=<%#Eval("ProductId") %>&categoryId=<%#Eval("CategoryId") %>">编辑</a>&nbsp;|&nbsp;<a href="###" onclick="deleteProduct(<%#Eval("ProductId") %>)">删除</a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
        <Goodspeed:SqlDataPageSource ID="SqlDataSource_rptList" runat="server" Sort=" CreateDateTime DESC "
            PageBarID="PagerBarBottom" SelectCommand="SELECT * FROM Products 
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
<asp:Content ID="Content3" ContentPlaceHolderID="cpFooterScript" Runat="Server">
    <script type="text/javascript">
        function deleteProduct(id) {
            if (window.confirm('确定要删除吗？\r\n\r\n请谨慎操作!')) {
                window.location.href = 'postproduct.aspx?productid='+id+'&action=del';
            }
        }
    </script>
</asp:Content>

