using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;



namespace MobileHub.Admin_layout
{
    public partial class Manageproduct : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)

            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                BindGridView();

            }
        }
        //method for binding GridView

        protected void BindGridView()
        {
            string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);

            DataTable dt = new DataTable();

            SqlDataAdapter da = new SqlDataAdapter("Select * from Product_tb" , con);

            con.Open();

            da.Fill(dt);

            con.Close();

            if (dt.Rows.Count > 0)

            {

                GridView1.DataSource = dt;

                GridView1.DataBind();

            }

        }

        // row delete event

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);

            // find id of edit row

            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

            SqlCommand cmd = new SqlCommand("delete from Product_tb where PID=" + id+"", con);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();

            // Refresh the GridView
            Response.Write("<script>alert('The product has been deleted');</script>");
            BindGridView();
            
            //Response.Redirect("Manageproduct.aspx");
         

        }



        // edit event

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;

            BindGridView();

        }
    


        // update event

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)

        {
            string constr = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);


            //find id of edit row

            string id = GridView1.DataKeys[e.RowIndex].Value.ToString();
            // find values for update

            TextBox name = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_Name");
            TextBox cat_id = (TextBox)GridView1.Rows[e.RowIndex].FindControl("Cat_id");
            FileUpload FileUpload1 = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
            TextBox description = (TextBox)GridView1.Rows[e.RowIndex].FindControl("description");
            TextBox price = (TextBox)GridView1.Rows[e.RowIndex].FindControl("price");

            string path = "~/Productimg/";

            if (FileUpload1.HasFile)

            {

                path = FileUpload1.FileName;

                //save image in folder

                FileUpload1.SaveAs(MapPath("~/Productimg/" + path));

            }

            else

            {

                // use previous user image if new image is not changed

                Image img = (Image)GridView1.Rows[e.RowIndex].FindControl("img_user");

                path = img.ImageUrl;

            }

            //SqlCommand cmd = new SqlCommand("update Product_tb set PName='" + name.Text + "',Cat_id='" + cat_id.Text + "', Pimage = '" + path + "',Description='" + description.Text + "',Price='" + price.Text + "'  where PID = " + id + "", con);


            SqlCommand cmd = new SqlCommand("update Product_tb set PName=@pname, Cat_id=@cat_id, Pimage=@image, Description=@description, Price=@price where PID = " + id + "", con);
            cmd.Parameters.AddWithValue("@pname", name.Text);
            cmd.Parameters.AddWithValue("@cat_id", cat_id.Text);
            cmd.Parameters.AddWithValue("@image", path);
            cmd.Parameters.AddWithValue("@description", description.Text);
            cmd.Parameters.AddWithValue("@price", price.Text);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();



            GridView1.EditIndex = -1;

            BindGridView();

        }

        // cancel edit event

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)

        {

            GridView1.EditIndex = -1;

            BindGridView();

        }
    }
}