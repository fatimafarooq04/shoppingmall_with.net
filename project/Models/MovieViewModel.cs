using project.Models;

namespace project.Models
{
	public class MovieViewModel
	{
        public List<Movie> Movies { get; set; }
        public List<string> Genres { get; set; }
        public List<string> Languages { get; set; }
        public List<Movieshowtime> Showtimes { get; set; }
        public List<Seats> Seats { get; set; }
        public Movie SelectedMovie { get; set; }
        public Movieshowtime SelectedShowtime { get; set; }

        public Movie Movie { get; set; }
     
        public List<string> Price { get; set; }


        public List<Movieshowtime> Moviesshowtime { get; set; }




    }
}
