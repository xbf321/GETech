using System;

using GETech.Data;
using GETech.Entity;

public partial class findpwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btn_Ok.Click += new EventHandler(btn_Ok_Click);
    }

    void btn_Ok_Click(object sender, EventArgs e)
    {
        //-1，说明没有此用户名名
        //0，说明有此用户名，但是Email错误
        //1，说明正确
        int i = MemberManage.FindPwd(this.txtUserName.Text,this.txtEmail.Text);
        if(i== -1){
            this.ltMsg.Text = "用户名不存在!";
            return;
        }
        if(i== 0){
            this.ltMsg.Text = "Email不正确!";
            return;
        }

        SiteMember sm = new SiteMember(this.txtUserName.Text);
        this.ltMsg.Text = string.Format("请牢记您的密码：{0}，并尽快更新!",sm.UserPwd);
    }
}
