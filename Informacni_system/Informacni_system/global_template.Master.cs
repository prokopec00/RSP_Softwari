using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Informacni_system
{
  public partial class global_template : System.Web.UI.MasterPage
  {
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void DB_ExecuteNonQuery(string sql)
    {
      MySqlConnectionStringBuilder conn_string = new MySqlConnectionStringBuilder();
      conn_string.Server = "db4free.net";
      conn_string.UserID = "rsp_prokopec";
      conn_string.Password = "freeacc123";
      conn_string.Database = "rsp_prokopec";
      conn_string.Port = 3306;

      MySqlConnection conn = new MySqlConnection(conn_string.ToString());
      conn.Open();


      MySqlCommand sqlCommand = new MySqlCommand(sql, conn);
      sqlCommand.ExecuteNonQuery();
      conn.Close();
    }

    public DataTable DB_ExecuteTable(string sql, DataTable table)
    {
      MySqlConnectionStringBuilder conn_string = new MySqlConnectionStringBuilder();
      conn_string.Server = "db4free.net";
      conn_string.UserID = "rsp_prokopec";
      conn_string.Password = "freeacc123";
      conn_string.Database = "rsp_prokopec";
      conn_string.Port = 3306;

      MySqlConnection conn = new MySqlConnection(conn_string.ToString());
      conn.Open();
      MySqlCommand sqlCommand = new MySqlCommand(sql, conn);
      MySqlDataAdapter sqlAdapter = new MySqlDataAdapter(sqlCommand);
      sqlAdapter.Fill(table);
      conn.Close();
      return table;
    }
  }
}