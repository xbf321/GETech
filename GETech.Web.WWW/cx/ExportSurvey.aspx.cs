using System;
using System.Data;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using System.Text;

public partial class cx_ExportSurvey : System.Web.UI.Page
{
    public class Survey
    {
        private string _trackId;
        public string TrackId
        {
            get { return _trackId; }
            set { _trackId = value; }
        }
        private string _guid;
        public string GUID
        {
            get
            {
                return _guid;
            }
            set
            {
                _guid = value;
            }
        }
        private string _question;
        public string Question { get { return _question; } set { _question = value; } }
        private string _answer;
        public string Answer { get { return _answer; } set { _answer = value; } }
        private DateTime _createDateTime;
        public DateTime CreateDateTime { get { return _createDateTime; } set { _createDateTime = value; } }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        string key = Request.QueryString["key"];
        if (!string.IsNullOrEmpty(key))
        {
            Export(key);
        }
    }
    void Export(string key)
    {
        string strSQLFormat = "SELECT TrackId,Guid,Question,Answer,CreateDateTime FROM Survey WITH(NOLOCK) WHERE Url = '{0}'";
        if (key.ToUpper() == "DPI")
        {
            //导出DPI调查
            string strSQL = string.Format(strSQLFormat, "/cx/DPI620Survey.aspx");
            DataTable dt = Goodspeed.Library.Data.SQLPlus.ExecuteDataTable(CommandType.Text, strSQL);
            Output(dt);
        }
        if(key.ToUpper() == "BN"){            
            //导出BN调查
            string strSQL = string.Format(strSQLFormat, "/cx/BNSurvey.aspx");
            DataTable dt = Goodspeed.Library.Data.SQLPlus.ExecuteDataTable(CommandType.Text, strSQL);
            Output(dt);
        }
    }
    private void Output(DataTable oTable)
    {

        StringBuilder sbText = new StringBuilder();

        System.Collections.Generic.List<Survey> surveyList = new System.Collections.Generic.List<Survey>();

        foreach (DataRow dr in oTable.Rows)
        {
            Survey model = new Survey();
            model.Answer = dr["Answer"].ToString();
            model.CreateDateTime = Convert.ToDateTime(dr["CreateDateTime"]);
            model.GUID = dr["GUID"].ToString();
            model.Question = dr["Question"].ToString();
            model.TrackId = dr["TrackId"].ToString();
            surveyList.Add(model);
        }

        Dictionary<string, string> fileds = new Dictionary<string, string>();
        Dictionary<string, string> guids = new Dictionary<string, string>();
        //把标题分组
        foreach (Survey item in surveyList)
        {
            if (!fileds.ContainsKey(item.Question))
            {
                fileds.Add(item.Question, item.Question);
            }
            if (!guids.ContainsKey(item.GUID))
            {
                guids.Add(item.GUID, item.GUID);
            }
        }
        foreach (KeyValuePair<string, string> item in fileds)
        {
            sbText.AppendFormat("{0},", item.Value);
        }
        sbText.AppendFormat("{0},{1},{2}", "TrackId", "GUID", "CreateDateTime");
        sbText.AppendLine();


        foreach (KeyValuePair<string, string> item in guids)
        {
            string guid = item.Value;
            List<Survey> signleGuidList = surveyList.FindAll(delegate(Survey m)
            {
                return m.GUID == guid;
            });
            if (signleGuidList.Count > 0)
            {
                //每一个用户
                //根据问题获取答案
                foreach (KeyValuePair<string, string> question in fileds)
                {
                    //循环每一个问题
                    List<string> answerList = new List<string>();

                    //防止有一个问题有多中答案
                    List<Survey> qList = signleGuidList.FindAll(delegate(Survey q)
                    {
                        return q.Question == question.Value;
                    });
                    if (qList.Count > 0)
                    {
                        foreach (Survey s in qList)
                        {
                            string answer = s.Answer;
                            answer = Regex.Replace(answer, @"[\f\n\r\t\v]", string.Empty);
                            answer = answer.Replace(",", ".");
                            answerList.Add(answer);
                        }
                        sbText.Append(string.Join("|", answerList.ToArray()));
                    }
                    sbText.Append(",");
                }

                //取第一个添加TrackId,Guid,CreateDateTime
                Survey firstSurvey = signleGuidList[0];
                sbText.AppendFormat("{0},{1},{2}", firstSurvey.TrackId, firstSurvey.GUID, firstSurvey.CreateDateTime);
                sbText.AppendLine();
            }/**/

        }

        Response.Clear();
        Response.AppendHeader("Content-Disposition", string.Format("attachment;filename=survey_{0}.csv", DateTime.Now.ToString("yyyyMMddHHmm")));
        Response.ContentType = "application/ms-excel";
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        Response.Write(sbText.ToString());
        Response.End();
    }
}
