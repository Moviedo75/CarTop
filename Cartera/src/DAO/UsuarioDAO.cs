using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace cartera.src.DAO
{
    public class UsuarioDAO
    {
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string correo { get; set; }
        public string password { get; set; }
        public string passwordNew { get; set; }
        public void registroUsuario(UsuarioDAO usuario)
        {
            string conString = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            using(SqlConnection con = new SqlConnection(conString))
            {
                //Guardar Topografo en la base de datos
                using(SqlCommand cmd = new SqlCommand("sp_GuardarTopografo", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@nombre",usuario.nombre);
                    cmd.Parameters.AddWithValue("@apellido",usuario.apellido);
                    cmd.Parameters.AddWithValue("@email",usuario.correo);
                    cmd.Parameters.AddWithValue("@pass",usuario.password);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
       
        public bool validarEmail(UsuarioDAO usuario)
        {
            string conString = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            using(SqlConnection con = new SqlConnection(conString))
            {
                using(SqlCommand cmd = new SqlCommand("sp_ValidarEmail", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", usuario.correo);
                    var resultado = cmd.ExecuteReader();
                    if(resultado == null)
                    {
                        return false;
                    }else
                    {
                        return true;
                    }
                }
            }
        }

        public bool validarUsuario(UsuarioDAO usuario)
        {
            string conString = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            using(SqlConnection con = new SqlConnection(conString))
            {
                using(SqlCommand cmd = new SqlCommand("sp_ValidarUsuario", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", usuario.correo);
                    cmd.Parameters.AddWithValue("@pass", usuario.password);
                    var resultado = cmd.ExecuteReader();
                    if (resultado.Read())
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }

        public bool eliminarUsuario(UsuarioDAO usuario)
        {
            string conString = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            using(SqlConnection con = new SqlConnection(conString))
            {
                using(SqlCommand cmd = new SqlCommand("sp_EliminarUsuario", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", usuario.correo);
                    int resultado = cmd.ExecuteNonQuery();
                    if(resultado > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }
        
        public bool actualizarUsuario(UsuarioDAO usuario)
        {
            string conString = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            using(SqlConnection con = new SqlConnection(conString))
            {
                SqlDataReader data;
                using(SqlCommand cmd = new SqlCommand("sp_ValidarPass", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", usuario.correo);
                    cmd.Parameters.AddWithValue("@pass", usuario.password);
                    data = cmd.ExecuteReader();
                }
                if (data.Read())
                {
                    con.Close();
                    using(SqlCommand cmd = new SqlCommand("sp_CambiarContrasenia", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@email", usuario.correo);
                        cmd.Parameters.AddWithValue("@pass", usuario.password);
                        cmd.Parameters.AddWithValue("@passNew", usuario.passwordNew);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }

                    return true;

                }else
                {
                    return false;
                }
            }
        }

        public bool RecuperarContrasenia(UsuarioDAO usuario)
        {
            string conString = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            using(SqlConnection con = new SqlConnection(conString))
            {
                using(SqlCommand cmd = new SqlCommand("sp_RecuperarContrasenia", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", usuario.correo);
                    cmd.Parameters.AddWithValue("@passNew", usuario.passwordNew);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return true;
                }
            }
        }

    }
}