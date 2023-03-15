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
    public partial class Order : System.Web.UI.Page
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
                Checkuser();
                // Bindorderitem();

            }
        }
        private void Checkuser()
        {
            String user = Session["Username"].ToString();
            SqlConnection con = new SqlConnection(constr);

            SqlDataAdapter da = new SqlDataAdapter("Select * from Order_tb where Username='" + user + "'", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            rptrorder.DataSource = ds;
            rptrorder.DataBind();

        }
        private void Bindorderitem()
        {
            String user = Session["Username"].ToString();
            string query = ("Select * from Order_tb where Username='" + user + "'");
            SqlCommand cmd = new SqlCommand(query, dc.cn);
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrorder.DataSource = dt;
                    rptrorder.DataBind();
                }

            }

        }

        protected void rptrorder_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Cancel" && e.CommandArgument.ToString() != "")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string del = " delete  from Order_tb where Order_ID=" + e.CommandArgument.ToString();
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = del;
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    rptrorder.DataBind();
                }
                Response.Redirect("Order.aspx");
            }
        }
    }
}