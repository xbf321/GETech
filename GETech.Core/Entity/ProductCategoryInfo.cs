
namespace GETech.Entity
{
    public class ProductCategoryInfo
    {
        public int CategoryId { get; set; }
        public int ParentId { get; set; }
        public int Layer { get; set; }
        public string ParentIdList { get; set; }
        public int SubCategoryCount { get; set; }
        public string CategoryName { get; set; }
        public int Sort { get; set; }
        public string Content { get; set; }

        /// <summary>
        /// 快速链接
        /// </summary>
        public string LinkUrl { get; set; }
    }
}
