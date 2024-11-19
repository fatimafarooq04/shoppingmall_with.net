namespace project.Models
{
    public class BookingViewModel
    {
        // Movie information
        public Movie Movie { get; set; }

        // Showtime information
        public Movieshowtime Showtime { get; set; }

        // List of selected seat numbers
        public List<string> SelectedSeats { get; set; }

        // Dictionary to hold the prices of selected seats
        public Dictionary<string, decimal> SeatPrices { get; set; }
        public int BookingId { get; set; }
        public string CustomerName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string RandomId { get; set; }
        // Constructor
        public BookingViewModel()
        {
            // Initialize the lists and dictionaries to avoid null references
            SelectedSeats = new List<string>();
            SeatPrices = new Dictionary<string, decimal>();
        }
    }

}

