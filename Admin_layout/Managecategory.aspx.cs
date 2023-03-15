using MobileHub.Bll;
using MobileHub.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

namespace MobileHub.Admin_layout
{
    public partial class Managecategory : System.Web.UI.Page
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
        //Add Category
        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                Category c = new Category(category.Text);
                Category_Dao CD = new Category_Dao();
                CD.Addcategory(c);
                Response.Redirect("Managecategory.aspx");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

    }
}