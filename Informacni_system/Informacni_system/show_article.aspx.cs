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
    int idArticle = -1;

    protected void Page_Load(object sender, EventArgs e)
    {




      DataTable query = new DataTable();
      global_template gt = new global_template();
      //gt.DB_ExecuteNonQuery("UPDATE tbl_article SET state=1 WHERE id_article=10");
      //gt.DB_ExecuteNonQuery("ALTER TABLE tbl_article ALTER COLUMN state SET DEFAULT 1");
      //gt.DB_ExecuteNonQuery("ALTER TABLE tbl_article ALTER COLUMN magazine SET DEFAULT 1");
      //gt.DB_ExecuteTable("SELECT * FROM tbl_review2", query);
      gt.DB_ExecuteTable("SELECT * FROM tbl_review_list", query);




      if (!IsPostBack)
      {
        //vyplneni prvni tabulky pri prvnim nacteni jinak se neprovadi


        articleDataBind();

      }
    }

    //protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //  GridViewRow gr = GridView1.SelectedRow;
    //  Label lb = (Label)GridView1.Rows[gr.RowIndex].FindControl("Label4");
    //  string filePath = Server.MapPath("~/Uploads/" + lb.Text);
    //  Response.ContentType = ContentType;
    //  Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
    //  Response.WriteFile(filePath);
    //  Response.End();

    //}

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

    //protected void Button1_Click1(object sender, EventArgs e)
    //{
    //  for (int i = 0; i < GridView1.Rows.Count; i++)
    //  {
    //    CheckBox ch = (CheckBox)GridView1.Rows[i].FindControl("theCheckBox");
    //    Label lb = (Label)GridView1.Rows[i].FindControl("Label4");
    //    if (ch.Checked == true)
    //    {
    //      string sourceFile = Server.MapPath("~/Uploads/" + lb.Text);
    //      string destinationFolder = Server.MapPath("~/Aproved/" + lb.Text);
    //      System.IO.File.Move(sourceFile, destinationFolder);
    //    }
    //  }
    //  Response.Redirect("~/show_article.aspx");
    //}

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {


    }

    //protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    //{
    //  if (e.CommandName == "openPdf")
    //  {
    //    GridView grid = sender as GridView;
    //    int index = Convert.ToInt32(e.CommandArgument);
    //    Label Text1 = (Label)GridView2.Rows[index].FindControl("Label6");
    //    string FilePath = Text1.Text;
    //    WebClient User = new WebClient();
    //    String FileBuffer = ("~/Aproved/" + FilePath);
    //    if (FileBuffer != null)
    //    {
    //      Response.ContentType = "application/pdf";
    //      Response.AddHeader("content-length", FileBuffer.Length.ToString());
    //      Response.WriteFile(FileBuffer);
    //    }
    //  }
 
    //}

    /**
    * Funkce na inicializaci udaju na strance
    * @author Robert Havranek
    */
    protected void detailInit(int idArticle)
    {

      recenzeDiv1.Visible = false;
      recenzeDiv2.Visible = false;
      allowButtonDiv.Visible = false;
      acrejButtonDiv.Visible = false;

      global_template gt = new global_template();
      DataTable articles = new DataTable();
      //natazeni clanku
      gt.DB_ExecuteTable("SELECT * FROM tbl_article WHERE id_article='" + idArticle + "'", articles);
      DataRow article = articles.Rows[0];

      int stateClanku = (int)article[4];
      string nazevClanku = article[1].ToString();
      string autorClanku = article[2].ToString();

      string magazineID = articles.Rows[0]["magazine"].ToString();
      DataTable magazineFromID = new DataTable();
      gt.DB_ExecuteTable("SELECT name FROM tbl_magazine WHERE id_magazine=" + magazineID,magazineFromID);

      string magazineName = magazineFromID.Rows[0][0].ToString();

      nazevClankuLb.Text = "Název článku: " +nazevClanku;
      authorClankuLb.Text = "Autor článku: " + autorClanku;
      magazinClankuLb.Text = "Číslo magazínu: " + magazineName;
      stateChanger(stateClanku);

      if (stateClanku != 1)
      {
        divCheckMagazineTheme.Visible = false;
      }
      if (stateClanku != 3)
      {
        divRecenzentAssigning.Visible = false;
      }
      else

      {

        divRecenzentAssigning.Visible = true;

        DataTable recenzenti = new DataTable();
        gt.DB_ExecuteTable("SELECT *,CONCAT(name,' ',surname) namefull FROM tbl_user WHERE role=2", recenzenti);

        ddlRecenzenti1.DataTextField = "namefull";
        ddlRecenzenti1.DataValueField = "id_user";
        ddlRecenzenti1.DataSource = recenzenti;
        ddlRecenzenti1.DataBind();

        ddlRecenzenti2.DataTextField = "namefull";
        ddlRecenzenti2.DataValueField = "id_user";
        ddlRecenzenti2.DataSource = recenzenti;
        ddlRecenzenti2.DataBind();

      }



      if (stateClanku < 4)
        return;
      DataTable reviewsList = new DataTable();
      gt.DB_ExecuteTable("SELECT * FROM tbl_review_list WHERE id_article='" + idArticle + "'", reviewsList);
      DataRow reviewList = reviewsList.Rows[0];
      int IdReviewer1, IdReviewer2;
      try
      {
        IdReviewer1 = Convert.ToInt32(reviewList[1]);
        IdReviewer2 = Convert.ToInt32(reviewList[2]);
        ratingRecenzent1.Text = "Recenzent: " + getUser(IdReviewer1);
        ratingRecenzent2.Text = "Recenzent: " + getUser(IdReviewer2);
      }
      catch
      {
        //jeste nebyli urceni recenzenti -> ukoncit funkci
        return;
      }

      int IdReview1, IdReview2;
      try
      {
        IdReview1 = Convert.ToInt32(reviewList[4]);
      }
      catch
      {
        IdReview1 = -1;
      }

      try
      {
        IdReview2 = Convert.ToInt32(reviewList[5]);
      }
      catch
      {
        IdReview2 = -1;
      }
      reviewInit(IdReview1, IdReview2);
      if (Convert.ToInt32(reviewList[7]) == 1)
      {
        stavZverejnen.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
      }
    }
    /**
    * Funkce na zjisteni jmena recenzenta
    * @author Robert Havranek
    * @param idRec id recenzenta
    * @return string Jmeno a prijmeni recenzenta
    */
    protected string getUser(int idRec)
    {
      global_template gt = new global_template();
      DataTable users = new DataTable();
      gt.DB_ExecuteTable("SELECT * FROM tbl_user WHERE id_user='" + idRec + "'", users);
      DataRow user = users.Rows[0];
      string uNameSur = user[2].ToString() + " " + user[3].ToString();
      return uNameSur;
    }


    /**
    * Funkce na inicializaci recenzi
    * @author Robert Havranek
    */
    protected void reviewInit(int rev1, int rev2)
    {
      global_template gt = new global_template();

      if (rev1 != -1)
      {
        DataTable reviewTable1 = new DataTable();

        gt.DB_ExecuteTable("SELECT * FROM tbl_review2 WHERE id_review='" + rev1 + "'", reviewTable1);
        DataRow review1 = reviewTable1.Rows[0];

        ratingInterest1.Text = starIt(Convert.ToInt32(review1[1]));
        ratingOriginality1.Text = starIt(Convert.ToInt32(review1[2]));
        ratingLevel1.Text = starIt(Convert.ToInt32(review1[3]));
        ratingLanguage1.Text = starIt(Convert.ToInt32(review1[4]));

        ratingText1.Text = review1[5].ToString();

        stavPosudek1.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
        recenzeDiv1.Visible = true;
      }
      else
      {
        recenzeDiv1.Visible = false;
        stavPosudek1.Text = "<i class=\"fa fa-times-circle fauncheck\"></i>";
      }

      if (rev2 != -1)
      {
        DataTable reviewTable2 = new DataTable();
        gt.DB_ExecuteTable("SELECT * FROM tbl_review2 WHERE id_review='" + rev2 + "'", reviewTable2);
        DataRow review2 = reviewTable2.Rows[0];

        ratingInterest2.Text = starIt(Convert.ToInt32(review2[1]));
        ratingOriginality2.Text = starIt(Convert.ToInt32(review2[2]));
        ratingLevel2.Text = starIt(Convert.ToInt32(review2[3]));
        ratingLanguage2.Text = starIt(Convert.ToInt32(review2[4]));

        ratingText2.Text = review2[5].ToString();

        stavPosudek2.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
        recenzeDiv2.Visible = true;
      }
      else
      {
        recenzeDiv2.Visible = false;
        stavPosudek2.Text = "<i class=\"fa fa-times-circle fauncheck\"></i>";
      }
      if (rev1 != -1 && rev2 != -1)
      {
        allowButtonDiv.Visible = true;
        acrejButtonDiv.Visible = true;
      }
    }

    /**
    * Funkce na inicializaci udaju na strance
    * @author Robert Havranek
    * @param state Stav ve kterem se clanek nachazi
    */
    protected void stateChanger(int state)
    {
      switch (state)
      {
        case 1:
          stavNovePodany.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavStanoveniRec.Text = "<i class=\"fa fa-times-circle fauncheck\"></i>";
          stavRecenze.Text = "<i class=\"fa fa-times-circle fauncheck\"></i>";
          stavUpravaAutor.Text = "<i class=\"fa fa-times-circle fauncheck\"></i>";
          stavKonec.Text = "<i class=\"fa fa-times-circle fauncheck\"></i>";
          break;
        case 2:
          stavNovePodany.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavStanoveniRec.Text = "<i class=\"fa fa-times-circle fauncheck\"></i>";
          stavRecenze.Text = "<i class=\"fa fa-times-circle fauncheck\"></i>";
          stavUpravaAutor.Text = "<i class=\"fa fa-times-circle fauncheck\"></i>";
          stavKonec.Text = "Tématická nevhodnost";
          break;
        case 3:
          stavNovePodany.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavStanoveniRec.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavRecenze.Text = "<i class=\"fa fa-times-circle fauncheck\"></i>";
          stavUpravaAutor.Text = "<i class=\"fa fa-times-circle fauncheck\"></i>";
          stavKonec.Text = "<i class=\"fa fa-times-circle fauncheck\"></i>";
          break;
        case 4:
          stavNovePodany.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavStanoveniRec.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavRecenze.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavUpravaAutor.Text = "<i class=\"fa fa-times-circle fauncheck\"></i>";
          stavKonec.Text = "<i class=\"fa fa-times-circle fauncheck\"></i>";
          break;
        case 5:
          stavNovePodany.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavStanoveniRec.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavRecenze.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavUpravaAutor.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavKonec.Text = "<i class=\"fa fa-times-circle fauncheck\"></i>";
          break;
        case 6:
          stavNovePodany.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavStanoveniRec.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavRecenze.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavUpravaAutor.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavKonec.Text = "Přijato";
          break;
        case 7:
          stavNovePodany.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavStanoveniRec.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavRecenze.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavUpravaAutor.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavKonec.Text = "Přijato s výhradami";
          break;
        case 8:
          stavNovePodany.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavStanoveniRec.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavRecenze.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavUpravaAutor.Text = "<i class=\"fa fa-check-circle facheck\"></i>";
          stavKonec.Text = "Zamítnuto";
          break;
      }
    }

    /**
    * Fukce na prevedeni hvezd do stringu
    * @author Robert Havranek
    * @param rev Znamka, ktera se preveda na stars
    * @return string w star
    */
    public string starIt(int rev)
    {
      string stars = "";
      switch (rev)
      {
        case 1:
          stars = "<i class=\"fa fa-star fastar\"></i><i class=\"fa fa-star fastar\"></i><i class=\"fa fa-star fastar\"></i><i class=\"fa fa-star fastar\"></i><i class=\"fa fa-star fastar\"></i>";
          break;
        case 2:
          stars = "<i class=\"fa fa-star fastar\"></i><i class=\"fa fa-star fastar\"></i><i class=\"fa fa-star fastar\"></i><i class=\"fa fa-star fastar\"></i>";
          break;
        case 3:
          stars = "<i class=\"fa fa-star fastar\"></i><i class=\"fa fa-star fastar\"></i><i class=\"fa fa-star fastar\"></i>";
          break;
        case 4:
          stars = "<i class=\"fa fa-star fastar\"></i><i class=\"fa fa-star fastar\"></i>";
          break;
        case 5:
          stars = "<i class=\"fa fa-star fastar\"></i>";
          break;
      }
      return stars;
    }

    /**
    * Povolit zobrazeni recenzi autorovi
    * @author Robert Havranek
    */
    protected void allowAccess_Click(object sender, EventArgs e)
    {
      global_template gt = new global_template();

      gt.DB_ExecuteNonQuery("UPDATE tbl_review_list SET author_allowed = '1' WHERE id_article='" + hfArticleID.Value + "'");
    }

    protected void rejectArt_Click(object sender, EventArgs e)
    {
      global_template gt = new global_template();
      gt.DB_ExecuteNonQuery("UPDATE tbl_article SET accepted = '0' WHERE id_article='" + hfArticleID.Value + "'");
      gt.DB_ExecuteNonQuery("UPDATE tbl_article SET state = '8' WHERE id_article='" + hfArticleID.Value + "'");
    }

    protected void aceptArt_Click(object sender, EventArgs e)
    {
      global_template gt = new global_template();
      gt.DB_ExecuteNonQuery("UPDATE tbl_article SET accepted = '1' WHERE id_article='" + hfArticleID.Value + "'");
      gt.DB_ExecuteNonQuery("UPDATE tbl_article SET state = '6' WHERE id_article='" + hfArticleID.Value + "'");
    }


    protected void btnDetail_Click(object sender, EventArgs e)
    {
      var button = (System.Web.UI.WebControls.Button)sender;
      int id = Int32.Parse(button.Attributes["Value"]);

      hfArticleID.Value = id.ToString();



      detailInit(id);

      pnlArticleOverview.Visible = false;
      pnlArticleDetail.Visible = true;

    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
      global_template gt = new global_template();

      var button = (System.Web.UI.WebControls.Button)sender;
      int id = Int32.Parse(button.Attributes["Value"]);
            deleteFile(id);
      gt.DB_ExecuteNonQuery("DELETE FROM tbl_article WHERE id_article=" + id);

      articleDataBind();
    }

    protected void articleDataBind()
    {

      global_template gT = new global_template();
      DataTable complete = new DataTable();

      gT.DB_ExecuteTable("SELECT a.ID_article,a.name_article, a.name_author,a.accepted,a.filename,s.state,m.name magazine FROM tbl_article a LEFT OUTER JOIN tbl_magazine m ON a.magazine=m.ID_magazine LEFT OUTER JOIN tbl_states s ON a.state=s.ID_state", complete);
            gv_ArticleOverview.Columns[6].Visible = false;

            if (Session["role"] !=null) {
                gv_ArticleOverview.Columns[6].Visible = true;
            }
            
      gv_ArticleOverview.DataSource = complete;
      gv_ArticleOverview.DataBind();
    }


    protected void btnThemeChecks_click(object sender, EventArgs e)
    {

      global_template gT = new global_template();

      gT.DB_ExecuteNonQuery("UPDATE tbl_article SET state=3 WHERE id_article=" + int.Parse(hfArticleID.Value));
      detailInit(int.Parse(hfArticleID.Value));


      articleDataBind();
    }

    protected void btnThemeIncorrect_click(object sender, EventArgs e)
    {

      global_template gT = new global_template();

      gT.DB_ExecuteNonQuery("UPDATE tbl_article SET state=2 WHERE id_article=" + int.Parse(hfArticleID.Value));
      detailInit(int.Parse(hfArticleID.Value));


      articleDataBind();
    }

    protected void btnAssignRecenzent_Click(object sender, EventArgs e)
    {
      global_template gT = new global_template();

      gT.DB_ExecuteNonQuery("INSERT INTO tbl_review_list (id_reviewer1,id_reviewer2,id_article,deadline,author_allowed) VALUES (" + ddlRecenzenti1.SelectedValue + "," + ddlRecenzenti2.SelectedValue + "," + hfArticleID.Value + ",'" + tbRecenzeDeadline.Text + "',0)");
      gT.DB_ExecuteNonQuery("UPDATE tbl_article SET state=4 WHERE id_article=" + hfArticleID.Value);

      detailInit(int.Parse(hfArticleID.Value));

    }

   

        protected void btnOpen_Click(object sender, EventArgs e)
        {
            var button = (System.Web.UI.WebControls.Button)sender;
            string FilePath = button.Attributes["Value"];
            String FileBuffer = ("~/Aproved/" + FilePath);
            if (FileBuffer != null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", FileBuffer.Length.ToString());
                Response.WriteFile(FileBuffer);
            }
        }
        protected void deleteFile(int id)
        { 

            global_template gT = new global_template();
            DataTable complete = new DataTable();
            gT.DB_ExecuteTable("Select id_article,filename from tbl_article where id_article=" + id, complete);
            string path = complete.Rows[0].Field<string>(1);
            string filePath = Server.MapPath("~/Aproved/"+path.ToString());
            File.Delete(filePath);
        }

        protected void gv_ArticleOverview_DataBound(object sender, EventArgs e)
        {
            /* if (Session["role"] != null)
             {
                 string role = (string)Session["role"];
                 int.TryParse(role, out int i);
                 foreach (GridViewRow rw in gv_ArticleOverview.Rows)
                 {

                     Label lb = (Label)rw.FindControl("lbArticle_accepted");
                     string text = lb.Text;
                     if ((i <= 2) && (text == "false"))
                         rw.Visible = false;
                 }
             }*///todo

            foreach (GridViewRow rw in gv_ArticleOverview.Rows)
            {
                Label lb = (Label)rw.FindControl("lbArticle_accepted");
                string text = lb.Text;

                if (Session["name"] == null)
                {
                    if (text == "False") {
                        rw.Visible = false;
                    }
                }
            }
        }

        protected void gv_ArticleOverview_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }

    
}