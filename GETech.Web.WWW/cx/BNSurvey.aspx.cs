using System;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Text.RegularExpressions;

public partial class cx_BNSurvey : System.Web.UI.Page
{
    protected string trackId = string.Empty;
    protected string errorTip = "非法请求！<a href=\"bn.aspx\">返回</a>";
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnOK.Click += new EventHandler(btnOK_Click);
        string key = Request.QueryString["k"];
        if (!string.IsNullOrEmpty(key))
        {
            try
            {
                trackId = Goodspeed.Library.Security.DESCryptography.Decrypt(key, "4D324DF0");
                if (!Regex.IsMatch(trackId, @"BN(\d+)", RegexOptions.IgnoreCase))
                {
                    Response.Write(errorTip);
                    Response.End();
                }

                if (!IsPostBack)
                {
                    //检查是否已经填写调查
                    if (checkSurvey(trackId))
                    {
                        //已经填写
                        Response.Write("您已经填写过此调查了，请等待工作人员和您联系，<a href=\"bn.aspx\">返回</a>");
                        Response.End();
                    }
                }
            }
            catch { }
        }
        else
        {
            Response.Write(errorTip);
            Response.End();
        }
    }

    //提交完了
    void btnOK_Click(object sender, EventArgs e)
    {

        //首先检查是否提交过
        if (checkSurvey(trackId))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('您已经填写过此调查了，请等待工作人员和您联系。');", true);
            return;
        }

        string guid = Guid.NewGuid().ToString();


        bool error = false;
        StringBuilder tipMessage = new StringBuilder();
        //问题1
        if (this.q1.SelectedIndex == -1)
        {
            error = true;
            tipMessage.Append(",请选择问题1");
        }
        //问题2
        if (this.q2.SelectedIndex == -1)
        {
            error = true;
            tipMessage.Append(",请选择问题2");
        }
        //问题3
        if (this.q3.SelectedIndex == -1)
        {
            error = true;
            tipMessage.Append(",请选择问题3");
        }
        //问题4
        if (this.q4.SelectedIndex == -1)
        {
            error = true;
            tipMessage.Append(",请选择问题4");
        }
        //问题5
        if (this.q5.SelectedIndex == -1)
        {
            error = true;
            tipMessage.Append(",请选择问题5");
        }
        if (tipMessage.Length > 0 && error)
        {
            string tip = Regex.Replace(tipMessage.ToString(), @"^,", string.Empty);
            Page.ClientScript.RegisterStartupScript(this.GetType(), "TIP", string.Format("alert('{0}');", tip), true);
        }
        else
        {
            //问题1
            insertSurvey(guid, "q1", this.q1.SelectedValue, "radio");            
            insertSurvey(guid, "q2", this.q2.SelectedValue, "radio");
            string q3Select = string.Empty;
            foreach (ListItem item in q3.Items)
            {
                if (item.Selected)
                {
                    q3Select += item.Value + "-";
                }
            }
            insertSurvey(guid, "q3", Regex.Replace(q3Select,@"\-$",string.Empty), "checkbox");
            insertSurvey(guid, "q4", this.q4.SelectedValue, "radio");
            insertSurvey(guid, "q5", this.q5.SelectedValue, "radio");

            //把Promotion201204表中的【是否参与调查】的标示更新为1
            updateIsSurveyed(trackId);

            Page.ClientScript.RegisterStartupScript(this.GetType(), "Success", "showDialog();", true);
        }
    }
    /// <summary>
    /// 把Promotion201204表中的【是否参与调查】的标示更新为1
    /// </summary>
    /// <param name="trackId"></param>
    void updateIsSurveyed(string trackId)
    {
        string strSQL = "UPDATE Promotion201204 SET IsSurveyed = 1,SurveryDateTime = GETDATE() WHERE TrackId = @TrackId";
        SqlParameter parm = new SqlParameter("TrackId", trackId);
        Goodspeed.Library.Data.SQLPlus.ExecuteNonQuery(CommandType.Text, strSQL, parm);
    }
    /// <summary>
    /// 插入到调查表中
    /// </summary>
    /// <param name="guid"></param>
    /// <param name="question"></param>
    /// <param name="answer"></param>
    /// <param name="url"></param>
    /// <param name="title"></param>
    void insertSurvey(string guid, string question, string answer, string controlName)
    {
        string title = this.Page.Title;
        string url = Request.Url.AbsolutePath;
        string strSQL = "INSERT INTO Survey([GUID],Url,Title,Question,Answer,ControlName,TrackId,CreateDateTime) VALUES(@GUID,@Url,@Title,@Question,@Answer,@ControlName,@TrackId,GETDATE())";
        SqlParameter[] parms = { 
                                new SqlParameter("GUID",SqlDbType.NVarChar),
                                new SqlParameter("Url",SqlDbType.NVarChar),
                                new SqlParameter("Title",SqlDbType.NVarChar),
                                new SqlParameter("Question",SqlDbType.NVarChar),
                                new SqlParameter("Answer",SqlDbType.NVarChar),
                                new SqlParameter("ControlName",SqlDbType.NVarChar),
                                new SqlParameter("TrackId",SqlDbType.NVarChar),
                               };
        parms[0].Value = guid;
        parms[1].Value = url;
        parms[2].Value = title;
        parms[3].Value = question;
        parms[4].Value = answer;
        parms[5].Value = controlName;
        parms[6].Value = trackId;
        Goodspeed.Library.Data.SQLPlus.ExecuteNonQuery(CommandType.Text, strSQL, parms);
    }
    /// <summary>
    /// 检查用户是否填写过调查
    /// </summary>
    /// <param name="trackId"></param>
    /// <returns></returns>
    bool checkSurvey(string trackId)
    {
        string strSQL = "SELECT IsSurveyed FROM Promotion201204 WITH(NOLOCK) WHERE TrackId = @TrackId";
        SqlParameter parm = new SqlParameter("TrackId", trackId);
        return Convert.ToInt32(Goodspeed.Library.Data.SQLPlus.ExecuteScalar(CommandType.Text, strSQL, parm)) > 0;
    }
}
