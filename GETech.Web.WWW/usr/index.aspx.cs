using System;
using System.Web.UI;


using GETech.Entity;
using GETech.Data;

public partial class usr_index : System.Web.UI.Page
{
    private SiteMember sm = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btn_Update.Click += new EventHandler(btn_Update_Click);
        sm = new SiteMember(User.Identity.Name);
        if (!Page.IsPostBack)
        {
            Init();
        }
    }

    void btn_Update_Click(object sender, EventArgs e)
    {
        //首先检查Email是否有重复

        if (sm.Email != this.txtEmail.Text)
        {
            //检查除了自己本身之外是否重复
            if (MemberManage.ExistsEmailExceptUser(this.txtEmail.Text, sm.UserId))
            {
                this.ltMsg.Text = "Email重复!";
                return;
            }
            sm.Email = this.txtEmail.Text;
        }

        sm.Company = this.txtCompany.Text;
        sm.Fax = this.txtFax.Text;
        sm.InterestProduct = this.txtInterestProduct.Text;
        sm.IsReceiveNewProductEmail = this.cbResive.Checked;
        sm.Phone = this.txtPhone.Text;
        sm.RealName = this.txtRealName.Text;

        sm.Update();

        this.ltMsg.Text = "更新成功!";
    }
    void Init()
    {
        sm = new SiteMember(User.Identity.Name);
        this.txtCompany.Text = sm.Company;
        this.txtEmail.Text = sm.Email;
        this.txtFax.Text = sm.Fax;
        this.txtInterestProduct.Text = sm.InterestProduct;
        this.txtPhone.Text = sm.Phone;
        this.txtRealName.Text = sm.RealName;
        this.cbResive.Checked = sm.IsReceiveNewProductEmail;
    }
}
