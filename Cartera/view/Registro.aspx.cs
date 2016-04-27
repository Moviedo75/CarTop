using cartera.src.DAO;
using System;

namespace Cartera.view
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistro_Click(object sender, EventArgs e)
        {
            UsuarioDAO usuario = new UsuarioDAO();
            usuario.nombre = txtNombre.Text;
            usuario.apellido = txtApellido.Text;
            usuario.correo = txtEmail.Text;
            usuario.password = txtPass.Text;
            try
            {

                var resutlado = usuario.validarEmail(usuario);
                if (resutlado.Equals(true))
                {
                    usuario.registroUsuario(usuario);
                    Response.Redirect("../view/Login.aspx");
                }
                else
                {
                    mensaje.Text = "No se pudo guardar en la base de datos";
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}