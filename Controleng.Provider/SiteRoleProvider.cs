using System;
using System.Web;
using System.Data;
using System.Text;
using System.Web.Security;
using System.Data.SqlClient;
using System.Configuration.Provider;
using System.Collections.Specialized;

using Goodspeed.Library.Data;

namespace Controleng.Core.Provider
{
    #region = SiteRoleProvider =
    /// <summary>
    /// Summary description for MembershipProvider
    /// </summary>
    public class SiteRoleProvider : System.Web.Security.RoleProvider
    {
        #region - ApplicationName -
        private string _AppName;

        public override string ApplicationName
        {
            get { return _AppName; }
            set
            {
                if (_AppName != value)
                {
                    _AppName = value;
                }
            }
        }
        #endregion

        public SiteRoleProvider() { }

        #region = Initialize =
        public override void Initialize(string name, NameValueCollection config)
        {
            if (config == null)
                throw new ArgumentNullException("config");
            if (String.IsNullOrEmpty(name))
                name = "SiteRoleProvider";
            if (string.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", "Role Provider for our site");
            }

            base.Initialize(name, config);

            _AppName = config["applicationName"];
            if (string.IsNullOrEmpty(_AppName))
                _AppName = SecUtility.GetDefaultAppName();

            if (_AppName.Length > 255)
            {
                throw new ProviderException("Provider application name too long, max is 255.");
            }

            config.Remove("connectionStringName");
            config.Remove("applicationName");
            config.Remove("description");
            if (config.Count > 0)
            {
                string attribUnrecognized = config.GetKey(0);
                if (!String.IsNullOrEmpty(attribUnrecognized))
                    throw new ProviderException("Provider unrecognized attribute: " + attribUnrecognized);
            }
        }
        #endregion

        #region = IsUserInRole =
        public override bool IsUserInRole(string username, string roleName)
        {
            string cachekey = "IsUserInRole_" + username + "_" + roleName;
            if (HttpContext.Current.Cache[cachekey] == null)
            {
                SecUtility.CheckParameter(ref username, true, false, true, 255, "username");
                if (username.Length < 1)
                    return false;
                SecUtility.CheckParameter(ref roleName, true, true, true, 255, "roleName");

                #region - T-SQL -
                StringBuilder strSQL = new StringBuilder();
                strSQL.Append(" SELECT COUNT(*) FROM Members");
                strSQL.Append(" WHERE EXISTS");
                strSQL.Append(" 	(");
                strSQL.Append(" 	    SELECT * FROM MembersInRoles");
                strSQL.Append(" 	    WHERE MembersInRoles.UserId = Members.UserId");
                strSQL.Append(" 	    AND EXISTS");
                strSQL.Append(" 		(");
                strSQL.Append(" 		    SELECT * FROM SiteRoles");
                strSQL.Append(" 		    WHERE SiteRoles.id = MembersInRoles.RoleId");
                strSQL.Append(" 		    AND SiteRoles.RoleName = @RoleName");
                strSQL.Append(" 		)");
                strSQL.Append(" 	)");
                strSQL.Append(" AND UserName = @UserName");

                SqlParameter[] parms = new SqlParameter[] {
                new SqlParameter("@username",SqlDbType.VarChar,20),
                new SqlParameter("@rolename",SqlDbType.VarChar,50)
            };
                parms[0].Value = username;
                parms[1].Value = roleName;
                #endregion

                bool b = (SQLPlus.ExecuteScalar(CommandType.Text, strSQL.ToString(), parms).ToString() != "0");

                CacheInsert(cachekey, b);

                return b;
            }

            return Convert.ToBoolean(HttpContext.Current.Cache[cachekey]);
        }
        #endregion

