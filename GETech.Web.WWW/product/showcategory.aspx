<%@ Page Title="" Language="C#" MasterPageFile="~/templates/ProductMasterPage.master" %>

<script runat="server">
    private int categoryId = 0;
    protected GETech.Entity.ProductCategoryInfo categoryInfo;
    protected void Page_Load()
    {
        string _url = Goodspeed.Web.UrlHelper.Current.FileName;
        categoryId = Controleng.Common.Utils.StrToInt(_url.Substring(0, _url.LastIndexOf('.')), 0);
        categoryInfo = GETech.Data.ProductCategoryManage.GetCategoryInfo(categoryId);
        if (categoryInfo == null)
        {
            Response.Write("参数错误");
            Response.End();
        }
        this.Page.Title = string.Format("{0} - 产品中心 - {1}",categoryInfo.CategoryName, System.Configuration.ConfigurationManager.AppSettings["WebSiteTitlePostfix"]);
    }
</script>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <div id="ProductR_column">
        <%=categoryInfo.Content %>
    </div>
</asp:Content>
