<%@ Page Title="" Language="C#" MasterPageFile="~/templates/NewsMasterPage.master"
    AutoEventWireup="true" CodeFile="show.aspx.cs" Inherits="news_show" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <div id="ProductR_column">
    <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" class="mB">
              <TBODY>
              <TR class=firstTitle>
                <TD class=firstTitle><IMG src="/images/pressReleases.gif" 
                  width=117 height=48></TD></TR>
              <TR>
                <TD bgColor=#cccccc height=1 vAlign=top></TD></TR>
              </TBODY></TABLE>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="top" class="midText">
                    <p>
                        <strong>
                            <%=articleInfo.Title %></strong><br />
                        <%=articleInfo.Content %>
                    </p>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpFooterScript" runat="Server">
</asp:Content>
