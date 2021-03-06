﻿using System;
using System.Data.SqlClient;
using System.Data;

using GETech.Entity;


namespace GETech.Data
{
    public class ProductCategoryManage
    {
        public static int Update(ProductCategoryInfo model)
        {
            string strSQL = "UPDATE ProductCategories SET CategoryName = @CategoryName ,Sort = @Sort,[Content] = @Content,LinkUrl = @LinkUrl WHERE CategoryId = @CategoryId";
            SqlParameter[] parms = {
                                    new SqlParameter("@CategoryId",model.CategoryId),
                                    new SqlParameter("@CategoryName",model.CategoryName),
                                    new SqlParameter("@Sort",model.Sort),
                                    new SqlParameter("@Content",model.Content),
                                    new SqlParameter("@LinkUrl",model.LinkUrl)
                                   };
            return Goodspeed.Library.Data.SQLPlus.ExecuteNonQuery(CommandType.Text, strSQL, parms);
        }
        public static int Insert(ProductCategoryInfo model)
        {
            string strSQL = "INSERT INTO ProductCategories(ParentId,Layer,ParentIdList,SubCategoryCount,CategoryName,Sort,[Content],LinkUrl) VALUES(@ParentID,@Layer,@ParentIdList,@SubCategoryCount,@CategoryName,@Sort,@Content,@LinkUrl);SELECT @@IDENTITY;";
            SqlParameter[] parms = { 
                                    new SqlParameter("@ParentId",model.ParentId),
                                    new SqlParameter("@Layer",model.Layer),
                                    new SqlParameter("@ParentIdList",model.ParentIdList),
                                    new SqlParameter("@SubCategoryCount",model.SubCategoryCount),
                                    new SqlParameter("@CategoryName",model.CategoryName),
                                    new SqlParameter("@Sort",model.Sort),
                                    new SqlParameter("@Content",model.Content),
                                    new SqlParameter("@LinkUrl",model.LinkUrl)
                                   };
            return Convert.ToInt32(Goodspeed.Library.Data.SQLPlus.ExecuteScalar(CommandType.Text, strSQL, parms));
        }
        public static DataTable GetCategoryForTable()
        {
            string strSQL = "SELECT * FROM ProductCategories ORDER BY Sort ASC";
            return Goodspeed.Library.Data.SQLPlus.ExecuteDataTable(CommandType.Text, strSQL);
        }
        public static ProductCategoryInfo GetCategoryInfo(int categoryId)
        {
            string strSQL = "SELECT * FROM ProductCategories WHERE CategoryId = @CategoryId";
            SqlParameter parm = new SqlParameter("@CategoryId", categoryId);
            DataRow dr = Goodspeed.Library.Data.SQLPlus.ExecuteDataRow(CommandType.Text, strSQL, parm);
            return GetCategoryInfoByDataRow(dr);

        }
        public static ProductCategoryInfo GetCategoryInfoByDataRow(DataRow dr)
        {

            ProductCategoryInfo model = null;
            if (dr != null)
            {
                model = new ProductCategoryInfo();
                model.CategoryId = Convert.ToInt32(dr["CategoryId"]);
                model.CategoryName = dr["CategoryName"].ToString();
                model.Layer = Convert.ToInt32(dr["Layer"]);
                model.ParentId = Convert.ToInt32(dr["ParentId"]);
                model.ParentIdList = dr["ParentIdList"].ToString();
                model.Sort = Convert.ToInt32(dr["Sort"]);
                model.SubCategoryCount = Convert.ToInt32(dr["SubCategoryCount"]);
                model.Content = dr["Content"].ToString();
                model.LinkUrl = dr["LinkUrl"].ToString();
            }
            return model;
        }
        public static DataTable GetSubCategoryListTable(int parentId)
        {
            string strSQL = "SELECT * FROM ProductCategories WHERE ParentId = @ParentId ORDER BY Sort ASC";
            SqlParameter parm = new SqlParameter("@ParentId", parentId);
            return Goodspeed.Library.Data.SQLPlus.ExecuteDataTable(CommandType.Text, strSQL, parm);
        }
        public static bool Delete(int categoryId)
        {
            DataTable dt = GetSubCategoryListTable(categoryId);
            if (dt != null && dt.Rows.Count > 0)
            {
                return false;
            }
            string strSQL = string.Format("DELETE ProductCategories WHERE CategoryId = {0} ", categoryId);
            Goodspeed.Library.Data.SQLPlus.ExecuteNonQuery(CommandType.Text, strSQL);

            return true;
        }
        public static void UpdateSubCategoryCount(int categoryId)
        {
            string strSQL = "UPDATE ProductCategories SET SubCategoryCount = SubCategoryCount + 1 WHERE CategoryId = @CategoryId";
            SqlParameter parm = new SqlParameter("@CategoryId", categoryId);
            Goodspeed.Library.Data.SQLPlus.ExecuteNonQuery(CommandType.Text, strSQL, parm);
        }
    }
}
