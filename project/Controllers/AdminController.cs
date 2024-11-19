using project.Models;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using System.Drawing;
using static System.Net.Mime.MediaTypeNames;


namespace AdminPanel.Controllers
{
    public class AdminController : Controller
    {
        Connection db = new Connection();


        private bool IsValidName(string input, string pattern)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(input, pattern);
        }



        public IActionResult Index()
        {
            var username = HttpContext.Session.GetString("username");


            if (string.IsNullOrEmpty(username))
            {
                return RedirectToAction("SignIn");
            }


            // Assuming the admin's data is stored in the session
            string email = HttpContext.Session.GetString("email");
            string userImg = HttpContext.Session.GetString("userimg");
            DateTime joinedDate = DateTime.Now; // Replace with actual date if stored in database

            // Pass data directly to the view
            ViewBag.Username = username;
            ViewBag.Email = email;
            ViewBag.UserImg = userImg;
            ViewBag.JoinedDate = joinedDate.ToString("dd-MM-yyyy");

            return View();
        }
        public IActionResult Privacy()
        {
            return View();
        }




        public IActionResult SignUp()
        {
            // Fetch roles from the database
            var roles = db.Roles.ToList(); // Ensure this fetches roles

            return View(roles); // Pass roles to the view
        }
        [HttpPost]



        public IActionResult SignUp(string Username, string Email, string Password, string FirstName, string LastName, int Role, IFormFile Userimg)
        {
            if (Userimg != null)
            {
                var postername = Userimg.FileName;
                var posterpath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/UserImg", postername);
                using (FileStream Stream = new FileStream(posterpath, FileMode.Create))
                {
                    Userimg.CopyTo(Stream);
                }

                // Create the user object and save it to the database
                User movie = new User(0, Username, Email, Password, FirstName, LastName, postername);
                db.Users.Add(movie);
                db.SaveChanges();
            }

            ViewBag.SuccessMessage = "User added successfully!";

            // Fetch roles again to populate the dropdown in the view
            var roles = db.Roles.ToList();
            return View(roles); // Make sure to return roles to the view even after saving
        }
        public IActionResult SignIn()
        {
            return View();
        }
        [HttpPost]
        public IActionResult SignIn(string Email, string Password)
        {
            var abc = db.Users.Where(x => x.Email == Email && x.Password == Password).ToList();
            var data = abc.FirstOrDefault();
            if (abc.Count != 0)
            {
                HttpContext.Session.SetString("username", data.Username);

                HttpContext.Session.SetString("userimg", data.Userimg);
                return RedirectToAction("Index");
            }
            else

            {
                ViewBag.Error = "Incorrect Email and password!";
                return View();
            }
        }
        public IActionResult Logout()
        {
            // Clear the session
            HttpContext.Session.Clear();

            // Redirect to the login page or homepage
            return RedirectToAction("SignIn", "Admin"); // Adjust this if your Login action is in a different controller
        }

        public IActionResult Profile()
        {
            // Assuming the admin's data is stored in the session
            string username = HttpContext.Session.GetString("username");
            string email = HttpContext.Session.GetString("email");
            string userImg = HttpContext.Session.GetString("userimg");
            string role = "Admin"; // Replace with actual role if stored in database
            DateTime joinedDate = DateTime.Now; // Replace with actual date if stored in database

            // Pass data directly to the view
            ViewBag.Username = username;
            ViewBag.Email = email;
            ViewBag.UserImg = userImg;
            ViewBag.Role = role;
            ViewBag.JoinedDate = joinedDate.ToString("dd-MM-yyyy");

            return View();
        }

        //Role start
        public IActionResult Role()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Role(string RoleName)
        {
            Role role = new Role(0, RoleName);
            db.Roles.Add(role);
            db.SaveChanges();
            return View();
        }
        public IActionResult ShowRole()
        {
            var role = db.Roles.ToList();
            return View(role);
        }
        public IActionResult EditRole(int id)
        {
            var edit = db.Roles.Find(id);
            return View(edit);
        }
        [HttpPost]
        public IActionResult EditRole(int id, string RoleName)
        {
            var edit = db.Roles.Find(id);
            edit.RoleName = RoleName;
            db.SaveChanges();
            return RedirectToAction("ShowRole");
        }
        //Role end
        //Floors start
        public IActionResult Floors()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Floors(int FloorNumber, string Description)
        {
            string categoryPattern = @"^[a-zA-Z\s]+$";

            // Validate the category name using the generalized method
            if (!IsValidName(Description, categoryPattern))
            {
                ViewBag.Message = "Floor description can only contain letters and spaces.";
                return View();
            }
            // Check if the floor already exists
            var existingFloor = db.Floors.FirstOrDefault(f => f.FloorNumber == FloorNumber);

            if (existingFloor != null)
            {
                // Floor already exists
                ViewBag.Message = "A floor with this number already exists.";
            }
            else
            {
                // Create a new floor
                Floors floor = new Floors(0, FloorNumber, Description);
                db.Floors.Add(floor);
                db.SaveChanges();
                ViewBag.Message = "Floor added successfully.";
            }

            // Optionally, return a view with the current list of floors or the same view
            return View();
        }

