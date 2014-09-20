using System;
using Goodspeed.Library.Data;
using System.Web;
using System.Web.Security;
using System.Text.RegularExpressions;
using System.Data.SqlClient;
using System.Data;

namespace GETech.Core
{
    public partial class Global : HttpApplication
    {
        #region = Application_End =
        //protected void Application_End(Object sender, EventArgs e)
        //{
        //    //  Code that runs on application shutdown

        //}
        #endregion

        #region = Application_Error =
        /// <summary>
        /// Handles the Error event of the Application control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="T:System.EventArgs"/> instance containing the event data.</param>
        protected void Application_Error(Object sender, EventArgs e)
        {
            //    // Code that runs when an unhandled error occurs
            try
            {
                // && Context.IsCustomErrorEnabled == true
                if (Context != null)
                {
                    if (Server.GetLastError() is HttpException)
                    {
                        HttpException HE = new HttpException("HttpException", Server.GetLastError());
                    }

                    Goodspeed.Common.ErrorHelper.WriteLog(this);
                }


            }
            catch
            {
                //Goodspeed.Common.FileHelper.WriteText(@"D:\1.txt", ex.Message);
            }
        }
        #endregion

        #region = Session_Start =
        protected void Session_Start(Object sender, EventArgs e)
        {
            // Code that runs when a new session is started
            Application.Lock();
            Session["start"] = DateTime.Now.ToString();
            Session["viewpage"] = 0;
            Session["ip"] = Request.ServerVariables["Remote_Addr"];
            Application.UnLock();


        }
        #endregion

        #region = Session_End =
        protected void Session_End(Object sender, EventArgs e)
        {
            // Code that runs when a session ends. 
            // Note: The Session_End event is raised only when the sessionstate mode
            // is set to InProc in the Web.config file. If session mode is set to StateServer 
            // or SQLServer, the event is not raised.

            if (Session["start"] == null || Session["viewpage"].ToString() == "0")
            {
                return;
            }
            DateTime start = DateTime.Parse(Session["start"].ToString());
            TimeSpan ts = DateTime.Now - start;

            //if (ts.Minutes >= 1)
            //{
            //    Application.Lock();
            //    string strSQL = "Insert Into VisitorSession([Visitor_IP],[Visitor_Start],[Visitor_End],[Visitor_Viewpage],IsDotnet) SELECT @ip,@s,@e,@c,1";

            //    SqlParameter[] parms = new SqlParameter[] {
            //        new SqlParameter("@ip",SqlDbType.NVarChar,100),
            //        new SqlParameter("@s",SqlDbType.DateTime),
            //        new SqlParameter("@e",SqlDbType.DateTime),
            //        new SqlParameter("@c",SqlDbType.Int)
            //    };

            //    parms[0].Value = Session["ip"];
            //    parms[1].Value = Session["start"];
            //    parms[2].Value = DateTime.Now;
            //    parms[3].Value = Session["viewpage"];

            //    SQLPlus.ExecuteNonQuery(CommandType.Text, strSQL, parms);
            //    Application.UnLock();
            //}
        }
        #endregion

        void Application_BeginRequest(Object source, EventArgs e)
        {
            HttpApplication app = (HttpApplication)source;
            HttpContext context = app.Context;


            // Attempt to peform first request initialization
            FirstRequestInitialization.Initialize(context);

        }

        class FirstRequestInitialization
        {
            private static bool s_InitializedAlready = false;
            private static Object s_lock = new Object();

            // Initialize only on the first request
            public static void Initialize(HttpContext context)
            {
                if (s_InitializedAlready)
                {
                    return;
                }

                lock (s_lock)
                {
                    if (s_InitializedAlready)
                    {
                        return;
                    }

                    // Perform first-request initialization here ...
                    ApplicationStart();

                    s_InitializedAlready = true;

                }
            }

            #region = Application_Start =
            static void ApplicationStart()
            {
                // Code that runs on application startup
                //创建默认用户和默认角色

                //role
                //if (Roles.RoleExists("admin") == false)
                //{
                //    Roles.CreateRole("Admin");
                //}
            }
            #endregion

        }

        /// <summary>
        /// http://www.cnblogs.com/eaglet/archive/2009/02/17/1392191.html
        /// </summary>
        static object _initLock = new object();
        static bool _initialized = false;
        public override void Init()
        {
            base.Init();

            // Do this one time for each AppDomain.
            lock (_initLock)
            {
                if (!_initialized)
                {
                    AppDomain.CurrentDomain.UnhandledException += new UnhandledExceptionEventHandler(OnUnhandledException);
                    _initialized = true;
                }
            }

        }

        void OnUnhandledException(object o, UnhandledExceptionEventArgs e)
        {
            //Do some thing you wish to do when the Unhandled Exception raised.

            try
            {

                Exception ex = (Exception)e.ExceptionObject;
                Goodspeed.Common.ErrorHelper.WriteLog(ex, HttpContext.Current);
            }
            catch
            {
            }
        }
    }
}
