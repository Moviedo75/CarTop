using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Cartera.src.DAO
{
    public class CarteraDAO
    {
        public string nombreCartera { get; set; }
        public DateTime fRealizacion { get; set; }
        public string estacion { get; set; }
        public string punto { get; set; }
        public string aGrados { get; set; }
        public string aMinutos { get; set; }
        public string aSegundos { get; set; }
        public string distancia { get; set; }
        public string azGrados { get; set; }
        public string azMinutos { get; set; }
        public string azSegundos { get; set; }
        public string proyeccionX { get; set; }
        public string proyeccionY { get; set; }
        public string vertice { get; set; }
        public string coordenadasX { get; set; }
        public string coordenadasY { get; set; }
        public string perimetro { get; set; }
        public string tProyeccionX { get; set; }
        public string tProyeccionY { get; set; }
        public string tipo { get; set; }

        public List<CarteraDAO> verCartera (string email)
        {
            List<CarteraDAO> lista = new List<CarteraDAO>();
            string conString = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            using(SqlConnection con = new SqlConnection(conString))
            {
                using(SqlCommand cmd = new SqlCommand("sp_VerCartera", con))
                {
                    SqlDataReader data;
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", email);
                    data = cmd.ExecuteReader();
                    while (data.Read())
                    {
                        CarteraDAO cartera = new CarteraDAO();
                        cartera.nombreCartera = data.GetString(0).ToString();
                        cartera.fRealizacion = data.GetDateTime(1);
                        lista.Add(cartera);
                    }
                    data.Close();
                    con.Close();
                    return lista;
                }
            }
        }

        public List<CarteraDAO> verPoligonal(string email, string nombreCartera)
        {
            List<CarteraDAO> lista = new List<CarteraDAO>();
            string conString = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            using(SqlConnection con = new SqlConnection(conString))
            {
                using(SqlCommand cmd = new SqlCommand("sp_VerPoligonal", con))
                {
                    SqlDataReader data;
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@nombreCartera", nombreCartera);
                    data = cmd.ExecuteReader();
                    while (data.Read())
                    {
                        CarteraDAO cartera = new CarteraDAO();
                        cartera.estacion = data.GetString(1).ToString();
                        cartera.punto = data.GetString(2).ToString();
                        cartera.aGrados = data.GetString(3).ToString();
                        cartera.aMinutos = data.GetString(4).ToString();
                        cartera.aSegundos = data.GetString(5).ToString();
                        cartera.distancia = data.GetString(6).ToString();
                        cartera.azGrados = data.GetString(7).ToString();
                        cartera.azMinutos = data.GetString(8).ToString();
                        cartera.azSegundos = data.GetString(9).ToString();
                        cartera.proyeccionX = data.GetString(10).ToString();
                        cartera.proyeccionY = data.GetString(11).ToString();
                        cartera.vertice = data.GetString(12).ToString();
                        cartera.coordenadasX = data.GetString(13).ToString();
                        cartera.coordenadasY = data.GetString(14).ToString();
                        lista.Add(cartera);
                    }
                    data.Close();
                    con.Close();
                    return lista;
                }
            }
        }

        public List<CarteraDAO> verCaracPoligonal(string email, string nombreCartera)
        {
            List<CarteraDAO> lista = new List<CarteraDAO>();
            string conString = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            using(SqlConnection con = new SqlConnection(conString))
            {
                using(SqlCommand cmd = new SqlCommand("sp_VerCaracPoligonal", con))
                {
                    SqlDataReader data;
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@nombreCartera", nombreCartera);
                    data = cmd.ExecuteReader();
                    if (data.Read())
                    {
                        CarteraDAO cartera = new CarteraDAO();
                        cartera.perimetro = data.GetString(1).ToString();
                        cartera.tProyeccionX = data.GetString(2).ToString();
                        cartera.tProyeccionY = data.GetString(3).ToString();
                        cartera.tipo = data.GetString(4).ToString();
                        lista.Add(cartera);
                    }
                    data.Close();
                    con.Close();
                    return lista;
                }
            }
        }

        public void EliminarCartera(string email, string nombreCartera)
        {
            string conString = ConfigurationManager.ConnectionStrings["connstr"].ConnectionString;
            using(SqlConnection con = new SqlConnection(conString))
            {
                using(SqlCommand cmd = new SqlCommand("sp_EliminarCartera", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@nombreCartera", nombreCartera);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }

    }
}