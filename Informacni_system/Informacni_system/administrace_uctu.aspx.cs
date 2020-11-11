using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using MySql.Data.MySqlClient;

using System.Data;
using System.Data.SqlClient;

using System.Text.RegularExpressions;


using System.Web.UI.HtmlControls;

using System.Security.Cryptography;
using System.Text;

namespace Informacni_system
{
    public partial class administrace_uctu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {




        }

        protected void odeslat_Click(object sender, EventArgs e)
        {
            global_template dbSaver = new global_template();

            //dbSaver.DB_ExecuteNonQuery("INSERT INTO `tbl_review` ( `review_title`, `rating`, `review_text`, `id_article`, `id_reviewer`)" +
            //    " VALUES('" + review_title.Text + "', '" + rating.Text + "', '" + texteditor.Text + "', '" + id_article.Text + "', '1')");
            //Response.Write("ulyeno");
            //review_title.Text = "ulyeno";
        }

        protected void pridat_Click(object sender, EventArgs e)
        {
            global_template dbSaver = new global_template();

            dbSaver.DB_ExecuteNonQuery("INSERT INTO `tbl_user` ( `username`, `name`, `surname`, `email`, `password`)" +
                " VALUES('" + username.Text + "', '" + firstname.Text + "', '" + lastname.Text + "', '" + email.Text + "', '" + password.Text + "')");
            Response.Write("ulozeno");
            // review_title.Text = "ulyeno";
            
        }

        protected void id_show_TextChanged(object sender, EventArgs e)
        {
            //int id_user = 1;
            //global_template dbSaver = new global_template();
            ////char bgr;
            //DataTable bgr = new DataTable();
            //bgr= dbSaver.DB_ExecuteTable("SELECT* FROM `tbl_user` WHERE id_user=1"+ id_user, bgr);
            ////Response.Write("ulozeno");
            ////DataList1= bgr;
            //Response.Write(obj: bgr);
            //Response.Write("ulozeno");
            
            //username_show.Text = obj: bgr;
        }
        //SELECT * FROM `tbl_user` WHERE id_user=1 
        



//        DECLARE @Msg VARCHAR(300)= 'My Name is Rajendra Gupta';
//PRINT @Msg;


        //id_review 	review_title 	rating 	review_text 	id_article 	id_reviewer 

    }
}