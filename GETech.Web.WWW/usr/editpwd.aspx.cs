using System;


using GETech.Entity;

public partial class usr_editpwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btn_Update.Click += new EventHandler(btn_Update_Click);
    }

    void btn_Update_Click(object sender, EventArgs e)
    {
        SiteMember sm = new SiteMember(User.Identity.Name);
        if(sm.UserPwd != this.txtOldPwd.Text){
            this.ltMsg.Text = "旧密码不正确,请重新输入!";
            return;
        }
        sm.UserPwd = this.txtConfirmNewPwd.Text;
        sm.Update();

        this.ltMsg.Text = "修改成功,请牢记!";
    }
}
