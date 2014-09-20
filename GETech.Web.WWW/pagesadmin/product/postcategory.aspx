<%@ Page Title="添加栏目" Language="C#" MasterPageFile="~/templates/PagesadminMasterPage.master" AutoEventWireup="true" ValidateRequest="false"  CodeFile="postcategory.aspx.cs" Inherits="pagesadmin_product_postcategory" %>
<%@ Register TagPrefix="uc" Namespace="GETech.Control" Assembly="GETech.Core" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" Runat="Server">
        <fieldset>
        <legend>栏目管理</legend>
        <form id="Form1" runat="server">
        <table cellpadding="4" cellspacing="0" border="0">
            <tr>
                <td align="right">
                    所属分类：
                </td>
                <td>
                    <uc:DropDownTreeList ID="ddlcategoryList" runat="server" Visible="true"></uc:DropDownTreeList>
                </td>
            </tr>
            <tr>
                <td align="right">
                    名称：
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" SetFocusOnError="true" runat="server" ControlToValidate="txtName"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right">
                    快速链接：
                </td>
                <td>
                    <asp:TextBox ID="txtLinkUrl" runat="server" Width="200"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">内容：</td>
                <td><asp:TextBox ID="txtContent" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right">
                    排序：
                </td>
                <td>
                    <asp:TextBox ID="txtSort" runat="server" Text="0"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" SetFocusOnError="true" runat="server"
                        ControlToValidate="txtSort" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr>
                <td>
                </td>
                <td>
                    <asp:Button ID="btnSave" OnClientClick="if(!checkForm()){return false;}" runat="server" Text="保存" />&nbsp;&nbsp;<input type="button"
                        onclick="window.history.back(0);" value="返回" />
                </td>
            </tr>
        </table>
        </form>
    </fieldset>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpFooterScript" Runat="Server">
    <script type="text/javascript" src="<%=ResolveUrl("~") %>editor/tiny_mce/tiny_mce.js"></script>

    <script type="text/javascript">
        tinyMCE.init({
            // General options
            language: "zh",
            mode: "exact",
            theme: "advanced",
            width: "100%",
            elements: "<%=txtContent.ClientID %>",
//            plugins: "pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave",
            theme_advanced_buttons1: "forecolor,backcolor,separator,bold,italic,underline,strikethrough,separator,bullist,numlist,separator, justifyleft, justifycenter, justifyright,justifyleft,justifycenter,justifyright,outdent,indent,removeformat,separator,link,unlink,image,quote,code,fullscreen,insertCode",
            theme_advanced_buttons2: "",
            theme_advanced_buttons3: "",
            theme_advanced_toolbar_location: "top",
            theme_advanced_toolbar_align: "left",
            theme_advanced_statusbar_location: "bottom",
            theme_advanced_resizing: true,

            theme_advanced_fonts: "宋体=宋体;黑体=黑体;仿宋=仿宋;楷体=楷体;隶书=隶书;",
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
            var content = getEditorContent();
            if ($.trim(content) == "") {
                alert("请输入内容!");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>

