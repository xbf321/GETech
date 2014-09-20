<%@ Page Language="C#" MasterPageFile="~/templates/NewsMasterPage.master" %>

<script runat="server">
    protected string dateTypeFlag = string.Empty;
    protected void Page_Load()
    {
        this.Page.Title = string.Format("新闻中心 - {0}", System.Configuration.ConfigurationManager.AppSettings["WebSiteTitlePostfix"]);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        var ClientContext = { News_Nav: "Index" };
    </script>

    <style type="text/css">
        .news
        {
            margin-top:10px;
        }
        .news h2{color:#3a55a5;font-size:14px;}
        .news ul li{ background:url(/images/iconLink.gif) no-repeat left 6px;padding-left:7px;}
        .news-column dl{width:260px;float:left;margin-bottom:10px;}
        .news-column dl dd{float:right;width:180px;padding-right:10px;}
        .news-column dl dt{float:left;}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <div id="ProductR_column">
        <h2>
            <img src="/imagesCn/aboutus/press.gif" /></h2>
        <p>
            GE检测科技的新闻中心为您提供新闻报道资料以及其他相关信息。</p>
        <div class="news">
            <h2>最新新闻</h2>
            <ul>
                <asp:Repeater ID="rptList" runat="server" DataSourceID="SqlDataSource_rptList">
                    <ItemTemplate>
                        <li><a href="<%#Eval("Url") %>" class="blue">
                            <%#Eval("Title") %></a>&nbsp;&nbsp;[<%#Eval("PublishDate", "{0:yyyy/MM/dd}")%>]</li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <asp:SqlDataSource ID="SqlDataSource_rptList" ConnectionString="<%$ConnectionStrings:ednchina %>"
                SelectCommand="SELECT TOP(5)* FROM Articles ORDER BY PublishDate DESC" runat="server">
            </asp:SqlDataSource>
        </div>
        <div class="moreNews">
            <img src="/images/news/arr_DR.gif" width="9" height="7" />
            <a href="/news/list.aspx" class="Fblue"><strong>更多新闻</strong></a></div>
        <div class="clear">
        </div>
        <hr />
        <div class="news-column">
            <dl>
                <dt>
                    <img src="/images/news/link_contactus.jpg" /></dt>
                <dd>
                    <a href="/aboutusCn/press.htm" class="blueB">媒体联系</a><a href="ut/index.html"><br />
                    </a>全套的应用广泛的超声波便携式探伤仪以及系统设备。</dd>
            </dl>
            <dl>
                <dt>
                    <img src="/images/news/link_salescontact02.jpg" /></dt>
                <dd>
                    <a href="/aboutusCn/testimonials.htm" class="blueB">顾客评价</a><a href="ut/index.html"><br />
                    </a>全套的应用广泛的超声波便携式探伤仪以及系统设备。</dd>
            </dl>
            <dl>
                <dt>
                    <img src="/images/news/message.gif" /></dt>
                <dd>
                    <a href="/feedback.aspx" class="blueB">在线反馈</a><a href="ut/index.html"><br />
                    </a>全套的应用广泛的超声波便携式探伤仪以及系统设备。</dd>
            </dl>
            <div class="clear"></div>
        </div>        
    </div>
</asp:Content>
