using Microsoft.AspNetCore.Mvc;
using project.Models;
using Microsoft.EntityFrameworkCore;

using System.Diagnostics;


using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;


namespace project.Controllers
{
    public class HomeController : Controller
    {
        Connection db = new Connection();

        public IActionResult Index()
        {
            var floor = db.Floors.ToList();
            return View(floor);
        }

        public IActionResult Shop(int? floorid, int? categoryid)
        {
            var model = new ShopViewModel
            {
                Shops = db.Shops.ToList(),
                Categories = db.Categories.ToList(),
                Floors = db.Floors.ToList()
            };

            if (floorid.HasValue && floorid.Value > 0)
            {
                model.Shops = model.Shops.Where(s => s.FloorID == floorid.Value).ToList();
            }

            // You can add a similar condition for categoryid if needed
            if (categoryid.HasValue && categoryid.Value > 0)
            {
                model.Shops = model.Shops.Where(s => s.CategoryID == categoryid.Value).ToList();
            }

            return View(model);
        }

        public IActionResult Search(string mydata)
        {

            var data = db.Shops.Where(x => x.ShopName.Contains(mydata)).ToList();

            return Json(data);
        }
        public IActionResult ShopDetail(int id)
        {
            var data = db.Shops.Where(x => x.ShopID == id).FirstOrDefault();

            var images = db.ShopImages.Where(x => x.ShopID == id).ToList();

            ViewBag.images = images;

            return View(data);
        }
        public IActionResult FoodCourt(int? floorid, int? categoryid)
        {
            var model = new FoodShopViewModel
            {
                FoodCourtShops = db.FoodCourtShops.ToList(),
                FoodCategory = db.FoodCategory.ToList(),
                Floors = db.Floors.ToList()
            };

            if (floorid.HasValue && floorid.Value > 0)
            {
                model.FoodCourtShops = model.FoodCourtShops.Where(s => s.FloorID == floorid.Value).ToList();
            }

            // You can add a similar condition for categoryid if needed
            if (categoryid.HasValue && categoryid.Value > 0)
            {
                model.FoodCourtShops = model.FoodCourtShops.Where(s => s.FoodCategoryID == categoryid.Value).ToList();
            }

            return View(model);
        }
        public IActionResult FoodSearch(string mydata)
        {

            var data = db.FoodCourtShops.Where(x => x.ShopName.Contains(mydata)).ToList();

            return Json(data);
        }
        public IActionResult FoodShopDetail(int id)
        {
            var data = db.FoodCourtShops.Where(x => x.FoodCourtShopID == id).FirstOrDefault();

            var images = db.FoodCourtImages.Where(x => x.FoodCourtShopID == id).ToList();

            ViewBag.images = images;

            return View(data);
        }



        public IActionResult Entertainment(string selectedGenre, string selectedLanguage)
        {
            // Retrieve all movies initially
            var moviesQuery = db.Movies.AsQueryable();

            // Filter by selected genre if provided
            if (!string.IsNullOrEmpty(selectedGenre))
            {
                moviesQuery = moviesQuery.Where(m => m.Genre == selectedGenre);
            }

            // Filter by selected language if provided
            if (!string.IsNullOrEmpty(selectedLanguage))
            {
                moviesQuery = moviesQuery.Where(m => m.Language == selectedLanguage);
            }

            // Get the filtered list of movies
            var movies = moviesQuery.ToList();

            // Get distinct genres and languages for the sidebar
            var genres = db.Movies.Select(m => m.Genre).Distinct().ToList();
            var languages = db.Movies.Select(m => m.Language).Distinct().ToList();

            var viewModel = new MovieViewModel
            {
                Movies = movies,
                Genres = genres,
                Languages = languages
            };

            return View(viewModel);
        }
        public IActionResult EntertainmentDetail(int id)
        {
            var data = db.Movies
                         .Include(m => m.MovieShowtimes) // Include the Showtimes navigation property
                         .FirstOrDefault(a => a.MovieId == id);
            return View(data);
        }
        public IActionResult MovieSeat(int movieId, int? showtimeId = null)
        {
            // Fetch all movies for the dropdown
            var movies = db.Movies.ToList();

            // Get the selected movie, or default to the first one in the list if not specified
            var selectedMovie = movies.FirstOrDefault(m => m.MovieId == movieId) ?? movies.First();

            // Get showtimes related to the selected movie
            var showtimes = db.MovieShowtimes
                              .Where(s => s.MovieId == selectedMovie.MovieId)
                              .OrderBy(s => s.StartTime)
                              .ToList();

            // Select the first showtime by default if showtimeId is not provided
            var selectedShowtime = showtimeId.HasValue
                ? showtimes.FirstOrDefault(s => s.ShowtimeId == showtimeId)
                : showtimes.FirstOrDefault();

            // Fetch available seats for the selected showtime, if any
            var seats = selectedShowtime != null
                ? db.Seats.Where(s => s.ShowTimeID == selectedShowtime.ShowtimeId).ToList()
                : new List<Seats>();

            // Create the ViewModel with all movies, showtimes, and seats
            var viewModel = new MovieViewModel
            {
                Movies = movies,
                Showtimes = showtimes,
                Seats = seats,
                SelectedMovie = selectedMovie,
                SelectedShowtime = selectedShowtime
            };

            return View(viewModel);
        }

