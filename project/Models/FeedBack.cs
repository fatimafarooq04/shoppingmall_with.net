using System.ComponentModel.DataAnnotations;

namespace project.Models
{
    public class FeedBack
    {
        public int FeedbackID { get; set; }
        [Required]
        public string ClientName { get; set; }
        [Required]
        public string Comments { get; set; }

        public FeedBack(int feedbackID, string clientName, string comments)
        {
            FeedbackID = feedbackID;
            ClientName = clientName;
            Comments = comments;
        }
    }
}
