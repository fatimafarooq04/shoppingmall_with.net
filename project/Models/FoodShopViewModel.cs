
using System.Drawing;
namespace project.Models
{
    public class FoodShopViewModel
    {
        public IEnumerable<Floors>Floors {  get; set; }

        public IEnumerable<Foodcategory> FoodCategory { get; set; }
        public foodshop foodshop { get; set; }
        public int SelectedFloorID { get; set; }
        public int SelectedFoodCategoryID { get; set; }
        public List<foodshop> FoodCourtShops { get; set; }

    }
}