        public IActionResult ShowFloors()
        {
            var floorsdata = db.Floors.ToList();
            return View(floorsdata);
        }
        public IActionResult EditFloors(int id)
        {
            var floorsedit = db.Floors.Find(id);
            return View(floorsedit);
        }
        [HttpPost]
        public IActionResult EditFloors(int id, int FloorNumber, string Description)
        {
           
            // Find the floor being edited by ID
            var floorToEdit = db.Floors.Find(id);

            if (floorToEdit == null)
            {
                ViewBag.Message = "Floor not found.";
                return RedirectToAction("ShowFloors"); // Or handle it accordingly
            }
           
            // Check if the floor number already exists (except for the current floor being edited)
            var existingFloor = db.Floors.FirstOrDefault(f => f.FloorNumber == FloorNumber && f.FloorID != id);

            if (existingFloor != null)
            {
                // Floor already exists
                ViewBag.Message = "A floor with this number already exists. Update not allowed.";
                // Return the view with the current floor data to show the error message
                return View(floorToEdit);
            }
            else
            {
                // Update the floor details
                floorToEdit.FloorNumber = FloorNumber;
                floorToEdit.Description = Description;
                db.SaveChanges();
                ViewBag.Message = "Floor updated successfully.";
            }

            // Redirect to ShowFloors action to display the updated list
            return RedirectToAction("ShowFloors");
        }
        //Floors end


        //Shop start 
        //Shop category start 
        public IActionResult Category()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Category(string CategoryName)
        {
            string categoryPattern = @"^[a-zA-Z\s]+$";

            // Validate the category name using the generalized method
            if (!IsValidName(CategoryName, categoryPattern))
            {
                ViewBag.Message = "Category name can only contain letters and spaces.";
                return View();
            }
            // Check if the category already exists (case-insensitive)
            var existingCategory = db.Categories
                .FirstOrDefault(c => c.CategoryName.ToLower() == CategoryName.ToLower());

            if (existingCategory != null)
            {
                // Category already exists
                ViewBag.Message = "A category with this name already exists.";
            }
            else
            {
                // Add new category
                Category category = new Category(0, CategoryName);
                db.Categories.Add(category);
                db.SaveChanges();
                ViewBag.Message = "Category added successfully.";
            }

            // Return the view with the message
            return View();
        }
        public IActionResult ShowCategory()
        {
            var data = db.Categories.ToList();
            return View(data);
        }
        public IActionResult EditCategory(int id)
        {
            var data = db.Categories.Find(id);
            return View(data);
        }
        [HttpPost]
        public IActionResult EditCategory(int id, string CategoryName)
        {
            // Find the category to edit
            var categoryToEdit = db.Categories.Find(id);

            if (categoryToEdit == null)
            {
                ViewBag.Message = "Category not found.";
                return RedirectToAction("ShowCategory"); // Redirect if not found
            }

            // Check if another category with the same name (case-insensitive) already exists
            var existingCategory = db.Categories
                .FirstOrDefault(f => f.CategoryName.ToLower() == CategoryName.ToLower() && f.CategoryID != id);

            if (existingCategory != null)
            {
                // Category with this name already exists
                ViewBag.Message = "A category with this name already exists. Update not allowed.";

                // Return the view with current category data and error message
                return View(categoryToEdit);
            }

            // Update the category details
            categoryToEdit.CategoryName = CategoryName;
            db.SaveChanges();

            ViewBag.Message = "Category updated successfully.";
            return RedirectToAction("ShowCategory");
        }

        //Shop category end 
        public IActionResult Shop()
        {
            var model = new ShopViewModel
            {
                Categories = db.Categories.ToList(),
                Floors = db.Floors.ToList()
            };

            return View(model);
        }
        [HttpPost]

