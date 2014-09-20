using System;
using System.Web;
using System.Data;
using System.Web.UI;


using GETech.Data;
using GETech.Entity;
using Controleng.Common;

public partial class pagesadmin_product_postcategory : System.Web.UI.Page
{
    protected int CategoryId = 0;
    protected string Action = "add";
    protected int categoryId = 0;
    protected ProductCategoryInfo categoryInfo;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Action.ToLower() == "edit")
            {
                if (categoryId > 0)
                {

                    this.txtName.Text = categoryInfo.CategoryName;
                    this.txtSort.Text = categoryInfo.Sort.ToString();
                    this.ddlcategoryList.Enabled = false;
                    this.txtContent.Text = categoryInfo.Content;
                    this.txtLinkUrl.Text = categoryInfo.LinkUrl;
                }
            }
        }
    }
    protected void InitInfo()
    {
        categoryId = CECRequest.GetQueryInt("categoryid", 0);
        Action = CECRequest.GetQueryString("action");

        if (Action.ToLower() == "del")
        {
            bool isDelete = ProductCategoryManage.Delete(categoryId);
            if (!isDelete)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "DelError", "alert('该分类可能有字分类，请先删掉子分类!');window.location.href='categorylist.aspx';", true);
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "DeleSuccess", "alert('删除成功!');window.location.href='categorylist.aspx';", true);

            }
            return;

        }

        this.ddlcategoryList.BuildTree(ProductCategoryManage.GetCategoryForTable(), "CategoryName", "CategoryId");
        this.ddlcategoryList.SelectedValue = categoryId.ToString();
        if (Action.ToLower() == "edit")
        {
            categoryInfo = ProductCategoryManage.GetCategoryInfo(categoryId);
            this.ddlcategoryList.SelectedValue = categoryInfo.ParentId.ToString();
        }

    }
    override protected void OnInit(EventArgs e)
    {
        InitializeComponent();
        base.OnInit(e);
    }

    private void InitializeComponent()
    {
        this.btnSave.Click += new EventHandler(btnSave_Click);
        InitInfo();
    }

    void btnSave_Click(object sender, EventArgs e)
    {
        if(string.IsNullOrEmpty(this.txtContent.Text)){
            Page.ClientScript.RegisterStartupScript(this.GetType(), "SaveError", "alert('请输入内容!');", true);
            return;
        }
        if (Action.ToLower() == "edit")
        {
            categoryInfo = new ProductCategoryInfo();
            categoryInfo.CategoryName = txtName.Text;
            categoryInfo.Sort = Convert.ToInt32(txtSort.Text);
            categoryInfo.CategoryId = categoryId;
            categoryInfo.Content = this.txtContent.Text;
            categoryInfo.LinkUrl = this.txtLinkUrl.Text;
            ProductCategoryManage.Update(categoryInfo);
        }
        else
        {
            if (this.ddlcategoryList.SelectedValue != "0")
            {
                int _id = Utils.StrToInt(this.ddlcategoryList.SelectedValue, 0);
                categoryInfo = ProductCategoryManage.GetCategoryInfo(_id);
                if (categoryInfo != null)
                {
                    string parentIdList = string.Empty;
                    if (categoryInfo.ParentIdList == "0")
                    {
                        parentIdList = categoryInfo.CategoryId.ToString();
                    }
                    else
                    {
                        parentIdList = categoryInfo.ParentIdList + "," + categoryInfo.CategoryId;
                    }
                    int maxOrder = 0;
                    DataTable dt = ProductCategoryManage.GetSubCategoryListTable(_id);
                    if (dt.Rows.Count > 0)
                    {
                        maxOrder = TypeConverter.ObjectToInt(dt.Compute("Max(Sort)", ""));
                    }
                    else
                    {
                        maxOrder = categoryInfo.Sort;
                    }

                    InsertCategory(_id, categoryInfo.Layer + 1, parentIdList, 0, maxOrder, txtContent.Text);
                    ProductCategoryManage.UpdateSubCategoryCount(_id);
                }
            }
            else
            {
                int maxdisplayorder = TypeConverter.ObjectToInt(ProductCategoryManage.GetCategoryForTable().Compute("Max(Sort)", "")) + 1;
                InsertCategory(0, 0, "0", 0, maxdisplayorder, txtContent.Text);
            }
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "SaveSuccess", "alert('添加成功!');window.location.href='postcategory.aspx';", true);

    }
    void InsertCategory(int parentId, int layer, string parentIdList, int subCategoryCount, int order, string content)
    {
        categoryInfo = new ProductCategoryInfo();
        categoryInfo.CategoryId = categoryId;
        categoryInfo.CategoryName = txtName.Text;
        categoryInfo.ParentId = parentId;
        categoryInfo.ParentIdList = parentIdList;
        categoryInfo.Layer = layer;
        categoryInfo.SubCategoryCount = subCategoryCount;
        categoryInfo.Sort = order;
        categoryInfo.Content = content;
        categoryInfo.LinkUrl = txtLinkUrl.Text;

        ProductCategoryManage.Insert(categoryInfo);

        this.txtName.Text = string.Empty;
    }
}
