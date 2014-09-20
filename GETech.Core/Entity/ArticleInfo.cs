using System;

namespace GETech.Entity
{
    public class ArticleInfo
    {
        public int ArticleId { get; set; }

        public string GUID { get; set; }

        public int CategoryId { get; set; }

        public string Title { get; set; }

        public string Content { get; set; }

        
        public DateTime PublishDate { get; set; }

        public DateTime CreateDateTime { get; set; }

        public int Sort { get; set; }

        public int ViewCount { get; set; }
        public string Url { get; set; }

        public string ImageUrl { get; set; }
        public string LinkUrl { get; set; }
        public string Introduction { get; set; }
    }
}
