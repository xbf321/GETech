using System;
using System.Data;
using System.Data.SqlClient;

using GETech.Entity;

namespace GETech.Data
{
    public class FeedbackMange
    {
        public static int Add(FeedbackInfo model) {
            int i = 0;
            string strSQL = "INSERT INTO Feedbacks(RealName,Email,Phone,Content,Ip,CreateDateTime) VALUES(@RealName,@Email,@Phone,@Content,@Ip,GETDATE());SELECT @@IDENTITY;";
            SqlParameter[] parms = { 
                                    new SqlParameter("RealName",SqlDbType.VarChar),
                                    new SqlParameter("Email",SqlDbType.VarChar),
                                    new SqlParameter("Phone",SqlDbType.VarChar),
                                    new SqlParameter("Content",SqlDbType.VarChar),
                                    new SqlParameter("Ip",SqlDbType.VarChar)
                                   };
            parms[0].Value = Goodspeed.Common.CharHelper.Truncate(model.RealName,50);
            parms[1].Value = Goodspeed.Common.CharHelper.Truncate(model.Email,50);
            parms[2].Value = Goodspeed.Common.CharHelper.Truncate(model.Phone, 50);
            parms[3].Value = Goodspeed.Library.Char.HtmlHelper.RemoveHtml(model.Content);
            parms[4].Value = model.IP;

            if (Goodspeed.Library.Net.MailClient.ValidateMailAddress(model.Email))
            {
                i = Convert.ToInt32(Goodspeed.Library.Data.SQLPlus.ExecuteScalar(CommandType.Text, strSQL, parms));
            }

            return i;
        }
        public static void Delete(int feedbackId) {
            string strSQL = "DELETE Feedbacks WHERE ID = @Id";
            SqlParameter parm = new SqlParameter("Id",feedbackId);
            Goodspeed.Library.Data.SQLPlus.ExecuteNonQuery(CommandType.Text,strSQL,parm);
            
        }
    }
}
