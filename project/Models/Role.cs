using System.ComponentModel.DataAnnotations;

namespace project.Models
{
  public class Role
  {
        [Key]
    public int RoleID { get; set; }

    public string RoleName { get; set; }
       
    public Role(int roleID, string roleName)
    {
      RoleID = roleID;
      RoleName = roleName;
    }
  }
}
