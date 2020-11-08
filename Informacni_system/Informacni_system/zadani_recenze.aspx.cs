using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Informacni_system
{
    public partial class zadani_recenze : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            


        }

        protected void odeslat_Click(object sender, EventArgs e)
        {
            global_template dbSaver= new global_template();
          
            dbSaver.DB_ExecuteNonQuery("INSERT INTO `tbl_review` ( `review_title`, `rating`, `review_text`, `id_article`, `id_reviewer`)" +
                " VALUES('" + review_title.Text + "', '" + rating.Text + "', '" + texteditor.Text + "', '" + id_article.Text + "', '1')");
           
            //TODO ID REVIEWER
        }
        

        //id_review 	review_title 	rating 	review_text 	id_article 	id_reviewer 
        protected void rating_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}