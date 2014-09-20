using System;

using GETech.Entity;
using GETech.Data;

public partial class feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnPost.Click += new EventHandler(btnPost_Click);

        string code = ValidateCodeControl.Code;
        code = Goodspeed.Library.Security.DESCryptography.Encrypt(code, System.Configuration.ConfigurationManager.AppSettings["DESKey"]);
        imageCode.ImageUrl = string.Format("{0}ValidateCode.aspx?code={1}",ResolveUrl("~"), code);


        this.Page.Title = string.Format("在线留言 - {0}", System.Configuration.ConfigurationManager.AppSettings["WebSiteTitlePostfix"]);
    }

    void btnPost_Click(object sender, EventArgs e)
    {
        if (this.Page.IsValid)
        {
            FeedbackInfo model = new FeedbackInfo();
            model.Content = this.txtContent.Text;
            model.Email = this.txtEmail.Text;
            model.Phone = this.txtPhone.Text;
            model.RealName = this.txtRealName.Text;
            model.IP = Goodspeed.Common.BrowserInfo.Current.IP;
            int i = FeedbackMange.Add(model);
            if (i > 0)
            {
                this.ltMsg.Text = "留言成功!";
            }
            else
            {
                this.ltMsg.Text = "留言失败";
            }

            this.txtRealName.Text = string.Empty;
            this.txtPhone.Text = string.Empty;
            this.txtEmail.Text = string.Empty;
            this.txtContent.Text = string.Empty;
        }

    }
}
