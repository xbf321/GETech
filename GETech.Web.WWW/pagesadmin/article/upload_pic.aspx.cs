using System;
using System.IO;
using System.Web.Security;

public partial class pagesadmin_article_upload_pic : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnUpload.Click += new EventHandler(btnUpload_Click);
        if (!Request.IsAuthenticated || !Roles.IsUserInRole("Admin"))
        {
            Response.Write("Not Access!");
            Response.End();
        }
    }

    void btnUpload_Click(object sender, EventArgs e)
    {
        //上传
        if (this.uploadedFile.FileContent.Length > 0)
        {
            string UploadDirectory = System.IO.Path.Combine(Server.MapPath("~"),"upload\\news\\");
            if(!System.IO.Directory.Exists(UploadDirectory)){
                System.IO.Directory.CreateDirectory(UploadDirectory);
            }
            FileInfo fi = new FileInfo(uploadedFile.PostedFile.FileName);

            string fileName = Guid.NewGuid().ToString() + fi.Extension;

            uploadedFile.PostedFile.SaveAs(UploadDirectory + fileName);

            string returnJs = "var html=\""+ResolveUrl("~")+"upload/news/"+fileName+"\";if (html != null) {html = '<img src=\"' + html + '\"/>';window.opener.InsertToEditor(html);window.close();}";
            this.Page.ClientScript.RegisterStartupScript(this.GetType(),"OK",returnJs,true);
        }
        else {
            this.lbmsg.Text = "请选择文件";
        }
    }
}
