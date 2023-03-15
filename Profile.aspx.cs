using MobileHub.Utils;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileHub
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                getUserDetails();
            }

        }

        private void getUserDetails()
        {
            string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            String user = Session["Username"].ToString();

            try
            {
                SqlConnection con = new SqlConnection(constr);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("Select * from User_tb where Username='" + user + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                Firstname.Text = dt.Rows[0]["FirstName"].ToString();
                Lastname.Text = dt.Rows[0]["LastName"].ToString();
                Address.Text = dt.Rows[0]["Address"].ToString();
                Email.Text = dt.Rows[0]["Email"].ToString();
                Phonenumber.Text = dt.Rows[0]["Phone"].ToString();
                Username.Text = dt.Rows[0]["Username"].ToString();
                Password.Text = dt.Rows[0]["Password"].ToString();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }


        }

        protected void Update_Click(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            String user = Session["Username"].ToString();
            string md5pass = FormsAuthentication.HashPasswordForStoringInConfigFile("org", "MD5");
            string password = Password.Text;

            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("UPDATE User_tb set Firstname=@Firstname, Lastname=@Lastname, Address=@Address, Email=@Email, Phone=@Phone, Password=@Password where Username = '" + user + "'", con);
            cmd.Parameters.AddWithValue("@Firstname", Firstname.Text.Trim());
            cmd.Parameters.AddWithValue("@Lastname", Lastname.Text.Trim());
            cmd.Parameters.AddWithValue("@Address", Address.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", Email.Text.Trim());
            cmd.Parameters.AddWithValue("@Phone", Phonenumber.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", md5pass);

            cmd.ExecuteNonQuery();

            con.Close();
            Response.Write("<script>alert('Your Profile is updated successfully')</script>");
        
        }
    }
}