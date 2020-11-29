using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Informacni_system
{
    public partial class addArticle : System.Web.UI.Page
    {
      
        DataTable tbl = new DataTable();


        global_template gT = new global_template();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/Aproved/"));
                
                DataTable complete = new DataTable();
               
               string sql = "Select filename,name_author,name_article from tbl_article";
                gT.DB_ExecuteTable(sql, complete);

                

                GridView1.DataSource = complete;
                GridView1.DataBind();
            }
     
            autorJmeno.Text = (string)Session["username"];
            gT.DB_ExecuteTable("Select id_magazine,name from tbl_magazine", tbl);
            List<string> magazines = new List<string>();
           for(int i = 0; i < tbl.Rows.Count; i++)
            {
                magazines.Add((string) tbl.Rows[i]["name"]);
            }
            magazinList.DataSource = magazines;
            magazinList.DataBind();

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
            string fileName = Path.GetFileName(filePath);
             string task1 = "Delete from tbl_article where filename='"+fileName+"'";
            gT.DB_ExecuteNonQuery(task1);
            File.Delete(filePath);
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void Upload_Click(object sender, EventArgs e)
        {
            /*string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            try
            {
                int id_magazine = tbl.Rows[0].Field<int>(magazinList.SelectedIndex);
                string task1 = "Insert into tbl_article(name_article,name_author,filename,magazine) values('"+ clanekJmeno.Text + "','" + autorJmeno.Text+"','" + fileName+"','"+id_magazine+"')";
                gT.DB_ExecuteNonQuery(task1);
                //FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Aproved/") + fileName);
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch (System.IO.IOException)
            {
                Response.Write("<script>alert('Vyberte soubor.');</script>");
            }*/
        }

        protected void Checked_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "dowload")
            {
                GridView grid = sender as GridView;
                int index = Convert.ToInt32(e.CommandArgument);
                Label lb = (Label)GridView1.Rows[index].FindControl("Label3");
                string filePath = Server.MapPath("~/Aproved/" + lb.Text);
                Response.ContentType = ContentType;
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.WriteFile(filePath);
                Response.End();
            }
            if (e.CommandName == "delete")
            {
                GridView grid = sender as GridView;
                int index = Convert.ToInt32(e.CommandArgument);
                Label lb = (Label)GridView1.Rows[index].FindControl("Label3");
                string filePath = Server.MapPath("~/Aproved/" + lb.Text);
                string task1 = "Delete from tbl_article where filename='" + lb.Text + "'";
                gT.DB_ExecuteNonQuery(task1);
                File.Delete(filePath);
                Response.Redirect(Request.Url.AbsoluteUri);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void uploadBtn_Click(object sender, EventArgs e)
        {
            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            
            try
            {
                int id_magazine = tbl.Rows[0].Field<int>(magazinList.SelectedIndex);
                string task1 = "Insert into tbl_article(name_article,name_author,filename,magazine) values('" + clanekJmeno.Text + "','" + autorJmeno.Text + "','" + fileName + "','" + id_magazine + "')";
                gT.DB_ExecuteNonQuery(task1);
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Aproved/") + fileName);
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch (System.IO.IOException)
            {
                Response.Write("<script>alert('Vyberte soubor.');</script>");
            }
        }
    }
}