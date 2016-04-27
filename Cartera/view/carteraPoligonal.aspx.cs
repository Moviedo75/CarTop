using System;
using System.Web.Services;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Cartera.view
{
    public partial class carteraPoligonal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblEmail.Text = Session["Email"].ToString();
            if (Session["Email"] == "")
            {
                Response.Redirect("Login.aspx");
            }
        }

        [WebMethod]
        public static string savePoligonal(string nombreCartera, string email, string[] estacion, string[] punto, string[] angulosGrados, string[] angulosMinutos, string[] angulosSegundos, string[] distancia, string[] azimutsGrados, string[] azimutsMinutos, string[] azimutsSegundos, string[] proyeccionesX, string[] proyeccionesY, string[] vertice, string[] coordenadasX, string[] coordenadasY, string perimetro, string totalProyeccionX, string totalProyeccionY)
        {
            string conString = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                SqlDataReader data;
                string mensaje = "";
                //Guardamos en la tabla 
                using(SqlCommand cmd = new SqlCommand("sp_ValidarNombreCartera", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@nombreCartera", nombreCartera);
                    data = cmd.ExecuteReader();
                }
                if (data.Read())
                {
                    con.Close();
                    mensaje = "El nombre de la cartera ya esta";

                }else
                {
                    con.Close();
                    using (SqlCommand cmd = new SqlCommand("sp_GuardarCarteraPoligonal", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@nombreCartera", nombreCartera);
                        cmd.Parameters.AddWithValue("@fRealizacion", DateTime.Today);
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }

                    using (SqlCommand cmd = new SqlCommand("sp_GuardarPoligonal", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        for (var i = 0; i < estacion.Length; i++)
                        {
                            cmd.Parameters.AddWithValue("@email", email);
                            cmd.Parameters.AddWithValue("@nombreCartera", nombreCartera);
                            cmd.Parameters.AddWithValue("@estacion", estacion[i]);
                            cmd.Parameters.AddWithValue("@punto", punto[i]);
                            cmd.Parameters.AddWithValue("@aGrados", angulosGrados[i]);
                            cmd.Parameters.AddWithValue("@aMinutos", angulosMinutos[i]);
                            cmd.Parameters.AddWithValue("@aSegundos", angulosSegundos[i]);
                            cmd.Parameters.AddWithValue("@distancia", distancia[i]);
                            cmd.Parameters.AddWithValue("@azGrados", azimutsGrados[i]);
                            cmd.Parameters.AddWithValue("@azMinutos", azimutsMinutos[i]);
                            cmd.Parameters.AddWithValue("@azSegundos", azimutsSegundos[i]);
                            cmd.Parameters.AddWithValue("@proyeccionX", proyeccionesX[i]);
                            cmd.Parameters.AddWithValue("@proyeccionY", proyeccionesY[i]);
                            cmd.Parameters.AddWithValue("@vertice", vertice[i]);
                            cmd.Parameters.AddWithValue("@coordenadasX", coordenadasX[i]);
                            cmd.Parameters.AddWithValue("@coordenadasY", coordenadasY[i]);
                            cmd.ExecuteNonQuery();
                            cmd.Parameters.Clear();
                        }
                        con.Close();
                    }
                    using (SqlCommand cmd = new SqlCommand("sp_GuardarCaracPoligonal", con))
                    {
                        con.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@nombreCartera", nombreCartera);
                        cmd.Parameters.AddWithValue("@perimetro", perimetro);
                        cmd.Parameters.AddWithValue("@tProyeccionX", totalProyeccionX);
                        cmd.Parameters.AddWithValue("@tProyeccionY", totalProyeccionY);
                        cmd.Parameters.AddWithValue("@tipo", "cerrada");
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }

                }

                return mensaje;
                 
            }

        }

    }
}
