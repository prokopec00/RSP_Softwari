 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Security.Principal;
using System.Windows;
using System.Net;

namespace Informacni_system
{
    public partial class show_article : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            global_template gT = new global_template();
            DataTable complete = new DataTable();
            
            gT.DB_ExecuteTable("Select filename,name_author,name_article from tbl_article",complete);
            if (!IsPostBack)
            {
                //vyplneni prvni tabulky pri prvnim nacteni jinak se neprovadi
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/Uploads/"));
                DataTable uploads = new DataTable();
                DataRow dr;
                uploads.Columns.Add("filename");
                uploads.Columns.Add("author");
                uploads.Columns.Add("article");
                foreach (string filePath in filePaths)
                {

                    dr = uploads.NewRow();
                    dr["filename"] = Path.GetFileName(filePath).ToString();
                    dr["author"] = (from DataRow aR in complete.Rows
                                    where (string)aR["filename"] == (string)dr["filename"]
                                    select (string)aR["name_author"]).FirstOrDefault();
                    dr["article"] = (from DataRow aR in complete.Rows
                                     where (string)aR["filename"] == (string)dr["filename"]
                                     select (string)aR["name_article"]).FirstOrDefault();
                    uploads.Rows.Add(dr);
                }
                GridView1.DataSource = uploads;
                GridView1.DataBind();
            
            //pokud by se neco zmenilo tak se nove soubory nenactou
                string[] filePaths_aproved = Directory.GetFiles(Server.MapPath("~/Aproved/"));
                DataTable aproved = new DataTable();
                DataRow ap;
                aproved.Columns.Add("filename");
                aproved.Columns.Add("author");
                aproved.Columns.Add("article");
            
                    foreach (string filePathaproved in filePaths_aproved)
                    {

                        ap = aproved.NewRow();
                        ap["filename"] = Path.GetFileName(filePathaproved).ToString();
                        ap["author"] = (from DataRow aR in complete.Rows
                                        where (string)aR["filename"] == (string)ap["filename"]
                                        select (string)aR["name_author"]).FirstOrDefault();
                        ap["article"] = (from DataRow aR in complete.Rows
                                         where (string)aR["filename"] == (string)ap["filename"]
                                         select (string)aR["name_article"]).FirstOrDefault();
                    aproved.Rows.Add(ap);

                    }
              


                GridView2.DataSource = aproved;
                GridView2.DataBind();
            }
        }

            protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            Label lb = (Label)GridView1.Rows[gr.RowIndex].FindControl("Label4");
            string filePath = Server.MapPath("~/Uploads/" + lb.Text);
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
            Response.WriteFile(filePath);
            Response.End();
           
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
       
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            for(int i = 0; i < GridView1.Rows.Count; i++)
            {
                CheckBox ch = (CheckBox)GridView1.Rows[i].FindControl("theCheckBox");
                Label lb = (Label)GridView1.Rows[i].FindControl("Label4");
                if (ch.Checked == true)
                {
            string sourceFile = Server.MapPath("~/Uploads/" + lb.Text);
            string destinationFolder = Server.MapPath("~/Aproved/" + lb.Text);
            System.IO.File.Move(sourceFile, destinationFolder);
                }
            }
            Response.Redirect("~/show_article.aspx");
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
           

        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "openPdf")
            {
                GridView grid = sender as GridView;
                int index = Convert.ToInt32(e.CommandArgument);
                Label Text1 = (Label)GridView2.Rows[index].FindControl("Label6");
                string FilePath =Text1.Text;
                WebClient User = new WebClient();
                String FileBuffer = ("~/Aproved/" + FilePath);
                if (FileBuffer != null)
                {
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-length", FileBuffer.Length.ToString());
                    Response.WriteFile(FileBuffer);
                }
            }
            if(e.CommandName == "openDetail")
            {
                //TODO
            }
        }
    }
}