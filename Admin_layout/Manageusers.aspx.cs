using MobileHub.Bll;
using MobileHub.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileHub.Admin_layout
{
    public partial class Manageusers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }

        //Adduser
        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                Manageuser m = new Manageuser(fname.Value, lname.Value, address.Value, email.Value, phone.Value, username.Value, password.Value, userrole.SelectedValue);
                Manageuser_Dao md = new Manageuser_Dao();
                md.Addusers(m);
                Response.Redirect("Manageusers.aspx");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}