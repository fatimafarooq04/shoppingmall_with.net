using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class Movie
    {
        [Key]
        public int MovieId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime? ReleaseDate { get; set; }
        public string Language { get; set; }
        public string Director { get; set; }
		public string Runtime { get; set; }
		public string Genre { get; set; }
		public string Actors { get; set; }
        public string Poster { get; set; }
        public string Trailer { get; set; }
        public virtual ICollection<Movieshowtime> MovieShowtimes { get; set; } = new List<Movieshowtime>();
    }
}
