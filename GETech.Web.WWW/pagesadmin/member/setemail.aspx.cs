using System;
using System.Web.UI;

using GETech.Entity;

public partial class pagesadmin_member_setemail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnSave.Click += new EventHandler(btnSave_Click);

        if(!Page.IsPostBack){
            SiteMember sm = new SiteMember(User.Identity.Name);
            this.txtEmail.Text = sm.Email;
        }
    }

    void btnSave_Click(object sender, EventArgs e)
    {
        SiteMember sm = new SiteMember(User.Identity.Name);
        if (!sm.ExistsEmail(this.txtNewEmail.Text))
        {
            sm.Email = txtNewEmail.Text;
            sm.Update();
            this.ltMsg.Text = "已更新";
        }
        else {
            this.ltMsg.Text = "此Email已存在,请选择其他Email";
            return;
        }
    }
}
