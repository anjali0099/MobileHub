using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MobileHub.Utils;
using System.Data.SqlClient;
using DbConnection = MobileHub.Utils.DbConnection;
using System.Data;

namespace MobileHub
{
    public partial class Oppo : System.Web.UI.Page
    {
        DbConnection dc = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProduct();
            }
        }

        private void BindProduct()
        {

            string query = ("SELECT * FROM Product_tb where Cat_id ='3'");
            SqlCommand cmd = new SqlCommand(query, dc.cn);
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    rptrProduct.DataSource = dt;
                    rptrProduct.DataBind();
                }
            }
        }
        
    }
}