<%@ Page Title="产品发布" Language="C#" MasterPageFile="~/templates/PagesadminMasterPage.master" AutoEventWireup="true" CodeFile="postproduct.aspx.cs" Inherits="pagesadmin_product_postproduct" ValidateRequest="false" %>
<%@ Register TagPrefix="uc" Namespace="GETech.Control" Assembly="GETech.Core" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" Runat="Server">
<form runat="server">
    <fieldset>
        <legend>产品发布</legend>
        <table cellpadding="4" cellspacing="0" border="0">
            <tr>
                <td align="right">所属类别：</td>
                <td>
                   <uc:DropDownTreeList ID="ddlcategoryList" runat="server" Visible="true"></uc:DropDownTreeList><font color="red"><asp:Literal ID="ltErrorMsg" runat="server"></asp:Literal></font> </td>
            </tr>
            <tr>
                <td align="right">标题：</td>
                <td><asp:TextBox ID="txtTitle" runat="server" Width="300"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right" valign="top">内容：</td>
                <td><asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Width="600" Height="300"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSave" OnClientClick="if(!checkForm()){return false;}" runat="server"
                        Text="保存" />&nbsp;&nbsp;<input type="button"
                    onclick="window.history.back(0);" value="返回" /></td>
            </tr>
        </table>
    </fieldset>
    </form>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpFooterScript" runat="Server">

    <script type="text/javascript" src="/editor/tiny_mce/tiny_mce.js"></script>

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

