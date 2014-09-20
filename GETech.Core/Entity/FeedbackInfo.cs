using System;

namespace GETech.Entity
{
    public class FeedbackInfo
    {
        public int Id { get; set; }
        public string RealName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Content { get; set; }
        public string IP { get; set; }
        public DateTime CreateDateTime { get; set; }
    }
}
