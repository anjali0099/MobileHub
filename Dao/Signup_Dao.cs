using MobileHub.Bll;
using MobileHub.Utils;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace MobileHub.Dao
{
    public class Signup_Dao
    {
        DbConnection dc = new DbConnection();

        string md5pass = FormsAuthentication.HashPasswordForStoringInConfigFile("org", "MD5");

        public void SignUp(User u)
        {


            string sql = ("INSERT INTO User_tb(FirstName,LastName ,Address ,Email ,Phone ,Username ,Password, Userrole) values (@fname,@lname,@Address,@Email,@phone,@Username,@Password,@Userrole)");
            SqlCommand cmd = new SqlCommand(sql, dc.cn);
            cmd.Parameters.AddWithValue("@fname", u.FirstName);
            cmd.Parameters.AddWithValue("@lname", u.LastName);
            cmd.Parameters.AddWithValue("@Address", u.Address);
            cmd.Parameters.AddWithValue("@Email", u.Email);
            cmd.Parameters.AddWithValue("@phone", u.Phone);
            cmd.Parameters.AddWithValue("@Username", u.Username);
            cmd.Parameters.AddWithValue("@Password", md5pass);
            cmd.Parameters.AddWithValue("@Userrole", "Customer");

            cmd.ExecuteNonQuery();
            dc.cn.Close();
        }
    }

}