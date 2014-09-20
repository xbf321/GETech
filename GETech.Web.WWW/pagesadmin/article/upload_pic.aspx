<%@ Page Title="上传图片" Language="C#" MasterPageFile="~/templates/EmptyMasterPageWithoutForm.master"
    AutoEventWireup="true" CodeFile="upload_pic.aspx.cs" Inherits="pagesadmin_article_upload_pic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        BODY
        {
            border: 0;
            margin: 0;
            cursor: default;
            background: buttonface;
            font-family: 宋体;
            font-size: 9pt;
        }
        td
        {
            margin: 0px;
            font-size: 12px;
            line-height: 150%;
        }
    </style>
    <base target="_self">

    <script type="text/javascript">

        function initWin() {
            window.moveTo(50, 50);
            window.resizeTo(550, 300);
        }


        function check() {
            if (document.getElementById("<%=uploadedFile.ClientID %>").value == "") {
                alert("请选择你要上传的文件!!!");
                return false;
            }

            str = document.getElementById("<%=uploadedFile.ClientID %>").value;
            strs = str.toLowerCase();
            lens = strs.length;
            filename = strs.substring(lens - 4, lens);
            if (filename != ".jpg" && filename != ".gif" && filename != ".png") {
                alert("只能上传图片文件(.jpg,.gif,.png)！");
                return false;
            }
            return true;

        }
        function ok() {
            var html = "http://home.cnblogs.com/images/logo_cnblogs_sns.gif";
            if (html != null) {
                html = "<img src='" + html + "'/>";
                window.opener.InsertToEditor(html);
                window.close();
            }
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <form runat="server" enctype="multipart/form-data">
    <center>
        <div id="PanelForm">
            <table cellspacing="0" bordercolordark="white" cellpadding="5" align="center" bordercolorlight="gray"
                border="1">
                <tr bgcolor="#F3F3F3">
                    <td colspan="2">
                        选择你的图片上传
                    </td>
                </tr>
                <tr bgcolor="white">
                    <td align="right" valign="top" width="80">
                        选择：
                    </td>
                    <td>
                        <asp:FileUpload ID="uploadedFile" Style="width: 450px; height: 21px" accept="text/*"
                            size="60" runat="server" />
                    </td>
                </tr>
                <tr bgcolor="white">
                    <td align="center" colspan="2">
                        <asp:Button ID="btnUpload" OnClientClick="if(!check()) return false;" runat="server"
                            Text=" 上 传 " Style="height: 25px; width: 100px;" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:Label ID="lbmsg" runat="server"></asp:Label>
    </center>
    </form>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpFooterScript" runat="Server">
</asp:Content>
