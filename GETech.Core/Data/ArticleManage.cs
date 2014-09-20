using System;
using System.Data;
using System.Data.SqlClient;

using GETech.Entity;

namespace GETech.Data
{
    public class ArticleManage
    {
        public static int Update(ArticleInfo model) {
            string strSQL = string.Empty;
            SqlParameter[] parms = { 
                                    new SqlParameter("ArticleId",SqlDbType.Int),
                                    new SqlParameter("GUID",SqlDbType.VarChar),
                                    new SqlParameter("CategoryId",SqlDbType.Int),
                                    new SqlParameter("Title",SqlDbType.VarChar),
                                    new SqlParameter("Content",SqlDbType.VarChar),
                                    new SqlParameter("PublishDate",SqlDbType.DateTime),
                                    new SqlParameter("Sort",SqlDbType.Int),
                                    new SqlParameter("Url",SqlDbType.VarChar),
                                    new SqlParameter("LinkUrl",SqlDbType.VarChar),
                                    new SqlParameter("ImageUrl",SqlDbType.VarChar),
                                    new SqlParameter("Introduction",SqlDbType.VarChar)
                                   };
            parms[0].Value = model.ArticleId;
            parms[1].Value = model.GUID;
            parms[2].Value = model.CategoryId;
            parms[3].Value = model.Title;
            parms[4].Value = model.Content;
            parms[5].Value = model.PublishDate;
            parms[6].Value = model.Sort;
            parms[7].Value = model.Url;
            parms[8].Value = model.LinkUrl;
            parms[9].Value = model.ImageUrl;
            parms[10].Value = model.Introduction;
            if (model.ArticleId == 0)
            {
                //Add
                strSQL = "INSERT INTO Articles([GUID],CategoryId,Title,Content,PublishDate,CreateDateTime,Sort,ViewCount,Url,LinkUrl,ImageUrl,Introduction) VALUES(@GUID,@CategoryId,@Title,@Content,@PublishDate,GETDATE(),0,0,@Url,@LinkUrl,@ImageUrl,@Introduction);SELECT @@IDENTITY;";
                model.ArticleId = Convert.ToInt32(Goodspeed.Library.Data.SQLPlus.ExecuteScalar(CommandType.Text,strSQL,parms));

            }
            else { 
                //Update
                strSQL = "UPDATE Articles SET CategoryId = @CategoryId,Title = @Title,Content = @Content,PublishDate = @PublishDate,Sort = @Sort,LinkUrl = @LinkUrl,ImageUrl = @ImageUrl,Introduction = @Introduction WHERE ArticleId = @ArticleId";
                Goodspeed.Library.Data.SQLPlus.ExecuteNonQuery(CommandType.Text,strSQL,parms);
            }
            return model.ArticleId;
        }
        public static ArticleInfo GetArticleInfoByArticleId(int articleId) {
            string strSQL = string.Format("SELECT * FROM Articles WHERE ArticleId = {0}", articleId);
            DataRow dr = Goodspeed.Library.Data.SQLPlus.ExecuteDataRow(CommandType.Text,strSQL);
            return GetArticleInfoByDataRow(dr);
        }
        public static int Delete(int articleId) {
            string strSQL = string.Format("DELETE Articles WHERE ArticleId = {0}",articleId);
            return Goodspeed.Library.Data.SQLPlus.ExecuteNonQuery(CommandType.Text,strSQL);
        }
        public static ArticleInfo GetArticleInfoByGUID(string guid) {
            string strSQL = "SELECT * FROM Articles WHERE Guid = @Guid";
            SqlParameter parm = new SqlParameter("Guid",guid);
            DataRow dr = Goodspeed.Library.Data.SQLPlus.ExecuteDataRow(CommandType.Text,strSQL,parm);
            return GetArticleInfoByDataRow(dr);
        }
        public static ArticleInfo GetArticleInfoByDataRow(DataRow dr) {
            ArticleInfo model = null;
            if(dr != null){
                model = new ArticleInfo();
                model.CategoryId = Convert.ToInt32(dr["CategoryId"]);
                model.Content = dr["Content"].ToString();
                model.ArticleId = Convert.ToInt32(dr["ArticleId"]);
                model.CreateDateTime = Convert.ToDateTime(dr["CreateDateTime"]);
                model.GUID = dr["Guid"].ToString();
                model.PublishDate = Convert.ToDateTime(dr["PublishDate"]);
                model.Sort = Convert.ToInt32(dr["Sort"]);
                model.Title = dr["Title"].ToString();
                model.ViewCount = Convert.ToInt32(dr["ViewCount"]);
                model.Url = dr["Url"].ToString();
                model.LinkUrl = dr["LinkUrl"].ToString();
                model.ImageUrl = dr["ImageUrl"].ToString();
                model.Introduction = dr["Introduction"].ToString();
            }
            return model;
        }
    }
}
