using System;
using GETech.Entity;
using GETech.Data;

public partial class news_show : System.Web.UI.Page
{
    protected ArticleInfo articleInfo;
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = Goodspeed.Web.UrlHelper.Current.FileName;
        string guid = url.Substring(0,url.LastIndexOf('.'));

        articleInfo = ArticleManage.GetArticleInfoByGUID(guid);
        if(articleInfo == null){
            Response.Write("参数错误!");
            Response.End();
        }

        this.Page.Title = string.Format("{0} - {1}", articleInfo.Title, System.Configuration.ConfigurationManager.AppSettings["WebSiteTitlePostfix"]);
    }
}
