<%@ Page Title="导航" EnableViewState="false" Language="C#" MasterPageFile="~/templates/EmptyMasterPageWithoutForm.master" %>
<script runat="server">
    protected void Page_Load()
    {
        if (Request.IsAuthenticated)
        {
            GETech.Entity.SiteMember sm = new GETech.Entity.SiteMember(HttpContext.Current.User.Identity.Name);
            if (!sm.IsPass || !Roles.IsUserInRole("Admin"))
            {
                Response.Redirect("login.aspx");
            }
        }
    }
</script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        body
        {
            font-size: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <form runat="server">
    <asp:TreeView ID="TreeView1" Target="right" runat="server" DataSourceID="SiteMapDataSource1"
        ImageSet="Msdn" ShowLines="True" NodeIndent="10" ExpandDepth="2">
    </asp:TreeView>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" SiteMapProvider="AdminSiteMapProvider" />
    </form>
</asp:Content>
