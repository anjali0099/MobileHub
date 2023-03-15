using MobileHub.Utils;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MobileHub.Bll;
using MobileHub.Dao;

namespace MobileHub
{
    public partial class ContactUs : System.Web.UI.Page
    {
        DbConnection dc = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sendmessage_Click(object sender, EventArgs e)
        {
            try
            {
                contact co = new contact(Txtname.Text, Txtemail.Text, Txtmessage.Text);
                contact_Dao cod = new contact_Dao();
                cod.Contact(co);
                Response.Redirect("~/userindex.aspx");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}