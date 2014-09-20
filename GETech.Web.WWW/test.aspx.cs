using System;
using System.Data;

public partial class test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strSQL = "SELECT TOP(10)* FROM dbo.Articles";
        DataTable dt = Goodspeed.Library.Data.SQLPlus.ExecuteDataTable(CommandType.Text,strSQL);
        if(dt != null && dt.Rows.Count>0){
            foreach(DataRow dr in dt.Rows){
                Response.Write(string.Format("{0}<br>",dr["Title"]));
            }
        }
    }
}
