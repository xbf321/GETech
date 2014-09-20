using System;
using System.Web;
using System.Web.UI;

using Controleng.Common;
using GETech.Data;
using GETech.Entity;
using System.Data;

public partial class pagesadmin_article_categorylist : System.Web.UI.Page
{
    public string str = "";
    public int noPicCount = 0;
    private string T_rootpic = "<img src=../../images/lines/tplus.gif align=absmiddle>";
    private string L_rootpic = "<img src=../../images/lines/lplus.gif align=absmiddle>";
    private string L_TOP_rootpic = "<img src=../../images/lines/rplus.gif align=absmiddle>";
    private string I_rootpic = "<img src=../../images/lines/dashplus.gif align=absmiddle>";
    private string T_nodepic = "<img src=../../images/lines/tminus.gif align=absmiddle>";
    private string L_nodepic = "<img src=../../images/lines/lminus.gif align=absmiddle>";
    private string I_nodepic = "<img src=../../images/lines/i.gif align=absmiddle>";
    private string No_nodepic = "<img src=../../images/lines/noexpand.gif align=absmiddle>";
    protected int CategoryId = 0;
    protected string Action = "add";
    protected int categoryId = 0;
    protected ArticleCategoryInfo categoryInfo;
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
                }
            }



            DataTable dt = ArticleCategoryManage.GetArticleCategoryTable();
            ViewState["dt"] = dt;

            if (dt.Rows.Count > 0)
            {

                AddTree(0, dt.Select("Layer=0 AND [ParentId]=0"), "");
                str = "<script type=\"text/javascript\">\r\n  var obj = [" + str;
                str = str.Substring(0, str.Length - 3);
                str += "];\r\n var newtree = new tree(\"newtree\",obj,\"reSetTree\");";
                str += "</script>";
            }
            ShowTreeLabel.Text = str;
        }

    }
    protected void InitInfo()
    {
        categoryId = CECRequest.GetQueryInt("categoryid", 0);
        Action = CECRequest.GetQueryString("action");

        if (Action == "del")
        {
            bool isDelete = ArticleCategoryManage.DeleteCategory(categoryId);
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

        this.ddlcategoryList.BuildTree(ArticleCategoryManage.GetArticleCategoryTable(), "CategoryName", "CategoryId");
        this.ddlcategoryList.SelectedValue = categoryId.ToString();
        if(Action.ToLower() == "edit"){
            categoryInfo = ArticleCategoryManage.GetArticleCategoryInfo(categoryId);
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
         if (Action.ToLower() == "edit")
        {
            categoryInfo = new ArticleCategoryInfo();
            categoryInfo.CategoryName = txtName.Text;
            categoryInfo.Sort = Convert.ToInt32(txtSort.Text);
            categoryInfo.CategoryId = categoryId;
            ArticleCategoryManage.UpdateArticleCategory(categoryInfo);
        }
        else
        {
            if (this.ddlcategoryList.SelectedValue != "0")
            {
                int _id = Utils.StrToInt(this.ddlcategoryList.SelectedValue, 0);
                categoryInfo = ArticleCategoryManage.GetArticleCategoryInfo(_id);
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
                    DataTable dt = ArticleCategoryManage.GetSubCategoryListTable(_id);
                    if (dt.Rows.Count > 0)
                    {
                        maxOrder = TypeConverter.ObjectToInt(dt.Compute("Max(Sort)", ""));
                    }
                    else
                    {
                        maxOrder = categoryInfo.Sort;
                    }

                    InsertCategory(_id, categoryInfo.Layer + 1, parentIdList, 0, maxOrder);
                    ArticleCategoryManage.UpdateSubCategoryCount(_id);
                }
            }
            else
            {
                int maxdisplayorder = TypeConverter.ObjectToInt(ArticleCategoryManage.GetArticleCategoryTable().Compute("Max(Sort)", "")) + 1;
                InsertCategory(0, 0, "0", 0, maxdisplayorder);
            }
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "SaveSuccess", "alert('添加成功!');window.location.href='categorylist.aspx';", true);

    }
    void InsertCategory(int parentId, int layer, string parentIdList, int subCategoryCount, int order)
    {
        categoryInfo = new ArticleCategoryInfo();
        categoryInfo.CategoryId = categoryId;
        categoryInfo.CategoryName = txtName.Text;
        categoryInfo.ParentId = parentId;
        categoryInfo.ParentIdList = parentIdList;
        categoryInfo.Layer = layer;
        categoryInfo.SubCategoryCount = subCategoryCount;
        categoryInfo.Sort = order;

        ArticleCategoryManage.InsertArticleCategory(categoryInfo);

        this.txtName.Text = string.Empty;
    }

    #region == AddTree ==
    private void AddTree(int layer, DataRow[] drs, string currentnodestr)
    {
        DataTable dt = (DataTable)ViewState["dt"];
        if (layer == 0)
        {
            #region 作为根结点

            for (int n = 0; n < drs.Length; n++)
            {
                string mystr = "";
                if (drs.Length == 1)
                {
                    mystr += I_rootpic; //
                    currentnodestr = No_nodepic;
                }
                else
                {
                    if (n == 0)
                    {
                        mystr += L_TOP_rootpic; //
                        currentnodestr = I_nodepic;
                    }
                    else
                    {
                        if ((n > 0) && (n < (drs.Length - 1)))
                        {
                            mystr += T_rootpic; //
                            currentnodestr = I_nodepic;
                        }
                        else
                        {
                            mystr += L_rootpic;
                            currentnodestr = No_nodepic;
                        }
                    }
                }

                str += "{fid:" + drs[n]["CategoryId"].ToString() + ",name:\"" +
                       HttpUtility.HtmlEncode(drs[n]["CategoryName"].ToString().Trim().Replace("\\", "\\\\ ")) + "\",subject:\" " +
                       mystr + " <img src=../../images/folders.gif align=\\\"absmiddle\\\" > <a href=\\\"###\\\" >" +
                       HttpUtility.HtmlEncode(drs[n]["CategoryName"].ToString().Trim().Replace("\\", "\\\\ ")) + "</a>\",linetitle:\"" +
                       mystr + "\",parentidlist:0,layer:" + drs[n]["Layer"].ToString() + ",subforumcount:" +
                       drs[n]["SubCategoryCount"].ToString() + "},\r\n";

                if (Convert.ToInt32(drs[n]["SubCategoryCount"].ToString()) > 0)
                {
                    int mylayer = Convert.ToInt32(drs[n]["Layer"].ToString());
                    string selectstr = "Layer=" + (++mylayer) + " AND ParentId=" + drs[n]["CategoryId"].ToString();
                    AddTree(mylayer, dt.Select(selectstr), currentnodestr);
                }
            }

            #endregion
        }
        else
        {
            #region 作为版块

            for (int n = 0; n < drs.Length; n++)
            {
                string mystr = "";
                mystr += currentnodestr;
                string temp = currentnodestr;

                if ((n >= 0) && (n < (drs.Length - 1)))
                {
                    mystr += T_nodepic; //
                    temp += I_nodepic;
                }
                else
                {
                    mystr += L_nodepic;
                    noPicCount++;
                    temp += No_nodepic;
                }

                str += "{fid:" + drs[n]["CategoryId"].ToString() + ",name:\"" +
                      HttpUtility.HtmlEncode(drs[n]["CategoryName"].ToString().Trim().Replace("\\", "\\\\ ")) + "\",subject:\" " +
                      mystr + " <img src=../../images/folder.gif align=\\\"absmiddle\\\" > <a href=\\\"###\\\">" +
                      HttpUtility.HtmlEncode(drs[n]["CategoryName"].ToString().Trim().Replace("\\", "\\\\ ")) + "</a>\",linetitle:\"" +
                      mystr + "\",parentidlist:\"" + drs[n]["ParentIdList"].ToString().Trim() + "\",layer:" +
                      drs[n]["Layer"].ToString() + ",subforumcount:" + drs[n]["SubCategoryCount"].ToString() + "},\r\n";


                if (Convert.ToInt32(drs[n]["SubCategoryCount"].ToString()) > 0)
                {
                    int mylayer = Convert.ToInt32(drs[n]["Layer"].ToString());
                    string selectstr = "Layer=" + (++mylayer) + " AND ParentId=" + drs[n]["CategoryId"].ToString();
                    AddTree(mylayer, dt.Select(selectstr), temp);
                }
            }

            #endregion
        }
    }
    #endregion
}
