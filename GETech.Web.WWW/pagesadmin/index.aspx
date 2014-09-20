<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<script runat="server">
    protected string url;
    void Page_Load(object sender, EventArgs e)
    {
        url = Request.QueryString["url"];
        if (url == null)
            url = "article/articlelist.aspx";
    }
</script>

<html>
<head runat="server">
    <title>检测科技网站管理系统</title>
    <link href="css/base.css" rel="stylesheet" type="text/css" />
    <link href="css/pagesadmin.css" rel="stylesheet" type="text/css" />
</head>
<div class="main_Login">
    <!--顶部导航-->
    <div class="LiMain mBL">
        <ul id="Litop">
            <li class="l"></li>
            <li class="R">
                <table width="90%" height="68" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td height="37" colspan="2">
                            &nbsp;
                        </td>
                        <td width="30%">
                            <img src="images/home.gif" width="13" height="14" align="absmiddle" />
                            <a href="/" class="blue3">网站首页</a>&nbsp;&nbsp;
                            <img src="images/suo.gif" width="13" height="14" align="absmiddle" />
                            <a href="login.aspx" class="blue3">安全退出</a>
                        </td>
                    </tr>
                    <tr>
                        <td width="4%">
                            &nbsp;
                        </td>
                        <td width="66%" class="blue2">
                            当前用户：超级管理员
                        </td>
                        <td class="blue2">
                            <%=DateTime.Now.ToString("yyyy年MM月dd日") %>&nbsp;&nbsp;<%=System.DateTime.Now.DayOfWeek %>
                        </td>
                    </tr>
                </table>
            </li>
        </ul>
    </div>
    <div class="clear">
    </div>
    <!--中间内容-->
    <div class="LiContentL">
        <p>
            <img src="images/LiLtitle.gif" height="30" /></p>
        <iframe src="lefttree.aspx" width="100%" height="90%" scrolling="auto" frameborder="0">
        </iframe>
    </div>
    <div class="LiContentR">
        <iframe src="<%=url%>" frameborder="0" width="100%" height="700" scrolling="auto"
            name="right" id="right"></iframe>
    </div>
    <div class="clear">
    </div>
    <div id="footBar">
        1997-
        <%=System.DateTime.Now.Year %>
        General Electric Company 版权所有</div>
</div>
</html>
