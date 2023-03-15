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

namespace MobileHub.Admin_layout
{
    public partial class Manageorder : System.Web.UI.Page
    {
        DbConnection dc = new DbConnection();
        string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

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
        //go button
        protected void Button4_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constr);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from Order_tb WHERE Order_ID ='" + order_id.Text.Trim() + "'", con);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    fname.Text = dt.Rows[0]["PName"].ToString();
                    lname.Text = dt.Rows[0]["Quantity"].ToString();
                    txtPname.Text = dt.Rows[0]["PName"].ToString();
                    qty.Text = dt.Rows[0]["Quantity"].ToString();
                    total.Text = dt.Rows[0]["GrandTotal"].ToString();
                    payment.SelectedValue = dt.Rows[0]["PaymentThrough"].ToString().Trim();
                    status.SelectedValue = dt.Rows[0]["Order_Status"].ToString().Trim();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Order ID');</script>");
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        //update button
        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(constr);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE Order_tb set Order_Status=@status where Order_ID ='" + order_id.Text.Trim() + "'", con);

                cmd.Parameters.AddWithValue("@status", status.SelectedValue);

                cmd.ExecuteNonQuery();
                Response.Redirect("Manageorder.aspx");
                con.Close();


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}