        #region = GetRolesForUser =
        public override string[] GetRolesForUser(string username)
        {
            string cachekey = "GetRolesForUser_" + username;

            //if (HttpContext.Current.Cache[cachekey] == null)
            {
                SecUtility.CheckParameter(ref username, true, false, true, 255, "username");
                if (username.Length < 1)
                    return new string[0];

                #region  - T-SQL -
                StringBuilder strSQL = new StringBuilder();
                strSQL.Append(" SELECT * FROM SiteRoles");
                strSQL.Append(" WHERE EXISTS(");
                strSQL.Append("     SELECT * FROM MembersInRoles");
                strSQL.Append("     WHERE EXISTS(");
                strSQL.Append("         SELECT * FROM Members");
                strSQL.Append("         WHERE Members.UserId = MembersInRoles.UserId");
                strSQL.Append("         AND Members.UserName = @UserName");
                strSQL.Append("     ) AND SiteRoles.id = MembersInRoles.RoleId");
                strSQL.Append(" )");

                SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter("@username",SqlDbType.VarChar,20)
                };
                parms[0].Value = username;
                #endregion

                DataTable oTable = SQLPlus.ExecuteDataTable(CommandType.Text, strSQL.ToString(), parms);

                StringCollection sc = new StringCollection();
                string[] strReturn;
                foreach (DataRow r in oTable.Rows)
                {
                    sc.Add(r["RoleName"].ToString().Trim());
                }

                strReturn = new string[sc.Count];

                sc.CopyTo(strReturn, 0);

                return strReturn;
            }

        }
        #endregion

        #region = CreateRole =
        public override void CreateRole(string roleName)
        {
            SecUtility.CheckParameter(ref roleName, true, true, true, 255, "roleName");

            string strSQL = "INSERT INTO dbo.SiteRole([RoleName]) SELECT @rolename WHERE NOT EXISTS(SELECT * FROM dbo.SiteRole WHERE RoleName=@rolename);";

            SqlParameter[] parms = new SqlParameter[] {
                new SqlParameter("@rolename",SqlDbType.VarChar,50)
            };

            parms[0].Value = roleName;

            SQLPlus.ExecuteNonQuery(CommandType.Text, strSQL, parms);
        }
        #endregion

        #region = DeleteRole =
        /// <summary>
        /// 删除角色
        /// </summary>
        /// <param name="roleName"></param>
        /// <param name="throwOnPopulatedRole">是否确认用户</param>
        /// <returns></returns>
        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            SecUtility.CheckParameter(ref roleName, true, true, true, 255, "roleName");

