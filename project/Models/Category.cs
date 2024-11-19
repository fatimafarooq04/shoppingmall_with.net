using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class Category
    {
        public int CategoryID { get; set; }

        [Required(ErrorMessage = "Category name is required.")]
        [StringLength(50, ErrorMessage = "Category name cannot be longer than 50 characters.")]
        public string CategoryName { get; set; }

        public ICollection<Shop> Shops { get; set; }

        // Parameterless constructor for Entity Framework
        public Category() { }

        public Category(int categoryID, string categoryName)
        {
            CategoryID = categoryID;
            CategoryName = categoryName;
        }
    }
}
