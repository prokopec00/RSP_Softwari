using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
//using MySql.Data;
//using MySql.Data.MySqlClient;
using System.Text;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace Informacni_system
{

    public partial class Add_article : System.Web.UI.Page
    { 
       /* public static void initilaizDB()
        {
       MySqlConnectionStringBuilder conn_string = new MySqlConnectionStringBuilder();

        conn_string.UserID = "rsp_prokopec";
        conn_string.Password = "freeacc123";
        conn_string.Server = "www.db4free.net";
        conn_string.Database = "rsp_prokopec";
        MySqlConnection conn = new MySqlConnection(conn_string.ConnectionString);
        conn.Open();
        Console.WriteLine(conn.ServerVersion);
         }   */
        protected void Page_Load(object sender, EventArgs e)
        {


            ConnectDB();

            if (!IsPostBack)
            {
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/Uploads/"));
                List<ListItem> files = new List<ListItem>();
                foreach (string filePath in filePaths)
                {
                    files.Add(new ListItem(Path.GetFileName(filePath), filePath));
                }
                GridView1.DataSource = files;
                GridView1.DataBind();
            }
        }
        

        protected void UploadFile(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
             try { 
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + fileName);
            Response.Redirect(Request.Url.AbsoluteUri);
             }
             catch (System.IO.IOException)
             { 
                 Response.Write("<script>alert('Vyberte soubor.');</script>"); 
              }

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void DownloadFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
        }
        protected void DeleteFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            File.Delete(filePath);
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
        public void ConnectDB()
        {
            SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            conn.Open();
            if (conn.State == System.Data.ConnectionState.Open) { }
        }
        static public void messege()
        {
            
        }
       
    }
}