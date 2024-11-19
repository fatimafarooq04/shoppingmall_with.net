namespace project.Models
{
    public class Foodcategory
    {
        public int FoodCategoryID { get; set; }
            public string CategoryName { get; set; }

        public Foodcategory(int foodCategoryID, string categoryName)
        {
            FoodCategoryID = foodCategoryID;
            CategoryName = categoryName;
        }
    }
}
