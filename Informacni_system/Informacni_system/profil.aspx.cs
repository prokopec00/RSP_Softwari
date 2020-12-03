using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Informacni_system
{
    public partial class profil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            profileInit();
            if (!Page.IsPostBack)
            {
                try
                {
                    profileNewName.Text = Session["name"].ToString();
                    profileNewSurname.Text = Session["surname"].ToString();
                    profileNewEmail.Text = Session["email"].ToString();
                }
                catch { }
            }
        }

        /**
        * Inicializace udaju profilu 
        * @author Robert Havranek
        */
        private void profileInit()
        {
            try
            {
                profileUsername.Text = Session["username"].ToString();
                profilName.Text = Session["name"].ToString();
                profilSurname.Text = Session["surname"].ToString();
                profilEmail.Text = Session["email"].ToString();
                profilRole.Text = getRole(Session["role"].ToString());
        //TODO: inicializace Avatara
        string avatarsFolder = Server.MapPath("~/Uploads/Avatars/");
        //zkusit, jestli ma uzivatel avatar - pripadne nastavit default
        if (System.IO.File.Exists(avatarsFolder + Session["userID"].ToString() + ".jpg"))
                {
                    profileAvatarBig.ImageUrl = @"Uploads\Avatars\" + Session["userID"].ToString() + ".jpg";
                    profileAvataImg.ImageUrl = @"Uploads\Avatars\" + Session["userID"].ToString() + ".jpg";
                }
                else if (System.IO.File.Exists(avatarsFolder + Session["userID"].ToString() + ".png"))
                {
                    profileAvatarBig.ImageUrl = @"Uploads\Avatars\" + Session["userID"].ToString() + ".png";
                    profileAvataImg.ImageUrl = @"Uploads\Avatars\" + Session["userID"].ToString() + ".png";
                }
                else
                {
                    profileAvatarBig.ImageUrl = "/Images/profile_empty.png";
                    profileAvataImg.ImageUrl = "/Images/profile_empty.png";
                }
            }
            catch
            {
                //global_template gt = new global_template();
                //gt.showAlertMsg("Tato stránka je jen pro <strong>přihlášené uživatele</strong>.",global_template.WarningType.Warning);

            }
        }

        //private void alert(string text, int typ)
        //{
        //    //Control alert = this.Master.FindControl("bootstrapAlert");
        //    WebControl alert = (Control)Master.FindControl("bootstrapAlert");
        //    Label msg = (Label)Master.FindControl("alertMsg");
        //    alert.Visible = true;
        //    switch (typ)
        //    {
        //        case 1:
        //            alert.Attributes.Remove("class");
        //            alert.Attributes.Add("class", "alert alert-success alert-dismissible fade show");
        //            break;
        //        case 2:
        //            alert.Attributes.Remove("class");
        //            alert.Attributes.Add("class", "alert alert-info alert-dismissible fade show");
        //            break;
        //        case 3:
        //            alert.Attributes.Remove("class");
        //            alert.Attributes.Add("class", "alert alert-warning alert-dismissible fade show");
        //            break;
        //        case 4:
        //            alert.Attributes.Remove("class");
        //            alert.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
        //            break;
        //    }
        //    alert.Visible = true;
        //    msg.Text = text;
        //}

        /**
        * Funkce prevede id role na jeji jmeno
        * @author Robert Havranek
        * @param index id role
        * @return String nazev role
        */
        private String getRole(String index)
        {
            switch (index)
            {
                case "1":
                    return "Autor";
                    break;
                case "2":
                    return "Recenzent";
                    break;
                case "3":
                    return "Redaktor";
                    break;
                case "4":
                    return "Šéfredaktor";
                    break;
                case "5":
                    return "Admin";
                    break;
            }
            return "Čtenář";
        }

        /**
        * Funkce na zmenu hesla. 
        * Kontrola spravne zadanych udaju.
        * @author Robert Havranek
        */
        protected void profilePassSaveBtn_Click(object sender, EventArgs e)
        {
            if (validatePass())
            {
                global_template gt = new global_template();
                String hashedPass = gt.passHash(profileNewPass.Text);
                gt.DB_ExecuteNonQuery("UPDATE tbl_user SET password= '" + hashedPass + "' WHERE id_user = '" + Session["userID"] + "'");
                //showAlertMsg("<strong>Heslo úspěšně změněno.</strong>", WarningType.Success);
            }
            else
            {
                //showAlertMsg("<strong>Změna hesla neproběhla v pořádku.</strong>", WarningType.Danger);
            }
        }

        /**
        * Kontrola spravne zadanych udaju.
        * @author Robert Havranek
        * @return bool vraci jestli byla zmena hesla v poradku
        */
        protected bool validatePass()
        {
            bool flag = true;

            if (profileOldPass.Text == "" || profileNewPass.Text == "" || profileConfPass.Text == "")
            {
                passGeneralErr.Visible = true;
                passGeneralErr.Text = "<i class=\"fa fa-warning\"></i> Nejsou vyplněna všechna pole.";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "showProfilePass", "showProfilePass()", true);
                flag = false;
            }
            else
            {
                passGeneralErr.Visible = false;
                //nacteni dat do users
                global_template gt = new global_template();
                DataTable users = new DataTable();
                gt.DB_ExecuteTable("SELECT * FROM tbl_user WHERE username='" + Session["username"] + "'", users);
                DataRow user = users.Rows[0];
                //aktualni heslo v db user[6].ToString();
                //hashnuti hesel pro kontrolu
                string oldPassHash = gt.passHash(profileOldPass.Text);
                string newPassHash = gt.passHash(profileNewPass.Text);

                //kontrola spravnosti stareho hesla
                if (user[6].ToString() != oldPassHash)
                {
                    passOldErr.Visible = true;
                    if (passGeneralErr.Visible == true)
                        passOldErr.Text = "<br><i class=\"fa fa-warning\"></i> Nesprávně zadané staré heslo.";
                    else
                        passOldErr.Text = "<i class=\"fa fa-warning\"></i> Nesprávně zadané staré heslo.";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "showProfilePass", "showProfilePass()", true);
                    flag = false;
                }
                else
                {
                    passOldErr.Visible = false;
                }

                //kontola shodnosti puvodniho a noveho hesla
                if (oldPassHash == newPassHash)
                {
                    passNewErr.Visible = true;
                    passNewErr.Text = "<i class=\"fa fa-warning\"></i> Heslo musí být jiné než původní.";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "showProfilePass", "showProfilePass()", true);
                    flag = false;
                }
                else
                {
                    passNewErr.Visible = false;
                }

                //kontrola shodnosti novych hesel
                if (profileNewPass.Text != profileConfPass.Text)
                {
                    passConfErr.Visible = true;
                    passConfErr.Text = "<i class=\"fa fa-warning\"></i> Nová hesla musí být shodná.";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "showProfilePass", "showProfilePass()", true);
                    flag = false;
                }
                else
                {
                    passConfErr.Visible = false;
                }
            }
            return flag; ;
        }

        /**
        * Funkce na zmenu udaju v profilu. 
        * Kontrola spravne zadanych udaju.
        * @author Robert Havranek
        */
        protected void profileInfoSaveBtn_Click(object sender, EventArgs e)
        {
            global_template gt = new global_template();
            if (validateInfo())
            {
                string newName = profileNewName.Text;
                string newSurname = profileNewSurname.Text;
                string newEmail = profileNewEmail.Text;
                gt.DB_ExecuteNonQuery("UPDATE tbl_user SET name = '" + newName + "', surname = '" + newSurname + "', email = '" + newEmail + "' WHERE id_user = '" + Session["userID"] + "'");
                //UPDATE Sessions
                Session.Contents.Remove("surname");
                Session.Contents.Remove("name");
                Session.Contents.Remove("email");

                Session["name"] = newName;
                Session["surname"] = newSurname;
                Session["email"] = newEmail;
                Response.Redirect("profil.aspx");
                //gt.showAlertMsg("<strong>Údaje úspěšně změněny.</strong>", global_template.WarningType.Success);
            }
            else
            {
                //showAlertMsg("<strong>Změna údajů neproběhla v pořádku.</strong>", WarningType.Danger);
            }
        }

        /**
        * Funkce na kontolu novych udaju v profilu. 
        * Kontrola spravne zadanych udaju.
        * @author Robert Havranek
        * @return bool vraci jestli byla zmena profilu
        */
        protected bool validateInfo()
        {
            bool flag = true;

            if (profileNewName.Text == "" || profileNewSurname.Text == "" || profileNewEmail.Text == "")
            {
                infoGeneralErr.Visible = true;
                infoGeneralErr.Text = "<i class=\"fa fa-warning\"></i> Nejsou vyplněna všechna pole.";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "showProfileInfo", "showProfileInfo()", true);
                flag = false;
            }
            else
            {
                infoGeneralErr.Visible = false;
                //kontrola spravnosti stareho emailu
                global_template gt = new global_template();
                if (!gt.validateEmail(profileNewEmail.Text))
                {
                    infoEmailErr.Visible = true;
                    infoEmailErr.Text = "<i class=\"fa fa-warning\"></i> Nesprávně zadaný email.";

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "showProfileInfo", "showProfileInfo()", true);
                    flag = false;
                }
                else
                {
                    infoEmailErr.Visible = false;
                }
            }
            return flag; ;
        }

        /**
        * Funkce na uploadu avataru. 
        * Avatar se ulozi az pozdeji.
        * @author Robert Havranek
        */
        protected void uploadButton_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "showAvatar", "showAvatar()", true);
      string uploadFolder = Server.MapPath("~/Uploads/Avatars/pre/");
      if (FileUpload1.HasFile)
            {
                if (System.IO.File.Exists(uploadFolder + Session["userID"].ToString() + ".jpg"))
                {
                    System.IO.File.Delete(uploadFolder + Session["userID"].ToString() + ".jpg");
                }
                if (System.IO.File.Exists(uploadFolder + Session["userID"].ToString() + ".png"))
                {
                    System.IO.File.Delete(uploadFolder + Session["userID"].ToString() + ".png");
                }
                //soubor vybran
                string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
                //zkouska spravne koncovky
                if (extension.ToLower() == ".jpg")
                {
                    FileUpload1.SaveAs(uploadFolder + Session["userID"].ToString() + ".jpg");
                    string imageSrc = "Uploads/Avatars/pre/" + Session["userID"].ToString() + ".jpg";
                    profileAvataImg.ImageUrl = imageSrc;
                }
                else if (extension.ToLower() == ".png")
                {
                    FileUpload1.SaveAs(uploadFolder + Session["userID"].ToString() + ".png");
                    string imageSrc = "Uploads/Avatars/pre/" + Session["userID"].ToString() + ".png";
                    profileAvataImg.ImageUrl = imageSrc;
                }
                else
                {
                    //spatna koncovka
                }
            }
            else
            {
                //nevybran soubor
                //OK
            }
        }

        /**
        * Funkce na set default avataru. 
        * Avatar se ulozi az pozdeji.
        * @author Robert Havranek
        */
        protected void avatarDefault_Click(object sender, EventArgs e)
        {
            profileAvataImg.ImageUrl = "/Images/profile_empty.png";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "showAvatar", "showAvatar()", true);
        }

        /**
        * Funkce na ulozeni avatara. 
        * presun avataru ze slozky /Avatars/pre do /Avatars.
        * clear /Avatars/pre
        * kdyz default => smazani usersID.jpg/.png v /Avatars
        * @author Robert Havranek
        */
        protected void saveAvatar_Click(object sender, EventArgs e)
        {
      string preFolder = Server.MapPath("~/Uploads/Avatars/pre/");
      string avatarsFolder = Server.MapPath("~/Uploads/Avatars/");


      //zkusit, jestli uz byl pouzivany avatar - pripadne smazat
      if (!Page.IsPostBack)
            {
                if (System.IO.File.Exists(avatarsFolder + Session["userID"].ToString() + ".jpg"))
                    System.IO.File.Delete(avatarsFolder + Session["userID"].ToString() + ".jpg");
                if (System.IO.File.Exists(avatarsFolder + Session["userID"].ToString() + ".png"))
                    System.IO.File.Delete(avatarsFolder + Session["userID"].ToString() + ".png");
            }
            
            //novy avatar -> presun z pre do ..
            if (System.IO.File.Exists(preFolder + Session["userID"].ToString() + ".jpg"))
            {
                if (System.IO.File.Exists(avatarsFolder + Session["userID"].ToString() + ".jpg"))
                    System.IO.File.Delete(avatarsFolder + Session["userID"].ToString() + ".jpg");
                System.IO.File.Move(preFolder + Session["userID"].ToString() + ".jpg", avatarsFolder + Session["userID"].ToString() + ".jpg");
                profileAvataImg.ImageUrl = @"Uploads\Avatars\" + Session["userID"].ToString() + ".jpg";
            }
            else if (System.IO.File.Exists(preFolder + Session["userID"].ToString() + ".png"))
            {
                if (System.IO.File.Exists(avatarsFolder + Session["userID"].ToString() + ".png"))
                    System.IO.File.Delete(avatarsFolder + Session["userID"].ToString() + ".png");
                System.IO.File.Move(preFolder + Session["userID"].ToString() + ".png", avatarsFolder + Session["userID"].ToString() + ".png");
                profileAvataImg.ImageUrl = @"Uploads\Avatars\" + Session["userID"].ToString() + ".png";
            }
            else
            {
                profileAvataImg.ImageUrl = "/Images/profile_empty.png";
            }

            //odstranit avatar, kdyz je dan jako default
            if(profileAvataImg.ImageUrl == "/Images/profile_empty.png")
            {
                if (System.IO.File.Exists(avatarsFolder + Session["userID"].ToString() + ".jpg"))
                    System.IO.File.Delete(avatarsFolder + Session["userID"].ToString() + ".jpg");
                if (System.IO.File.Exists(avatarsFolder + Session["userID"].ToString() + ".png"))
                    System.IO.File.Delete(avatarsFolder + Session["userID"].ToString() + ".png");
            }

            //odstranit obsah /pre
            if (System.IO.File.Exists(preFolder + Session["userID"].ToString() + ".jpg"))
                System.IO.File.Delete(preFolder + Session["userID"].ToString() + ".jpg");
            if (System.IO.File.Exists(preFolder + Session["userID"].ToString() + ".png"))
                System.IO.File.Delete(preFolder + Session["userID"].ToString() + ".png");

            Response.Redirect("profil.aspx");
        }
    }
}