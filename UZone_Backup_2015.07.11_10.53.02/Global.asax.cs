using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace UZone
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        void Session_Start(Object sender, EventArgs e)
        {
            Session["userName"] = null;
            Session["currentSchool"] = null;
            Session["currentSchoolID"] = null;
            Session["isLogged"] = null;
            Session["timeStamp"] = null;
            Session["userRole"] = null;
        }

        void Session_End(Object sender, EventArgs e)
        {
            Session["userName"] = null;
            Session["currentSchool"] = null;
            Session["currentSchoolID"] = null;
            Session["isLogged"] = null;
            Session["timeStamp"] = null;
            Session["userRole"] = null;
        }
    }
}