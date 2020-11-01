using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Informacni_system
{
  public partial class global_template : System.Web.UI.MasterPage
  {
    protected void Page_Load(object sender, EventArgs e)
    {
      int ID_user = 1;

      DataTable notifications = new DataTable();
      DataTable notifications_notSeen = new DataTable();

      notifications_notSeen = DB_ExecuteTable("SELECT COUNT(*) FROM tbl_notification n LEFT OUTER JOIN tbl_notification_link l ON n.ID_notification=l.ID_notification WHERE seen=0 AND l.id_user =" + ID_user, notifications_notSeen);
      int notSeenCount = int.Parse(notifications_notSeen.Rows[0][0].ToString());
      badge.InnerText = notSeenCount.ToString();

      notifications = DB_ExecuteTable("SELECT * FROM tbl_notification n LEFT OUTER JOIN tbl_notification_link l ON n.ID_notification=l.ID_notification WHERE l.id_user =" + ID_user, notifications);


      menu_ul_1.DataSource = notifications;
      menu_ul_1.DataBind();

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

    public void notificationDataBind()
    {
      int ID_user = 1;

      DataTable notifications = new DataTable();
      DataTable notifications_notSeen = new DataTable();

      notifications_notSeen = DB_ExecuteTable("SELECT COUNT(*) FROM tbl_notification n LEFT OUTER JOIN tbl_notification_link l ON n.ID_notification=l.ID_notification WHERE seen=0 AND l.id_user =" + ID_user, notifications_notSeen);
      int notSeenCount = int.Parse(notifications_notSeen.Rows[0][0].ToString());
      badge.InnerText = notSeenCount.ToString();

      notifications = DB_ExecuteTable("SELECT * FROM tbl_notification n LEFT OUTER JOIN tbl_notification_link l ON n.ID_notification=l.ID_notification WHERE l.id_user =" + ID_user, notifications);


      menu_ul_1.DataSource = notifications;
      menu_ul_1.DataBind();
    }

    public void loginDataBind(object sender, EventArgs e)
    {


      loginButtons.Visible = false;
      loggedInfo.Visible = true;

    }


    public void newNotification(string Text, string Redirection)
    {
      DB_ExecuteNonQuery("INSERT INTO tbl_notification (redirect,text) VALUES ('" + Redirection + "','" + Text + "')");

    }

    public void assignNotification_toRole(DateTime date, int ID_role, int ID_notification)
    {

    }
    public void assignNotification_toUser(DateTime date, int ID_User, int ID_notification)
    {

      DB_ExecuteNonQuery("INSERT INTO tbl_notification_link (date,id_notification, id_user) VALUES ('" + date + "'," + ID_notification + "," + ID_User + ")");

    }

    protected void markAsRead(object sender, EventArgs e)
    {
      int ID_notification = int.Parse((sender as HtmlAnchor).Name.ToString());
      int ID_user = 1;

      DB_ExecuteNonQuery("UPDATE tbl_notification_link SET seen=1 WHERE ID_notification=" + ID_notification + " AND ID_user=" + ID_user);
      notificationDataBind();
    }
  }
}