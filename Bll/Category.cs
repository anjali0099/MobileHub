using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MobileHub.Bll
{
    public class Category
    {
        public int Cat_id { get; set; }
        public string Cat_Name { get; set; }

        public Category(string category)
        {
            Cat_Name = category;
        }
            
    }
}