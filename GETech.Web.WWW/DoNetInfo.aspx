<%@ Page Language="C#"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Asp.Net 服务器信息探针</title>
    <style type="text/css"> 
body,table,td{font-size:12px;color:#000000;word-break:break-all; text-align:left;}
form{margin:0;padding:0}
td td{padding-left:12px;}
a{color:#000090;}
a:hover{color:#FF3333}
.InputTxt{font-size:12px;width:140px;height:18px;border:solid 1px #333333;}
.Button{font-size:12px;width:32px;height:16px;border:solid 1px #333333;background:#CCCCCC}
.TrHead{font-size:12px;color:#CC3380;font-weight:600;text-align:center;height:28px;background:#CCCCCC}
</style>

</head>
<body>
    <table border="0" width="100%" align="center">
	<tr>
		<td class="TrHead" height="30" style="font-size:14px;font-weight:600;color:#FF3333">Asp.Net 服务器信息探针</td>
	</tr>
</table>
<table width="760" border="1" align="center" cellspacing="0" bordercolor="#666666" bgcolor="#EEEEEE" style="border-collapse:collapse">
	<tr> 
		<td align="center">
			<table width="95%" align="center" border="1" bordercolor="#FFFFFF" cellspacing="0" style="border-collapse:collapse">
				<tr> 
					<td colspan="2" class="TrHead">服务器基本信息</td>
				</tr>
				<tr> 
					<td width="38%" height="26">服务器计算机名</td>
					<td><%=System.Environment.MachineName %></td>
				</tr>
				<tr> 
					<td height="26">服务器IP地址</td>
					<td><%=HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"]%></td>
				</tr>
				<tr> 
					<td height="26">服务器IIS版本</td>
					<td><%=HttpContext.Current.Request.ServerVariables["SERVER_SOFTWARE"]%></td>
				</tr>
				<tr> 
					<td height="26">端口</td>
					<td><%=System.Web.HttpContext.Current.Request.ServerVariables["SERVER_PORT"]%></td>
				</tr>
				<tr> 
					<td height="26">站点目录名称</td>
					<td><%=HttpContext.Current.Server.MapPath("~") %></td>
				</tr>
				<tr>
					<td height="26">服务器操作系统</td>
					<td><%=Environment.OSVersion%></td>
				</tr>
				<tr>
					<td height="26">服务器操作系统安装目录</td>
					<td><%=System.IO.Directory.GetParent(Environment.SystemDirectory).FullName%></td>
				</tr>
				<tr>
					<td height="26">服务器应用程序安装目录</td>
					<td><%=System.Environment.CurrentDirectory %></td>
				</tr>
				<tr>
					<td height="26">.NET Framework 版本</td>
					<td><%=System.Environment.Version %></td>
				</tr>
				<tr>
					<td height="26">服务器当前时间</td>
					<td><%=System.DateTime.Now %></td>
				</tr>
				<tr>
					<td height="26">服务器上次启动到现在已运行</td>
					<td><%=(new TimeSpan(Convert.ToInt64(System.Environment.TickCount) * 10000)).Days %> 天 <%=(new TimeSpan(Convert.ToInt64(System.Environment.TickCount) * 10000)).Hours %> 小时 <%=(new TimeSpan(Convert.ToInt64(System.Environment.TickCount) * 10000)).Minutes %> 分 <%=(new TimeSpan(Convert.ToInt64(System.Environment.TickCount) * 10000)).Seconds%> 秒</td>
				</tr>
			</table>
		<%--<br>
			<table width="95%" align="center" border="1" bordercolor="#FFFFFF" cellspacing="0" style="border-collapse:collapse">
				<tr> 
					<td colspan="2" class="TrHead">服务器相关硬件信息</td>
				</tr>
				<tr> 
					<td width="38%" height="26">物理内存总数</td>
					<td><%=System.Environment.WorkingSet/1024%> MB</td>
				</tr>
				<tr> 
					<td height="26">可用物理内存</td>
					<td>169 MB</td>
				</tr>
				<tr> 
					<td height="26">正使用的内存</td>
					<td>91 %</td>
				</tr>
				<tr> 
					<td height="26">交换文件大小</td>
					<td>3947 MB</td>
				</tr>
				<tr> 
					<td height="26">交换文件可用大小</td>
					<td>1224 MB</td>
				</tr>
				<tr> 
					<td height="26">总虚拟内存</td>
					<td>2047 MB</td>
				</tr>
				<tr> 
					<td height="26">剩余虚拟内存</td>
					<td>1628 MB</td>
				</tr>
				<tr> 
					<td width="38%" height="26">逻辑驱动器</td>
					<td><%=string.Join("|",System.Environment.GetLogicalDrives()) %></td>
				</tr>
				<tr> 
					<td height="26">CPU 总数</td>
					<td><%=System.Environment.ProcessorCount %></td>
				</tr>
				
				
			</table>--%>
		</td>
	</tr>
</table>
</body>
</html>
