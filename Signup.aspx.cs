
using MobileHub.Bll;
using MobileHub.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileHub
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        //register
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                User s = new User(fname.Text, lname.Text, Address.Text, Email.Text, phone.Text, Username.Text, Password.Text);

                Signup_Dao sd = new Signup_Dao();
                sd.SignUp(s);
                Response.Redirect("login.aspx");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}