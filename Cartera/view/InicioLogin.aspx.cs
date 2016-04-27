using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cartera.view
{
    public partial class InicioLogin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblEmail.Text = Session["Email"].ToString();
            if (Session["Email"] == "")
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}