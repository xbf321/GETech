<%@ Page Title="找回追踪号" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true"
    CodeFile="FindTrack.aspx.cs" Inherits="cx_FindTrack" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<style type="text/css">
        body
        {
            background: #999999;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" runat="Server">
    追踪号：<asp:TextBox ID="txtTrackId" runat="server"></asp:TextBox><asp:RequiredFieldValidator
        runat="server" ControlToValidate="txtTrackId" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
    姓名：<asp:TextBox ID="txtRealName" runat="server"></asp:TextBox><asp:RequiredFieldValidator
        runat="server" ControlToValidate="txtRealName" ErrorMessage="*" Display="Dynamic"></asp:RequiredFieldValidator>
    <asp:Button runat="server" ID="btnOk" Text="找回" />
    <asp:Literal runat="server" ID="ltUrl"></asp:Literal>
</asp:Content>
