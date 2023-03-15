using MobileHub.Bll;
using MobileHub.Dao;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace MobileHub
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            Login_bll lb = new Login_bll();
            lb.Username = username.Text;
            lb.Password = password.Text;
            
            Login_Dao ld = new Login_Dao();

            DataTable dt = ld.CheckUser(lb);

            if (dt.Rows.Count != 0)
            {

                Session["UID"] = dt.Rows[0]["UID"].ToString();
                Session["Username"] = dt.Rows[0]["Username"].ToString();
                string Role;
                Role = dt.Rows[0][8].ToString().Trim();

                if (Role == "Customer" || Role == "customer")
                {
                   Session["Username"] = username.Text;
                   Response.Redirect("userindex.aspx");
                }
                if (Role == "Admin" || Role == "admin")
                {
                   Session["Username"] = username.Text;
                   Response.Redirect("Admin_Layout/Admindashboard.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Username or Password');</script>");
            }
            


        }
    }
}