        public IActionResult Shop(string ShopName, string Description, int category, int floor, IFormFile card, IFormFileCollection image, string location, string Phone, string Email, string StoreHours)
        {
            // Validate shop name: Check if it contains numbers
            if (ShopName.Any(char.IsDigit))
            {
                ViewBag.ErrorMessage = "Shop Name cannot contain numbers.";
                var modelWithErrors = new ShopViewModel
                {
                    Categories = db.Categories.ToList(),
                    Floors = db.Floors.ToList()
                };
                return View(modelWithErrors);
            }

            // Check if the shop already exists
            var existingShop = db.Shops.FirstOrDefault(s => s.ShopName.ToLower() == ShopName.ToLower());
            if (existingShop != null)
            {
                ViewBag.SuccessMessage = "A shop with this name already exists.";
                ViewBag.SuccessMessage = "A shop with this name already exists.";
                var modelWithErrors = new ShopViewModel
                {
                    Categories = db.Categories.ToList(),
                    Floors = db.Floors.ToList()
                };
                return View(modelWithErrors);
            }

            // Proceed to upload the card image
            if (card != null)
            {
                var filename = card.FileName;
                var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/shopimages", filename);
                using (FileStream stream = new FileStream(path, FileMode.Create))
                {
                    card.CopyTo(stream);
                }

                // Create and save the shop
                Shop shop = new Shop(0, ShopName, category, floor, filename, Description, location, Phone, Email, StoreHours);
                db.Shops.Add(shop);
                db.SaveChanges();

                // Upload additional images
                if (image != null && image.Count > 0)
                {
                    foreach (var imgFile in image)
                    {
                        var imgName = imgFile.FileName;
                        var imgPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/shopimages", imgName);
                        using (FileStream imgStream = new FileStream(imgPath, FileMode.Create))
                        {
                            imgFile.CopyTo(imgStream);
                        }
                        Shopimages img = new Shopimages(0, shop.ShopID, imgName);
                        db.ShopImages.Add(img);
                    }
                    db.SaveChanges();
                }

                // Prepare the model for successful submission
                var model = new ShopViewModel
                {
                    Categories = db.Categories.ToList(),
                    Floors = db.Floors.ToList()
                };

                ViewBag.SuccessMessage = "Shop added successfully!";
                return View(model);
            }

            // If card is null, return a model with errors
            var modelWithErrorsFinal = new ShopViewModel
            {
                Categories = db.Categories.ToList(),
                Floors = db.Floors.ToList()
            };

            return View(modelWithErrorsFinal);
        }
        public IActionResult Showshop()
        {
            var shops = db.Shops
         .Include(s => s.Categories)
         .Include(s => s.Floors)
         .Include(s => s.ShopImages)
         .ToList();

            return View(shops);
        }
        public IActionResult EditShop(int id)
        {
            var shop = db.Shops
                .Include(s => s.Categories)
                .Include(s => s.Floors)
                .Include(s => s.ShopImages)
                .FirstOrDefault(s => s.ShopID == id);


            var viewModel = new ShopViewModel
            {
                Shop = shop,
                Shops = db.Shops.ToList(),
                Categories = db.Categories.ToList(),
                Floors = db.Floors.ToList()
            };

            return View(viewModel);
        }
        [HttpPost]
        public IActionResult EditShop(int id, string ShopName, string Description, int category, int floor, string Location, string Phone, string Email, string StoreHours, IFormFile CardImage, IFormCollection Images)
        {
            var shop = db.Shops
                .Include(s => s.Categories)
                .Include(s => s.Floors)
                .Include(s => s.ShopImages)
                .FirstOrDefault(s => s.ShopID == id);


            shop.ShopName = ShopName;
            shop.Description = Description;
            shop.CategoryID = category;
            shop.FloorID = floor;
            shop.Location = Location;
            shop.Phone = Phone;
            shop.Email = Email;
            shop.StoreHours = StoreHours;



            if (CardImage?.Length > 0)
            {
                var cardname = CardImage.FileName;
                var cardpath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/shopimages", cardname);
                using (FileStream stream = new FileStream(cardpath, FileMode.Create))
                {
                    CardImage.CopyTo(stream);
                };
                shop.ImageURL = cardname;
            }

            if (Images?.Count > 0)
            {
                foreach (var img in Request.Form.Files)
                {
                    var imgname = img.FileName;

                    var imagepath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/shopimages", imgname);
                    using (FileStream imgstream = new FileStream(imagepath, FileMode.Create))
                    {
                        img.CopyTo(imgstream);
                    };
                    var shopimg = new Shopimages(0, shop.ShopID, imgname)
                    {

                        ShopID = shop.ShopID,
                        ImageURL = imgname,

                    };
                    db.ShopImages.Add(shopimg);
                }

                db.SaveChanges();
            }

            return RedirectToAction("Showshop");
        }
        public IActionResult DeleteShop(int id)
        {
            var shop = db.Shops
                .Include(s => s.ShopImages)
                .FirstOrDefault(s => s.ShopID == id);

            if (shop != null)
            {
                // Delete images from the server
                foreach (var image in shop.ShopImages)
                {
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/shopimages", image.ImageURL);
                    if (System.IO.File.Exists(filePath))
                    {
                        System.IO.File.Delete(filePath);
                    }
                    db.ShopImages.Remove(image); // Corrected to use ShopImages
                }

                // Delete the shop
                db.Shops.Remove(shop);
                db.SaveChanges();
            }

            return RedirectToAction("ShowShop"); // Make sure "Showshop" matches the action name
        }
        //Shop end 



