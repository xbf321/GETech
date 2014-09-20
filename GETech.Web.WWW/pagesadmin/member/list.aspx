<%@ Page Title="用户管理" Language="C#" MasterPageFile="~/templates/PagesadminMasterPage.master"
    AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="pagesadmin_member_list" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <fieldset>
        <legend>用户管理</legend>
        <table cellpadding="4" cellspacing="0" width="100%">
            <tr>
                <th align="left">
                    用户名
                </th>
                <th align="left">
                    Email
                </th>
                <th width="10%" align="center">
                    是否审核
                </th>
                <th width="15%" align="center">
                    注册时间
                </th>
                <th width="10%" align="center">
                    操作
                </th>
            </tr>
            <asp:Repeater ID="rptList" runat="server" DataSourceID="SqlDataSource_rptList">
            <ItemTemplate>
                <tr>
                    <td align="left">
                        <%#Eval("UserName") %>
                    </td>
                    <td align="left">
                    <%#Eval("Email") %>
                    </td>
                    <td width="10%" align="center">
                    <%#Eval("IsPass") %>
                    </td>
                    <td width="15%" align="center">
                    <%#Eval("CreateDateTime") %>
                    </td>
                    <td align="center" width="10%" ><a href="edit.aspx?userid=<%#Eval("UserId") %>">编辑</a></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        </table>        
        <asp:SqlDataSource ID="SqlDataSource_rptList" ConnectionString="<%$ConnectionStrings:ednchina %>" SelectCommand="SELECT * FROM Members WHERE UserName <> 'xbf321' ORDER BY CreateDateTime DESC" runat="server"></asp:SqlDataSource>
    </fieldset>
</asp:Content>
