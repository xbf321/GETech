<%@ Page Title="" Language="C#" MasterPageFile="~/templates/ProductMasterPage.master" %>

<script runat="server">
    protected void Page_Load()
    {
        this.Page.Title = string.Format("产品中心 - {0}", System.Configuration.ConfigurationManager.AppSettings["WebSiteTitlePostfix"]);
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" Runat="Server">
<div id="ProductR_column">
    <div class="ProductR_top mB">
      <h3><img src="http://www.geinspectiontechnologies.cn/imagesCn/products/productIndex.gif" /></h3>
      <p>GE的检测科技为各工业领域提供了最全面的无损检测（NDT），远程可视化检测(RVI)以及其他产品的选择。我们的优势在于运用了行业经验以及客户反馈，以此来建立当今市场上最有用的NDT   以及RVI产品。</p>
    </div>
    <h3 class="mB">目录</h3><div class="ProductRBottomB mB">
      <dl>
        <dt><img src="http://www.geinspectiontechnologies.cn/imagesCn/ut/link_ut.jpg" width="60" height="60" /></dt>
        <dd><a href="/product/category/1.aspx" class="blueB">超声检测</a><a href="ut/index.html"><br />
        </a>全套的探伤仪，测厚仪，探头，传感器和大型检测设备。
        </dl>
    </div>
    <div class="ProductRBottomB mB">
      <dl>
        <dt><img src="http://www.geinspectiontechnologies.cn/imagesCn/rvi/link_rvi.jpg" width="60" height="60" /></dt>
        <dd><a href="/product/category/10.aspx" class="blueB">工业内窥镜</a><a href="ut/index.html" class="blueB"></a><a href="ut/index.html"><br />
        </a>完整的Everest遥控视频检测设备系列，从可视管道镜、ptz摄像头..</dd>
      </dl>
    </div>
    <div class="clear"></div>
    <div class="ProductRBottomB mB">
      <dl>
        <dt><img src="http://www.geinspectiontechnologies.cn/imagesCn/xrs/link_dxri.jpg" width="60" height="60" /></dt>
        <dd><a href="/product/category/19.aspx" class="blueB">X射线产品</a><a href="ut/index.html"><br />
        </a>我们为汽车价值链的每一部分都提供了广泛的检测方案，从半成品..</dd>
      </dl>
    </div>
    <div class="ProductRBottomB mB">
      <dl>
        <dt><img src="http://www.geinspectiontechnologies.cn/imagesCn/ec/link_ec.jpg" width="60" height="60" /></dt>
        <dd><a href="/product/category/27.aspx" class="blueB">涡流产品</a><a href="ut/index.html"><br />
        </a>为帮助进行腐蚀探测和检测焊接提供广泛的检测方案。</dd>
      </dl>
    </div>
    <div class="clear"></div>
    <div class="ProductRBottomB mB">
      <dl>
        <dt><img src="http://www.geinspectiontechnologies.cn/imagesCn/ht/link_dynapocket.jpg" /></dt>
        <dd><a href="/product/category/36.aspx" class="blueB">硬度计</a><a href="xr/index.html" class="blueB"></a><a href="ut/index.html"><br />
        </a>全套的便携式硬度计，用于从薄涂层到厚重金属铸造等不同运用方面..</dd>
      </dl>
    </div>
    <div class="ProductRBottomB mB">
      <dl>
        <dt><img src="http://www.geinspectiontechnologies.cn/imagesCn/metrology/link_lightscan.jpg" /></dt>
        <dd><a href="/product/category/43.aspx" class="blueB">光学系统</a><a href="ut/index.html"><br />
        </a>用各种精密仪器设备获得被测样品的物理参数并对样品加以分析。</dd>
      </dl>
    </div>
    <div class="centerBottomB mB"></div>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpFooterScript" Runat="Server">
</asp:Content>

