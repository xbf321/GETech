using System;
using System.Web.UI;


using GETech.Data;
using Controleng.Common;
using GETech.Entity;

public partial class pagesadmin_article_postarticle : System.Web.UI.Page
{
    protected int articleId = 0;
    protected int categoryId = 0;
    protected string action = "add";


    protected ArticleInfo articleInfo;    
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack){
            if(articleId != 0){
                articleInfo = ArticleManage.GetArticleInfoByArticleId(articleId);
                this.txtContent.Text = articleInfo.Content;
                this.txtTitle.Text = articleInfo.Title;
                this.PublishDate.SelectedDate = articleInfo.PublishDate;
                this.txtLinkUrl.Text = articleInfo.LinkUrl;
                this.txtImageUrl.Text = articleInfo.ImageUrl;
                this.txtIntroduction.Text = articleInfo.Introduction;
            }
        }
    }
    override protected void OnInit(EventArgs e)
    {
        InitializeComponent();
        base.OnInit(e);
    }
    void InitInfo() {

        articleId = CECRequest.GetQueryInt("articleid",0);
        action = CECRequest.GetQueryString("action");
        categoryId = CECRequest.GetQueryInt("categoryid",0);

        if(action.ToLower() == "del"){
            ArticleManage.Delete(articleId);
            Response.Redirect("articlelist.aspx");
            return;
        }

        this.PublishDate.SelectedDate = DateTime.Now;
        this.ddlcategoryList.BuildTree(ArticleCategoryManage.GetArticleCategoryTable(), "CategoryName", "CategoryId");
        this.ddlcategoryList.SelectedValue = categoryId.ToString();
    }
    private void InitializeComponent()
    {
        this.btnSave.Click += new EventHandler(btnSave_Click);
        InitInfo();
    }

    void btnSave_Click(object sender, EventArgs e)
    {
        int _selectCategoryId = Convert.ToInt32(this.ddlcategoryList.SelectedValue);
        if(_selectCategoryId == 0){
            this.ltErrorMsg.Text = "请选择所属分类";
            return;
        }

        articleInfo = new ArticleInfo();
        articleInfo.ArticleId = articleId;
        articleInfo.CategoryId = _selectCategoryId;
        articleInfo.Title = txtTitle.Text;
        articleInfo.Content = txtContent.Text;        
        articleInfo.GUID = Guid.NewGuid().ToString();
        articleInfo.PublishDate = Convert.ToDateTime(string.Format("{0} {1}", this.PublishDate.SelectedDate.ToString("yyyy-MM-dd"), DateTime.Now.ToString("hh:mm:ss")));
        articleInfo.LinkUrl = this.txtLinkUrl.Text;
        articleInfo.Url = string.Format("{1}news/html/{0}.aspx", articleInfo.GUID,ResolveUrl("~"));
        articleInfo.ImageUrl = this.txtImageUrl.Text;
        articleInfo.Introduction = this.txtIntroduction.Text;
        if(!string.IsNullOrEmpty(articleInfo.LinkUrl)){
            articleInfo.Url = this.articleInfo.LinkUrl;
        }
        
        

        ArticleManage.Update(articleInfo);

        string js = string.Format("alert('保存成功!');window.location.href='articlelist.aspx?categoryId={0}';",_selectCategoryId);
        Page.ClientScript.RegisterStartupScript(this.GetType(),"SaveSuccess",js, true);
    }
}
