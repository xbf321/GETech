using System;
using System.Data;

public partial class temp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
//        string strSQL = @"INSERT INTO SiteRoles(RoleName,RoleChineseName,GroupName)
//VALUES('SiteMember','普通会员',2)";
//        Goodspeed.Library.Data.SQLPlus.ExecuteNonQuery(CommandType.Text, strSQL);

//        //Response.Write("Over");

        string strSQL = "SElECT * FROM SiteRoles";
        DataTable dt = Goodspeed.Library.Data.SQLPlus.ExecuteDataTable(CommandType.Text,strSQL);
        foreach(DataRow dr in dt.Rows){
            Response.Write(dr["RoleName"].ToString());
          }

        //Response.Write(foo(5)+"<br>");
        //Response.Write(foo2(5));
    }
    int foo(int n) {
        int result = 1;
        for (int i = n; i > 0;i-- ) {
            result = result * i;
        }
        return result;
    }
    int foo2(int n) {
        if (n == 1) { return 1; }
        return n * foo2(n-1);
    }
}
