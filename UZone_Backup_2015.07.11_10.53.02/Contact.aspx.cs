using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace UZone
{
    public partial class Contact : Page
    {
        string _emailFromAddress = ConfigurationManager.AppSettings["EmailFromAddress"];
        string _emailFromName = ConfigurationManager.AppSettings["EmailFromName"];
        string _emailPassword = ConfigurationManager.AppSettings["EmailPassword"];
        string _emailUsername = ConfigurationManager.AppSettings["EmailUsername"];

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendEmail_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(new MailAddress(_emailFromAddress, _emailFromName));
                mail.From = new MailAddress(txtEmail.Value, txtName.Value);
                mail.Subject = "Contact Us";
                mail.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(txtMess.Value, null, MediaTypeNames.Text.Html));
                mail.AlternateViews.Add(AlternateView.CreateAlternateViewFromString(txtMess.Value, null, MediaTypeNames.Text.Plain));

                SmtpClient _client = new SmtpClient("smtp.sendgrid.net", Convert.ToInt32(587));
                NetworkCredential _credentials = new NetworkCredential(_emailUsername, _emailPassword);
                _client.Credentials = _credentials;
                _client.Send(mail);
                Server.Transfer("/Account/Confirm.aspx?confirm=contactus");
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
    }
}