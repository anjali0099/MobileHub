using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MobileHub.Bll
{
    public class Manageuser
    {
        public int UID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Userrole { get; set; }


        public Manageuser(string FName, string LName, string address, string email, string phone, string username, string password,string userrole)
        {
            FirstName = FName;
            LastName = LName;
            Address = address;
            Email = email;
            Phone = phone;
            Username = username;
            Password = password;
            Userrole = userrole;

        }
    }
}