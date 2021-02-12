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
        recenzevalidInit();
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

            //klob
            //autorPrehledGV0.DataSource = complete;
            //autorPrehledGV0.DataBind();
        }

    protected void redaktorInit()
    {
      global_template gT = new global_template();
      DataTable complete = new DataTable();

      gT.DB_ExecuteTable("SELECT a.ID_article,a.name_article, a.name_author, s.state, m.name magazine FROM tbl_article a LEFT OUTER JOIN tbl_magazine m ON a.magazine=m.ID_magazine LEFT OUTER JOIN tbl_states s ON a.state=s.ID_state WHERE a.state <> 1 AND a.state <> 2 AND a.state <> 5 ORDER BY a.ID_article DESC", complete);

      redaktorPrehledGV.DataSource = complete;
      redaktorPrehledGV.DataBind();

    }

        //klob
        protected void recenzevalidInit()
        {
            global_template gT = new global_template();
            DataTable complete = new DataTable();

            //gT.DB_ExecuteTable("SELECT a.name_article, c.username, d.review_validity " +
            //    "FROM tbl_article AS a " +
            //    "INNER JOIN tbl_review_list AS b ON a.id_article = b.id_article " +
            //    "INNER JOIN tbl_user AS c ON b.id_reviewer1 = c.id_user" +
            //    "INNER JOIN tbl_review2 AS d ON b.id_review1 = d.id_review OR b.id_review2 = d.id_review" +
            //    "WHERE d.review_validity = 0" +
            //    "", complete);
            gT.DB_ExecuteTable("SELECT a.name_article,a.ID_article, a.name_author, d.username, c.id_review FROM tbl_article a " +
                "JOIN tbl_review_list b ON a.id_article = b.id_article " +
                "JOIN tbl_review2 c ON b.id_review1 = c.id_review " +
                "JOIN tbl_user d ON b.id_reviewer1 = d.id_user " +
                "WHERE c.review_validity = 0 " +
                "ORDER BY a.ID_article DESC", complete);

            //gT.DB_ExecuteTable("SELECT a.name_article, c.username " +
            //   "FROM tbl_article a " +
            //   "LEFT OUTER JOIN tbl_review_list b ON a.id_article = b.id_article " +
            //   "LEFT OUTER JOIN tbl_user c ON b.id_reviewer1 = c.id_user" +
            //   "" +
            //   "WHERE a.name_article <> Logo" +
            //   "ORDER BY c.username DESC", complete);


            autorPrehledGV0.DataSource = complete;
            autorPrehledGV0.DataBind();

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
            //todo opravit chybu mozna
      recenzePrehledGV.DataSource = rev1;
      recenzePrehledGV2.DataSource = rev2;

      recenzePrehledGV2.DataBind();
      recenzePrehledGV.DataBind();
    }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //select article id=textbox 
            //state to 2 reassign reviewers

        }
    }
}