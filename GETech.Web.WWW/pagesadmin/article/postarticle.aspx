<%@ Page Title="发表文章" Language="C#" MasterPageFile="~/templates/PagesadminMasterPage.master"
    AutoEventWireup="true" CodeFile="postarticle.aspx.cs" ValidateRequest="false"
    Inherits="pagesadmin_article_postarticle" %>

<%@ Register TagPrefix="uc" Namespace="GETech.Control" Assembly="GETech.Core" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <form runat="server">
    <fieldset>
        <legend>信息发布</legend>
        <table cellpadding="6" cellspacing="0">
            <tr>
                <td align="right">
                    所属分类：
                </td>
                <td>
                    <uc:DropDownTreeList ID="ddlcategoryList" runat="server" Visible="true"></uc:DropDownTreeList>
                    <font color="red">
                        <asp:Literal ID="ltErrorMsg" runat="server"></asp:Literal></font>
                </td>
            </tr>
            <tr>
                <td align="right">
                    标题：
                </td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server" Width="500"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    内容：
                </td>
                <td>
                    <a href="###" onclick="OpenWindow('upload_pic.aspx',550,300,200);return false; ">上传图片</a><br />
                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Width="600" Height="300"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">介绍：</td>
                <td>
                    <asp:TextBox ID="txtIntroduction" Width="400" Height="100" TextMode="MultiLine" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    设置新闻图片：
                </td>
                <td>
                    <a onclick="setImageUrl();" style="cursor: pointer; color: Blue;">设置新闻图片</a>(<font
                        color="red">请在图片上单击选择</font>)
                    <div id="piclist">
                    </div>
                    <asp:TextBox ID="txtImageUrl" runat="server" BorderWidth="0" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right">
                    发布时间：
                </td>
                <td>
                    <Goodspeed:DatePicker ID="PublishDate" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    快速链接：
                </td>
                <td>
                    <asp:TextBox ID="txtLinkUrl" Width="400" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnSave" OnClientClick="if(!checkForm()){return false;}" runat="server"
                        Text="保存" />&nbsp;&nbsp;<input type="button" onclick="window.history.back(0);" value="返回" />
                </td>
            </tr>
        </table>
    </fieldset>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpFooterScript" runat="Server">

    <script type="text/javascript" src="<%=ResolveUrl("~/editor/tiny_mce/tiny_mce.js") %>"></script>

    <script type="text/javascript">
        tinyMCE.init({
            // General options
            language: "zh",
            mode: "exact",
            theme: "advanced",
            width: "100%",
            elements: "<%=txtContent.ClientID %>",
            plugins: "pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave",
            theme_advanced_buttons1: "forecolor,backcolor,separator,bold,italic,underline,strikethrough,separator,bullist,numlist,separator, justifyleft, justifycenter, justifyright,justifyleft,justifycenter,justifyright,outdent,indent,removeformat,separator,link,unlink,image,quote,code,fullscreen,insertCode",
            theme_advanced_buttons2: "",
            theme_advanced_buttons3: "",
            theme_advanced_toolbar_location: "top",
            theme_advanced_toolbar_align: "left",
            theme_advanced_statusbar_location: "bottom",
            theme_advanced_resizing: true,

            theme_advanced_fonts: "宋体=宋体;黑体=黑体;仿宋=仿宋;楷体=楷体;隶书=隶书;幼圆=幼圆;Arial=arial,helvetica,sans-serif;Comic Sans MS=comic sans ms,sans-serif;Courier New=courier new,courier;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times;Verdana=verdana,geneva;Webdings=webdings;Wingdings=wingdings,zapf dingbats",
            convert_fonts_to_spans: true,
            remove_trailing_nbsp: true,
            convert_newlines_to_brs: false,
            force_br_newlines: false,
            force_p_newlines: false,
            remove_linebreaks: false,
            relative_urls: false,
            remove_script_host: false,
            paste_preprocess: function(pl, o) {
                o.content = o.content.replace(/[\n\r\t]/g, '');
            },
            extended_valid_elements: "pre[name|class]",
            handle_event_callback: "MCECheckIndent",
            cleanup: true


        });
        function MCECheckIndent(e) {

            if (e.type == 'keydown' && e.keyCode == 9) {
                tinyMCE.execCommand('mceInsertContent', false, '　　');
                return false;
            }
        }
        function getEditorContent() {
            var content = tinyMCE.get('<%=txtContent.ClientID %>').getContent();
            var vailaContent = content.replace(/<p>(&nbsp;)*(\s)*(<br \/>)*<\/p>/ig, "").replace(/(\n)*/ig, "").replace(/(\r)*/ig, "");
            return vailaContent;
        }


        function InsertToEditor(content) {
            tinyMCE.execCommand('mceInsertContent', false, content);
        }

        function OpenWindow(url, width, height, offset) {
            var leftVal = (screen.width - width) / 2 - offset;
            var topVal = (screen.height - height) / 2 - offset;
            var newwindow = window.open(url, '_blank', 'width=' + width + ',height=' + height + ',toolbars=0,resizable=1,left=' + leftVal + ',top=' + topVal);
            newwindow.focus();
        }
    </script>

    <script type="text/javascript">
        function setImageUrl() {
            var editor = getEditorContent();
            var picListObj = document.getElementById("piclist");
            $(editor).find("img").each(function() {
                var _src = this.src.toLowerCase();
                var _ext = _src.substring(_src.length - 4, _src.length);
                if (_ext == ".jpg" || _ext == ".gif" || _ext == ".png") {
                    var s = "<img src=\"" + _src + "\"";
                    if (this.offsetHeight > 60) {
                        s += " width=\"60px\"";
                    } else {
                        s += " width=\"60px\"";
                    }

                    s += " onclick=\"chooseImageUrl(this)\" />";

                    picListObj.innerHTML += s;
                }
            });

        }
        function chooseImageUrl(e) {
            document.getElementById("<%=txtImageUrl.ClientID %>").value = e.src;
        }
        function checkForm() {
            var titleObj = $("#<%=txtTitle.ClientID %>");
            var content = getEditorContent();
            if ($.trim(titleObj.val()) == "") {
                alert("请输入文章标题!");
                titleObj.focus();
                return false;
            }
            if ($.trim(content) == "") {
                alert("请输入内容!");
                return false;
            }
            return true;
        }
    </script>

</asp:Content>
