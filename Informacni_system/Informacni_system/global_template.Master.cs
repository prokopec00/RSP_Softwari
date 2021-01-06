using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace Informacni_system
{
  public partial class global_template : System.Web.UI.MasterPage
  {
    protected void Page_Load(object sender, EventArgs e)
    {

      //inicializace avataru
      avatarInit();

      //aby profil v menu fungoval spravne na kazde page
      if (isLogged())
      {
        hideButtonsProfile(true);
        bindMenuForRole(int.Parse(Session["role"].ToString()));
        notificationDataBind();

      }
      else
      {
        hideButtonsProfile(false);
      }

    }

    public void notificationDataBind()
    {
      if (Session["userID"] != null)
      {
        DataTable notifications = new DataTable();
        DataTable notifications_notSeen = new DataTable();

        DB_ExecuteTable("SELECT * FROM tbl_notification n LEFT OUTER JOIN tbl_notification_link l ON n.ID_notification=l.ID_notification WHERE l.id_user =" + (Session["userID"].ToString()), notifications);
        DB_ExecuteTable("SELECT COUNT(*) FROM tbl_notification n LEFT OUTER JOIN tbl_notification_link l ON n.ID_notification=l.ID_notification WHERE seen=0 AND l.id_user =" + (Session["userID"].ToString()), notifications_notSeen);

        int notSeenCount = int.Parse(notifications_notSeen.Rows[0][0].ToString());
        badge.Visible = true;
        badge.InnerText = notSeenCount.ToString();

        menu_ul_1.DataSource = notifications;
        menu_ul_1.DataBind();
      }
    }


    public void DB_ExecuteNonQuery(string sql)
    {
      //MySqlConnectionStringBuilder conn_string = new MySqlConnectionStringBuilder();
      //conn_string.Server = "db4free.net";
      //conn_string.UserID = "rsp_prokopec";
      //conn_string.Password = "freeacc123";
      //conn_string.Database = "rsp_prokopec";
      //conn_string.Port = 3306;

      SqlConnection conn = new SqlConnection("Data Source=SQL5053.site4now.net;Initial Catalog=DB_A6B685_prokopec;User Id=DB_A6B685_prokopec_admin;Password=freeacc123");
      conn.Open();


      SqlCommand sqlcommand = new SqlCommand(sql, conn);
      sqlcommand.ExecuteNonQuery();
      conn.Close();
    }

    public DataTable DB_ExecuteTable(string sql, DataTable table)
    {
      //MySqlConnectionStringBuilder conn_string = new MySqlConnectionStringBuilder();
      //conn_string.Server = "db4free.net";
      //conn_string.UserID = "rsp_prokopec";
      //conn_string.Password = "freeacc123";
      //conn_string.Database = "rsp_prokopec";
      //conn_string.Port = 3306;

      SqlConnection conn = new SqlConnection("Data Source=SQL5053.site4now.net;Initial Catalog=DB_A6B685_prokopec;User Id=DB_A6B685_prokopec_admin;Password=freeacc123");
      conn.Open();
      SqlCommand sqlCommand = new SqlCommand(sql, conn);
      SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlCommand);
      sqlAdapter.Fill(table);
      conn.Close();
      return table;


    }

    //public void notificationDataBind()
    //{
    //  int ID_user = 1;

    //  DataTable notifications = new DataTable();
    //  DataTable notifications_notSeen = new DataTable();

    //  notifications_notSeen = DB_ExecuteTable("SELECT COUNT(*) FROM tbl_notification n LEFT OUTER JOIN tbl_notification_link l ON n.ID_notification=l.ID_notification WHERE seen=0 AND l.id_user =" + ID_user, notifications_notSeen);
    //  int notSeenCount = int.Parse(notifications_notSeen.Rows[0][0].ToString());
    //  badge.InnerText = notSeenCount.ToString();

    //  notifications = DB_ExecuteTable("SELECT * FROM tbl_notification n LEFT OUTER JOIN tbl_notification_link l ON n.ID_notification=l.ID_notification WHERE l.id_user =" + ID_user, notifications);


    //  menu_ul_1.DataSource = notifications;
    //  menu_ul_1.DataBind();
    //}

    //Funkce pro skryti login/profilovych tlacitek/funkci
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
    protected void bindMenuForRole(int ID_role)
    {

      DataTable menuForRole = new DataTable();
      menuForRole.Columns.Add("menuTarget");
      menuForRole.Columns.Add("text");

      if (ID_role == 1)// menu pro autora
      {
        DataRow row = menuForRole.NewRow();
        row["menuTarget"] = "addArticle.aspx";
        row["text"] = "Přidat článek";

        menuForRole.Rows.Add(row);


        horizontalMenu.DataSource = menuForRole;
        horizontalMenu.DataBind();
      }
      else if (ID_role == 2) //menu pro recenzenta
      {
        DataRow row = menuForRole.NewRow();
        row["menuTarget"] = "reviewV2.aspx";
        row["text"] = "Spravovat Recenze";

        menuForRole.Rows.Add(row);


        horizontalMenu.DataSource = menuForRole;
        horizontalMenu.DataBind();
      }
      else if (ID_role == 4) //menu pro sefredaktora
      {
        DataRow row = menuForRole.NewRow();
        row["menuTarget"] = "sefredaktor_prehled.aspx";
        row["text"] = "Přehled událostí";

        menuForRole.Rows.Add(row);


        horizontalMenu.DataSource = menuForRole;
        horizontalMenu.DataBind();
      }
      else if (ID_role == 5) //menu pro administratora
      {
        DataRow row = menuForRole.NewRow();
        row["menuTarget"] = "administrace_uctu.aspx";
        row["text"] = "Spravovat uživatele";

        menuForRole.Rows.Add(row);

        horizontalMenu.DataSource = menuForRole;
        horizontalMenu.DataBind();
      }

    }
    /**
    * Funkce na prihlaseni. 
    * Kontrola spravneho jmena a hesla.
    * @author Robert Havranek
    */
    protected void loginBtn_Click(object sender, EventArgs e)
    {
      //nacteni dat do users
      DataTable users = new DataTable();
      //DB_ExecuteTable("SELECT * FROM tbl_user WHERE username='" + usernameTB.Text + "' and password='" + passwordTB.Text + "'", users);
      DB_ExecuteTable("SELECT * FROM tbl_user WHERE username='" + usernameTB.Text + "'", users);
      //kontrola spravnosti dat
      if (users.Rows.Count.ToString() == "1")
      {
        loginUsernameErr.Visible = false;
        DataRow user = users.Rows[0];
        String hashedPass = passHash(passwordTB.Text);
        if (user[6].ToString() == hashedPass)
        {
          loginPassErr.Visible = false;
          //spravne jmeno a heslo
          Session["userID"] = user[0].ToString();
          Session["username"] = user[1].ToString();
          Session["name"] = user[2].ToString();
          Session["surname"] = user[3].ToString();
          Session["email"] = user[4].ToString();
          Session["role"] = user[5].ToString();

          hideButtonsProfile(true);
          showAlertMsg("<strong>Vítejte</strong> " + Session["name"] + " <strong>'" + Session["username"] + "'</strong> " + Session["surname"] + ".", WarningType.Success);
          //Response.Redirect("index.aspx");

          bindMenuForRole(int.Parse(Session["role"].ToString()));
          notificationDataBind();
          avatarInit();


        }
        else
        {
          //spatne heslo
          Page.ClientScript.RegisterStartupScript(this.GetType(), "showLogin", "showLogin()", true);
          loginPassErr.Visible = true;
          showAlertMsg(" Přihlášení proběhlo <strong>neúspěšně</strong>.", WarningType.Danger);
        }
      }
      else
      {
        //spatne jmeno
        Page.ClientScript.RegisterStartupScript(this.GetType(), "showLogin", "showLogin()", true);
        loginUsernameErr.Visible = true;
        showAlertMsg(" Přihlášení proběhlo <strong>neúspěšně</strong>.", WarningType.Danger);
      }

    }

    /**
    * Funkce pro skryti login/profilovych tlacitek/funkci
    * @author Robert Havranek
    * @param flag uzivatel se prihlasil - true | odhlasil - false
    */
    public void hideButtonsProfile(bool flag)
    {
      if (flag)
      {
        loginButtons.Visible = false;
        loggedInfo.Visible = true;
        profileInit();
      }
      else
      {
        loginButtons.Visible = true;
        loggedInfo.Visible = false;
      }
    }

    /**
    * Funkce pro inicializaci profilu v prace casti bootstrap menu
    * @author Robert Havranek
    */
    //
    public void profileInit()
    {
      loggedNameSurname.Text = Session["name"].ToString() + " " + Session["surname"];
    }

    /**
    * Funkce pro odhlaseni
    * @author Robert Havranek
    */
    public void logOut(object sender, EventArgs e)
    {
      hideButtonsProfile(false);
      Session.Contents.Remove("userID");
      Session.Contents.Remove("username");
      Session.Contents.Remove("surname");
      Session.Contents.Remove("name");
      Session.Contents.Remove("email");
      Session.Contents.Remove("role");
      showAlertMsg("Byli jste úspěšně <strong>odhlášeni</strong>. ", WarningType.Info);
      Response.Redirect("index.aspx");
    }

    /**
    * Typy alertu
    * @author Robert Havranek
    */
    public enum WarningType
    {
      Success,
      Info,
      Warning,
      Danger
    }

    /**
    * Funkce pro alerty
    * @author Robert Havranek
    * @param msg zprava, ktera se zobrazuje v alertu
    * @param type typ alertu | Success - zelena | Info - Modra | Warning - Zluta | Danger - Cervena
    */
    public void showAlertMsg(String msg, WarningType type)
    {

      bootstrapAlert.Visible = true;
      switch (type)
      {
        case WarningType.Success:
          bootstrapAlert.Attributes.Remove("class");
          bootstrapAlert.Attributes.Add("class", "alert alert-success alert-dismissible fade show");
          break;
        case WarningType.Info:
          bootstrapAlert.Attributes.Remove("class");
          bootstrapAlert.Attributes.Add("class", "alert alert-info alert-dismissible fade show");
          break;
        case WarningType.Warning:
          bootstrapAlert.Attributes.Remove("class");
          bootstrapAlert.Attributes.Add("class", "alert alert-warning alert-dismissible fade show");
          break;
        case WarningType.Danger:
          bootstrapAlert.Attributes.Remove("class");
          bootstrapAlert.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
          break;
      }
      alertMsg.Text = msg;
    }

    /**
    * Funkce pro skryti alertu (pred tim to bylo zabugovane)
    * vyvola se automaticky po stisku krizku u alertu
    * @author Robert Havranek
    */
    public void closeAlertMsg()
    {
      bootstrapAlert.Visible = false;
    }

    /**
    * Funkce na registraci. 
    * Kontrola spravne zadanych udaju.
    * @author Robert Havranek
    */
    protected void registerBtn_Click(object sender, EventArgs e)
    {

      if (validateRegForm())
      {
        String hashedPass = passHash(registerPass1TB.Text);
        DB_ExecuteNonQuery("INSERT INTO tbl_user (username, name, surname, email, role, password) VALUES ('" + registerUsernameTB.Text + "','" + registerNameTB.Text + "','" + registerSurnameTB.Text + "','" + registerEmailTB.Text + "', '1' ,'" + hashedPass + "')");
        showAlertMsg("<strong>Registrace proběhla v pořádku.</strong> Nyní se můžete přihlásit.", WarningType.Success);
      }
      else
      {
        showAlertMsg("<strong>Registrace neproběhla v pořádku.</strong>", WarningType.Danger);
      }
    }

    /**
    * Kontrola spravne zadanych udaju.
    * @author Robert Havranek
    * @return bool vraci jestli byl registracni formular v poradku
    */
    private bool validateRegForm()
    {
      bool flag = true;

      //kontrola naplnění polí
      if (registerUsernameTB.Text == "" || registerNameTB.Text == "" || registerSurnameTB.Text == "" || registerEmailTB.Text == "" || registerPass1TB.Text == "" || registerPass2TB.Text == "")
      {
        registerGeneralErr.Visible = true;
        registerGeneralErr.Text = "<i class=\"fa fa-warning\"></i> Nejsou vyplněna všechna pole.";
        //registerGeneralErrMsg.Text = "Nejsou vyplněna všechna pole.";
        Page.ClientScript.RegisterStartupScript(this.GetType(), "showRegister", "showRegister()", true);
        flag = false;
      }
      else
      {
        registerGeneralErr.Visible = false;
        //nacteni dat do users
        DataTable users = new DataTable();
        DB_ExecuteTable("SELECT * FROM tbl_user WHERE username='" + registerUsernameTB.Text + "'", users);
        //kontrola jestli uzivatel uz neexistuje
        if (users.Rows.Count.ToString() == "1")
        {
          registerUsernameErr.Visible = true;
          if (registerGeneralErr.Visible == true)
            registerUsernameErr.Text = "<br><i class=\"fa fa-warning\"></i> Uživatelské jméno již existuje.";
          else
            registerUsernameErr.Text = "<i class=\"fa fa-warning\"></i> Uživatelské jméno již existuje.";

          Page.ClientScript.RegisterStartupScript(this.GetType(), "showRegister", "showRegister()", true);
          flag = false;
        }
        else
        {
          registerUsernameErr.Visible = false;
        }

        //kontrola spravnosti hesla
        if (registerPass1TB.Text != registerPass2TB.Text)
        {
          registerPassErr.Visible = true;
          registerPassErr.Text = "<i class=\"fa fa-warning\"></i> Hesla se musí shodovat.";
          Page.ClientScript.RegisterStartupScript(this.GetType(), "showRegister", "showRegister()", true);
          flag = false;
        }
        else
        {
          registerPassErr.Visible = false;
        }

        //kontrola spravnosti emailu
        if (validateEmail(registerEmailTB.Text))
        {
          registerEmailErr.Visible = false;
        }
        else
        {
          registerEmailErr.Visible = true;
          registerEmailErr.Text = "<i class=\"fa fa-warning\"></i> Neplatný formát emailu.";
          Page.ClientScript.RegisterStartupScript(this.GetType(), "showRegister", "showRegister()", true);
          flag = false;
        }
      }
      return flag;
    }

    /**
    * Kontrola spravneho formatu emailu.
    * @author Robert Havranek
    * @param email retezec, kteremu se kontroluje spravny format
    * @return bool vraci jestli byl email v poradku
    */
    public bool validateEmail(String email)
    {
      string pattern;
      pattern = @"\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";
      Regex rgx = new Regex(pattern);
      if (rgx.IsMatch(email))
        return true;
      else
        return false;
    }

    /**
    * Metoda na hashovani hesla.
    * @author Robert Havranek
    * @param password heslo v plain textu
    * @return string zahashovane heslo
    */
    public String passHash(String password)
    {
      var crypt = new System.Security.Cryptography.SHA256Managed();
      var hash = new System.Text.StringBuilder();
      byte[] crypto = crypt.ComputeHash(Encoding.UTF8.GetBytes(password));
      foreach (byte theByte in crypto)
      {
        hash.Append(theByte.ToString("x2"));
      }
      return hash.ToString();
    }

    /**
    * Metoda na zjisteni, jestli je uzivatel prihlasen
    * @author Robert Havranek
    * @return bool je prihlasen
    */
    public bool isLogged()
    {
      if (Session["userID"] == null)
        return false;
      else
        return true;
    }

    /**
    * Metoda na inicializaci avataru
    * @author Robert Havranek
    */
    protected void avatarInit()
    {
      if (Session["userID"] != null)
      {
        string avatarsFolder = Server.MapPath("~/Uploads/Avatars/");

        if (System.IO.File.Exists(avatarsFolder + Session["userID"].ToString() + ".jpg"))
        {
          profileAvatarSmall.ImageUrl = @"Uploads\Avatars\" + Session["userID"].ToString() + ".jpg";
        }
        else if (System.IO.File.Exists(avatarsFolder + Session["userID"].ToString() + ".png"))
        {
          profileAvatarSmall.ImageUrl = @"Uploads\Avatars\" + Session["userID"].ToString() + ".png";
        }
        else
        {
          profileAvatarSmall.ImageUrl = "/Images/profile_empty.png";
        }
      }
    }
  }
}