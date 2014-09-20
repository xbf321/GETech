using System;
using System.Web.UI;


using GETech.Data;
using Controleng.Common;

public partial class pagesadmin_product_postproduct : System.Web.UI.Page
{
    protected int productId = 0;
    protected string action = "add";
    protected int categoryId = 0;

    protected ProductInfo productInfo;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack){
            if(productId > 0){
                productInfo = ProductManage.GetProductInfoByProductId(productId);
                this.txtContent.Text = productInfo.Content;
                this.txtTitle.Text = productInfo.Title;
            }
        }
    }
    override protected void OnInit(EventArgs e)
    {
        InitializeComponent();
        base.OnInit(e);
    }
    void InitInfo()
    {

        productId = CECRequest.GetQueryInt("productId", 0);
        action = CECRequest.GetQueryString("action");
        categoryId = CECRequest.GetQueryInt("categoryid", 0);

        if (action.ToLower() == "del")
        {
            ProductManage.Delete(productId);
            Response.Redirect("productlist.aspx");
            return;
        }
        this.ddlcategoryList.BuildTree(ProductCategoryManage.GetCategoryForTable(), "CategoryName", "CategoryId");
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
        if (_selectCategoryId == 0)
        {
            this.ltErrorMsg.Text = "请选择所属分类";
            return;
        }

        productInfo = new ProductInfo();
        productInfo.CategoryId = _selectCategoryId;
        productInfo.Content = txtContent.Text;
        productInfo.Title = txtTitle.Text;

        ProductManage.Update(productInfo);
        string js = string.Format("alert('保存成功!');window.location.href='productlist.aspx?categoryId={0}';", _selectCategoryId);
        Page.ClientScript.RegisterStartupScript(this.GetType(), "SaveSuccess", js, true);
    }
}
