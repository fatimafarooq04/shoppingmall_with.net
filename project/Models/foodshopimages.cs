using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class foodshopimages
    {
        [Key]
        public int FoodCourtImageID { get; set; }
        public int FoodCourtShopID { get; set; }
        public string ImageURL { get; set; }

        [ForeignKey("FoodCourtShopID")]
        public foodshop foodshop { get; set; }

        public foodshopimages(int foodCourtImageID, int foodCourtShopID, string imageURL)
        {
            FoodCourtImageID = foodCourtImageID;
            FoodCourtShopID = foodCourtShopID;
            ImageURL = imageURL;
        }
    }
}
