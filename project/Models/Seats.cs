using project.Models;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace project.Models
{
    public class Seats
    {
        [Key]
        public int SeatID { get; set; }            
        public int ShowTimeID { get; set; }      
        public string SeatCode { get; set; }
        public bool IsBooked { get; set; } = false;
        public decimal Price { get; set; }
        [ForeignKey("ShowTimeID")]
        public Movieshowtime Movieshowtime { get; set; }

    
    }
}
