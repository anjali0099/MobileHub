using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MobileHub.Bll
{
    public class Products
    {
        public int PID { get; set; }
        public string PName { get; set; }
        public string Cat_id { get; set; }
        public string Pimage { get; set; }
        public string Description { get; set; }
        public string Price { get; set; }

        public Products(string txtPname, string category, string image, string txtPDetail, string txtPrice)
        {
            PName = txtPname;
            Cat_id = category;
            Pimage = image;
            Description = txtPDetail;
            Price = txtPrice;
        }
    }
}