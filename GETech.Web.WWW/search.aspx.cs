using System;
using Controleng.Common;

public partial class search : System.Web.UI.Page
{
    protected string strKeywords = string.Empty;
    protected string strType = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnSearch.Click += new EventHandler(btnSearch_Click);
        strKeywords = CECRequest.GetQueryString("keywords");
        strType = CECRequest.GetQueryString("type");
        if (!Page.IsPostBack)
        {
            this.txtKey.Text = strKeywords;
            if(!string.IsNullOrEmpty(strType)){
                switch(strType){
                    case "n":
                        this.rblType.SelectedValue = "n";
                        break;
                    case "p":
                        this.rblType.SelectedValue = "p";
                        break;
                }
            }
            Search(this.txtKey.Text, this.rblType.SelectedValue);
        }
        this.Page.Title = string.Format("{1} - 搜索 - {0}", System.Configuration.ConfigurationManager.AppSettings["WebSiteTitlePostfix"],strKeywords);
    }
    void Search(string key ,string type) {
        string strSQL = string.Empty;
        if (type == "n")
        {           
            //News
            strSQL = "SELECT ArticleId AS Id, Title,Url,Content FROM Articles WHERE Title LIKE '%'+@Key+'%' OR Content LIKE '%'+@key+'%'";
        }
        if (type == "p")
        {
            //Product
            strSQL = "SELECT CategoryId AS Id, CategoryName AS Title,CASE LinkUrl WHEN '' THEN '/product/category/'+CAST(CategoryId AS NVARCHAR(10))+'.aspx' ELSE LinkUrl END AS Url,Content FROM ProductCategories WHERE Content LIKE '%'+@Key+'%'";
        }
        SqlDataSource_rptList.SelectCommand = strSQL;
        SqlDataSource_rptList.SelectParameters["Key"].DefaultValue = key;
    }
    void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("search.aspx?keywords={0}&type={1}",this.txtKey.Text,this.rblType.SelectedValue));
    }
}
