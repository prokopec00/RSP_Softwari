using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Informacni_system
{
    public partial class reviewV2 : System.Web.UI.Page
    {
        //Pro testovaci uceli. Nastavit potom na session
        //int loggedUser = 1;
        //int loggedUser = Convert.ToInt32(Session["userID"]);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                reviewDataBind();
            }
        }

        /**
        * Inicializace dat v gridView
        * @author Robert Havranek
        */
        protected void reviewDataBind()
        {
            global_template gT = new global_template();
            DataTable query = new DataTable();
            DataTable pre = new DataTable();
            DataTable post = new DataTable();
            pre.Columns.Add("deadline", typeof(DateTime));
            pre.Columns.Add("name_article", typeof(string));
            pre.Columns.Add("name_author", typeof(string));
            pre.Columns.Add("id_review1", typeof(int));
            pre.Columns.Add("id_review2", typeof(int));
            pre.Columns.Add("id_reviewer1", typeof(int));
            pre.Columns.Add("id_reviewer2", typeof(int));
            pre.Columns.Add("id_review_list", typeof(int));

            post.Columns.Add("deadline", typeof(DateTime));
            post.Columns.Add("name_article", typeof(string));
            post.Columns.Add("name_author", typeof(string));
            post.Columns.Add("id_review1", typeof(int));
            post.Columns.Add("id_review2", typeof(int));
            post.Columns.Add("id_reviewer1", typeof(int));
            post.Columns.Add("id_reviewer2", typeof(int));
            post.Columns.Add("id_review_list", typeof(int));

            gT.DB_ExecuteTable("SELECT r.deadline, a.name_article, a.name_author, r.id_review1, r.id_review2, r.id_reviewer1, r.id_reviewer2, r.id_review_list FROM tbl_review_list r INNER JOIN tbl_article a ON r.id_article = a.id_article WHERE (r.id_reviewer1 = " + Session["userID"] + " OR r.id_reviewer2 = " + Session["userID"] + ")", query);

            //naplneni tabulek, podle toho jestli uz recenzent zrecenzoval
            foreach (DataRow row in query.Rows)
            {
                //zjisteni,jestli je dan jako reviever1 nebo 2
                if (row["id_reviewer1"].ToString() == Session["userID"].ToString())
                {
                    if (row["id_review1"].ToString() == "")
                    {
                        //neni zrecenzovano -> dat do pre
                        //pre.Rows.Add(row.ItemArray);
                        pre.ImportRow(row);
                    }
                    else
                    {
                        //je zrecenzovano -> dat do post
                        //post.Rows.Add(row.ItemArray);
                        post.ImportRow(row);
                    }
                }
                else
                {
                    if (row["id_review2"].ToString() == "")
                    {
                        //neni zrecenzovano -> dat do pre
                        //pre.Rows.Add(row.ItemArray);
                        pre.ImportRow(row);
                    }
                    else
                    {
                        //je zrecenzovano -> dat do post
                        //post.Rows.Add(row.ItemArray);
                        post.ImportRow(row);
                    }
                }
            }

            recenzeGridView.DataSource = pre;
            recenzeGridView.DataBind();
            recenzeDoneGridView.DataSource = post;
            recenzeDoneGridView.DataBind();
        }

        /**
        * Inicializace recenzniho formulare na recenzi
        * @author Robert Havranek
        */
        protected void btnRecenzovat_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "showRecenzniForm", "showRecenzniForm()", true);
            global_template gt = new global_template();

            var button = (System.Web.UI.WebControls.Button)sender;
            int idReviewList = Int32.Parse(button.Attributes["Value"]);
            hiddenIDlist.Value = idReviewList.ToString();
        }

        /**
        * Inicializace hotoveho recenzniho formulare
        * @author Robert Havranek
        */
        protected void btnZobrazitRecenzi_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "showRecenzniDoneForm", "showRecenzniDoneForm()", true);
            global_template gt = new global_template();

            var button = (System.Web.UI.WebControls.Button)sender;
            int id = Int32.Parse(button.Attributes["Value"]);
            int idReview;

            DataTable reviewList = new DataTable();
            gt.DB_ExecuteTable("SELECT id_reviewer1, id_reviewer2, id_review1, id_review2 FROM tbl_review_list WHERE id_review_list =" + id, reviewList);
            DataRow rowReviewList = reviewList.Rows[0];

            if (rowReviewList[0].ToString() == Session["userID"].ToString())
            {
                idReview = Convert.ToInt32(rowReviewList[2]);
            }
            else
            {
                idReview = Convert.ToInt32(rowReviewList[3]);
            }

            DataTable reviews = new DataTable();
            gt.DB_ExecuteTable("SELECT * FROM tbl_review2 WHERE id_review =" + idReview, reviews);
            DataRow review = reviews.Rows[0];

            show_article sa = new show_article();
            done1.Text = sa.starIt(Convert.ToInt32(review[1]));
            done2.Text = sa.starIt(Convert.ToInt32(review[2]));
            done3.Text = sa.starIt(Convert.ToInt32(review[3]));
            done4.Text = sa.starIt(Convert.ToInt32(review[4]));
            done5.Text = review[5].ToString();
        }

        protected void saveReview_Click(object sender, EventArgs e)
        {
            global_template gt = new global_template();
            string datum = DateTime.Now.ToString("yyyy-MM-dd");

            //vlozeni recenze do tabulky
            gt.DB_ExecuteNonQuery("INSERT INTO tbl_review2 (rating_interest, rating_originality, rating_level, rating_language, reting_text, date_review) VALUES (" + dropDown1.SelectedValue.ToString() + ", " + dropDown2.SelectedValue.ToString() + ", " + dropDown3.SelectedValue.ToString() + ", " + dropDown4.SelectedValue.ToString() + ", '" + tbOpenAnswer.Text + "', '" + datum + "')");

            //nalezeni ID nove recenze
            DataTable revs = new DataTable();
            gt.DB_ExecuteTable("SELECT * FROM tbl_review2 ORDER BY id_review DESC LIMIT 1", revs);
            DataRow lastRow = revs.Rows[0];

            int idReview = Convert.ToInt32(lastRow[0]);

            //vlozeni recenze do reviewListu
            DataTable reviewList = new DataTable();
            gt.DB_ExecuteTable("SELECT id_reviewer1, id_reviewer2, id_review1, id_review2 FROM tbl_review_list WHERE id_review_list = " + hiddenIDlist.Value, reviewList);
            DataRow rowReviewList = reviewList.Rows[0];
            if (rowReviewList[0].ToString() == Session["userID"].ToString())
            {
                //vlozit id recenze do id_review1
                gt.DB_ExecuteNonQuery("UPDATE tbl_review_list SET id_review1= " + idReview + " WHERE id_review_list = " + hiddenIDlist.Value);
            }
            else
            {
                //vlozit id recenze do id_review2
                gt.DB_ExecuteNonQuery("UPDATE tbl_review_list SET id_review2= " + idReview + " WHERE id_review_list = " + hiddenIDlist.Value);
            }
        }
    }
}