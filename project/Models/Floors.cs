using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class Floors
    {
        [Key]
        public int FloorID { get; set; }

        [Required(ErrorMessage = "Floor number is required.")]
        [Range(1, 10, ErrorMessage = "Floor number must be between 1 and 10.")]
        public int FloorNumber { get; set; }

        [StringLength(250, ErrorMessage = "Description cannot exceed 250 characters.")]
        public string Description { get; set; }

        public ICollection<Shop> Shops { get; set; }

        // Parameterless constructor for model binding
        public Floors() { }

        // Constructor with parameters
        public Floors(int floorID, int floorNumber, string description)
        {
            FloorID = floorID;
            FloorNumber = floorNumber;
            Description = description;
        }
    }
}
