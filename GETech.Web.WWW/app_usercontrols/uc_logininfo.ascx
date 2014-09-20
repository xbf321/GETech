<%@ Control Language="C#" ClassName="uc_logininfo" %>

<script runat="server">

</script>
<div style=" background-color:#eeeeee;height:22px;padding:2px 10px 2px 0;">
    <span style="float:right"><%if (Request.IsAuthenticated)
      {%>
      您好,<%=HttpContext.Current.User.Identity.Name%>!&nbsp;&nbsp;<a href="/usr/">【我的中心】</a>,<a href="/logout.aspx">退出</a>
    <%}
      else
      {%>
      您好，欢迎来GE检测控制技术！请<a href="/login.aspx">登录</a>&nbsp;&nbsp;<a href="/register.aspx">免费注册</a>
    <%} %></span>
</div>
