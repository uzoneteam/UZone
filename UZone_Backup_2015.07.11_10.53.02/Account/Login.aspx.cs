using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using UZone.Models;
using System.Linq;
using System.Web.UI.WebControls;

namespace UZone.Account
{
    public partial class Login : Page
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUser.Focus();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (UserLogin())
                Response.Redirect("/Admin/Modules");            
            else
                CreateErrorMsg("The username/password combination do not match.");
        }

        private Boolean UserLogin()
        {
            using (var context = new UzoneEntities())
            {
                var founduser = (from ru in context.RegisteredUsers
                                 where ru.UserName == txtUser.Value
                                 && ru.Password == txtPassword.Value
                                 select ru);

                if (founduser.FirstOrDefault() != null)
                {
                    Session["userName"] = founduser.First().UserName;
                    Session["currentSchool"] = context.Schools.FirstOrDefault(x => x.SchoolID == founduser.FirstOrDefault().SchoolID).Name;
                    Session["currentSchoolID"] = founduser.First().SchoolID;
                    Session["isLogged"] = "true";
                    Session["userRole"] = founduser.First().UserRoleID;
                    Session["timeStamp"] = DateTime.Now;
                    return true;
                }
                else return false;
            }
        }

        private void CreateErrorMsg(string message)
        {
            CustomValidator err = new CustomValidator();
            err.IsValid = false;
            err.ErrorMessage = message;
            Page.Validators.Add(err);
            return;
        }
    }
}