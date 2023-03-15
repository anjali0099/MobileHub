using MobileHub.Bll;
using MobileHub.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace MobileHub.Admin_layout
{
    public partial class AddProduct : System.Web.UI.Page
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

        //Add Product
        protected void AddButton_Click(object sender, EventArgs e)
        {
            try
            {
                Products p = new Products(txtPname.Text, category.SelectedValue, image.FileName, txtPDetail.Text, txtPrice.Text);
                Product_Dao PD = new Product_Dao();
                if (image.HasFile)
                {
                    image.PostedFile.SaveAs(Server.MapPath("~/Productimg/" + image.FileName));
                }

                PD.Addproduct(p);
                Response.Redirect("Manageproduct.aspx");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }
}