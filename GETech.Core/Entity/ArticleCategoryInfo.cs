
namespace GETech.Entity
{
    public class ArticleCategoryInfo
    {
        public int CategoryId { get; set; }
        public int ParentId { get; set; }
        public int Layer { get; set; }
        public string ParentIdList { get; set; }
        public int SubCategoryCount { get; set; }
        public string CategoryName { get; set; }
        public int Sort { get; set; }
    }
}
