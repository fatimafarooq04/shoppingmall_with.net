using project.Models;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace project.Models
{
    public class foodshop

    {
        [Key]
        public int FoodCourtShopID { get; set; }
        public string ShopName { get; set; }

        public int FloorID { get; set; }

        public string ImageURL { get; set; }

        public string Description { get; set; }

        public string Location { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string StoreHours { get; set; }



        public int FoodCategoryID { get; set; }

        [ForeignKey("FloorID")]
        public Floors Floors { get; set; }

        [ForeignKey("FoodCategoryID")]
        public Foodcategory Foodcategory { get; set; }
        public ICollection<foodshopimages> foodshopimages { get; set; }


        public foodshop(int foodCourtShopID, string shopName, int floorID, string imageURL, string description, string location, string phone, string email, string storeHours, int foodCategoryID)
        {
            FoodCourtShopID = foodCourtShopID;
            ShopName = shopName;
            FloorID = floorID;
            ImageURL = imageURL;
            Description = description;
            Location = location;
            Phone = phone;
            Email = email;
            StoreHours = storeHours;
            FoodCategoryID = foodCategoryID;
        }
    }
}