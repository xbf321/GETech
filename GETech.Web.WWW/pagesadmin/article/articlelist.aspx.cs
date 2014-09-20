using System;

using GETech.Data;
using Controleng.Common;

public partial class pagesadmin_article_articlelist : System.Web.UI.Page
{
    private int categoryId = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    override protected void OnInit(EventArgs e)
    {
        InitializeComponent();
        base.OnInit(e);
    }
    private void InitializeComponent()
    {
        this.btnSearch.Click += new EventHandler(btnSearch_Click);
        InitInfo();
    }

    void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("articlelist.aspx?CategoryId={0}", this.ddlcategoryList.SelectedValue));
    }
    void InitInfo()
    {
        this.ddlcategoryList.BuildTree(ArticleCategoryManage.GetArticleCategoryTable(), "CategoryName", "CategoryId");

        categoryId = CECRequest.GetQueryInt("CategoryId", 0);
        this.ddlcategoryList.SelectedValue = this.SqlDataSource_rptList.SelectParameters[0].DefaultValue = categoryId.ToString();         
    }
}
