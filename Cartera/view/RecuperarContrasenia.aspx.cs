using cartera.src.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cartera.view
{
    public partial class RecuperarContrasenia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCambiar_Click(object sender, EventArgs e)
        {
            try
            {

                UsuarioDAO usuario = new UsuarioDAO();
                usuario.correo = txtCorreo.Text;
                usuario.passwordNew = txtPassNuevo.Text;
                var resultado = usuario.RecuperarContrasenia(usuario);
                if(resultado == true)
                {
                    Response.Redirect("../view/Login.aspx");
                }

            }catch(Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
            }
        }
    }
}