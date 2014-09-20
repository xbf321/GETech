<%@ Page Title="GE 检测控制技术" Language="C#" MasterPageFile="~/templates/EmptyMasterPageWithoutForm.master" %>

<%@ Register TagPrefix="uc" Namespace="GETech.Control" Assembly="GETech.Core" %>
<%@ Register Src="app_usercontrols/uc_header.ascx" TagName="uc_header" TagPrefix="uc1" %>
<%@ Register Src="app_usercontrols/uc_footer.ascx" TagName="uc_footer" TagPrefix="uc2" %>
<%@ Register Src="~/app_usercontrols/uc_logininfo.ascx" TagName="uc_logininfo" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="/css/base.css" rel="stylesheet" type="text/css" />
    <link href="/css/channel.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .news-commend
        {
        }
        .news-commend .more{float:right;}
        .news-commend h2, .product-commend h2
        {
            font-size: 14px;
            color: #3a73b8;
        }
        .product-commend
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <uc3:uc_logininfo ID="uc_logininfo" runat="server" />
    <div id="banner" class="mB">
        <a href="/">
            <img src="/images/top.jpg" /></a></div>
    <uc1:uc_header ID="uc_header1" runat="server" />
    <div class="clear">
    </div>
    <div class="main">
        <div id="left_column">
            <div class="searchBar mB">
                <p>
                    站内搜索</p>
                <p>
                    <input type="text" id="txtkey" size="15" />
                    <img src="images/search_btn.gif" onclick="search();" align="absmiddle" /></p>
            </div>
            <div class="searchBar mB">
                <p>
                    产品目录</p>
                <p>
                    <select id="selProduct" name="selProduct" class="ProductsByCategory" style="width: 118px;">
                        <option value="-1">-- 请选择 --</option>
                        <option value="/product/category/1.aspx">超声检测</option>
                        <option value="/product/category/2.aspx">- 探伤仪</option>
                        <option value="/product/category/4.aspx">- 大型检测设备</option>
                        <option value="/product/category/236.aspx">- 系统</option>
                        <option value="/product/category/5.aspx">- 腐蚀测厚仪</option>
                        <option value="/product/category/5.aspx">- 精密测厚仪</option>
                        <option value="/product/category/6.aspx">- 传感器</option>
                        <option value="/product/category/7.aspx">- 探头和藕合剂</option>
                        <option value="/product/category/8.aspx">- 软件</option>
                        <option value="/product/category/10.aspx">工业内窥镜</option>
                        <option value="/product/category/11.aspx">- 视频内视镜</option>
                        <option value="/product/category/12.aspx">- 摇摄-倾斜-变焦摄像头</option>
                        <option value="/product/category/13.aspx">- 硬式管道镜</option>
                        <option value="/product/category/14.aspx">- 可伸缩纤维管道镜</option>
                        <option value="/product/category/15.aspx">- 机器人采集器</option>
                        <option value="/product/category/16.aspx">- 光源</option>
                        <option value="/product/category/17.aspx">- 软件</option>
                        <option value="/product/category/18.aspx">- 配件</option>
                        <option value="/product/category/19.aspx">X射线产品</option>
                        <option value="/product/category/20.aspx">- 胶片及胶片处理设备</option>
                        <option value="/product/category/21.aspx">- 数字X光成像</option>
                        <option value="/product/category/22.aspx">- 工业X射线管、高压发生器和控制 </option>
                        <option value="/product/category/24.aspx">- X射线实时成像系统</option>
                        <option value="/product/category/25.aspx">- X射线分析</option>
                        <option value="/product/category/27.aspx">涡流产品</option>
                        <option value="/product/category/43.aspx">光学系统</option>
                    </select>
                </p>
            </div>
            <div class="searchBar mB">
                <p>
                    更多信息需求,<br />
                    <span class="blue"><a href="/aboutusCn/contactus.htm" target="_blank">
                        <img src="images/geit_2.jpg" alt="请联系我们" /></a></span></p>
                <p>
                    <br />
                    <span class="blue">
                        <img src="images/tell.gif" alt="中国客服中电话：8009159966" /></span></p>
                <br />
                <p>
                    <span class="blue"><a href="http://www.ge-energy.com/prod_serv/products/oc/cn/index.htm"
                        target="_blank">
                        <img src="images/geit_1.jpg" alt="Bently Nevada & 控制解决方案" /></a></span></p>
                <p>
                    &nbsp;
                </p>
                <p>
                    <span class="blue"><a href="http://www.gesensing.com.cn/" target="_blank">
                        <img src="images/geit_3.jpg" alt="传感科技与测量解决方案" /></a></span></p>
            </div>
            <div class="searchBar mB">
                <p>
                    加入GE,<br />
                    <span class="blue"><a href="/aboutusCn/careers.htm" target="_blank">
                        <img src="images/geit_4.jpg" alt="加入Ge" /></a></span></p>
            </div>
            <div class="searchBar mB">
            </div>
            <div class="searchBar mB">
                <p>
                    <span class="blue"><a href="http://webinar.controleng.cn/" target="_blank">
                        <img src="images/usm.gif" /></a></span></p>
            </div>
        </div>
        <div id="center_column">
            <div class="news-commend">
                <h2>
                    最新新闻</h2>
                <ul>
                    <asp:Repeater ID="rptNewsCommandList" runat="server" DataSourceID="SqlDataSource_rptNewsCommandList">
                        <ItemTemplate>
                            <li>><a href="<%#Eval("Url") %>" class="blue" title="<%#Eval("Title") %>">
                                <%#Eval("Title") %></a>&nbsp;&nbsp;[<%#Eval("PublishDate","{0:yyyy/MM/dd}")%>]</li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <a href="/news/" class="more">>> 新闻中心</a>
                <div class="clear"></div>
                <asp:SqlDataSource ID="SqlDataSource_rptNewsCommandList" SelectCommand="SELECT TOP(4)Url,Introduction,Title,PublishDate FROM Articles /*WHERE CategoryId = 4 首页推荐 AND ImageUrl = ''*/ ORDER BY PublishDate DESC"
                    ConnectionString="<%$ ConnectionStrings:ednchina %>" runat="server"></asp:SqlDataSource>
            </div>
            <div class="clear"></div>
            <div class="product-commend">
                <h2>
                    产品推荐</h2>
                <asp:Repeater ID="rptProductList" runat="server" DataSourceID="SqlDataSource_rptProductList">
                    <ItemTemplate>
                        <div class="centerBottomB mB">
                            <dl>
                                <dt><a href="<%#Eval("Url") %>" title="<%#Eval("Title") %>">
                                    <img src="<%#Eval("ImageUrl") %>" alt="<%#Eval("Title") %>" /></a></dt>
                                <dd>
                                    <a href="<%#Eval("Url") %>" class="blue" title="<%#Eval("Title") %>"><strong>
                                        <%#Eval("Title") %></strong></a>
                                    <br />
                                    <%#Eval("Introduction") %></dt>
                            </dl>
                        </div>
                        <div class="clear">
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="SqlDataSource_rptProductList" ConnectionString="<%$ ConnectionStrings:ednchina %>"
                    SelectCommand="SELECT TOP(4)Url,Introduction,Title,ImageUrl FROM Articles WHERE CategoryId = 4 /*首页推荐*/ AND ImageUrl <> '' ORDER BY PublishDate DESC"
                    runat="server"></asp:SqlDataSource>
            </div>
        </div>
        <div id="right_column">
            <div class="mB">
                <object id="CoreVPlayer" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0"
                    height="150" width="203" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000">
                    <param name="Movie" value="images/GEIT.swf">
                    <param name="Align" value="middle">
                    <param name="Quality" value="High">
                    <param name="wmode" value="opaque" />
                    <param name="AllowScriptAccess" value="always">
                    <param name="Scale" value="ShowAll">
                    <param name="BGColor" value="#ffffff">
                    <param name="AllowFullScreen" value="false">
                    <embed src="images/GEIT.swf" align="middle" quality="high" bgcolor="#ffffff" allowscriptaccess="always"
                        allowfullscreen="true" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash"
                        type="application/x-shockwave-flash" width="203" height="150"></embed>
                </object>
            </div>
            <div class="mB">
                <p>
                    <a href="/news/">
                        <img src="images/news.gif" alt="公司新闻" /></a></p>
                <p>
                    <a href="/aboutusCn/tradeshow.htm">
                        <img src="images/exhibition.gif" alt="展会信息" /></a></p>
                <p>
                    <a href="/train_down.htm">
                        <img src="images/down.gif" alt="下载中心" /></a></p>
                <p>
                    <a href="/train_newWeb.htm">
                        <img src="images/newsite.gif" alt="新品网站" /></a></p>
            </div>
            <div class="message">
                <strong><a href="/feedback.aspx">
                    <img src="images/message.gif" alt="在线反馈" /></a> <a href="/feedback.aspx" class="blueB">
                        在线反馈</a></strong>
                <br />
                如果您对我们的产品、服务有什么建议、疑问和需求，请在线提交给我们。</div>
        </div>
        <div class="clear">
        </div>
    </div>
    <uc2:uc_footer ID="uc_footer1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpFooterScript" runat="Server">

    <script type="text/javascript">
        $(document).ready(function() {
            $("#nav >li").each(function() {
                $(this).mousedown(function() {
                    $(this).attr("class", "sfhover");
                    $(this).find("ul").show();
                });
                $(this).mouseup(function() {
                    $(this).attr("class", "sfhover");
                    $(this).find("ul").show();
                });
                $(this).mouseover(function() {
                    $(this).attr("class", "sfhover");
                    $(this).find("ul").show();
                });
                $(this).mouseout(function() {
                    $(this).removeAttr("class");
                    $(this).find("ul").hide();
                });
            });
            $("#selProduct").change(function() {
                var _value = $(this).val();
                if (_value != "-1") {
                    window.location.href = _value;
                }
            });
        });
        function search() {
            var keyObj = $("#txtkey");
            if ($.trim(keyObj.val()) == "") {
                alert("请输入关键词");
                return;
            }
            window.location.href = 'search.aspx?keywords=' + escape(keyObj.val());
        }
    </script>

</asp:Content>
