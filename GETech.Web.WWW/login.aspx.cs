using System;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using GETech.Data;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btn_Login.Click += new EventHandler(btn_Login_Click);
    }

    void btn_Login_Click(object sender, EventArgs e)
    {
        if (MemberManage.Validator(this.txtUserName.Text, this.txtPwd.Text))
        {
            //管理员不能在这登录
            bool isInAdmin = Roles.IsUserInRole(this.txtUserName.Text, "Admin");
            if (isInAdmin)
            {
                this.ltMsg.Text = "用户名或密码错误!";
                return;
            }
            Login(this.txtUserName.Text, this.txtPwd.Text);
            Response.Redirect("/");
        }
        else
        {
            this.ltMsg.Text = "用户名或密码错误!";
        }
    }
    private void Login(string userName, string password)
    {
        int expiresTime = 1;//半小时
        string[] UserRolesList = Roles.GetRolesForUser(userName);
        
        string UserRoles = string.Join(",", UserRolesList);
        FormsAuthenticationTicket Ticket = new FormsAuthenticationTicket(1, userName, DateTime.Now, DateTime.Now.AddHours(expiresTime), true, UserRoles, FormsAuthentication.FormsCookiePath);
        string HashTicket = FormsAuthentication.Encrypt(Ticket);
        HttpCookie lcookie = new HttpCookie(FormsAuthentication.FormsCookieName, HashTicket);
        lcookie.Expires = DateTime.Now.AddHours(expiresTime);
        lcookie.Domain = FormsAuthentication.CookieDomain;
        Response.Cookies.Add(lcookie);
        Response.Cookies[FormsAuthentication.FormsCookieName].Expires = DateTime.Now.AddHours(expiresTime);
    }
}
