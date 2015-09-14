using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using UZone.Models;

namespace UZone.Account
{
    public partial class Confirm : Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            var typeOfConfirmation = Request.QueryString["confirm"];

            switch (typeOfConfirmation)
            {
                case "forgotpassword":
                    confirmMsg.Text = "<p>Your account credentials have been updated. Click <a href='Login'>here</a> to login</p>";
                    break;
                case "resetpassword":
                    confirmMsg.Text = "<p>Your account credentials have been updated. Click <a href='Login'>here</a> to login</p>";
                    break;
                case "forgotusername":
                    confirmMsg.Text = "<p>Your account credentials have been updated. Click <a href='Login'>here</a> to login</p>";
                    break;
                case "contactus":
                    confirmMsg.Text = "<p>Thank you for contacting us.  We will be in touch with you shortly.</p>";
                    break;
                case "userregistration":
                    confirmMsg.Text = "<p>Thank you for creating your account. Click <a href='Login'>here</a> to login</p>";
                    break;
                case "signout":
                    confirmMsg.Text = "<p>Thank you for using our site.  You have been signed out.</p>";
                    Session["userName"] = null;
                    Session["currentSchool"] = null;
                    Session["currentSchoolID"] = null;
                    Session["isLogged"] = null;
                    Session["timeStamp"] = null;
                    Session["userRole"] = null;
                    break;
                default: break;
            }
        }
    }
}