using System;
using System.Data;
using System.Text.RegularExpressions;

public partial class cx_ExportUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strSQL = "SELECT TrackId,RealName,Mobile,Company,Position,Department,Phone,Email,Source,IsSurveyed,SelectProduct,CreateDateTime,ProductType,Course FROM dbo.Promotion201204 WITH(NOLOCK)";
        DataTable dt = Goodspeed.Library.Data.SQLPlus.ExecuteDataTable(CommandType.Text,strSQL);
        if(dt != null && dt.Rows.Count>0){
            Output(dt);
        }
    }
    private void Output(DataTable oTable)
    {
        Response.Clear();
        Response.AppendHeader("Content-Disposition", string.Format("attachment;filename=member_{0}.csv", DateTime.Now.ToString("yyyyMMddHHmm")));
        Response.ContentType = "application/ms-excel";
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        foreach (DataColumn dc in oTable.Columns)
        {
            Response.Write(dc.ColumnName.ToLower() + ",");
        }

        Response.Write("\n");


        foreach (DataRow dr in oTable.Rows)
        {
            foreach (DataColumn dc in oTable.Columns)
            {
                string s = dr[dc].ToString().Replace(",", " ");
                s = Regex.Replace(s, @"[\f\n\r\t\v]", string.Empty);
                Response.Write(s + ",");
            }
            Response.Write("\n");
        }
        Response.End();
    }
}
