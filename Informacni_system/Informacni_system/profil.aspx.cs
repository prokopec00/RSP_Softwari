using System;
using System.Collections.Generic;
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
            }
            catch
            {
                //global_template gt = new global_template();
                //gt.showAlertMsg("Tato stránka je jen pro <strong>přihlášené uživatele</strong>.",global_template.WarningType.Warning);

            }
        }

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
    }
}