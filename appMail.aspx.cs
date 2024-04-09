using System;
using System.Collections.Generic;
// using System.Linq;
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
        mail.From = new MailAddress("jagila@ecuahosting.net");
        mail.To.Add("sergio.bauz@gmail.com");

        //set the content
        mail.Subject = "Desde el Sitio de Siges";
        mail.Body = "Este es un correo de prueba servidor siges.";

        //send the message
        SmtpClient smtp = new SmtpClient("mail.ecuahosting.net",25);
        try
        {
            smtp.Credentials = new System.Net.NetworkCredential("jagila@ecuahosting.net", "xxxx"); 
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