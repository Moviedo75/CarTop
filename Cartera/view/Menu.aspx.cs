using Cartera.src.DAO;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cartera.view
{
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblEmail.Text = Session["Email"].ToString();
            if (Session["Email"] == "")
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                verCartera();
            }

        }

        private void ExportGridToExcel()
        {
            /*Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = lblNombreCartera.Text + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            CarteraPoligonal.GridLines = GridLines.Both;
            CarteraPoligonal.HeaderStyle.Font.Bold = true;
            CarteraPoligonal.RenderControl(htmltextwrtter);
            CaracPoligonal.GridLines = GridLines.Both;
            CaracPoligonal.HeaderStyle.Font.Bold = true;
            CaracPoligonal.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
            */
            Response.Clear();

            Response.AddHeader("content-disposition", "attachment;filename = '" + lblNombreCartera.Text + "'.xls");
        


            Response.ContentType = "application/vnd.xls";

            System.IO.StringWriter stringWrite = new System.IO.StringWriter();

            System.Web.UI.HtmlTextWriter htmlWrite =
            new HtmlTextWriter(stringWrite);

            CarteraPoligonal.RenderControl(htmlWrite);
            CaracPoligonal.RenderControl(htmlWrite);

            Response.Write(stringWrite.ToString());

            Response.End();
            

        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void verCartera()
        {
            CarteraDAO cartera = new CarteraDAO();
            string email = lblEmail.Text;
            List<CarteraDAO> lista = cartera.verCartera(email);
            CarterasPoligonales.DataSource = lista;
            CarterasPoligonales.DataBind();
        }

        protected void btnPoligonal_Click(object sender, EventArgs e)
        {
            Response.Redirect("carteraPoligonal.aspx");
        }

        protected void btnNivelacin_Click(object sender, EventArgs e)
        {
            string idCartera = "nivelacion";

        }

        protected void btnConfiguracion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Configuracion.aspx");
        }

        protected void CarterasPoligonales_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if(e.CommandName == "Ver")
            {

                string nombreCarteraP = CarterasPoligonales.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text;
                string emailP = lblEmail.Text;
                CarteraDAO cartera = new CarteraDAO();
                lblNombreCartera.Text = nombreCarteraP;
                List<CarteraDAO> lista = cartera.verPoligonal(emailP, nombreCarteraP);
                CarteraPoligonal.DataSource = lista;
                CarteraPoligonal.DataBind();
                List<CarteraDAO> listaC = cartera.verCaracPoligonal(emailP, nombreCarteraP);
                CaracPoligonal.DataSource = listaC;
                CaracPoligonal.DataBind();
            }else
            {
                if(e.CommandName == "Eliminar")
                {
                    CarteraDAO carteraE = new CarteraDAO();
                    string nombreCarteraE = CarterasPoligonales.Rows[int.Parse(e.CommandArgument.ToString())].Cells[0].Text;
                    string emailE = lblEmail.Text;
                    carteraE.EliminarCartera(emailE, nombreCarteraE);
                }else
                {
                    
                }
                
            }
            
            
        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }
    }
}