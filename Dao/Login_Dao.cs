using MobileHub.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MobileHub.Bll;
using System.Web.Security;
using System.Data;
using System.Data.SqlClient;

namespace MobileHub.Dao
{
    public class Login_Dao
    {
        DbConnection dc = new DbConnection();
        public DataTable CheckUser(Login_bll lb)
        {
            string md5pass = FormsAuthentication.HashPasswordForStoringInConfigFile("org", "MD5");
            string password = lb.Password;
            string query2 = "SELECT * From User_tb where Username=@Username and Password=@Password";
            SqlCommand cmd = new SqlCommand(query2, dc.cn);
            cmd.Parameters.AddWithValue("@Username", lb.Username);
            cmd.Parameters.AddWithValue("@Password", md5pass);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "Login");
            return ds.Tables[0];
        }
    }
}