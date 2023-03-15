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
    public class Manageuser_Dao
    {
        DbConnection dc = new DbConnection();

        string md5pass = FormsAuthentication.HashPasswordForStoringInConfigFile("org", "MD5");
        //Adduser
        public void Addusers(Manageuser m)
        {
            string sql = ("INSERT INTO User_tb(FirstName,LastName ,Address ,Email ,Phone ,Username ,Password, Userrole) values (@fname,@lname,@Address,@Email,@phone,@Username,@Password,@Userrole)");
            SqlCommand cmd = new SqlCommand(sql, dc.cn);
            cmd.Parameters.AddWithValue("@fname", m.FirstName);
            cmd.Parameters.AddWithValue("@lname", m.LastName);
            cmd.Parameters.AddWithValue("@Address", m.Address);
            cmd.Parameters.AddWithValue("@Email", m.Email);
            cmd.Parameters.AddWithValue("@phone", m.Phone);
            cmd.Parameters.AddWithValue("@Username", m.Username);
            cmd.Parameters.AddWithValue("@Password", md5pass);
            cmd.Parameters.AddWithValue("@Userrole", m.Userrole);

            cmd.ExecuteNonQuery();
            dc.cn.Close();
        }

    }
}