        //foodshop court start
        //foodshop category start
        public IActionResult Foodcategory()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Foodcategory(string foodcategory)
        {
            Foodcategory category = new Foodcategory(0, foodcategory);
            db.FoodCategory.Add(category);
            db.SaveChanges();
            return View();
        }
        public IActionResult ShowFoodcategory()
        {
            var data = db.FoodCategory.ToList();
            return View(data);
        }
        public IActionResult EditFoodCategory(int id)
        {
            var fooddata = db.FoodCategory.Find(id);
            return View(fooddata);
        }
        [HttpPost]
        public IActionResult EditFoodCategory(int id, string CategoryName)
        {
            var fooddata = db.FoodCategory.Find(id);
            fooddata.CategoryName = CategoryName;
            db.SaveChanges();
            return RedirectToAction("ShowFoodcategory");
        }
        //foodshop category end
        public IActionResult foodshop()
        {
            var model = new FoodShopViewModel

            {
                FoodCategory = db.FoodCategory.ToList(),
                Floors = db.Floors.ToList()
            };

            return View(model);
        }
        [HttpPost]
        public IActionResult foodshop(string FoodShopName, string Description, int floor, IFormFile card, int category, IFormFileCollection image, string Location, string Phone, string Email, string StoreHours)
        {
            if (card != null)
            {
                var filename = card.FileName;
                var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/foodimage", filename);
                using (FileStream stream = new FileStream(path, FileMode.Create))
                {
                    card.CopyTo(stream);
                }

                foodshop foodshop = new foodshop(0, FoodShopName, floor, filename, Description, Location, Phone, Email, StoreHours, category);
                db.FoodCourtShops.Add(foodshop);
                db.SaveChanges();


                if (image != null && image.Count > 0)
                {
                    foreach (var imgFile in image)
                    {
                        var imgName = imgFile.FileName;
                        var imgPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/foodimage", imgName);
                        using (FileStream imgStream = new FileStream(imgPath, FileMode.Create))
                        {
                            imgFile.CopyTo(imgStream);
                        }

                        foodshopimages foodshopimages = new foodshopimages(0, foodshop.FoodCourtShopID, imgName);
                        db.FoodCourtImages.Add(foodshopimages);
                    }


                    db.SaveChanges();
                }

                var model = new FoodShopViewModel

                {
                    FoodCategory = db.FoodCategory.ToList(),
                    Floors = db.Floors.ToList()
                };

                ViewBag.SuccessMessage = "Shop added successfully!";

                return View(model);

            }

            var modelWithErrors = new FoodShopViewModel
            {
                FoodCategory = db.FoodCategory.ToList(),
                Floors = db.Floors.ToList()
            };

            return View(modelWithErrors);
        }
        public IActionResult Showfood()
        {
            var foodshops = db.FoodCourtShops
         .Include(s => s.Foodcategory)
         .Include(s => s.Floors)
         .Include(s => s.foodshopimages)
         .ToList();

            return View(foodshops);
        }


