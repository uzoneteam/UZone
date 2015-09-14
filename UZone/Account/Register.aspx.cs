using System;
using System.Collections.Generic;
using System.Data.Entity;
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
            txtName.Focus();

            if (!Page.IsPostBack)
                if (Session["userName"] != null)
                    LoadRegistration();
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

        private Boolean UpdateAccount(RegisteredUser user)
        {
            try
            {
                using (var context = new UzoneEntities())
                {
                    string _currentUsername = Session["userName"].ToString();
                    user.UserID = context.RegisteredUsers.FirstOrDefault(c => c.UserName == _currentUsername).UserID;
                }

                using (var context = new UzoneEntities())
                {
                    context.RegisteredUsers.Attach(user);
                    context.Entry(user).State = EntityState.Modified;
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
            else if (string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                accountWizard.ActiveStepIndex = e.CurrentStepIndex;
                CreateErrorMsg("Your password was cleared due to a previous error message.  Please re-enter it beforkde proceeding.");
            }
            else
            {
                RegisteredUser _user = new RegisteredUser();
                _user.Name = txtName.Text;
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

                if (Session["userName"] == null)
                {
                    if (CheckEmailAvailability(txtEmail.Text) == true && CheckUsernameAvailability(txtUsername.Text) == true)
                    {
                        if (!CreateAccount(_user))
                        {
                            accountWizard.ActiveStepIndex = e.CurrentStepIndex;
                            CreateErrorMsg("There was an issue saving your data.  Please try again.");
                        }
                    }
                    else
                    {
                        accountWizard.ActiveStepIndex = e.CurrentStepIndex;
                        CreateErrorMsg("The email/username is already in use.  Please correct and try again.");
                    }
                }
                else
                {
                    if (!UpdateAccount(_user))
                    {
                        accountWizard.ActiveStepIndex = e.CurrentStepIndex;
                        CreateErrorMsg("There was an issue saving your data.  Please try again.");
                    }
                }
            }
        }

        private void LoadRegistration()
        {
            using (var context = new UzoneEntities())
            {
                RegisteredUser _user = new RegisteredUser();
                string _currentUsername = Session["userName"].ToString();
                _user = (from ru in context.RegisteredUsers
                         where ru.UserName == _currentUsername
                         select ru).FirstOrDefault();

                if (_user != null)
                {
                    txtName.Text = _user.Name;
                    txtUsername.Text = _user.UserName;
                    txtPassword.Text = _user.Password;
                    txtConfirmPass.Text = _user.Password;
                    txtEmail.Text = _user.Email;
                    comboSchool.SelectedValue = _user.SchoolID.ToString();
                    comboSecurityQues.SelectedValue = _user.LockedQuestionID.ToString();
                    txtSecurityAns.Text = _user.LockedAnswer;
                    chkTerms.Checked = true;
                }
            }
        }
    }
}