using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Informacni_system
{
    public partial class zadani_clanku : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void odeslat_Click(object sender, EventArgs e)
        {
            Response.Write(autor.Text);
            Response.Write(clanek.Text);
            Response.Write(texteditor.Text);
        }
    }
}