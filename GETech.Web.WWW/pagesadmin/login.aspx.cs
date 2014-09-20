using System;
using System.Web;
using System.Web.UI;
using System.Web.Security;

using GETech.Data;
using GETech.Entity;

public partial class pagesadmin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnLogin.Click += new EventHandler(btnLogin_Click);
        if(!Page.IsPostBack){
            if (Request.IsAuthenticated)
            {
                FormsAuthentication.SignOut();
            }
        }
        
    }

    void btnLogin_Click(object sender, EventArgs e)
    {
        if (MemberManage.Validator(this.txtUserName.Text, this.txtUserPwd.Text))
        {
            SiteMember sm = new SiteMember(this.txtUserName.Text);
            if (!sm.IsPass) {
                this.ltMsg.Text = "您还没有通过审核或帐号已禁用";
            }
            else
            {
                Login(this.txtUserName.Text, this.txtUserPwd.Text);
                Response.Redirect(string.Format("{0}pagesadmin/index.aspx",ResolveUrl("~")));
            }
        }
        else {
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