            StringBuilder strSQL = new StringBuilder();
            SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter("@rolename",SqlDbType.VarChar,50)
            };
            parms[0].Value = roleName;
            if (throwOnPopulatedRole == true)
            {
                #region - T-SQL -
                strSQL.Append(" SELECT COUNT(u.ID) FROM dbo.SiteRole AS r");
                strSQL.Append(" INNER JOIN dbo.Tech2Type AS t ON r.id = t.TechId");
                strSQL.Append(" INNER JOIN dbo.v_User2ID AS u ON u.id = t.TypeId");
                strSQL.Append(" WHERE r.RoleName = @rolename");
                strSQL.Append(" AND t.[Type] = 'UsersInRoles'");


                #endregion

                int i = Convert.ToInt32(SQLPlus.ExecuteScalar(CommandType.Text, strSQL.ToString(), parms));

                if (i > 0)
                {
                    throw new ProviderException("Role is not empty");
                }
            }
            strSQL = new StringBuilder("DELETE FROM dbo.SiteRole WHERE RoleName = @rolename;");

            int j = Convert.ToInt32(SQLPlus.ExecuteNonQuery(CommandType.Text, strSQL.ToString(), parms));

            return (j == 1);
        }
        #endregion

        #region = RoleExists =
        public override bool RoleExists(string roleName)
        {
            try
            {
                SecUtility.CheckParameter(ref roleName, true, true, true, 255, "roleName");
            }
            catch
            {
                return false;
            }

            StringBuilder strSQL = new StringBuilder("SELECT COUNT(id) FROM dbo.SiteRole WHERE RoleName = @rolename;");

            SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter("@rolename",SqlDbType.VarChar,50)
            };
            parms[0].Value = roleName;

            return (SQLPlus.ExecuteScalar(CommandType.Text, strSQL.ToString(), parms).ToString() != "0");
        }
        #endregion

        #region = AddUsersToRoles =
        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            SecUtility.CheckArrayParameter(ref roleNames, true, true, true, 255, "roleNames");
            SecUtility.CheckArrayParameter(ref usernames, true, true, true, 255, "usernames");

            #region - T-SQL -
            StringBuilder strSQL = new StringBuilder(BuildTable(usernames, roleNames));
            strSQL.Append(" INSERT INTO MembersInRoles(RoleId,UserId)");
            strSQL.Append(" SELECT r.id,u.UserId FROM @t AS t");
            strSQL.Append(" INNER JOIN dbo.SiteRoles AS r ON t.rolename = r.RoleName");
            strSQL.Append(" INNER JOIN dbo.Members AS u ON u.Username= t.username");
            strSQL.Append(" WHERE NOT EXISTS");
            strSQL.Append(" (");
            strSQL.Append(" 	SELECT * FROM dbo.MembersInRoles AS t2");
            strSQL.Append(" 	INNER JOIN dbo.SiteRoles AS r1 ON r1.id = t2.RoleId");
            strSQL.Append(" 	WHERE u.UserId = t2.UserId");
            strSQL.Append(" 	AND r1.GroupName = r.GroupName");
            strSQL.Append(" )");
            #endregion

            SQLPlus.ExecuteNonQuery(CommandType.Text, strSQL.ToString());
        }
        #endregion

        #region = RemoveUsersFromRoles =
        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            SecUtility.CheckArrayParameter(ref roleNames, true, true, true, 255, "roleNames");
            SecUtility.CheckArrayParameter(ref usernames, true, true, true, 255, "usernames");

            #region - T-SQL -
            StringBuilder strSQL = new StringBuilder(BuildTable(usernames, roleNames));
            strSQL.Append(" DELETE dbo.Tech2Type");
            strSQL.Append(" FROM @t AS t");
            strSQL.Append(" INNER JOIN dbo.SiteRole AS r ON t.rolename = r.RoleName");
            strSQL.Append(" INNER JOIN dbo.v_User2ID AS u ON u.Username= t.username");
            strSQL.Append(" INNER JOIN dbo.Tech2Type AS t2 ON r.id = t2.TechId AND u.id = t2.TypeId");
            strSQL.Append(" WHERE t2.[Type] = 'UsersInRoles'");
            #endregion

            SQLPlus.ExecuteNonQuery(CommandType.Text, strSQL.ToString());
        }
        #endregion

        #region = GetUsersInRole =
        public override string[] GetUsersInRole(string roleName)
        {
            SecUtility.CheckParameter(ref roleName, true, true, true, 255, "roleName");

            #region  - T-SQL -
            StringBuilder strSQL = new StringBuilder();
            strSQL.Append(" SELECT u.Username FROM dbo.SiteRole AS r");
            strSQL.Append(" INNER JOIN dbo.Tech2Type AS t ON r.id = t.TechId");
            strSQL.Append(" INNER JOIN dbo.v_User2ID AS u ON u.id = t.TypeId");
            strSQL.Append(" WHERE r.RoleName = @rolename;");
            strSQL.Append(" AND t.[Type] = 'UsersInRoles'");
            SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter("@rolename",SqlDbType.VarChar,50)
            };
            parms[0].Value = roleName;
            #endregion

            DataTable oTable = SQLPlus.ExecuteDataTable(CommandType.Text, strSQL.ToString(), parms);

            StringCollection sc = new StringCollection();
            String[] strReturn;

            foreach (DataRow r in oTable.Rows)
            {
                sc.Add(r[0].ToString().Trim());
            }

            strReturn = new String[sc.Count];
            sc.CopyTo(strReturn, 0);
            return strReturn;
        }
        #endregion

        #region = FindUsersInRole =
        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            SecUtility.CheckParameter(ref roleName, true, true, true, 255, "roleName");
            SecUtility.CheckParameter(ref usernameToMatch, true, true, false, 255, "usernameToMatch");



            #region  - T-SQL -
            StringBuilder strSQL = new StringBuilder();
            strSQL.Append(" SELECT u.Username FROM dbo.SiteRole AS r");
            strSQL.Append(" INNER JOIN dbo.Tech2Type AS t ON r.id = t.TechId");
            strSQL.Append(" INNER JOIN dbo.v_User2ID AS u ON u.id = t.TypeId");
            strSQL.Append(" WHERE r.RoleName = @rolename");
            strSQL.Append(" AND u.Username LIKE @UserNameToMatch+'%'");
            strSQL.Append(" AND t.[Type] = 'UsersInRoles'");
            SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter("@rolename",SqlDbType.VarChar,50),
                new SqlParameter("@UserNameToMatch",SqlDbType.VarChar,20)
            };
            parms[0].Value = roleName;
            parms[1].Value = usernameToMatch;
            #endregion

            DataTable oTable = SQLPlus.ExecuteDataTable(CommandType.Text, strSQL.ToString(), parms);

            return DataTable2Array(oTable);
        }
        #endregion

        #region = GetAllRoles =
        public override string[] GetAllRoles()
        {
            string strSQL = "SELECT RoleName FROM dbo.SiteRoles";

            DataTable oTable = SQLPlus.ExecuteDataTable(CommandType.Text, strSQL);

            return DataTable2Array(oTable);
        }
        #endregion

        #region - BuildTable -
        private string BuildTable(string[] usernames, string[] roleNames)
        {
            StringBuilder strTable = new StringBuilder("DECLARE @t table(rolename varchar(50),username varchar(20));");
            foreach (string rolename in roleNames)
            {
                foreach (string username in usernames)
                {
                    strTable.AppendFormat(" INSERT INTO @t SELECT '{0}','{1}';", rolename, username);
                }
            }

            return strTable.ToString();
        }
        #endregion

        #region - DataTable2Array -
        private string[] DataTable2Array(DataTable oTable)
        {
            StringCollection sc = new StringCollection();

            foreach (DataRow r in oTable.Rows)
            {
                sc.Add(r[0].ToString().Trim());
            }


            string[] allUsers = new string[sc.Count];
            sc.CopyTo(allUsers, 0);
            return allUsers;
        }
        #endregion

        #region = RoleChineseName =
        public static string RoleChineseName(string roleName)
        {
            string cachekey = "RoleChineseName_" + roleName;

            if (HttpContext.Current.Cache[cachekey] == null)
            {
                string strSQL = "SELECT RoleChineseName FROM dbo.SiteRole WHERE RoleName=@rolename";

                SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter("@rolename",SqlDbType.VarChar,50)
                };
                parms[0].Value = roleName;

                string s = SQLPlus.ExecuteScalar(CommandType.Text, strSQL, parms).ToString();

                CacheInsert(cachekey, s);

                return s;
            }

            return HttpContext.Current.Cache[cachekey].ToString();
        }
        #endregion

        #region = GetRolesChineseNameForUser =
        public static string GetRolesChineseNameForUser(string username)
        {
            string cachekey = "GetRolesChineseNameForUser" + username;
            if (HttpContext.Current.Cache[cachekey] == null)
            {
                if (string.IsNullOrEmpty(username) == true)
                {
                    return string.Empty;
                }
                StringBuilder strResult = new StringBuilder();
                foreach (string rolename in Roles.GetRolesForUser(username))
                {
                    strResult.Append(SiteRoleProvider.RoleChineseName(rolename) + " ");
                }
                string s = strResult.ToString().TrimEnd();

                CacheInsert(cachekey, s);

                return s;
            }

            return HttpContext.Current.Cache[cachekey].ToString();
        }
        #endregion

        #region = GetRoleID =
        public static int GetRoleID(string roleName)
        {
            string strSQL = "SELECT ID FROM dbo.SiteRole WHERE RoleName=@rolename UNION SELECT -1 ORDER BY ID DESC";

            SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter("@rolename",SqlDbType.VarChar,50)
            };
            parms[0].Value = roleName;

            return Convert.ToInt32(SQLPlus.ExecuteScalar(CommandType.Text, strSQL, parms));
        }
        #endregion

        private static void CacheInsert(string key, object value)
        {
            HttpContext.Current.Cache.Insert(key, value, null, DateTime.Now.AddMinutes(2), TimeSpan.Zero, System.Web.Caching.CacheItemPriority.Normal, null);
        }
    }
    #endregion
}
