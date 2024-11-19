namespace project.Models
{
    public class SeatBooking
    {
        public int SeatBookingId { get; set; }

        // Foreign Keys
        public int BookingId { get; set; }
        public Booking Booking { get; set; }

        public int SeatId { get; set; }
        public Seats Seat { get; set; }
    }

}
