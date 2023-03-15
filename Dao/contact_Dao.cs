using MobileHub.Bll;
using MobileHub.Utils;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MobileHub.Dao
{
    public class contact_Dao
    {
        DbConnection dc = new DbConnection();

        public void Contact(contact co)
        {
            string sql = ("INSERT INTO ContactUs_tb(FullName,Email,Message) values (@fullname,@Email,@Message)");
            SqlCommand cmd = new SqlCommand(sql, dc.cn);
            cmd.Parameters.AddWithValue("@fullname", co.FullName);
            cmd.Parameters.AddWithValue("@Email", co.Email);
            cmd.Parameters.AddWithValue("@Message", co.Message);


            cmd.ExecuteNonQuery();
            dc.cn.Close();
        }
    }
}