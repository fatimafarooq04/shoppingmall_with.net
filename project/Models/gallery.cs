namespace project.Models
{
    public class gallery

    {
        public int GalleryID { get; set; }

        public string ImageURL { get; set; }

        public gallery(int galleryID, string imageURL)
        {
            GalleryID = galleryID;
            ImageURL = imageURL;
        }
    }
}
