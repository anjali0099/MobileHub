using MobileHub.Bll;
using MobileHub.Utils;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MobileHub.Dao
{
    public class Category_Dao
    {
        DbConnection dc = new DbConnection();
        
        //Add category
        public void Addcategory(Category c)
        {
            string query1 = ("INSERT INTO Category_tb (Cat_Name) values (@Cat_Name)");
            SqlCommand cmd = new SqlCommand(query1, dc.cn);
            cmd.Parameters.AddWithValue("@Cat_Name", c.Cat_Name);

            cmd.ExecuteNonQuery();
            dc.cn.Close();
        }
    }
}