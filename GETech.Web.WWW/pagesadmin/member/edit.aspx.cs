using System;
using System.Web.UI;
using System.Data;
using System.Web.Security;


using GETech.Data;
using GETech.Entity;
using Controleng.Common;

public partial class pagesadmin_member_edit : System.Web.UI.Page
{
    protected int userId = 0;
    protected SiteMember sm;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnSave.Click += new EventHandler(btnSave_Click);
        userId = CECRequest.GetQueryInt("userid",0);
        if (!Page.IsPostBack)
        {
            if (userId > 0)
            {
                sm = new SiteMember(userId);
                if (sm != null)
                {
                    this.txtUserName.Text = sm.UserName;
                    this.cbIsPass.Checked = sm.IsPass;
                }
            }
        }
    }

    void btnSave_Click(object sender, EventArgs e)
    {
        SiteMember sm = new SiteMember(userId);
        sm.IsPass = cbIsPass.Checked;
        sm.Update();

        DataRow dr = MemberManage.GetUserInfo(userId);
        if(cbIsPass.Checked){
            Roles.AddUsersToRoles(new string[] { dr["UserName"].ToString() }, new string[] { "Admin" });
        }
        
    }
}
