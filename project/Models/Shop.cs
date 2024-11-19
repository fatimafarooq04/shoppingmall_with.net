using project.Models;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
namespace project.Models
{
    public class Shop
    {
        public int ShopID { get; set; }

        [Required(ErrorMessage = "Shop name is required.")]
        [StringLength(100, ErrorMessage = "Shop name cannot exceed 100 characters.")]
        public string ShopName { get; set; }

        [Required(ErrorMessage = "Category is required.")]
        public int CategoryID { get; set; }

        [Required(ErrorMessage = "Floor is required.")]
        public int FloorID { get; set; }

        [Required(ErrorMessage = "Please upload a card image.")]
        [FileExtensions(Extensions = "jpg,jpeg,png", ErrorMessage = "Only .jpg, .jpeg, and .png formats are allowed.")] 
        public string ImageURL { get; set; }

        [StringLength(500, ErrorMessage = "Description cannot exceed 500 characters.")]
        public string Description { get; set; }

        [StringLength(200, ErrorMessage = "Location cannot exceed 200 characters.")]
        public string Location { get; set; }

        [Phone(ErrorMessage = "Please enter a valid phone number.")]
        [MinLength(11, ErrorMessage = "Phone number cannot exceed 11 characters.")]
        public string Phone { get; set; }

        [EmailAddress(ErrorMessage = "Please enter a valid email address.")]
        [StringLength(100, ErrorMessage = "Email cannot exceed 100 characters.")]
        public string Email { get; set; }

        [StringLength(50, ErrorMessage = "Store hours cannot exceed 50 characters.")]
        public string StoreHours { get; set; }

        [ForeignKey("FloorID")]
        public Floors Floors { get; set; }

        [ForeignKey("CategoryID")]
        public Category Categories { get; set; }

        public ICollection<Shopimages> ShopImages { get; set; }
        // Parameterless constructor (required for model binding)
        public Shop() { }
        public Shop(int shopID, string shopName, int categoryID, int floorID, string imageURL, string description, string location, string phone, string email, string storeHours)
        {
            ShopID = shopID;
            ShopName = shopName;
            CategoryID = categoryID;
            FloorID = floorID;
            ImageURL = imageURL;
            Description = description;
            Location = location;
            Phone = phone;
            Email = email;
            StoreHours = storeHours;
        }
    }
}