        [HttpGet]

        public JsonResult GetShowtimes(int movieId)
        {
            var currentDate = DateTime.Now.Date; // Get today's date without the time component

            var showtimes = db.MovieShowtimes
                .Where(s => s.MovieId == movieId && s.ShowDate >= currentDate)
                .Select(s => new
                {
                    ShowtimeId = s.ShowtimeId,
                    ShowDate = s.ShowDate.ToString("yyyy-MM-dd"), // Example formatting
                    StartTime = s.StartTime.ToString(@"hh\:mm"), // Example formatting
                    EndTime = s.EndTime.ToString(@"hh\:mm") // Example formatting
                }).ToList();

            return Json(showtimes);
        }



        public JsonResult GetSeats(int showtimeId)
        {
            var seats = db.Seats
                .Where(s => s.ShowTimeID == showtimeId)
                .Select(s => new
                {
                    IsBooked = s.IsBooked,
                    SeatCode = s.SeatCode, // Changed from TotalSeats to SeatCode
                    Price = s.Price
                })
                .ToList();

            return Json(seats);
        }

        [HttpGet]
        public IActionResult Book(int movieId, int showtimeId, string seats)
        {
            if (string.IsNullOrEmpty(seats))
            {
                TempData["ErrorMessage"] = "Please select at least one seat.";
                // Redirect to the same page or a previous page where the user selects the seats
                return RedirectToAction("MovieSeat", new { movieId = movieId, showtimeId = showtimeId });
            }

            // Fetch the movie details
            var movie = db.Movies.FirstOrDefault(m => m.MovieId == movieId);
            if (movie == null)
            {
                TempData["ErrorMessage"] = "Movie not found.";
                return RedirectToAction("Index"); // Adjust as necessary
            }

            // Fetch the showtime details
            var showtime = db.MovieShowtimes.FirstOrDefault(s => s.ShowtimeId == showtimeId);
            if (showtime == null)
            {
                TempData["ErrorMessage"] = "Showtime not found.";
                return RedirectToAction("Index"); // Adjust as necessary
            }

            // Split the seat codes into a list
            var selectedSeats = seats.Split(',').ToList();

            // Initialize the seat prices (Example: Fetch from DB or set statically for now)
            var seatPrices = new Dictionary<string, decimal>();

            foreach (var seat in selectedSeats)
            {
                // Assuming you have a way to fetch price per seat
                var seatPrice = db.Seats
                                  .Where(s => s.SeatCode == seat && s.ShowTimeID == showtimeId)
                                  .Select(s => s.Price)
                                  .FirstOrDefault();

                if (seatPrice > 0) // Ensure the price is valid
                {
                    seatPrices[seat] = seatPrice; // Add seat and its price
                }
                else
                {
                    seatPrices[seat] = 0; // Default price if not found (handle according to your requirements)
                }
            }

            // Create the model
            var model = new BookingViewModel
            {
                Movie = movie,
                Showtime = showtime,
                SelectedSeats = selectedSeats, // Populate selected seats
                SeatPrices = seatPrices // Populate seat prices
            };

            return View(model);
        }


