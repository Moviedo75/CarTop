using cartera.src.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cartera.view
{
    public partial class CambiarContrasenia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblEmail.Text = Session["Email"].ToString();
            if (Session["Email"] == "")
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnCambiar_Click(object sender, EventArgs e)
        {
            UsuarioDAO usuario = new UsuarioDAO();
            usuario.correo = lblEmail.Text;
            usuario.password = txtPassAntiguo.Text;
            usuario.passwordNew = txtPassNuevo.Text;
            var resultado = usuario.actualizarUsuario(usuario);
            if (resultado == true)
            {
                mensaje.Text = "Exito al cambiar la contraseña";
            }
            else
            {
                mensaje.Text = "la contraseña antigua esta mal";
            }
        }
    }
}