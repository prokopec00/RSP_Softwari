using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;

namespace Informacni_system
{
    public partial class show_article : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/Uploads/"));
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("filename");
                foreach (string filePath in filePaths)
                {
                    //files.Add(new ListItem(Path.GetFileName(filePath), filePath));
                    dr = dt.NewRow();
                    dr["filename"] = Path.GetFileName(filePath).ToString();
                    dt.Rows.Add(dr);
                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = GridView1.SelectedRow;
            string filePath = Server.MapPath("~/Uploads/" + gr.Cells[0].Text);
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
                Label lb = (Label)GridView1.Rows[i].FindControl("Label1");
                if (ch.Checked == true)
                {
            string sourceFile = Server.MapPath("~/Uploads/" + lb.Text);
            string destinationFolder = Server.MapPath("~/Aproved/" + lb.Text);
            System.IO.File.Move(sourceFile, destinationFolder);
                }
            }
            Response.Redirect("~/show_article.aspx");
        }
    }
}