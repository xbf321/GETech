using System;
using System.Web.UI;

using System.Data;
using System.Text;
using System.Data.SqlClient;

using Goodspeed.Library.Data;
using System.Text.RegularExpressions;

public partial class cx_BN : System.Web.UI.Page
{
    protected string trackId = string.Empty;
    protected string encryptTrackId = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnOK.Click += new EventHandler(btnOK_Click);
        if (!IsPostBack)
        {
            this.txtP1DateTime.Text = this.txtP2DateTime.Text = this.txtP3DateTime.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
    }

    void btnOK_Click(object sender, EventArgs e)
    {
        //组合选择的产品
        StringBuilder selectProduct = new StringBuilder();
        StringBuilder selectProductForEmail = new StringBuilder();
        if (this.cbP1.Checked)
        {
            selectProduct.AppendFormat(",P1-{0}-{1}", this.ddlP1PC.SelectedValue, this.txtP1DateTime.Text);
            selectProductForEmail.AppendFormat("买【Scout100】，购买台数：{0}，大致购买时间 ：{1}。<br />", this.ddlP1PC.SelectedValue, this.txtP1DateTime.Text);
        }
        if (this.cbP2.Checked)
        {
            selectProduct.AppendFormat(",P2-{0}-{1}", this.ddlP2PC.SelectedValue, this.txtP2DateTime.Text);
            selectProductForEmail.AppendFormat("买【Scout140】，购买台数：{0}，大致购买时间 ：{1}。<br />", this.ddlP2PC.SelectedValue, this.txtP2DateTime.Text);
        }
        if (this.cbP3.Checked)
        {
            selectProduct.AppendFormat(",P3-{0}-{1}", this.ddlP3PC.SelectedValue, this.txtP3DateTime.Text);
            selectProductForEmail.AppendFormat("买【ADRE 408】，购买台数：{0}，大致购买时间 ：{1}。<br />", this.ddlP3PC.SelectedValue, this.txtP3DateTime.Text);
        }

        //注册
        string strSQL = "INSERT INTO Promotion201204(GUID,ProductType,RealName,Mobile,Company,Position,Department,Phone,Email,Source,SelectProduct,Course) VALUES(@GUID,'BN',@RealName,@Mobile,@Company,@Position,@Department,@Phone,@Email,@Source,@SelectProduct,@Course);SELECT @@IDENTITY;";
        string guid = Guid.NewGuid().ToString();

        SqlParameter[] parms = { 
                                new SqlParameter("GUID",SqlDbType.NVarChar),
                                new SqlParameter("RealName",SqlDbType.NVarChar),
                                new SqlParameter("Mobile",SqlDbType.NVarChar),
                                new SqlParameter("Company",SqlDbType.NVarChar),
                                new SqlParameter("Position",SqlDbType.NVarChar),
                                new SqlParameter("Department",SqlDbType.NVarChar),
                                new SqlParameter("Phone",SqlDbType.NVarChar),
                                new SqlParameter("Email",SqlDbType.NVarChar),
                                new SqlParameter("Source",SqlDbType.NVarChar),
                                new SqlParameter("SelectProduct",SqlDbType.NVarChar),
                                new SqlParameter("Course",SqlDbType.NVarChar)
                               };
        parms[0].Value = guid;
        parms[1].Value = txtRealname.Text;
        parms[2].Value = this.txtMobile.Text;
        parms[3].Value = this.txtCompany.Text;
        parms[4].Value = this.txtPosition.Text;
        parms[5].Value = this.txtDepartment.Text;
        parms[6].Value = this.txtPhone.Text;
        parms[7].Value = this.txtEmail.Text;
        parms[8].Value = this.ddlfrom.SelectedValue;
        parms[9].Value = Regex.Replace(selectProduct.ToString(), @"^,", string.Empty);
        parms[10].Value = Regex.Replace(txtCourse.Value, @"\-$", string.Empty);

        int i = Convert.ToInt32(SQLPlus.ExecuteScalar(CommandType.Text, strSQL, parms));
        if (i > 0)
        {

            //生成追踪号 格式DPI04XXXXX
            trackId = string.Format("BN{1}{0}", i.ToString("0000"), DateTime.Now.ToString("MMdd"));
            //更新追踪号
            strSQL = string.Format("UPDATE Promotion201204 SET TrackId = '{0}' WHERE Id = {1} ", trackId, i);
            i = SQLPlus.ExecuteNonQuery(CommandType.Text, strSQL);


            //弹出提示框
            //加密trackId和GUID
            encryptTrackId = Goodspeed.Library.Security.DESCryptography.Encrypt(string.Format("{0}", trackId), "4D324DF0");

            StringBuilder emailBody = new StringBuilder();
            emailBody.AppendFormat("{0} ，您好！", txtRealname.Text);
            emailBody.Append("<br /><br />");
            emailBody.AppendFormat("非常感谢您参与我们此次用户真情回馈促销活动，您的订单跟踪号是{0}，以下是关于您订单的具体信息：", trackId);
            emailBody.Append("<br /><br />");
            emailBody.AppendFormat("姓 名：{0}", txtRealname.Text);
            emailBody.Append("<br />");
            emailBody.AppendFormat("手 机：{0}", txtMobile.Text);
            emailBody.Append("<br />");
            emailBody.AppendFormat("公司名称：{0}", txtCompany.Text);
            emailBody.Append("<br />");
            emailBody.AppendFormat("职 务：{0}", txtPosition.Text);
            emailBody.Append("<br />");
            emailBody.AppendFormat("所属部门：{0}", txtDepartment.Text);
            emailBody.Append("<br />");
            emailBody.AppendFormat("办公电话：{0}", txtPhone.Text);
            emailBody.Append("<br />");
            emailBody.AppendFormat(" Email：{0}", txtEmail.Text);
            emailBody.Append("<br />");
            emailBody.AppendFormat("促销信息来源：{0}", ddlfrom.SelectedValue);
            emailBody.Append("<br />");
            emailBody.Append("您选择购买的产品：");
            emailBody.Append("<br />");
            emailBody.AppendFormat("{0}", selectProductForEmail.ToString());
            emailBody.Append("<br /><br />");
            emailBody.Append("我们会有专人在2个工作日之内与您联系，如有问题请咨询中国客服电话800-915-9966。");
            emailBody.Append("<br />");
            emailBody.Append("GE监测控制技术");
            emailBody.Append("<br />");
            emailBody.AppendFormat("{0}", DateTime.Now.ToString("yyyy年MM月dd日"));

            //发送Email
            SendEmail(txtEmail.Text, emailBody.ToString());

            Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowSuccessDialog", "showSuccessDialog();",true);
        }
        else
        {
            Response.Write("出现未知错误，请重试！");
            Response.End();
        }

    }
    /// <summary>
    /// 发送邮件
    /// </summary>
    /// <param name="email"></param>
    void SendEmail(string email, string body)
    {
        string from = "gemcchinacx@163.com";
        string subject = "注册成功";

        System.Net.Mail.MailMessage myEmail = new System.Net.Mail.MailMessage();
        Encoding eEncod = Encoding.GetEncoding("utf-8");
        myEmail.From = new System.Net.Mail.MailAddress(from, subject, eEncod);
        myEmail.To.Add(email);
        myEmail.Subject = subject;
        myEmail.IsBodyHtml = true;
        myEmail.Body = body;
        myEmail.Priority = System.Net.Mail.MailPriority.Normal;
        myEmail.BodyEncoding = Encoding.GetEncoding("utf-8");
        string[] cc = { "Dishu.Sun@ge.com", "sensing.cn@ge.com", "shelley.hou@ge.com", "hong.ren@ge.com", "slc007@163.com" };
        myEmail.CC.Add(string.Join(",", cc));

        System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
        smtp.Host = "smtp.163.com";
        smtp.Port = 25;
        smtp.Credentials = new System.Net.NetworkCredential("gemcchinacx", "13910162891");


        try
        {
            smtp.Send(myEmail);
        }
        catch
        {
        }/**/
    }
}
