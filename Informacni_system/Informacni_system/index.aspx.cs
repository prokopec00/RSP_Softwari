using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Informacni_system
{
  public partial class Index : System.Web.UI.Page
  {
    global_template gTemplate = new global_template();

    protected void Page_Load(object sender, EventArgs e)
    {
      //gTemplate.DB_ExecuteNonQuery("INSERT INTO test VALUES ('2', 'abcde') ");

      //DataTable test = new DataTable();
      //gTemplate.DB_ExecuteTable("SELECT * FROM test", test);

    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
      Response.Redirect("show_article.aspx");
    }
  }
}