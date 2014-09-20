using System;
using System.Data;
using GETech.Data;

using Goodspeed.Library.Reflection;

namespace GETech.Entity
{
    public class SiteMember
    {
        [Column("UserId")]
        public int UserId { get; set; }
        [Column("UserName")]
        public string UserName { get; set; }
        [Column("UserPwd")]
        public string UserPwd { get; set; }
        [Column("Email")]
        public string Email { get; set; }
        [Column("Company")]
        public string Company { get; set; }
        [Column("Phone")]
        public string Phone { get; set; }
        [Column("RealName")]
        public string RealName { get; set; }
        [Column("Fax")]
        public string Fax { get; set; }
        [Column("InterestProduct")]
        public string InterestProduct { get; set; }
        [Column("IsReceiveNewProductEmail")]
        public bool IsReceiveNewProductEmail { get; set; }
        [Column("IsPass")]
        public bool IsPass { get; set; }
        [Column("CreateDateTime")]
        public DateTime CreateDateTime { get; set; }

        public SiteMember() { }
        public SiteMember(int userId) {
            DataRow dr = MemberManage.GetUserInfo(userId);

            if (dr != null)
            {
                FillHelper.Fill(dr, this);
            }
        }
        public SiteMember(string userName) { 
            if (string.IsNullOrEmpty(userName) == true) 
                   throw new ArgumentException("loginName is null or empty");
            DataRow dr = MemberManage.GetUserInfo(userName);

            if (dr != null)
            {
                FillHelper.Fill(dr, this);
            }
        }
        public bool Exists(string userName,string email){
            return MemberManage.Exists(userName,email);
        }
        public bool ExistsEmail(string email) {
            return MemberManage.ExistsEmail(email);   
        }
        public int Update(){
            if(this.UserId == 0){
                //Add
                this.UserId = MemberManage.Add(this);
            }else{
                //Update
                MemberManage.Update(this);
            }
            return this.UserId;
        }
        
    }
}
