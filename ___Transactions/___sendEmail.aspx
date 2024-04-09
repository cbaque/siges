<%@ Page Language="C#" ContentType="text/html" ResponseEncoding="utf-8" Debug="true"  %>
<%@ OutputCache Duration="60" VaryByParam="None" %>

<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net.Mime" %>
<%@ Import Namespace="System.Threading" %>


<%
MailMessage mail = new MailMessage();

        //set the addresses
        mail.From = new MailAddress("notificaciones@i-solutions.com.ec");
        mail.To.Add("sbauz@hotmail.com");
        mail.CC.Add("sergio.bauz@gmail.com,ircajunio@hotmail.com"); //Adding Multiple CC email Id
        //set the content
        mail.Subject = "Correo VPS";
        				
		mail.Body = "Mensaje de Prueba desde el servidor VPS";
        
        //send the message
        SmtpClient smtp = new SmtpClient("mail.i-solutions.com.ec",26);
        try{
            smtp.Credentials = new System.Net.NetworkCredential("notificaciones@i-solutions.com.ec", "Doom5452@@"); 
            mail.IsBodyHtml = true;
			
			smtp.Send(mail);
        }catch (Exception ex){
            Exception ex2 = ex;
            string errorMessage = string.Empty;
            while (ex2 != null){
                errorMessage += ex2.ToString();
                ex2 = ex2.InnerException;
            }
            Response.Write(errorMessage);
        }

Response.Write("Enviado!!!");
%>
