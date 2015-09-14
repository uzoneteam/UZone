using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using UZone.Models;

namespace UZone
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           //CheckStatus();

            if (Session["isLogged"] != null && Session["isLogged"].ToString() == "true")
            {
                anonymousMenu.Visible = false;
                anonymousLogin.Visible = false;
                
                loggedInLogin.Visible = true;
                lbLoggedIn.InnerText = "Welcome, " + Session["Name"].ToString();
                schoolEditLink.HRef = "/Admin/Register.aspx?schoolid=" + Session["currentSchoolID"];
            }
            else
            {
                anonymousMenu.Visible = true;
                anonymousLogin.Visible = true;
                
                loggedInLogin.Visible = false;
            }
        }

        private void CheckStatus()
        {
            string blockApplicationPath = HttpContext.Current.Request.RawUrl;
            if (blockApplicationPath.Contains("Admin") && Session["userRole"].ToString() != "1" && (Session["isLogged"] == null || Session["isLogged"].ToString() == "false"))
                 Response.Redirect("/Account/Login.aspx");            
        }
    }

}