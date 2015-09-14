using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UZone.Models;

namespace UZone.Account
{
    public partial class Register : Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            LoadSchool();
            LoadSecurityQuestion();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            txtUsername.Focus();
        }        

        private Boolean CreateAccount(RegisteredUser user)
        {
            try
            {
                using (var context = new UzoneEntities())
                {
                    context.RegisteredUsers.Add(user);
                    context.SaveChanges();
                }
                return true;
            }
            catch (Exception ex)
            { return false; }
        }

        private Boolean CheckUsernameAvailability(string username)
        {
            using (var context = new UzoneEntities())
            {
                var founduser = (from ru in context.RegisteredUsers
                                 where ru.UserName == username
                                 select ru);

                if (founduser.Any())
                    return false;
                else return true;
            }
        }

        private Boolean CheckEmailAvailability(string email)
        {
            using (var context = new UzoneEntities())
            {
                var founduser = (from ru in context.RegisteredUsers
                                 where ru.Email == email
                                 select ru);

                if (founduser.Any())
                    return false;
                else return true;
            }
        }

        private void LoadSchool()
        {
            using (var context = new UzoneEntities())
            {
                List<School> _schools;
                _schools = context.Set<School>().ToList();
                comboSchool.DataSource = _schools;
                comboSchool.DataBind();
            }
        }

        private void LoadSecurityQuestion()
        {
            using (var context = new UzoneEntities())
            {
                List<LockedQuestion> _questions;
                _questions = context.Set<LockedQuestion>().ToList();
                comboSecurityQues.DataSource = _questions;
                comboSecurityQues.DataBind();
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

        protected void acountWizard_FinishButtonClick(object sender, Telerik.Web.UI.WizardEventArgs e)
        {
            if (!chkTerms.Checked)
            {
                accountWizard.ActiveStepIndex = e.CurrentStepIndex;
                CreateErrorMsg("You must accept terms of use to proceed");
            }
            else
            {
                RegisteredUser _user = new RegisteredUser();
                _user.UserName = txtUsername.Text;
                _user.Email = txtEmail.Text;
                _user.Password = txtPassword.Text;
                _user.IsLocked = false;
                _user.IsActive = true;
                _user.NumAttempts = 0;
                _user.LockedQuestionID = Convert.ToInt32(comboSecurityQues.SelectedValue);
                _user.LockedAnswer = txtSecurityAns.Text;
                _user.UserRoleID = 2;
                _user.SchoolID = Convert.ToInt32(comboSchool.SelectedValue);

                if (CheckEmailAvailability(txtEmail.Text) == false)
                {
                    accountWizard.ActiveStepIndex = e.CurrentStepIndex;
                    CreateErrorMsg("The email is already in use.  Please correct and try again.");
                }
                else
                {
                    if (CreateAccount(_user))
                    { }
                    else
                        CreateErrorMsg("There was an issue saving your data.  Please try again.");
                }

                if (CheckUsernameAvailability(txtUsername.Text) == false)
                {
                    accountWizard.ActiveStepIndex = e.CurrentStepIndex;
                    CreateErrorMsg("The username is already in use.  Please correct and try again.");
                }
                else
                {
                    if (CreateAccount(_user))
                    { }
                    else
                        CreateErrorMsg("There was an issue saving your data.  Please try again.");
                }                
            }
        }
    }
}