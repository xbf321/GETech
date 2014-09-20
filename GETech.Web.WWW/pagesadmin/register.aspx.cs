using System;

using GETech.Data;
using GETech.Entity;

public partial class pagesadmin_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnRegister.Click += new EventHandler(btnRegister_Click);
    }

    void btnRegister_Click(object sender, EventArgs e)
    {
        if(MemberManage.Exists(this.txtUserName.Text,this.txtUserEmail.Text)){
            this.ltMsg.Text = "用户名或Email已存在";
            return;
        }
        SiteMember sm = new SiteMember();
        sm.Email = this.txtUserEmail.Text;
        sm.UserName = this.txtUserName.Text;
        sm.UserPwd = this.txtConfirmUserPwd.Text;
        int i = sm.Update();

        if(i >0){
            this.ltMsg.Text = "用户已经创建,请等待审核!";
        }
    }
}
