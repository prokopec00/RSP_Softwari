using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Informacni_system
{
  public partial class sefredaktor_prehled : System.Web.UI.Page
  {
    protected void Page_Load(object sender, EventArgs e)
    {

      if (Session["userID"] == null || !Session["role"].ToString().Equals("4"))
      {
        Response.Redirect("index.aspx");
      }


      if (!IsPostBack)
      {
        autorInit();
        redaktorInit();
        recenzeInit();
      }
    }

    protected void autorInit()
    {
      global_template gT = new global_template();
      DataTable complete = new DataTable();

      gT.DB_ExecuteTable("SELECT a.ID_article,a.name_article, a.name_author, s.state, m.name magazine FROM tbl_article a LEFT OUTER JOIN tbl_magazine m ON a.magazine=m.ID_magazine LEFT OUTER JOIN tbl_states s ON a.state=s.ID_state WHERE a.state = 1 OR a.state = 2 OR a.state = 5 ORDER BY a.ID_article DESC", complete);

      autorPrehledGV.DataSource = complete;
      autorPrehledGV.DataBind();

    }

    protected void redaktorInit()
    {
      global_template gT = new global_template();
      DataTable complete = new DataTable();

      gT.DB_ExecuteTable("SELECT a.ID_article,a.name_article, a.name_author, s.state, m.name magazine FROM tbl_article a LEFT OUTER JOIN tbl_magazine m ON a.magazine=m.ID_magazine LEFT OUTER JOIN tbl_states s ON a.state=s.ID_state WHERE a.state <> 1 AND a.state <> 2 AND a.state <> 5 ORDER BY a.ID_article DESC", complete);

      redaktorPrehledGV.DataSource = complete;
      redaktorPrehledGV.DataBind();

    }

    protected void recenzeInit()
    {
      global_template gT = new global_template();
      DataTable rev1 = new DataTable();
      DataTable rev2 = new DataTable();

      DataTable rev3 = new DataTable();
      DataTable rev4 = new DataTable();

      gT.DB_ExecuteTable("SELECT a.id_review_list, b.username, c.name_article FROM tbl_review_list a JOIN tbl_user b ON a.id_reviewer1 = b.id_user JOIN tbl_article c ON a.id_article = c.id_article WHERE a.id_review1 IS NOT NULL", rev1);
      gT.DB_ExecuteTable("SELECT a.id_review_list, b.username, c.name_article FROM tbl_review_list a JOIN tbl_user b ON a.id_reviewer2 = b.id_user JOIN tbl_article c ON a.id_article = c.id_article WHERE a.id_review2 IS NOT NULL", rev2);

      gT.DB_ExecuteTable("SELECT a.id_review_list, b.username, c.name_article FROM tbl_review_list a JOIN tbl_user b ON a.id_reviewer1 = b.id_user JOIN tbl_article c ON a.id_article = c.id_article WHERE a.id_review1 IS NULL", rev3);
      gT.DB_ExecuteTable("SELECT a.id_review_list, b.username, c.name_article FROM tbl_review_list a JOIN tbl_user b ON a.id_reviewer2 = b.id_user JOIN tbl_article c ON a.id_article = c.id_article WHERE a.id_review2 IS NULL", rev4);

      rev1.Merge(rev2);
      rev3.Merge(rev4);

      recenzePrehledGV.DataSource = rev1;
      recenzePrehledGV2.DataSource = rev2;

      recenzePrehledGV2.DataBind();
      recenzePrehledGV.DataBind();
    }

  }
}