using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Informacni_system
{
    public partial class artDetailRedaktor : System.Web.UI.Page
    {
        //zatim na pevno jeden clanek -> poresit metodou POST
        int idArticle = 12;

        protected void Page_Load(object sender, EventArgs e)
        {
            recenzeDiv1.Visible = false;
            recenzeDiv2.Visible = false;
            allowButtonDiv.Visible = false;
            acrejButtonDiv.Visible = false;
            detailInit();
        }

        /**
        * Funkce na inicializaci udaju na strance
        * @author Robert Havranek
        */
        protected void detailInit()
        {
            global_template gt = new global_template();
            DataTable articles = new DataTable();
            //natazeni clanku
            gt.DB_ExecuteTable("SELECT * FROM tbl_article WHERE id_article='" + idArticle + "'", articles);
            DataRow article = articles.Rows[0];

            int stateClanku = (int)article[4];
            string nazevClanku = article[1].ToString();
            string autorClanku = article[2].ToString();

            nazevClankuLb.Text = nazevClanku;
            authorClankuLb.Text = autorClanku;
            stateChanger(stateClanku);

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
            if(Convert.ToInt32(reviewList[7]) == 1)
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
            
            if(rev1 != -1)
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
            if(rev1 != -1 && rev2 != -1)
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
        protected string starIt(int rev)
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
            gt.DB_ExecuteNonQuery("UPDATE tbl_review_list SET author_allowed = '1' WHERE id_article='" + idArticle + "'");
        }

        protected void rejectArt_Click(object sender, EventArgs e)
        {
            global_template gt = new global_template();
            gt.DB_ExecuteNonQuery("UPDATE tbl_article SET accepted = '0' WHERE id_article='" + idArticle + "'");
            gt.DB_ExecuteNonQuery("UPDATE tbl_article SET state = '8' WHERE id_article='" + idArticle + "'");
        }

        protected void aceptArt_Click(object sender, EventArgs e)
        {
            global_template gt = new global_template();
            gt.DB_ExecuteNonQuery("UPDATE tbl_article SET accepted = '1' WHERE id_article='" + idArticle + "'");
            gt.DB_ExecuteNonQuery("UPDATE tbl_article SET state = '6' WHERE id_article='" + idArticle + "'");
        }
    }  
}