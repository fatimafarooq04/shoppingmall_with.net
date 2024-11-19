namespace project.Models
{
    public class Booking
    {
        public int BookingId { get; set; }
        public string RandomId { get; set; }
        // Customer Info
        public string CustomerName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }

        // Foreign Keys
        public int MovieId { get; set; }
        public Movie Movie { get; set; }

        public int ShowtimeId { get; set; }
        public Movieshowtime Showtime { get; set; }

        // Navigation Property for Seats
        public List<SeatBooking> SeatBookings { get; set; }
    }

}
