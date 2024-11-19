using project.Models;
using Microsoft.EntityFrameworkCore;

namespace project.Models
{
  public class Connection : DbContext
  {
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
      base.OnConfiguring(optionsBuilder);
      optionsBuilder.UseSqlServer("Server=DESKTOP-16PTMFU\\SQLEXPRESS;Database=ABCD_Mall;Integrated Security=True;");
    }
        public DbSet<User>Users {  get; set; }
        public DbSet <Role> Roles { get; set; } 
        public DbSet<Floors> Floors { get; set; }

        public DbSet<Category>Categories { get; set; }
        public DbSet<Shop> Shops { get; set; }
        public DbSet<Shopimages> ShopImages { get; set; }


        public DbSet<Foodcategory> FoodCategory { get; set; }
        public DbSet<foodshop> FoodCourtShops { get; set; }
        public DbSet<foodshopimages> FoodCourtImages { get; set; }
        public DbSet<gallery> Gallery { get; set; }

        public DbSet<Movie> Movies { get; set; }
        public DbSet<Movieshowtime> MovieShowtimes { get; set; }
        public DbSet<Seats> Seats { get; set; }
        public DbSet<Booking> Bookings { get; set; }
        public DbSet<SeatBooking> SeatBookings { get; set; }
        public DbSet<FeedBack> Feedback { get; set; }






    }
}