        public IActionResult Editfoodshop(int id)
        {
            var shop = db.FoodCourtShops
                .Include(s => s.Foodcategory)
                .Include(s => s.Floors)
                .Include(s => s.foodshopimages)
                .FirstOrDefault(s => s.FoodCourtShopID == id);


            var viewModel = new FoodShopViewModel
            {
                foodshop = shop,
                FoodCourtShops = db.FoodCourtShops.ToList(),
                FoodCategory = db.FoodCategory.ToList(),
                Floors = db.Floors.ToList()
            };

            return View(viewModel);
        }
        [HttpPost]
        public IActionResult EditFoodShop(int id, string FoodShopName, string Description, int category, int floor, string Location, string Phone, string Email, string StoreHours, IFormFile CardImage, IFormCollection Images)
        {
            var shop = db.FoodCourtShops
                .Include(s => s.Foodcategory)
                .Include(s => s.Floors)
                .Include(s => s.foodshopimages)
                .FirstOrDefault(s => s.FoodCourtShopID == id);


            shop.ShopName = FoodShopName;
            shop.Description = Description;
            shop.FoodCategoryID = category;
            shop.FloorID = floor;
            shop.Location = Location;
            shop.Phone = Phone;
            shop.Email = Email;
            shop.StoreHours = StoreHours;



            if (CardImage?.Length > 0)
            {
                var cardname = CardImage.FileName;
                var cardpath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/foodimage", cardname);
                using (FileStream stream = new FileStream(cardpath, FileMode.Create))
                {
                    CardImage.CopyTo(stream);
                };
                shop.ImageURL = cardname;
            }

            if (Images?.Count > 0)
            {
                foreach (var img in Request.Form.Files)
                {
                    var imgname = img.FileName;

                    var imagepath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/foodimage", imgname);
                    using (FileStream imgstream = new FileStream(imagepath, FileMode.Create))
                    {
                        img.CopyTo(imgstream);
                    };
                    var shopimg = new foodshopimages(0, shop.FoodCourtShopID, imgname);  // Pass 0 for identity column
                    db.FoodCourtImages.Add(shopimg);


                    db.FoodCourtImages.Add(shopimg);
                }

                db.SaveChanges();
            }

            return RedirectToAction("Showfood");
        }
        public IActionResult DeleteFoodShop(int id)
        {

            var shop = db.FoodCourtShops
      .Include(s => s.foodshopimages)
      .FirstOrDefault(s => s.FoodCourtShopID == id);

            if (shop != null)
            {
                // Delete images from the server
                foreach (var image in shop.foodshopimages)
                {
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/foodimage", image.ImageURL);
                    if (System.IO.File.Exists(filePath))
                    {
                        System.IO.File.Delete(filePath);
                    }
                    db.FoodCourtImages.Remove(image); // Remove image from the database
                }



                // Delete the food shop
                db.FoodCourtShops.Remove(shop);
                db.SaveChanges();
            }
            return RedirectToAction("Showfood");
        }
        //foodshop shop end
        //gallery start
        public IActionResult gallery()
        {
            return View();
        }

        [HttpPost]
        public IActionResult gallery(IFormCollection images)
        {
            foreach (var file in images.Files)
            {
                if (file.Length > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/galleryimages", fileName);

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }

                    var myGallery = new gallery(0, fileName);
                    db.Gallery.Add(myGallery);
                }
            }

            db.SaveChanges();
            return View();
        }


        public IActionResult showgallery()
        {
            var galleryImages = db.Gallery.ToList();
            return View(galleryImages);
        }

        public IActionResult Editgallery(int id)
        {

            var edit = db.Gallery.Find(id);
            return View(edit);

        }


        [HttpPost]
        public IActionResult EditGallery(int id, IFormCollection images)
        {
            // Find the gallery item by its ID
            var edit = db.Gallery.Find(id);
            if (edit == null)
            {
                return NotFound();
            }

            // If there are new files uploaded
            if (images.Files.Count > 0)
            {
                foreach (var file in images.Files)
                {
                    if (file.Length > 0)
                    {
                        var fileName = Path.GetFileName(file.FileName);
                        var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/galleryimages", fileName);               
                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            file.CopyTo(stream);
                        }

                        // Update the ImageURL in the database
                        edit.ImageURL = fileName;
                    }
                }
            }

           
            db.SaveChanges();

         
            return RedirectToAction("showgallery");
        }

        public IActionResult Delete(int id)
        {
        
            var data = db.Gallery.Find(id);
            if (data == null)
            {
                return NotFound();
            }

            
            var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/galleryimages", data.ImageURL);
            if (System.IO.File.Exists(filePath))
            {
                System.IO.File.Delete(filePath);
            }

           
            db.Gallery.Remove(data);
            db.SaveChanges();

            return RedirectToAction("showgallery");
        }
