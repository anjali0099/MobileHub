using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileHub.Admin_layout
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (Session["Username"] != null)
                    {
                        logoutbtn.Visible = true;
                        Hello.Visible = true;
                        Hello.Text = "Welcome " + Session["Username"].ToString();
                        admin.Text = Session["Username"].ToString();
                    }
                    else
                    {
                        Response.Redirect("~/Login.aspx");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }
        protected void logoutbtn_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/userindex.aspx");
        }
    }
}