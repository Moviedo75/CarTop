using cartera.src.DAO;
using Cartera.src.DAO;
using System;

namespace Cartera.view
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Email"] = "";
        }

        protected void btnRegistar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            UsuarioDAO usuario = new UsuarioDAO();
            usuario.correo = txtEmail.Text;
            usuario.password = txtPass.Text;
            bool result = usuario.validarUsuario(usuario);
            if (result.Equals(true))
            {
                Session["Email"] = txtEmail.Text;
                Session["Name"] = txtPass.Text;
                Response.Redirect("InicioLogin.aspx");
            }
            else
            {
                mensaje.Text = "El correo o la contraseña incorrectos";
            }
        }

        protected void Recuperar_Click(object sender, EventArgs e)
        {
            Email enviar = new Email();
            UsuarioDAO usuario = new UsuarioDAO();
            string from = txtEmailUsuario.Text;
            var resultado = enviar.EnviarCorreo(from);
            if (resultado == true)
            {
                mensajeEmail.Text = "Mensaje enviado";
            }
            else
            {
                mensajeEmail.Text = "Mensaje no enviado";
            }
        }
    }
}