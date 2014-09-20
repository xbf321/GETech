<%@ Page Title="栏目管理" Language="C#" MasterPageFile="~/templates/PagesadminMasterPage.master" AutoEventWireup="true" CodeFile="categorylist.aspx.cs" ValidateRequest="false" Inherits="pagesadmin_product_categorylist" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" Runat="Server">
    <fieldset>
        <legend>列表</legend>
        <table width="100%">
            <tr>
                <td width="100%">
                    <asp:Literal ID="ShowTreeLabel" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
    </fieldset>
    <script type="text/javascript">
        function del(id) {
            if (confirm('您要删除该项吗?')) {
                window.location.href = 'postcategory.aspx?categoryid=' + id + '&action=del'; 
            }
        }
    </script>
</asp:Content>

