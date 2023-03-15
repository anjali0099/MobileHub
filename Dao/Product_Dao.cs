using MobileHub.Bll;
using MobileHub.Utils;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MobileHub.Dao
{
    public class Product_Dao
    {
        DbConnection dc = new DbConnection();

        public void Addproduct(Products p)
        {
            string query = ("INSERT INTO Product_tb(PName, Cat_id, Pimage, Description, Price) values (@Pname,@Cat_id,@Pimage,@Description,@Price) ");
            SqlCommand cmd = new SqlCommand(query, dc.cn);
            cmd.Parameters.AddWithValue("@Pname", p.PName);
            cmd.Parameters.AddWithValue("@Cat_id", p.Cat_id);
            cmd.Parameters.AddWithValue("@Pimage", p.Pimage);
            cmd.Parameters.AddWithValue("@Description", p.Description);
            cmd.Parameters.AddWithValue("@Price", p.Price);

            cmd.ExecuteNonQuery();
            dc.cn.Close();

        }
    }
}