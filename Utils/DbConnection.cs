using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MobileHub.Utils
{
    public class DbConnection
    {
        public SqlConnection cn;

        public DbConnection()
        {
            string sqlcon = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnection"].ToString();
            cn = new SqlConnection(sqlcon);
            cn.Open();
        }
    }
}