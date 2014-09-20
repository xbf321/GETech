using System;

using GETech.Entity;

public partial class pagesadmin_member_setpassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnSave.Click += new EventHandler(btnSave_Click);
    }

    void btnSave_Click(object sender, EventArgs e)
    {
        SiteMember sm = new SiteMember(User.Identity.Name);
        if(sm.UserPwd != this.txtUserPwd.Text){
            this.ltMsg.Text = "您的旧密码不匹配,请重试";
            return;
        }
        sm.UserPwd = this.txtNewConfirmUserPwd.Text;
        sm.Update();

        this.ltMsg.Text = "已更新";
        
    }
}
