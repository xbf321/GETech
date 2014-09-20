using System;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class cx_FindTrack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.btnOk.Click += new EventHandler(btnOk_Click);
    }

    void btnOk_Click(object sender, EventArgs e)
    {
        string name = this.txtRealName.Text;
        string trackId = this.txtTrackId.Text;
        string strSQL = "SELECT TOP(1)* FROM Promotion201204 WITH(NOLOCK) WHERE TrackId = @TrackId AND RealName = @RealName";
        SqlParameter[] parms = { 
                                new SqlParameter("TrackId",SqlDbType.NVarChar),
                                new SqlParameter("RealName",SqlDbType.NVarChar)
                               };
        parms[0].Value = trackId;
        parms[1].Value = name;
        DataRow dr = Goodspeed.Library.Data.SQLPlus.ExecuteDataRow(CommandType.Text,strSQL,parms);
        if(dr == null){
            this.ltUrl.Text = "暂无记录。";
            return;
        }
        //两种情况
        //1,确实没有参加调查问卷
        //2,已经参加调查问卷
        trackId = dr["TrackId"].ToString();
        bool isSurveyed = Convert.ToBoolean(dr["IsSurveyed"]);
        if(isSurveyed){
            this.ltUrl.Text = "您已经参加过调查，请等待工作人员和您联系。";
            return;
        }
        string encrptTrackId = Goodspeed.Library.Security.DESCryptography.Encrypt(string.Format("{0}", trackId), "4D324DF0");
        string url = string.Empty;
        if(Regex.IsMatch(trackId,@"DPI(\d+)",RegexOptions.IgnoreCase)){
            url = string.Format("DPI620Survey.aspx?k={0}",encrptTrackId);
        }
        if(Regex.IsMatch(trackId,@"BN(\d+)",RegexOptions.IgnoreCase)){
            url = string.Format("BNSurvey.aspx?k={0}", encrptTrackId);
        }
        if (!string.IsNullOrEmpty(url))
        {
            this.ltUrl.Text = string.Format("<a href=\"{0}\">点击参加调查</a>", url);
        }
    }
}
