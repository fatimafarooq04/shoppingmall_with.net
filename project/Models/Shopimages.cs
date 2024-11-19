using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace project.Models
{
    public class Shopimages
    {
        [Key]
        public int ShopImageID { get; set; }
        public  int ShopID { get; set; }

        [Required(ErrorMessage = "Please upload at least one image..")]
        [FileExtensions(Extensions = "jpg,jpeg,png", ErrorMessage = "Only .jpg, .jpeg, and .png formats are allowed.")]
        public string ImageURL { get; set; }

        [ForeignKey("ShopID")]
        public Shop Shops { get; set; }
        // Parameterless constructor
        public Shopimages() { }
        public Shopimages(int shopImageID, int shopID, string imageURL)
        {
            ShopImageID = shopImageID;
            ShopID = shopID;
            ImageURL = imageURL;
        }
    }
}
