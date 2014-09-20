<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="/css/superfish.css" media="screen">
    <link href="/css/superfish-vertical.css" rel="stylesheet" type="text/css" />

    <script src="/js/jquery.min.1.3.2.js" type="text/javascript"></script>

    <script type="text/javascript" src="/js/superfish.js"></script>

</head>
<body>
    <div>
        <ul id="sf-menu" class="sf-menu sf-vertical">
            <li><a href="/product/category/2.aspx">超声检测</a>
                <ul>
                    <li><a href="/product/category/8.aspx">探伤仪</a><ul>
                        <li><a href="/product/category/16.aspx">Phasor 系列</a><ul>
                            <li><a href="/product/category/20.aspx">USM 系列</a><ul>
                                <li><a href="/product/category/21.aspx">USM Go</a></li><li><a href="/product/category/22.aspx">
                                    USM 33</a></li><li><a href="/product/category/23.aspx">USM 32X</a></li><li><a href="/product/category/24.aspx">
                                        USM 35X</a></li></ul>
                            </li>
                        </ul>
                        </li>
                        <li><a href="/product/category/17.aspx">USN 系列</a></li><li><a href="/product/category/18.aspx">
                            点焊检测仪</a></li><li><a href="/product/category/19.aspx">USLT 2000 系列</a></li></ul>
                    </li>
                    <li><a href="/product/category/9.aspx">系统设备</a></li><li><a href="/product/category/10.aspx">
                        检测设备</a></li><li><a href="/product/category/12.aspx">传感器</a></li></ul>
            </li>
            <li><a href="/product/category/3.aspx">工业内窥镜</a><ul>
                <li><a href="/product/category/13.aspx">CSS</a></li><li><a href="/product/category/14.aspx">
                    XHTML</a></li><li><a href="/product/category/15.aspx">JavaScript</a></li></ul>
            </li>
            <li><a href="/product/category/4.aspx">X射线产品</a><ul>
                <li><a href="http://www.baidu.com">光彩仪器</a></li><li><a href="http://www.baidu.com">京东商城</a></li></ul>
            </li>
            <li><a href="/product/category/5.aspx">涡流产品</a></li><li><a href="/product/category/6.aspx">
                硬度计</a></li><li><a href="/product/category/7.aspx">光学系统</a></li><li><a href="/product/category/11.aspx">
                    测厚仪</a></li><li><a href="/product/category/29.aspx">GE检测</a></li></ul>
    </div>

    <script type="text/javascript">
        //        ddsmoothmenu.init({
        //            mainmenuid: "menuProduct", //Menu DIV id
        //            orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
        //            classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
        //            contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
        //        });
        jQuery(function() {
            jQuery('ul.sf-menu').superfish();
        });
    </script>

</body>
</html>