//gallery end


        //Movie start
        [HttpGet]
        public IActionResult Movie()
        {
            return View(new Movie());
        }

        [HttpPost]
        public async Task<IActionResult> FetchMovie(string movieTitle)
        {
            // Fetch the movie details from the API
            var movieDetails = await GetFullMovieData(movieTitle);

            // Check if the movie was found in the API
            if (movieDetails != null)
            {
                // Check if the movie already exists in the database (case-insensitive)
                var existingMovie = await db.Movies
                    .FirstOrDefaultAsync(m => m.Title.ToLower() == movieDetails.Title.ToLower());

                if (existingMovie != null)
                {
                    ModelState.AddModelError("", "This movie already exists in the database.");
                    return View("Movie", new Movie()); // Return a new empty Movie instance to keep the input form
                }

                return View("Movie", movieDetails);
            }

            // If movieDetails is null, show an error message
            ModelState.AddModelError("", "Movie not found. Please try again.");
            return View("Movie", new Movie());
        }





        private async Task<Movie> GetFullMovieData(string movieTitle)
        {
            var movieDetails = await GetMovieDetails(movieTitle);
            if (movieDetails != null)
            {
                movieDetails.Trailer = await GetMovieTrailer(movieDetails.Title);
            }
            return movieDetails;
        }

        private async Task<Movie> GetMovieDetails(string movieTitle)
        {
            string apiKey = "7795c016"; // Replace with your OMDb API key
            string url = $"http://www.omdbapi.com/?t={Uri.EscapeDataString(movieTitle)}&apikey={apiKey}";

            using (HttpClient client = new HttpClient())
            {
                var response = await client.GetStringAsync(url);
                var movieData = JsonConvert.DeserializeObject<dynamic>(response);

                if (movieData != null && movieData.Response == "True")
                {
                    return new Movie
                    {
                        Title = movieData.Title ?? "N/A",
                        Description = movieData.Plot ?? "No description available.",
                        ReleaseDate = DateTime.TryParse((string)movieData.Released, out var releaseDate) ? releaseDate : (DateTime?)null,
                        Language = movieData.Language ?? "N/A",
						Genre = movieData.Genre ?? "N/A",
						Runtime = movieData.Runtime ?? "N/A",


						Director = movieData.Director ?? "N/A",
                        Actors = movieData.Actors ?? "N/A",
                        Poster = movieData.Poster ?? "https://via.placeholder.com/200",
                    };
                }
            }
            return null; // Return null if the movie is not found
        }

        private async Task<string> GetMovieTrailer(string movieTitle)
        {
            string apiKey = "AIzaSyB_FFpOtXmHuUSmjU9t3Uf4C1s7FgSgBtk"; // Replace with your YouTube API key
            string url = $"https://www.googleapis.com/youtube/v3/search?part=snippet&q={Uri.EscapeDataString(movieTitle)} trailer&type=video&key={apiKey}";

            using (HttpClient client = new HttpClient())
            {
                var response = await client.GetStringAsync(url);
                var videoData = JsonConvert.DeserializeObject<Dictionary<string, object>>(response);

                if (videoData != null && videoData.ContainsKey("items"))
                {
                    var items = (Newtonsoft.Json.Linq.JArray)videoData["items"];
                    if (items.Count > 0)
                    {
                        var videoId = items[0]["id"]["videoId"].ToString();
                        return $"https://www.youtube.com/watch?v={videoId}"; // Return the trailer link
                    }
                }
            }
            return null; // Return null if no trailer is found
        }

        [HttpPost]
    
        public async Task<IActionResult> SaveMovieDetails(Movie movie)
        {
            // Check if the movie already exists in the database to prevent duplicates
            var existingMovie = await db.Movies.FirstOrDefaultAsync(m => m.Title == movie.Title);
            if (existingMovie == null)
            {
                // Save the movie to the database
                db.Movies.Add(movie); // Add the new movie
                await db.SaveChangesAsync(); // Save changes to the database
                return RedirectToAction("Movie"); // Redirect after saving
            }

            ModelState.AddModelError("", "Movie already exists.");
            return View("Movie", movie);
        }

        //Movie end
        public IActionResult ShowMovieTime()
        {
            // Fetch the list of movies to pass to the view
            var movies = db.Movies.ToList();
            ViewBag.SuccessMessage = null; // Initialize to ensure it's not null
            return View(movies);
        }

        [HttpPost]
        public IActionResult ShowMovieTime(int MovieId, DateTime[] ShowDates, TimeSpan[] StartTimes, TimeSpan[] EndTimes, string SeatRange, decimal[] Prices)
        {
            // Split the seat range input into a list of individual seat codes
            List<string> SeatCodes = GenerateSeatCodes(SeatRange);

            // Ensure we have the same number of showtimes for each set of fields
            if (ShowDates.Length == StartTimes.Length && StartTimes.Length == EndTimes.Length && EndTimes.Length == Prices.Length)
            {
                for (int i = 0; i < ShowDates.Length; i++)
                {
                    // Create a new showtime and add it to the database
                    var showtime = new Movieshowtime(0, MovieId, ShowDates[i], StartTimes[i], EndTimes[i]);
                    db.MovieShowtimes.Add(showtime);
                    db.SaveChanges(); // Save to get the ShowTimeID for the seat

                    // Now, add the corresponding seat information
                    foreach (var seatCode in SeatCodes)
                    {
                        var seat = new Seats
                        {
                            ShowTimeID = showtime.ShowtimeId, // Use the ID from the newly created showtime
                            SeatCode = seatCode,
                            Price = Prices[i], // Assuming the price is the same for all seats for this showtime
                            IsBooked = false // Initial booked seats can be zero
                        };

                        db.Seats.Add(seat);
                    }
                }

                db.SaveChanges(); // Save all changes
                ViewBag.SuccessMessage = "Movie Showtimes and Seats added successfully!";
            }
            else
            {
                ViewBag.ErrorMessage = "The number of dates, start times, end times, and prices must match.";
            }

            // Fetch the list of movies again to pass to the view
            var movies = db.Movies.ToList();

            // Pass the list of movies to the view
            return View(movies);
        }

        // Method to generate seat codes from a range (e.g., "A-E" or "A1-A5")
        private List<string> GenerateSeatCodes(string seatRange)
        {
            List<string> seatCodes = new List<string>();

            // Split the range by '-' and trim any whitespace
            var ranges = seatRange.Split('-');
            if (ranges.Length == 2)
            {
                string start = ranges[0].Trim();
                string end = ranges[1].Trim();

                // Assume the start is in format "A1" and end is in format "A5"
                char startRow = start[0];
                char endRow = end[0];
                int startNum = int.Parse(start[1..]);
                int endNum = int.Parse(end[1..]);

                for (char row = startRow; row <= endRow; row++)
                {
                    for (int num = (row == startRow ? startNum : 1); num <= (row == endRow ? endNum : 5); num++) // Assume max seat number is 5 for each row
                    {
                        seatCodes.Add($"{row}{num}");
                    }
                }
            }
            return seatCodes;
        }
        public IActionResult ShowMovie()
        {
            var movies = new MovieViewModel
            {
                Movies = db.Movies.ToList(),
                Seats = db.Seats.ToList(),
                Moviesshowtime=db.MovieShowtimes.ToList(),

            };
                return View(movies);
        }
        [HttpGet]
        public IActionResult EditMovie(int id)
        {
            var movie = db.Movies
                .Include(m => m.MovieShowtimes) // Include related showtimes for the movie
                .FirstOrDefault(m => m.MovieId == id);

            if (movie == null)
            {
                return NotFound("Movie not found.");
            }

            // Get seats related only to the movie's showtimes
            var showtimeIds = movie.MovieShowtimes.Select(s => s.ShowtimeId).ToList();
            var seats = db.Seats.Where(seat => showtimeIds.Contains(seat.ShowTimeID)).ToList();

            var model = new MovieViewModel
            {
            Movie=movie,
                Seats = seats,
                Moviesshowtime = movie.MovieShowtimes.ToList()
            };

            return View(model);
        }

        [HttpPost]
        public IActionResult EditMovie(
     int id,
     string Title, string Description, string Poster, string Trailer,
     string Actors, string Director, string Language, string Genre,
     string Runtime, DateTime[] ShowDates, TimeSpan[] StartTimes,
     TimeSpan[] EndTimes, string SeatRange, decimal[] SeatPrices)
        {
            // Validate input arrays
            if (ShowDates.Length != StartTimes.Length ||
                StartTimes.Length != EndTimes.Length ||
                SeatPrices.Length == 0) // SeatCodes are now generated from SeatRange
            {
                ModelState.AddModelError("", "All showtime and seat arrays must have the same length.");
                return View(); // Return view with error message
            }

            // Retrieve the movie and related showtimes by ID
            var movie = db.Movies
                .Include(m => m.MovieShowtimes)
                .FirstOrDefault(m => m.MovieId == id);

            if (movie == null)
            {
                return NotFound("Movie not found.");
            }

            // Update movie properties
            movie.Title = Title;
            movie.Description = Description;
            movie.Poster = Poster;
            movie.Trailer = Trailer;
            movie.Genre = Genre;
            movie.Runtime = Runtime;
            movie.Actors = Actors;
            movie.Director = Director;
            movie.Language = Language;

            // Save movie changes
            db.SaveChanges();

            // Remove existing showtimes and seats
            var showtimeIds = movie.MovieShowtimes.Select(s => s.ShowtimeId).ToList();
            var existingSeats = db.Seats.Where(seat => showtimeIds.Contains(seat.ShowTimeID)).ToList();
            db.Seats.RemoveRange(existingSeats);
            db.MovieShowtimes.RemoveRange(movie.MovieShowtimes);
            db.SaveChanges(); // Save deletions

            // Parse seat range
            List<string> seatCodes = ParseSeatRange(SeatRange);

            // Add new showtimes and seats
            for (int i = 0; i < ShowDates.Length; i++)
            {
                var showtime = new Movieshowtime(0, movie.MovieId, ShowDates[i], StartTimes[i], EndTimes[i]);
                db.MovieShowtimes.Add(showtime);
                db.SaveChanges(); // Save to get the new ShowtimeId

                // Only proceed to add seats if the showtime was successfully saved
                if (showtime.ShowtimeId > 0) // Check if the ShowtimeId is valid
                {
                    foreach (var seatCode in seatCodes)
                    {
                        var seat = new Seats
                        {
                            ShowTimeID = showtime.ShowtimeId,
                            SeatCode = seatCode,
                            Price = SeatPrices[i] // Assuming all seats for that showtime have the same price
                        };
                        db.Seats.Add(seat);
                    }
                }
            }

            // Save all new records
            db.SaveChanges();

            return RedirectToAction("ShowMovie");
        }
        private List<string> ParseSeatRange(string seatRange)
        {
            var seats = new List<string>();

            // Split the range on the hyphen
            var rangeParts = seatRange.Split('-');

            if (rangeParts.Length != 2)
            {
                throw new ArgumentException("Invalid seat range format.");
            }

            var start = rangeParts[0].Trim();
            var end = rangeParts[1].Trim();

            // Extract the row and column from start and end
            var startRow = start[0];
            var endRow = end[0];

            var startCol = int.Parse(start.Substring(1));
            var endCol = int.Parse(end.Substring(1));

            // Loop through the rows and columns to generate seat codes
            for (char row = startRow; row <= endRow; row++)
            {
                for (int col = startCol; col <= endCol; col++)
                {
                    seats.Add($"{row}{col}");
                }
            }

            return seats;
        }





        public IActionResult DeleteMovie(int id)
        {
            // Get the associated showtimes for the movie
            var showtimes = db.MovieShowtimes.Where(s => s.MovieId == id).ToList();

            // Collect all seat IDs that belong to the showtimes
            var seatIds = new List<int>();

            foreach (var showtime in showtimes)
            {
                var seats = db.Seats.Where(seat => seat.ShowTimeID == showtime.ShowtimeId).ToList();
                seatIds.AddRange(seats.Select(seat => seat.SeatID));
            }

            // Remove seats
            var seatsToDelete = db.Seats.Where(seat => seatIds.Contains(seat.SeatID)).ToList();
            db.Seats.RemoveRange(seatsToDelete);

            // Remove showtimes
            db.MovieShowtimes.RemoveRange(showtimes);

            // Remove the movie
            var movie = db.Movies.Find(id);
            if (movie != null)
            {
                db.Movies.Remove(movie);
            }

            // Save changes to the database
            db.SaveChanges();

            // Redirect to the ShowMovie action
            return RedirectToAction("ShowMovie");
        }



        public IActionResult Showbooking()
        {
            // Retrieve all bookings from the database (or filter as needed)
            var bookings = db.Bookings
                .Include(b => b.Movie)
                .Include(b => b.Showtime)
                .Include(b => b.SeatBookings)
                .ThenInclude(sb => sb.Seat)
                .ToList();

            // Map bookings to your BookingViewModel or create a new ViewModel if needed
            var model = bookings.Select(booking => new BookingViewModel
            {
                CustomerName = booking.CustomerName,
                Email = booking.Email,
                Phone = booking.Phone,
                Movie = booking.Movie,
                Showtime = booking.Showtime,
                SelectedSeats = booking.SeatBookings.Select(sb => sb.Seat.SeatCode).ToList(),
                RandomId = booking.RandomId // Assuming you've renamed BookingReference to RandomId
            }).ToList();

            return View(model);
        }

        public IActionResult Showfeedback()
        {
            var feedback = db.Feedback.ToList();

            if (feedback == null)
            {
                // Log this or handle it as needed
                // For example, you can return an empty view or a message
                return View(new List<project.Models.FeedBack>()); // Return an empty list if null
            }

            return View(feedback);
        }
    }

}




























