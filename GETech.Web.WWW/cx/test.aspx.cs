using System;
using System.Text;

public partial class cx_test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SendEmail("xbf321@gmail.com");
    }
    /// <summary>
    /// 发送邮件
    /// </summary>
    /// <param name="email"></param>
    void SendEmail(string email)
    {
        string from = "gemcchinacx@163.com";
        string subject = "123123";
        string body = "<a href=\"\">sss</a>3333";

        System.Net.Mail.MailMessage myEmail = new System.Net.Mail.MailMessage();
        Encoding eEncod = Encoding.GetEncoding("utf-8");
        myEmail.From = new System.Net.Mail.MailAddress(from, subject, eEncod);
        myEmail.To.Add(email);
        myEmail.Subject = subject;
        myEmail.IsBodyHtml = true;
        myEmail.Body = body;
        myEmail.Priority = System.Net.Mail.MailPriority.Normal;
        myEmail.BodyEncoding = Encoding.GetEncoding("utf-8");


        System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
        smtp.Host = "smtp.163.com";
        smtp.Port = 25;
        smtp.Credentials = new System.Net.NetworkCredential("gemcchinacx", "13910162891");


        try
        {
            smtp.Send(myEmail);
        }
        catch (System.Net.Mail.SmtpException ex)
        {
            throw ex;
        }/**/
    }
}
