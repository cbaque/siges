using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Threading;

public partial class Default2 : System.Web.UI.Page
{
        protected void cmdEnviar_Click(object sender, EventArgs e)
    {

        MailMessage mail = new MailMessage();

        //set the addresses
        mail.From = new MailAddress("sergio.bauz@gmail.com");
        mail.To.Add("sbauz@hotmail.com");

        //set the content
        mail.Subject = "This is an email";
        mail.Body = "this is the body content of the email.";

        //send the message
        SmtpClient smtp = new SmtpClient("88.99.13.135");
        try
        {
            smtp.DeliveryMethod = SmtpDeliveryMethod.PickupDirectoryFromIis; 
			smtp.Credentials = new System.Net.NetworkCredential("meh", "l4m3r"); 
            smtp.Send(mail);
        }
        catch (Exception ex)
        {
            Exception ex2 = ex;
            string errorMessage = string.Empty;
            while (ex2 != null)
            {
                errorMessage += ex2.ToString();
                ex2 = ex2.InnerException;
            }

            Response.Write(errorMessage);
        }




    }
}