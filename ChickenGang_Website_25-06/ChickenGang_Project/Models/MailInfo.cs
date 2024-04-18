using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace ChickenGang_Project.Models
{
    public class MailInfo
    {
        public void SendEmail(string address, string hoten)
        {
            var message = new MailMessage();
            message.To.Add(new MailAddress(address));  
            message.From = new MailAddress(Properties.Settings.Default.MAIL_FROM);  
            message.Subject = Properties.Settings.Default.MAIL_REGISTER_SUBJECT;
            message.Body = string.Format(Properties.Settings.Default.MAIL_REGISTER_BODY, hoten);
            message.IsBodyHtml = true;

            using (var smtp = new SmtpClient())
            {
                var credential = new NetworkCredential
                {
                    UserName = Properties.Settings.Default.MAIL_FROM,  
                    Password = Properties.Settings.Default.MAIL_PASSWORD  
                };
                smtp.Credentials = credential;
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Timeout = 20000;
                smtp.Send(message);

            }
        }

        public void SendEmailOrder(string address, string hoten)
        {
            var message = new MailMessage();
            message.To.Add(new MailAddress(address));  
            message.From = new MailAddress(Properties.Settings.Default.MAIL_FROM);  
            message.Subject = Properties.Settings.Default.MAIL_ORDER_SUBJECT;
            message.Body = string.Format(Properties.Settings.Default.MAIL_ORDER_BODY, hoten);
            message.IsBodyHtml = true;

            using (var smtp = new SmtpClient())
            {
                var credential = new NetworkCredential
                {
                    UserName = Properties.Settings.Default.MAIL_FROM,  
                    Password = Properties.Settings.Default.MAIL_PASSWORD  
                };
                smtp.Credentials = credential;
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Timeout = 20000;
                smtp.Send(message);

            }
        }

        public void SendEmailForgotPassword(string address, string mk)
        {
            var message = new MailMessage();
            message.To.Add(new MailAddress(address));  
            message.From = new MailAddress(Properties.Settings.Default.MAIL_FROM);  
            message.Subject = Properties.Settings.Default.Mail_FORGOT_SUBJECT;
            message.Body = string.Format(Properties.Settings.Default.MAIL_FORGOTPASSWORD, mk);
            message.IsBodyHtml = true;

            using (var smtp = new SmtpClient())
            {
                var credential = new NetworkCredential
                {
                    UserName = Properties.Settings.Default.MAIL_FROM,  
                    Password = Properties.Settings.Default.MAIL_PASSWORD  
                };
                smtp.Credentials = credential;
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Timeout = 20000;
                smtp.Send(message);
            }
        }
    }
}