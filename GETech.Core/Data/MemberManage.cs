using System;
using System.Data;
using System.Data.SqlClient;
using GETech.Entity;

namespace GETech.Data
{
    public class MemberManage
    {
        public static int GetUserId(string userName) {
            string strSQL = "SELECT UserId FROM Members WHERE UserName = @UserName";
            SqlParameter parm = new SqlParameter("UserName",userName);
            return Convert.ToInt32(Goodspeed.Library.Data.SQLPlus.ExecuteScalar(CommandType.Text,strSQL,parm));
        }
        public static DataRow GetUserInfo(string userName) {
            return GetUserInfo(GetUserId(userName));
        }
        public static DataRow GetUserInfo(int userId) {
            string strSQL = "SELECT * FROM Members WHERE UserId = @UserID";
            SqlParameter parm = new SqlParameter("UserId", userId);
            return Goodspeed.Library.Data.SQLPlus.ExecuteDataRow(CommandType.Text,strSQL,parm);
        }
        public static bool Validator(string userName,string userPwd) {
            string strSQL = "SELECT COUNT(*) FROM Members WHERE UserName = @UserName AND UserPwd = @UserPwd";
            SqlParameter[] parms = { 
                                    new SqlParameter("UserName",SqlDbType.VarChar),
                                    new SqlParameter("UserPwd",SqlDbType.VarChar)
                                   };
            parms[0].Value = userName;
            parms[1].Value = userPwd;
            return Convert.ToInt32(Goodspeed.Library.Data.SQLPlus.ExecuteScalar(CommandType.Text,strSQL,parms)) > 0;
        }
        [Obsolete]
        public static int Add(string userName,string userPwd,string email) {
            string strSQL = "INSERT INTO Members(UserName,UserPwd,Email,CreateDateTime,IsPass) VALUES(@UserName,@UserPwd,@Email,GETDATE(),0);SELECT @@IDENTITY;";
            SqlParameter[] parms = { 
                                    new SqlParameter("UserName",SqlDbType.VarChar),
                                    new SqlParameter("UserPwd",SqlDbType.VarChar),
                                    new SqlParameter("Email",SqlDbType.VarChar),
                                   };
            parms[0].Value = userName;
            parms[1].Value = userPwd;
            parms[2].Value = email;

            int userId = Convert.ToInt32(Goodspeed.Library.Data.SQLPlus.ExecuteScalar(CommandType.Text,strSQL,parms));
            

            return userId;
        }
        /// <summary>
        /// 2010/11/25更新，上面那个方法不用了
        /// </summary>
        /// <param name="siteMember"></param>
        /// <returns></returns>
        public static int Add(SiteMember siteMember) {
            string strSQL = "INSERT INTO Members(UserName,UserPwd,Email,CreateDateTime,IsPass,Company,Phone,RealName,Fax,InterestProduct,IsReceiveNewProductEmail) VALUES(@UserName,@UserPwd,@Email,GETDATE(),@IsPass,@Company,@Phone,@RealName,@Fax,@InterestProduct,@IsReceiveNewProductEmail);SELECT @@IDENTITY;";
            SqlParameter[] parms = { 
                                    new SqlParameter("UserName",SqlDbType.VarChar),
                                    new SqlParameter("UserPwd",SqlDbType.VarChar),
                                    new SqlParameter("Email",SqlDbType.VarChar),
                                    new SqlParameter("IsPass",SqlDbType.Int),
                                    new SqlParameter("Company",SqlDbType.VarChar),
                                    new SqlParameter("Phone",SqlDbType.VarChar),
                                    new SqlParameter("RealName",SqlDbType.VarChar),
                                    new SqlParameter("Fax",SqlDbType.VarChar),
                                    new SqlParameter("InterestProduct",SqlDbType.VarChar),
                                    new SqlParameter("IsReceiveNewProductEmail",SqlDbType.Int),
                                   };
            parms[0].Value = siteMember.UserName;
            parms[1].Value = siteMember.UserPwd;
            parms[2].Value = siteMember.Email;
            parms[3].Value = siteMember.IsPass == true ? 1 : 0;
            parms[4].Value = siteMember.Company;
            parms[5].Value = siteMember.Phone;
            parms[6].Value = siteMember.RealName;
            parms[7].Value = siteMember.Fax;
            parms[8].Value = siteMember.InterestProduct;
            parms[9].Value = siteMember.IsReceiveNewProductEmail == true ? 1 : 0;

            int userId = Convert.ToInt32(Goodspeed.Library.Data.SQLPlus.ExecuteScalar(CommandType.Text, strSQL, parms));


            return userId;
        }
        [Obsolete]
        public static int Update(int userId,string userPwd,string email,bool isPass) {
            string strSQL = "UPDATE Members SET UserPwd = @UserPwd,Email = @Email,IsPass = @IsPass WHERE UserId = @UserID";
            SqlParameter[] parms = { 
                                    new SqlParameter("UserId",SqlDbType.VarChar),
                                    new SqlParameter("UserPwd",SqlDbType.VarChar),
                                    new SqlParameter("Email",SqlDbType.VarChar),
                                    new SqlParameter("IsPass",SqlDbType.Int)
                                   };
            parms[0].Value = userId;
            parms[1].Value = userPwd;
            parms[2].Value = email;
            parms[3].Value = isPass == true ? 1 : 0;
            Goodspeed.Library.Data.SQLPlus.ExecuteNonQuery(CommandType.Text,strSQL,parms);
            return userId;
        }
        /// <summary>
        /// 2010/11/25 更新
        /// </summary>
        /// <param name="siteMember"></param>
        /// <returns></returns>
        public static int Update(SiteMember siteMember) {
            string strSQL = "UPDATE Members SET Email = @Email,Company = @Company,Phone = @Phone,RealName = @RealName,Fax = @Fax,InterestProduct = @InterestProduct,IsReceiveNewProductEmail = @IsReceiveNewProductEmail,UserPwd = @UserPwd WHERE UserId = @UserID";
            SqlParameter[] parms = { 
                                    new SqlParameter("Email",SqlDbType.VarChar),
                                    new SqlParameter("Company",SqlDbType.VarChar),
                                    new SqlParameter("Phone",SqlDbType.VarChar),
                                    new SqlParameter("RealName",SqlDbType.VarChar),
                                    new SqlParameter("Fax",SqlDbType.VarChar),
                                    new SqlParameter("InterestProduct",SqlDbType.VarChar),
                                    new SqlParameter("IsReceiveNewProductEmail",SqlDbType.Int),
                                    new SqlParameter("UserId",SqlDbType.Int),
                                    new SqlParameter("UserPwd",SqlDbType.VarChar),
                                   };
            parms[0].Value = siteMember.Email;
            parms[1].Value = siteMember.Company;
            parms[2].Value = siteMember.Phone;
            parms[3].Value = siteMember.RealName;
            parms[4].Value = siteMember.Fax;
            parms[5].Value = siteMember.InterestProduct;
            parms[6].Value = siteMember.IsReceiveNewProductEmail == true ? 1 : 0;
            parms[7].Value = siteMember.UserId;
            parms[8].Value = siteMember.UserPwd;
            Goodspeed.Library.Data.SQLPlus.ExecuteNonQuery(CommandType.Text, strSQL, parms);
            return siteMember.UserId;
        }
        public static bool Exists(string userName,string email) {
            string strSQL = "SELECT COUNT(*) FROM Members WHERE UserName = @UserName OR Email = @Email";
            SqlParameter[] parms = { 
                                    new SqlParameter("UserName",SqlDbType.VarChar),
                                    new SqlParameter("Email",SqlDbType.VarChar),
                                  };
            parms[0].Value = userName;
            parms[1].Value = email;
            return Convert.ToInt32(Goodspeed.Library.Data.SQLPlus.ExecuteScalar(CommandType.Text,strSQL,parms)) > 0;

        }
        public static bool ExistsEmail(string email)
        {
            string strSQL = "SELECT COUNT(*) FROM Members WHERE Email = @Email";
            SqlParameter[] parms = { 
                                    new SqlParameter("Email",SqlDbType.VarChar),
                                  };
            parms[0].Value = email;
            return Convert.ToInt32(Goodspeed.Library.Data.SQLPlus.ExecuteScalar(CommandType.Text, strSQL, parms)) > 0;
        }
        public static bool ExistsEmailExceptUser(string email,int userId) {
            string strSQL = "SELECT COUNT(*) FROM Members WHERE Email = @Email AND UserId <> @UserId";
            SqlParameter[] parms = { 
                                    new SqlParameter("Email",SqlDbType.VarChar),
                                    new SqlParameter("UserId",SqlDbType.Int),
                                  };
            parms[0].Value = email;
            parms[1].Value = userId;
            return Convert.ToInt32(Goodspeed.Library.Data.SQLPlus.ExecuteScalar(CommandType.Text, strSQL, parms)) > 0;
        }
        /// <summary>
        /// 找回密码
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="email"></param>
        /// <returns>-1：说明没有改用户名,0说明用户名存在，但是Email错误,1:说明正确</returns>
        public static int FindPwd(string userName,string email) {
            SqlParameter[] parms = { 
                                    new SqlParameter("UserName",SqlDbType.VarChar),
                                    new SqlParameter("Email",SqlDbType.VarChar)
                                   };
            parms[0].Value = userName;
            parms[1].Value = email;

            string strSQL = "SELECT COUNT(*) FROM Members WHERE UserName = @UserName";
            int i = Convert.ToInt32(Goodspeed.Library.Data.SQLPlus.ExecuteScalar(CommandType.Text, strSQL, parms));
            if(i == 0 ){
                return -1; //说明没有此用户名
            }
            strSQL = "SELECT COUNT(*) FROM Members WHERE UserName = @UserName AND Email = @Email";
            i = Convert.ToInt32(Goodspeed.Library.Data.SQLPlus.ExecuteScalar(CommandType.Text, strSQL, parms));
            if(i == 0){
                return 0; //说明用户名存在，但是Email错误
            }
            return 1;//说明正确


        }
       
    }
}
