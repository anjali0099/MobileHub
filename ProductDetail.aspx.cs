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
    public partial class ProductDetail : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        DbConnection dc = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {


                BindProductDetail();
                BindCustomerFeedback();

            }

        }

        private void BindCustomerFeedback()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

            string query = ("select * from Feedback_tb where PID=" + PID + "");
            SqlCommand cmd = new SqlCommand(query, dc.cn);
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrCustomerRatings.DataSource = dt;
                    rptrCustomerRatings.DataBind();
                }

            }
        }

        private void BindProductDetail()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);

            string query = ("select * from Product_tb where PID=" + PID + "");
            SqlCommand cmd = new SqlCommand(query, dc.cn);
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrProduct.DataSource = dt;
                    rptrProduct.DataBind();
                }

            }
        }

        protected void AddtoCart_Click(object sender, EventArgs e)
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            //{ Response.Write("<script>alert('" + PID + "');</script>"); }
            //DbConnection dc = new DbConnection();



            DropDownList dp = (DropDownList)rptrProduct.Items[0].FindControl("DropDownList_qty");
            Label pl = (Label)rptrProduct.Items[0].FindControl("Price");

            if (pl == null) { return; }

            int pric = Convert.ToInt32(pl.Text);
            int Quantity = Convert.ToInt32(dp.SelectedValue);
            int TotalPrice = pric * Quantity;


            string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmdselect = new SqlCommand("select * from Product_tb where PID =@PID", con);
            cmdselect.Parameters.AddWithValue("@PID", PID);
            con.Open();

            
            SqlDataReader dr = cmdselect.ExecuteReader();

            if (!dr.HasRows) { Response.Write("<script>alert('no data found');</script>"); return; }

            
            if (Session["Username"] != null)
            {
                String user = Session["Username"].ToString();
                String UID = Session["UID"].ToString();
                SqlCommand cmd = new SqlCommand("INSERT INTO Cart_tb (PID,UID, PName,Username, Pimage, Quantity, Price,TotalPrice) VALUES(@pid,@uid, @pName,@username,@pimage, @quantity, @price, @totalprice)", con);

                dr.Read();

                cmd.Parameters.AddWithValue("@pName", dr["PName"]);
                cmd.Parameters.AddWithValue("@pid", dr["PID"]);

                cmd.Parameters.AddWithValue("@pimage", dr["Pimage"]);
                cmd.Parameters.AddWithValue("@username", user);
                cmd.Parameters.AddWithValue("@uid", UID);
                cmd.Parameters.AddWithValue("@quantity", Quantity);
                cmd.Parameters.AddWithValue("@price", dr["Price"]);
                cmd.Parameters.AddWithValue("@totalprice", TotalPrice);


                dr.Close();

                cmd.ExecuteNonQuery();
                Response.Write("<script> alert('Add to cart successfull'); </script>");
                con.Close();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
  
        }

        protected void Feedback_btn_Click(object sender, EventArgs e)
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);


            string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmdselect = new SqlCommand("select * from Product_tb where PID =@PID", con);
            cmdselect.Parameters.AddWithValue("@PID", PID);
            con.Open();

            SqlDataReader dr = cmdselect.ExecuteReader();

            if (!dr.HasRows) { Response.Write("<script>alert('no data found');</script>"); return; }

            SqlCommand cmd = new SqlCommand("INSERT INTO Feedback_tb (PID, Name,Email, Message, Ratings , Feedback_date) VALUES(@pid, @Name,@email,@message,@ratings,@feedbackdate)", con);

            dr.Read();


            cmd.Parameters.AddWithValue("@pid", dr["PID"]);


            cmd.Parameters.AddWithValue("@Name", name.Text.Trim());
            cmd.Parameters.AddWithValue("@email", email.Text.Trim());
            cmd.Parameters.AddWithValue("@message", message.Text.Trim());


            cmd.Parameters.AddWithValue("@ratings", ratings.SelectedValue);

            cmd.Parameters.AddWithValue("@feedbackdate", DateTime.Now);

            dr.Close();

            cmd.ExecuteNonQuery();

            Response.Write("<script> alert(' Thank You For Your Valuable Review... '); </script>"); clear();

            con.Close();

        }

        private void clear()
        {
            name.Text = ""; // resetting textbox
            email.Text = "";// resetting textbox
            message.Text = "";// resetting textbox

            ratings.SelectedValue = null;  // reset radiobuttonlist
        }
    }
}