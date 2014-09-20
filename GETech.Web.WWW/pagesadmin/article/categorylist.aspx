<%@ Page Title="栏目管理" Language="C#" MasterPageFile="~/templates/PagesadminMasterPage.master"
    AutoEventWireup="true" CodeFile="categorylist.aspx.cs" Inherits="pagesadmin_article_categorylist" %>

<%@ Register TagPrefix="uc" Namespace="GETech.Control" Assembly="GETech.Core" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        body
        {
            overflow-x: auto;
        }
        .contral
        {
            font-size: 12px;
            cursor: default;
            margin: 0 auto;
        }
        .contral input
        {
            font-size: 12px;
            cursor: hand;
            valign: middle;
        }
        .treenode_move
        {
            position: absolute;
            width: 200px;
            line-height: 18px;
            filter: alpha(opacity=50);
            opacity: 0.5;
            z-index: 110;
            display: none;
            padding-left: 20px;
            background: url('/images/folder.gif') no-repeat 0px 0px;
        }
        .treenode_0_noselected
        {
            height: 4px;
            line-height: 4px;
            overflow: hidden;
            z-index: 100;
            border: 0px #ffffff solid;
        }
        .treenode_0_over
        {
            background-color: #c0ddfc;
            height: 6px;
            line-height: 6px;
            overflow: hidden;
            z-index: 100;
            border: 0px #933456 solid;
        }
        .treenode_selected
        {
            line-height: 15px;
            z-index: 100;
            background-color: #c0ddfc;
            color: #ffffff;
            border: 0px #0A246A solid;
        }
        .treenode_noselected
        {
            line-height: 15px;
            z-index: 100;
            border: 0px #ffffff solid;
        }
        .treenode_over
        {
            line-height: 15px;
            background-color: #c0ddfc;
            color: #ffffff;
            cursor: poiter;
            z-index: 100;
            border: 0px #4963A9 solid;
        }
    </style>

    <script type="text/javascript">
        var treeID = null;
        function tree(treeID, treeNodes, funName) {
            var fid = 0;
            var treeType = 0;
            var layer = 0;
            var parentidlist = "";
            var title = "";
            var lastDiv = null;

            this.id = treeID;
            this.drag = false;
            this.dragObj = null;
            this.oldClass = "";
            this.fid = 0;
            this.treeType = 0;
            this.layer = 0;
            this.parentidlist = "";
            this.title = ""
            this.lastDiv = null

            this.getPos = function(el, sProp) {
                var iPos = 0;
                while (el != null) {
                    iPos += el["offset" + sProp];
                    el = el.offsetParent;
                }
                return iPos;
            }

            this.getETarget = function(e) {
                if (!e) { return null; }
                if (!e.srcElement && !e.target) { return null; }
                obj = e.srcElement ? e.srcElement : e.target;
                if (obj == null) { return null };

                while (obj.getAttribute("treetype") == null && obj.tagName != "BODY" && obj.tagName != "HTML") {
                    obj = obj.parentNode;
                    if (obj == null) { break; }
                }
                return obj;
            }

            //鼠标按下
            this.onmousedown = function(e) {

                if (!e) { return false; }

                if (this.dragObj) {
                    this.dragObj.className = "noselected";
                }

                this.dragObj = this.getETarget(e);
                if (!this.dragObj) { return; }

                if (!this.dragObj.getAttribute("treetype")) { return; }

                var mX = e.x ? e.x : e.pageX;
                var mY = e.y ? e.y : e.pageY;

                this.drag = true;
                this.dragObj.className = "treenode_selected";
                this.oldClass = "treenode_selected";

                var textContent = this.dragObj.textContent ? this.dragObj.textContent : this.dragObj.innerText;
                textContent = textContent.replace("添加", "");
                textContent = textContent.replace("编辑", "");
                textContent = textContent.replace("删除", "");

                this.ShowMove(mX, mY, textContent);

                treeID = this;
                document.onmousedown = function() { return false };
                document.onmousemove = function(e) {
                    if (tree == null) {
                        return;
                    }
                    treeID.document_onmousemove(e);
                }

                alignElWithMouse(mX, mY);

            };

            this.onmouseup = function(e) { this.document_onmouseup(e) };
            this.onmouseover = function(e) {
                if (this.drag) {
                    this.oldClass = this.getETarget(e).className;
                    if (this.getETarget(e).getAttribute("treeType") == 1) {
                        this.getETarget(e).className = "treenode_over";
                    }
                    else {
                        this.getETarget(e).className = "treenode_0_over";
                    }
                }
                var mX = e.x ? e.x : e.pageX;
                var mY = e.y ? e.y : e.pageY;
                alignElWithMouse(mX, mY)

            };
            this.onmouseout = function(e) {
                if (this.drag) {
                    this.getETarget(e).className = this.oldClass;
                    if (this.dragObj.id == this.getETarget(e).id) {
                        this.findObj(this.id + "_treenode_move").style.display = "block";
                    }
                }

            };
            this.init = function() {
                document.write("\n<div id=\"" + this.id + "_control\" class=\"contral\">");
                document.write("\n<div id = \"" + this.id + "_treenode_move\" class=\"treenode_move\"></div>")
                document.write("\n<div id = \"" + this.id + "_line\"></div>")
                document.write("\n<div class=\"treenode_0\" style=\"display:none;\" id = \"" + this.id + "_treenode_0\" onmouseup=\"" + this.id + ".onmouseup(event);\" onmouseover=\"" + this.id + ".onmouseover(event)\" onmouseout=\"" + this.id + ".onmouseout(event)\"></div>")
                document.write("\n<div class=\"treenode_1\" style=\"display:none;\" id = \"" + this.id + "_treenode\" onmousedown=\"" + this.id + ".onmousedown(event);\" onmouseup=\"" + this.id + ".onmouseup(event);\" onmouseover=\"" + this.id + ".onmouseover(event)\" onmouseout=\"" + this.id + ".onmouseout(event)\"></div>");
                for (i = 0; i < treeNodes.length; i++) {
                    var nodeStr = "";
                    for (treeNode in treeNodes[i]) {
                        nodeStr += treeNode + "=\"" + escape(treeNodes[i][treeNode]) + "\" ";
                    }
                    document.write("\n<div class=\"treenode_0_noselected\" id = \"" + this.id + "_treenode" + i + "_0\" index=\"" + i + "\" treetype=\"0\" ");
                    document.write(nodeStr);
                    document.write("onmouseup=\"" + this.id + ".onmouseup(event);\" onmouseover=\"" + this.id + ".onmouseover(event)\" onmouseout=\"" + this.id + ".onmouseout(event)\">");
                    if (i > 0) {
                        document.write(treeNodes[i].linetitle);
                    }
                    document.write("</div>");
                    document.write("\n<div class=\"treenode_noselected\" id = \"" + this.id + "_treenode" + i + "\" index=\"" + i + "\" treetype=\"1\" ");
                    document.write(nodeStr);
                    if (treeNodes[i].layer == '0') {
                        document.write("onmousedown=\"" + this.id + ".onmousedown(event);\" onmouseup=\"" + this.id + ".onmouseup(event);\" onmouseover=\"" + this.id + ".onmouseover(event)\" onmouseout=\"" + this.id + ".onmouseout(event)\">" + treeNodes[i].subject + " &nbsp;&nbsp;<a href=\"?categoryid=" + treeNodes[i].fid + "&action=add\" class=\"TopicButton\"  type=\"button\">添加</a>&nbsp;&nbsp;<a href=\"?CategoryId=" + treeNodes[i].fid + "&action=edit\" class=\"TopicButton\" type=\"button\">编辑</a>&nbsp;&nbsp;<a href=\"#\" class=\"TopicButton\" type=\"button\" onclick=\"javascript:if(confirm('您要删除该项吗?')){window.location.href='?categoryid=" + treeNodes[i].fid + "&action=del';}\">删除</a></div>");

                    }
                    else {
                        document.write("onmousedown=\"" + this.id + ".onmousedown(event);\" onmouseup=\"" + this.id + ".onmouseup(event);\" onmouseover=\"" + this.id + ".onmouseover(event)\" onmouseout=\"" + this.id + ".onmouseout(event)\">" + treeNodes[i].subject + " &nbsp;&nbsp;<a href=\"?CategoryId=" + treeNodes[i].fid + "&action=add\" class=\"TopicButton\" type=\"button\">添加</a>&nbsp;&nbsp;<a href=\"?CategoryId=" + treeNodes[i].fid + "&action=edit\" class=\"TopicButton\" type=\"button\">编辑</a>&nbsp;&nbsp;<a href=\"#\" class=\"TopicButton\" type=\"button\" onclick=\"javascript:if(confirm('您要删除该项吗?')){window.location.href='?categoryid=" + treeNodes[i].fid + "&action=del';}\">删除</a></div>");


                    }
                }
            }

            document.write("\n</div>");


            this.findObj = function(objname) {
                if (document.getElementById(objname)) {
                    return document.getElementById(objname);
                }
                else if (document.getElementsByName(objname)) {
                    return document.getElementsByName(objname)
                }
                else {
                    return null;
                }
            }

            this.HideMove = function() {
                if (this.findObj(this.id + "_treenode_move").style.display != "none") {
                    this.findObj(this.id + "_treenode_move").style.display = "none";
                }
            }

            this.ShowMove = function(mX, mY, innerHTML) {
                this.findObj(this.id + "_treenode_move").innerHTML = innerHTML;
                this.findObj(this.id + "_treenode_move").style.left = (mX + 10) + "px";
                this.findObj(this.id + "_treenode_move").style.top = (mY) + "px";
            }

            this.SetMove = function(e, mX, mY) {
                this.findObj(this.id + "_treenode_move").style.left = (mX + 10) + "px";
                this.findObj(this.id + "_treenode_move").style.top = (mY) + "px";
            }


            //document事件
            this.document_onmouseup = function(e) {
                if (this.drag) {
                    this.drag = false;
                    try {
                        this.getETarget(e).className = this.oldClass;

                        index = this.getETarget(e).getAttribute("index");
                        eval(funName + "(treeNodes[index],treeNodes[this.dragObj.getAttribute(\"index\")],this.getETarget(e).getAttribute(\"treetype\"))");
                    }
                    catch (e) { }

                    this.HideMove();
                    treeID = null;

                    document.onmousedown = function() { return true };
                    document.onmousemove = function() { null; };
                }

            }
            document.onmouseup = new Function(this.id + ".document_onmouseup();");

            this.document_onmousemove = function(e) {
                e = e ? e : window.event;
                var mX = e.x ? e.x : e.pageX;
                var mY = e.y ? e.y : e.pageY;
                this.SetMove(e, mX, mY);

            }

            this.document_onselectstart = function() {
                return !this.drag;
            }
            document.onselectstart = new Function("return " + this.id + ".document_onselectstart ();");

            this.init();

            if (this.findObj(this.id + "_treenode0")) {
                //alert(this.findObj(this.id+"_treenode0").id);
                //this.findObj(this.id+"_treenode0").className='treenode_selected';
            }

        }	
    </script>

    <script type="text/javascript">

        function netscapeMouseMove(e) {

            if (e.screenY > (document.body.offsetHeight - 10)) {
                window.scrollTo(e.screenX, e.screenY + 1000);
            }

            if (e.screenY < 10) {
                window.scrollTo(e.screenX, e.screenY - 1000);
            }

        }

        function microSoftMouseMove() {
            if (window.event.y > (document.body.offsetHeight - 10)) {
                window.scrollTo(window.event.x, window.event.y + 1000);
            }

            if (window.event.y < 10) {
                window.scrollTo(window.event.x, window.event.y - 1000);
            }
        }

        var countdown = 1;
        var countup = 1;
        function alignElWithMouse(x, y) {
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainWrapper" runat="Server">
    <fieldset>
        <legend>栏目管理</legend>
        <form runat="server">
        <table>
            <tr>
                <td>
                    所属分类:
                </td>
                <td>
                    <uc:DropDownTreeList ID="ddlcategoryList" runat="server" Visible="true"></uc:DropDownTreeList>
                </td>
            </tr>
            <tr>
                <td>
                    名称:
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1" SetFocusOnError="true" runat="server" ControlToValidate="txtName"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    排序:
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
                    <asp:Button ID="btnSave" runat="server" Text="保存" />&nbsp;&nbsp;<input type="button"
                        onclick="window.history.back(0);" value="返回" />
                </td>
            </tr>
        </table>
        </form>
    </fieldset>
    <fieldset>
        <legend>列表</legend>
        <table width="100%">
            <tr>
                <td width="100%">
                    <asp:Literal ID="ShowTreeLabel" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Content>
