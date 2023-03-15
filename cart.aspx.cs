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
using DbConnection = MobileHub.Utils.DbConnection;

namespace MobileHub
{
    public partial class cart : System.Web.UI.Page
    {
        DbConnection dc = new DbConnection();
        string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                if (Session["Username"] == null)
                {
                    Response.Redirect("login.aspx");
                }

                BindCartItem();
                Checkuser();
            }

        }

        private void Checkuser()
        {
            String user = Session["Username"].ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                SqlDataAdapter da = new SqlDataAdapter("Select * from Cart_tb where Username='" + user + "'", con);

                DataSet ds = new DataSet();
                da.Fill(ds);
                rptrCart.DataSource = ds;
                rptrCart.DataBind();
                
            }
        }

        private void BindCartItem()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            string query = ("SELECT * FROM Cart_tb where PID =" + PID + "");
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

        }

        protected void rptrCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete" && e.CommandArgument.ToString() != "")
            {
                using (SqlConnection con = new SqlConnection(constr))
                {
                    string del = " delete  from Cart_tb where Cart_ID=" + e.CommandArgument.ToString();
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    cmd.CommandText = del;
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    rptrCart.DataBind();
                    Response.Redirect("cart.aspx");
                }
            }
        }
    }
}