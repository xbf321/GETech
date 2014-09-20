using System;
using System.Web;
using System.Data;
using System.Web.UI;


using GETech.Data;
using System.Text;


public partial class pagesadmin_product_categorylist : System.Web.UI.Page
{   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DataTable dt = ProductCategoryManage.GetCategoryForTable();
            StringBuilder sb = new StringBuilder();
            string blank = HttpUtility.HtmlDecode("‖—");
            sb.Append(BindNode("0",dt,blank));
            this.ShowTreeLabel.Text = sb.ToString();
        }

    }

    private string BindNode(string sonparentid, DataTable dt, string blank)
    {
        StringBuilder sb = new StringBuilder();
        DataRow[] drs = dt.Select("ParentId=" + sonparentid);
        foreach (DataRow r in drs)
        {
            string blankNode = HttpUtility.HtmlDecode("———" +blank);
            sb.AppendFormat("{2}{1}&nbsp;<a href=\"postcategory.aspx?categoryid={0}&action=add\">添加</a>&nbsp;|&nbsp;<a href=\"postcategory.aspx?CategoryId={0}&action=edit\">编辑</a>&nbsp;|&nbsp;<a href=\"###\" onclick=\"del({0});\">删除</a></br>", r["CategoryId"], r["CategoryName"], blank);
            
            sb.Append(BindNode(r["CategoryId"].ToString(), dt,blankNode));
        }
        return sb.ToString();
    }
}
