using project.Models;
using System.Drawing;

namespace project.Models
{
	public class ShopViewModel
	{
		public IEnumerable<Category> Categories { get; set; }
		public IEnumerable<Floors> Floors { get; set; }
        public Shop Shop { get; set; } = new Shop(); 
		public List<Shop> Shops { get; set; }
		public Shopimages Shopimages { get; set; }
        public IFormFile CardImage { get; set; }
        public IFormFileCollection ShopImages { get; set; }
        public List<Shopimages> Shopimage { get; set; }
		public int SelectedCategoryID { get; set; }
		public int SelectedFloorID { get; set; }
        // Parameterless constructor
        public ShopViewModel()
        {
            Shop = new Shop(); // Initialize Shop to avoid null reference
            Categories = new List<Category>(); // Initialize to avoid null reference
            Floors = new List<Floors>(); // Initialize to avoid null reference
            Shopimage = new List<Shopimages>();
        }
    }
}
