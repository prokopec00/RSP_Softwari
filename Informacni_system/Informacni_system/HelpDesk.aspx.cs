using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Informacni_system
{
    public partial class HelpDesk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //    id_name.Text = "";
            //    id_email.Text = "";
            //    id_surname.Text = "";
            //    id_text.Text = "";
            //  
            alert.Text = "Ulozeno";
        }

        protected void odeslat_Click(object sender, EventArgs e)
        {
            global_template gt = new global_template();
            gt.DB_ExecuteNonQuery("INSERT INTO `helpdesk` (`name`, `surname`, `email`, `text`)" + "VALUES ('" + id_name.Text + "','" + id_email.Text + "','" + id_surname.Text + "','" + id_text.Text + "')");
           
            
            id_name.Text = null;
            id_email.Text = null;
            id_surname.Text = null;
            id_text.Text = null;


        }
    }
}