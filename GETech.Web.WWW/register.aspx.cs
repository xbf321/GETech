using System;

using GETech.Entity;
using System.Web.Security;

public partial class register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnReg.Click += new EventHandler(btnReg_Click);
    }

    void btnReg_Click(object sender, EventArgs e)
    {
        //判断用户名是否存在,判断Email是否存在
        SiteMember siteMember = new SiteMember();
        if (siteMember.Exists(this.txtUserName.Text,this.txtEmail.Text)) {
            this.ltMsg.Text = "用户名或Email已存在!";
            return;
        }

        //审核通过（普通用户）
        siteMember.Company = this.txtCompany.Text;
        siteMember.Email = this.txtEmail.Text;
        siteMember.Fax = this.txtFax.Text;
        siteMember.InterestProduct = this.txtInterestProduct.Text;
        siteMember.IsPass = true;
        siteMember.IsReceiveNewProductEmail = this.cbResive.Checked;
        siteMember.Phone = this.txtPhone.Text;
        siteMember.RealName = this.txtRealName.Text;
        siteMember.UserName = this.txtUserName.Text;
        siteMember.UserPwd = this.txtPwd.Text;

        int userId = siteMember.Update();

        //Update UserRole

        Roles.AddUsersToRole(new string[] { siteMember.UserName }, "SiteMember");

        this.ltMsg.Text = "注册成功!";
    }
}
