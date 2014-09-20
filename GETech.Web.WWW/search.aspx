<%@ Page Title="" Language="C#" MasterPageFile="~/templates/BaseMasterPage.master"
    AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <form runat="server">
    <table cellpadding="4" cellspacing="0">
        <tr>
            <td>
                <asp:TextBox ID="txtKey" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RadioButtonList ID="rblType" RepeatColumns="2" runat="server">
                    <asp:ListItem Value="n" Text="新闻" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="p" Text="产品"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:Button ID="btnSearch" runat="server" Width="100" Text="搜索" />
            </td>
        </tr>
    </table>
    </form>
    <ul class="Search_pnall">
        <asp:Repeater ID="rptList" runat="server" DataSourceID="SqlDataSource_rptList">
            <ItemTemplate>
                <li><a href="<%#Eval("Url") %>" title='<%#Eval("Title") %>'>
                    <%#Eval("Title") %></a><br />
                    <%#Goodspeed.Common.CharHelper.Truncate(Goodspeed.Library.Char.HtmlHelper.RemoveHtml(Eval("Content").ToString()),200) %>
                </li>
            </ItemTemplate>
        </asp:Repeater>
        <%if (rptList.Items.Count == 0)
          {%>
          <li>没有搜索到结果!请重试!</li>
        <%} %>
    </ul>
    <Goodspeed:SqlDataPageSource ID="SqlDataSource_rptList" runat="server" Sort=" Id DESC "
        PageBarID="PagerBarBottom">
        <SelectParameters>
            <asp:Parameter Name="Key" DefaultValue="" />
        </SelectParameters>
    </Goodspeed:SqlDataPageSource>
    <table cellpadding="4" cellspacing="0">
        <tr>
            <td>
                <Goodspeed:PageBar ID="PagerBarBottom" runat="server" Size="20" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpFooterScript" runat="Server">
</asp:Content>
