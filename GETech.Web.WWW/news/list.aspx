<%@ Page Language="C#" MasterPageFile="~/templates/NewsMasterPage.master" %>

<script runat="server">
    protected string dateTypeFlag = string.Empty;
    protected void Page_Load()
    {
        this.Page.Title = string.Format("新闻发布 - {0}", System.Configuration.ConfigurationManager.AppSettings["WebSiteTitlePostfix"]);
    }
    protected string PrintDate(object DateType)
    {

        if (Convert.ToDateTime(DateType).ToString("yyyy-MM") == dateTypeFlag)
        {
            return string.Empty;
        }
        else
        {
            dateTypeFlag = Convert.ToDateTime(DateType).ToString("yyyy-MM");
            return "<p><strong>" + Convert.ToDateTime(dateTypeFlag).ToString("yyyy年MM月") + "</strong></p>";
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        var ClientContext = { News_Nav: "List" };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <div id="ProductR_column">
        <div class="ProductR_top mB">
            <h3>
                <img src="http://www.geinspectiontechnologies.cn/imagesCn/aboutus/pressReleases.gif" /></h3>
        </div>
        <div>
            <div class="mB">
                <ul class="newsListBar">
                    <asp:Repeater ID="rptList" runat="server" DataSourceID="SqlDataSource_rptList">
                        <ItemTemplate>
                            <%#PrintDate(Eval("PublishDate"))%>
                            <li><a href="<%#Eval("Url") %>" class="blue">
                                <%#Eval("Title") %></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
            <Goodspeed:SqlDataPageSource ID="SqlDataSource_rptList" runat="server" Sort=" PublishDate DESC "
                PageBarID="PagerBarBottom" SelectCommand="SELECT * FROM Articles">
            </Goodspeed:SqlDataPageSource>
            <Goodspeed:PageBar ID="PagerBarBottom" runat="server" Size="20" />
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
