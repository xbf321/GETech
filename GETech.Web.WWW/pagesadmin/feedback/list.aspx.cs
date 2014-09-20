using System;

using GETech.Data;
using Controleng.Common;

public partial class pagesadmin_feedback_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (CECRequest.GetQueryString("action").ToLower() == "del")
        {
            FeedbackMange.Delete(CECRequest.GetQueryInt("id", 0));
            Response.Redirect("list.aspx");
        }
    }
}
