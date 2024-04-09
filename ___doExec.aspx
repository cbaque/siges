<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net.Mime" %>
<%@ Import Namespace="System.Threading" %>

<%
MailMessage mail = new MailMessage();

        //set the addresses
        mail.From = new MailAddress("gerencia@i-solutions.com.ec");
        mail.To.Add("sbauz@hotmail.com");

        //set the content
        mail.Subject = "Desde el Sitio de Siges";
        mail.Body = "Este es un correo de prueba servidor siges.";

        //send the message
        SmtpClient smtp = new SmtpClient("mail.i-solutions.com.ec",26);
        try
        {
            smtp.Credentials = new System.Net.NetworkCredential("gerencia@i-solutions.com.ec", "doom5452"); 
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


%>