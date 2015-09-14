using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using UZone.Models;
using System.Net.Mail;
using System.Net;
using System.Net.Mime;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Linq;
using System.Data.Entity;

namespace UZone.Account
{
    public partial class ForgotPassword : Page
    {
        string _emailFromAddress = ConfigurationManager.AppSettings["EmailFromAddress"];
        string _emailFromName = ConfigurationManager.AppSettings["EmailFromName"];
        string _emailPassword = ConfigurationManager.AppSettings["EmailPassword"];
        string _emailUsername = ConfigurationManager.AppSettings["EmailUsername"];

        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmailAddress.Focus();

            var typeOfForgot = Request.QueryString["forgot"];
            switch (typeOfForgot)
            {
                case "forgotpassword":
                    headerText.InnerText = "Enter in your profile's email address to receive your new password";
                    Page.Title = "Forgot Password";
                    break;
                case "forgotusername":
                    headerText.InnerText = "Enter in your profile's email address to receive your username";
                    Page.Title = "Forgot Username";
                    break;
                default: break;
            }
        }

        protected void SendEmail_Click(object sender, EventArgs e)
        {
            var typeOfForgot = Request.QueryString["forgot"];
            using (var context = new UzoneEntities())
            {
                RegisteredUser foundUser = (from fu in context.RegisteredUsers
                                            where fu.Email == txtEmailAddress.Value &&
                                            fu.LockedAnswer == txtSecurityAnswer.Value
                                            select fu).FirstOrDefault();
                if (foundUser != null)
                {
                    if (typeOfForgot == "forgotpassword")
                        resetAndSend(txtEmailAddress.Value);
                    else if (typeOfForgot == "forgotusername")
                        sendUsername(txtEmailAddress.Value);
                    else
                        CreateErrorMsg("There was an issue accessing your account.  Please try again.");
                }
                else
                    CreateErrorMsg("The email and security answer combination does not exist.  Please try again.");
            }
        }

        private void resetAndSend(string emailAddress)
        {
            using (var context = new UzoneEntities())
            {
                RegisteredUser foundUser = (from fu in context.RegisteredUsers
                                            where fu.Email == emailAddress
                                            select fu).FirstOrDefault();

                if (foundUser != null)
                {
                    foundUser.Password = CreateRandomPassword();
                    context.RegisteredUsers.Attach(foundUser);
                    context.Entry(foundUser).State = EntityState.Modified;
                    context.SaveChanges();
                    sendMail(foundUser.Email, foundUser.Name, "Here is your new password: " + foundUser.Password + ".  Once you login, use the manage profile module to reset your password.");
                }
            }
        }

        private void sendUsername(string emailAddress)
        {
            using (var context = new UzoneEntities())
            {
                RegisteredUser foundUsername = (from fu in context.RegisteredUsers
                                                where fu.Email == emailAddress
                                                select fu).FirstOrDefault();

                if (foundUsername != null)
                    sendMail(foundUsername.Email, foundUsername.Name, "Here is your username: " + foundUsername.UserName);
            }
        }

        private Boolean emailExist(string emailAddress)
        {
            using (var context = new UzoneEntities())
            {
                var foundEmail = (from fe in context.RegisteredUsers
                                  where fe.Email == emailAddress
                                  select fe);

                if (foundEmail.Any())
                    return true;
                else return false;
            }
        }

        private void sendMail(string toAddress, string toName, string message)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(new MailAddress(toAddress, toName));
                mail.From = new MailAddress(_emailFromAddress, _emailFromName);
                mail.Subject = "Forgot Account Information";
                mail.IsBodyHtml = true;
                string mailContent = "<img src='../Images/UZONE_Logo_Transparent_Small.png' /><br/>" + message;
                mail.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(mailContent, null, MediaTypeNames.Text.Html));
                mail.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(message, null, MediaTypeNames.Text.Plain));

                SmtpClient _client = new SmtpClient("smtp.sendgrid.net", Convert.ToInt32(587));
                NetworkCredential _credentials = new NetworkCredential(_emailUsername, _emailPassword);
                _client.Credentials = _credentials;
                _client.Send(mail);
                Response.Redirect("/Account/Confirm.aspx?confirm=" + Request.QueryString["forgot"]);
            }
            catch (Exception ex)
            {
                CreateErrorMsg("There was an issue sending your email.  Please try again.");
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

        private string CreateRandomPassword()
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = new Random();
            var result = new string(
                Enumerable.Repeat(chars, 8)
                          .Select(s => s[random.Next(s.Length)])
                          .ToArray());
            return result;
        }

        protected void checkEmail_Click(object sender, EventArgs e)
        {
            using (var context = new UzoneEntities())
            {
                RegisteredUser foundUser = (from fu in context.RegisteredUsers
                                            where fu.Email == txtEmailAddress.Value
                                            select fu).FirstOrDefault();

                if (foundUser != null)
                {
                    rwSecurity.Style.Add("visibility", "visible");
                    SendEmail.Visible = true;
                    checkEmail.Visible = false;
                    lbSecurityQuestion.InnerText = context.LockedQuestions.Find(foundUser.LockedQuestionID).Question;
                }
                else
                    CreateErrorMsg("The specified email address was not found.  Please check and try again.");

            }
        }
    }
}