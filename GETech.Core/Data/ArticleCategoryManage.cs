using System;
using System.Data.SqlClient;
using System.Data;

using GETech.Entity;

namespace GETech.Data
{
    public class ArticleCategoryManage
    {
        public static int UpdateArticleCategory(ArticleCategoryInfo model) {
            string strSQL = "UPDATE ArticleCategories SET CategoryName = @CategoryName ,Sort = @Sort WHERE CategoryId = @CategoryId";
            SqlParameter[] parms = {
                                    new SqlParameter("@CategoryId",model.CategoryId),
                                    new SqlParameter("@CategoryName",model.CategoryName),
                                    new SqlParameter("@Sort",model.Sort)
                                   };
            return Goodspeed.Library.Data.SQLPlus.ExecuteNonQuery(CommandType.Text,strSQL,parms);
        }
        public static int InsertArticleCategory(ArticleCategoryInfo model)
        {
            string strSQL = "INSERT INTO ArticleCategories(ParentId,Layer,ParentIdList,SubCategoryCount,CategoryName,Sort) VALUES(@ParentID,@Layer,@ParentIdList,@SubCategoryCount,@CategoryName,@Sort);SELECT @@IDENTITY;";
            SqlParameter[] parms = { 
                                    new SqlParameter("@ParentId",model.ParentId),
                                    new SqlParameter("@Layer",model.Layer),
                                    new SqlParameter("@ParentIdList",model.ParentIdList),
                                    new SqlParameter("@SubCategoryCount",model.SubCategoryCount),
                                    new SqlParameter("@CategoryName",model.CategoryName),
                                    new SqlParameter("@Sort",model.Sort)
                                   };
            return Convert.ToInt32(Goodspeed.Library.Data.SQLPlus.ExecuteScalar(CommandType.Text, strSQL, parms));
        }
        public static DataTable GetArticleCategoryTable()
        {
            string strSQL = "SELECT * FROM ArticleCategories ORDER BY Sort ASC";
            return Goodspeed.Library.Data.SQLPlus.ExecuteDataTable(CommandType.Text, strSQL);
        }
        public static ArticleCategoryInfo GetArticleCategoryInfo(int articleCategoryId)
        {
            string strSQL = "SELECT * FROM ArticleCategories WHERE CategoryId = @CategoryId ORDER BY Sort DESC";
            SqlParameter parm = new SqlParameter("@CategoryId", articleCategoryId);
            DataRow dr = Goodspeed.Library.Data.SQLPlus.ExecuteDataRow(CommandType.Text, strSQL, parm);
            return GetArticleCategoryInfoByDataRow(dr);

        }
        public static ArticleCategoryInfo GetArticleCategoryInfoByDataRow(DataRow dr)
        {

            ArticleCategoryInfo model = null;
            if (dr != null)
            {
                model = new ArticleCategoryInfo();
                model.CategoryId = Convert.ToInt32(dr["CategoryId"]);
                model.CategoryName = dr["CategoryName"].ToString();
                model.Layer = Convert.ToInt32(dr["Layer"]);
                model.ParentId = Convert.ToInt32(dr["ParentId"]);
                model.ParentIdList = dr["ParentIdList"].ToString();
                model.Sort = Convert.ToInt32(dr["Sort"]);
                model.SubCategoryCount = Convert.ToInt32(dr["SubCategoryCount"]);
            }
            return model;
        }
        public static DataTable GetSubCategoryListTable(int parentId)
        {
            string strSQL = "SELECT * FROM ArticleCategories WHERE ParentId = @ParentId ORDER BY Sort DESC";
            SqlParameter parm = new SqlParameter("@ParentId", parentId);
            return Goodspeed.Library.Data.SQLPlus.ExecuteDataTable(CommandType.Text, strSQL, parm);
        }
        public static bool DeleteCategory(int categoryId) {
            bool b = false;
            DataTable dt = GetSubCategoryListTable(categoryId);
            if(dt != null && dt.Rows.Count>0){
                return false;
            }
            string strSQL = string.Format("DELETE ArticleCategories WHERE CategoryId = {0} ",categoryId);
            Goodspeed.Library.Data.SQLPlus.ExecuteNonQuery(CommandType.Text,strSQL);
            
            return true;
        }
        public static void UpdateSubCategoryCount(int articleCategoryId)
        {
            string strSQL = "UPDATE ArticleCategories SET SubCategoryCount = SubCategoryCount + 1 WHERE CategoryId = @CategoryId";
            SqlParameter parm = new SqlParameter("@CategoryId", articleCategoryId);
            Goodspeed.Library.Data.SQLPlus.ExecuteNonQuery(CommandType.Text, strSQL, parm);
        }
    }
}
