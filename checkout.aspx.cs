using MobileHub.Utils;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MobileHub
{
    public partial class checkout : System.Web.UI.Page
    {
        DbConnection dc = new DbConnection();
        string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                String user = Session["Username"].ToString();


                Checkuser();
                BindCartItem();

                //GrandTotal();
            }

        }


        private void Checkuser()
        {
            String user = Session["Username"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlDataAdapter da = new SqlDataAdapter("Select * from Cart_tb where Username='" + user + "'", con);

                /*SqlDataAdapter da = new SqlDataAdapter("Select sn, product_id, product_name, imagepath, imagename, price, quantity, totalprice, time, status from dbo.addtocart where username=" + user + "", con);*/
                //SqlDataAdapter da = new SqlDataAdapter("Select product_id, name, color, type, description, price, material, imagepath, imagename from product where product_id=", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                rptrCart.DataSource = ds;
                rptrCart.DataBind();
                //return ds;
            }
        }


        private void BindCartItem()
        {
            //Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            //String Cart_ID = Request.QueryString["Cart_ID"];

            //string PID;
            //PID = Convert.ToString(Request.QueryString["PID"]);

            //Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            string query = ("SELECT * FROM Cart_tb");
            SqlCommand cmd = new SqlCommand(query, dc.cn);
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrCart.DataSource = dt;
                    rptrCart.DataBind();
                }

            }

            // Response.Write("<script>alert('Your Cart is Empty ');</script>");
        }

        protected void placeorder_Click(object sender, EventArgs e)
        {
            //string PID;
            //PID = Convert.ToString(Request.QueryString["PID"]);
            Int64 Cart_ID = Convert.ToInt64(Request.QueryString["Cart_ID"]);

            //{ Response.Write("<script>alert('" + Cart_ID + "');</script>"); }

            String user = Session["Username"].ToString();
            String UID = Session["UID"].ToString();


            //Label qty = (Label)rptrCart.Items[0].FindControl("Quantity");
            //Label pn = (Label)rptrCart.Items[0].FindControl("Label1");



            string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmdselect = new SqlCommand("select * from Cart_tb where Cart_ID =@Cart_ID", con);
            cmdselect.Parameters.AddWithValue("@Cart_ID", Cart_ID);
            con.Open();

            SqlDataReader dr = cmdselect.ExecuteReader();
            //if (!dr.HasRows) { Response.Write("<script>alert('no data found');</script>"); return; }

            SqlCommand cmd = new SqlCommand("INSERT INTO Order_tb (FirstName, LastName,Address,City,Area,PhoneNumber, Username,PID,  PName, Quantity, GrandTotal, PaymentThrough, Order_Status,Order_date) VALUES " +
             "(@firstname, @lastname, @address, @city, @area, @phonenumber,@username,@pid,  @pName, @quantity, @grandtotal, @payment, @orderstatus, @orderdate)", con);

            dr.Read();

            cmd.Parameters.AddWithValue("@firstname", FirstName.Text.Trim());
            cmd.Parameters.AddWithValue("@lastname", LastName.Text.Trim());
            cmd.Parameters.AddWithValue("@address", Address.Text.Trim());
            cmd.Parameters.AddWithValue("@city", City.Text.Trim());
            cmd.Parameters.AddWithValue("@area", Area.Text.Trim());
            cmd.Parameters.AddWithValue("@phonenumber", Phone.Text.Trim());


            cmd.Parameters.AddWithValue("@username", user);

            cmd.Parameters.AddWithValue("@pid", dr["PID"]);
            cmd.Parameters.AddWithValue("@pName", dr["PName"]);
            cmd.Parameters.AddWithValue("@quantity", dr["Quantity"]);
            cmd.Parameters.AddWithValue("@grandtotal", dr["Price"]);

            cmd.Parameters.AddWithValue("@payment", payment.SelectedValue);
            cmd.Parameters.AddWithValue("@orderstatus", "pending");
            cmd.Parameters.AddWithValue("@orderdate", DateTime.Now);

            dr.Close();

            cmd.ExecuteNonQuery();

            SqlCommand query = new SqlCommand("DELETE from Cart_tb where Username='" + user + "'", con);
            query.ExecuteNonQuery();
            Response.Write("<script> alert('Your Order Has Been Placed!!! '); </script>"); clear();
            con.Close();
        }


        private void clear()
        {
            FirstName.Text = ""; // resetting textbox
            LastName.Text = "";// resetting textbox
            Address.Text = "";// resetting textbox
            City.Text = ""; // resetting textbox
            Area.Text = "";// resetting textbox
            Phone.Text = "";// resetting textbox


            payment.SelectedValue = null;  // reset radiobuttonlist
        }
    }
}