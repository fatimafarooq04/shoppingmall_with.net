using project.Models;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace project.Models
{
    public class Movieshowtime
    {
        [Key]
        public int ShowtimeId { get; set; }

        [ForeignKey("Movie")]
        public int MovieId { get; set; }

        [Required]
        public DateTime ShowDate { get; set; }

        [Required]
        public TimeSpan StartTime { get; set; }

        [Required]
        public TimeSpan EndTime { get; set; }


        // Navigation property for Movie
        public Movie Movie { get; set; }
        public ICollection<Seats> Seats { get; set; }
        public Movieshowtime(int showtimeId, int movieId, DateTime showDate, TimeSpan startTime, TimeSpan endTime)
        {
            ShowtimeId = showtimeId;
            MovieId = movieId;
            ShowDate = showDate;
            StartTime = startTime;
            EndTime = endTime;
        }
    }
}