        [HttpPost]
        public IActionResult Book(int movieId, int showtimeId, string seats, string name, string email, string phone)
        {
            // Validate and fetch Movie and Showtime from the database
            var movie = db.Movies.FirstOrDefault(m => m.MovieId == movieId);
            var showtime = db.MovieShowtimes.FirstOrDefault(s => s.ShowtimeId == showtimeId);

            if (movie == null || showtime == null)
            {
                ModelState.AddModelError("", "Movie or Showtime not found.");
                return View(); // Return the view with an error message
            }

            // Split the selected seats into a list
            var selectedSeats = seats.Split(',');

            // Create a new Booking object with a random ID
            var booking = new Booking
            {
                RandomId = GenerateRandomId(), // Generate a random ID
                CustomerName = name,
                Email = email,
                Phone = phone,
                MovieId = movie.MovieId,
                ShowtimeId = showtime.ShowtimeId,
                SeatBookings = new List<SeatBooking>()
            };

            // Loop through the selected seats, save them to SeatBookings, and mark them as booked
            foreach (var seatNumber in selectedSeats)
            {
                var seat = db.Seats.FirstOrDefault(s => s.SeatCode == seatNumber && s.ShowTimeID == showtimeId);

                if (seat != null)
                {
                    // Add the seat to SeatBookings
                    booking.SeatBookings.Add(new SeatBooking
                    {
                        SeatId = seat.SeatID
                    });

                    // Mark the seat as booked
                    seat.IsBooked = true;
                }
            }

            // Save the booking and update seat status in the database
            db.Bookings.Add(booking);
            db.SaveChanges();

            // Redirect to the confirmation page
            return RedirectToAction("BookingConfirmation", new { bookingId = booking.BookingId });
        }

        // Method to generate a random booking ID
        private string GenerateRandomId()
        {
            // Generate a random string of characters (for example, 8 characters long)
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = new Random();
            return new string(Enumerable.Repeat(chars, 8)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        [HttpGet]
        public IActionResult BookingConfirmation(int bookingId)
        {
            var booking = db.Bookings
                .Include(b => b.Movie)
                .Include(b => b.Showtime)
                .Include(b => b.SeatBookings)
                    .ThenInclude(sb => sb.Seat)
                .FirstOrDefault(b => b.BookingId == bookingId);

            if (booking == null) return NotFound();

            var selectedSeats = booking.SeatBookings.Select(sb => sb.Seat.SeatCode).ToList();
            var seatPrices = selectedSeats.ToDictionary(
                seat => seat,
                seat => db.Seats
                    .Where(s => s.SeatCode == seat && s.ShowTimeID == booking.ShowtimeId)
                    .Select(s => s.Price)
                    .FirstOrDefault()
            );

            // Populate the BookingViewModel
            var model = new BookingViewModel
            {
                BookingId = booking.BookingId, // Ensure you add this property to your view model
                CustomerName = booking.CustomerName, // Assuming these properties exist in your Booking table
                Email = booking.Email,
                Phone = booking.Phone,
                RandomId = booking.RandomId, // Ensure this property exists in your Booking table
                Movie = booking.Movie,
                Showtime = booking.Showtime,
                SelectedSeats = selectedSeats,
                SeatPrices = seatPrices
            };

            return View(model);
        }



        public IActionResult gallery()
        {
          

            var data = db.Gallery.ToList();
            return View(data);
        }
        public IActionResult Feedback()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Feedback(string ClientName, string Comments)
        {
            if (ModelState.IsValid)
            {
                FeedBack feed = new FeedBack(0, ClientName, Comments);
                db.Feedback.Add(feed);
                db.SaveChanges();
            }

            TempData["SuccessMessage"] = "Your comment has been submitted successfully!";
            return RedirectToAction("Feedback");
        }

    }
}


