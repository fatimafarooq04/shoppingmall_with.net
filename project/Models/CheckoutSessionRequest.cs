namespace project.Models
{
    public class CheckoutSessionRequest
    {
        public int MovieId { get; set; }
        public int ShowtimeId { get; set; }
        public string Seats { get; set; }
    }
}
