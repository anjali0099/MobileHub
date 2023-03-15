using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MobileHub.Bll
{
    public class contact
    {
        public int ContactUs_id { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Message { get; set; }


        public contact(string fullname, string email, string message)
        {
            FullName = fullname;
            Email = email;
            Message = message;
        }
    }
}