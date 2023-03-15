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
    public partial class user : System.Web.UI.MasterPage
    {
        DbConnection dc = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            
           // BindCategories();
            try
            {
                if(Session["Username"]!=null)
                {
                    loginbtn.Visible = false;
                    logoutbtn.Visible = true;
                    welcome.Visible = true;
                    welcome.Text = "Welcome " + Session["Username"].ToString();
                }
                else
                {
                    loginbtn.Visible = true;
                    logoutbtn.Visible = false;
                    welcome.Visible = false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        private void BindCategories()
        {
            string query = ("SELECT * FROM Product_tb ");
            SqlCommand cmd = new SqlCommand(query, dc.cn);
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    //rptrProduct.DataSource = dt;
                    //rptrProduct.DataBind();
                }
            }
            //string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            //SqlConnection con = new SqlConnection(constr);

            //DataTable dt = new DataTable();
            //SqlDataAdapter da = new SqlDataAdapter("select * from Product_tb", con);
            //con.Open();

            //da.Fill(dt);

            //con.Close();
            //////{


            ////    using (SqlCommand cmd = new SqlCommand("select * from Category_tb", con))
            ////    {
            ////        cmd.CommandType = CommandType.Text;
            ////        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            ////        {

            ////            sda.Fill(dt);

            ////        }

            ////    }
            ////}


            //if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            //{
            //    string catId = (e.Item.FindControl("hfCatId") as HiddenField).Value;
            //string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            ////SqlConnection con = new SqlConnection(constr);

            ////{
            //    using (SqlCommand con = new SqlCommand(constr))
            //{
            //    using (SqlCommand cmd = new SqlCommand(string.Format("select * from Category_tb WHERE Cat_id='{0}'", catId), con))
            //    {
            //        cmd.CommandType = CommandType.Text;
            //        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            //        {
            //            DataTable dt = new DataTable();
            //            sda.Fill(dt);
            //            rptCategory.DataSource = dt;
            //            rptCategory.DataBind();
            //        }

            //    }


            //}
            //    //    "select * from Category_tb where Cat_id='{0}'", con))
            //    //{
            //    //    cmd.CommandType = CommandType.Text;
            //    //    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            //    //    {
            //    //        DataTable dt = new DataTable();
            //    //        sda.Fill(dt);
            //    //        rptCategory.DataSource = dt;
            //    //        rptCategory.DataBind();
            //    //    }

            //    //}
            //}
        }

        protected void loginbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void logoutbtn_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("userindex.aspx");
            loginbtn.Visible = true;
            logoutbtn.Visible = false;
            welcome.Visible = false;
        }

        //protected void rptCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        string catId = (e.Item.FindControl("hfCatId") as HiddenField).Value;
        //        Repeater rptCategory = e.Item.FindControl("rptCategory") as Repeater;

        //        string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
                
               
        //        using (SqlConnection con = new SqlConnection(constr))
        //        {
        //            using (SqlCommand cmd = new SqlCommand(string.Format("select * from Category_tb WHERE Cat_id='{0}'", catId), con))
        //            {
        //                cmd.CommandType = CommandType.Text;
        //                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //                {
        //                    DataTable dt = new DataTable();
        //                    sda.Fill(dt);
        //                    rptCategory.DataSource = dt;
        //                    rptCategory.DataBind();
        //                }

        //            }
        //        }
        //    }
        //}
    }
}