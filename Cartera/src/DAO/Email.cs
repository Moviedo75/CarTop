using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;


namespace Cartera.src.DAO
{
    public class Email
    {
        MailMessage mensaje = new MailMessage();
        SmtpClient smtp = new SmtpClient();

        public bool EnviarCorreo(string email)
        {
            mensaje.From = new MailAddress("mateo_oviedo95@hotmail.com");
            mensaje.To.Add(new MailAddress(email));
            mensaje.Body = "Hola para recuperar tu contraseña ve a este link: http://localhost:64906/view/RecuperarContrasenia.aspx";
            mensaje.IsBodyHtml = false;
            mensaje.Subject = "Recuperacion de contraseña";
            //smtp.Host = "smtp.gmail.com"; //Mirar como hacer para gmail
            smtp.Host = "smtp.live.com";
            smtp.Port = 25;
            smtp.Credentials = new NetworkCredential("mateo_oviedo95@hotmail.com", "Godnotdead1795");
            smtp.EnableSsl = true;
            try
            {
                smtp.Send(mensaje);
                return true;
            }catch(Exception e)
            {
                Console.WriteLine(e.StackTrace);
                return false;
            }
            
        }

    }
}