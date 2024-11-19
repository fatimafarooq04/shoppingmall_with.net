using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace project.Models
{
    public class User
    {
        [Key]
        public int UserID { get; set; }
       
        public string Username { get; set; }

        public string Email { get; set; }


        public string Password { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Userimg { get; set; }



        public User(int userID,  string username, string email, string password, string firstName, string lastName, string userimg)
        {
            UserID = userID;
       
            Username = username;
            Email = email;
            Password = password;
            FirstName = firstName;
            LastName = lastName;
            Userimg = userimg;
        }
    }
}
