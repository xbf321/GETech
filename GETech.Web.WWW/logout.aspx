<%@ Page Title="" Language="C#" MasterPageFile="~/templates/EmptyMasterPageWithoutForm.master" %>

<script runat="server">
    void Page_Load() {
        FormsAuthentication.SignOut();
        Response.Redirect("/");
    }
</script>

