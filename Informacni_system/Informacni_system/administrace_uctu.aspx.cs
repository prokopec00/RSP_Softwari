﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using MySql.Data.MySqlClient;

using System.Data;
using System.Data.SqlClient;

using System.Text.RegularExpressions;


using System.Web.UI.HtmlControls;

using System.Security.Cryptography;
using System.Text;

namespace Informacni_system
{
    public partial class administrace_uctu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {




        }
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


        protected void pridat_Click(object sender, EventArgs e)
        {
            global_template dbSaver = new global_template();

            dbSaver.DB_ExecuteNonQuery("INSERT INTO `tbl_user` ( `username`, `name`, `surname`, `email`,`role`, `password`)" +
                " VALUES('" + username.Text + "', '" + firstname.Text + "', '" + lastname.Text + "', '" + email.Text + "', '" + role.Text + "','" + passHash(password.Text) + "')");
            Response.Write("ulozeno");

           // String hashedPass = passHash(passwordTB.Text);
            //DB_ExecuteNonQuery("INSERT INTO tbl_user (username,name,surname,email,role,password) VALUES ('panrecenzent','pan','recenzent','recenzent@abc.gg',2,'" + passHash("recenzent") + "')");
        }
       


        protected void del_Click(object sender, EventArgs e)
        {
            global_template dbSaver = new global_template();
            
            dbSaver.DB_ExecuteNonQuery("DELETE FROM `tbl_user` WHERE `tbl_user`.`id_user` = '" + id_show.Text + "'");
            Response.Write("zaznam odstranen");
            




        }

        protected void show_Click(object sender, EventArgs e)
        {
            global_template dbSaver = new global_template();
            DataTable zaznam = new DataTable();
            
            
            dbSaver.DB_ExecuteTable("SELECT * FROM tbl_user  WHERE id_user='" + id_show.Text + "'", zaznam);

            
            DataRow user = zaznam.Rows[0];
            string username = user[1].ToString() + " ";
            username_show.Text = username;
           

            string name = user[2].ToString() + " ";
            firstname_show.Text = name;

            string surname = user[3].ToString() + " ";
            lastname_show.Text = surname;

            string email = user[4].ToString() + " ";
            email_show.Text = email;

            string role = user[5].ToString() + " ";
            role_show.Text = role;
           
            //string password = user[6].ToString() + " ";
            //password_show.Text = password;

            Response.Write("zaznam oznacen");


        }

        protected void alter_Click(object sender, EventArgs e)
        {
            global_template dbSaver = new global_template();
if (password_show.Text == null)
            dbSaver.DB_ExecuteNonQuery(" UPDATE `tbl_user` SET `username` = '" + username_show.Text + "', `name` = '" + firstname_show.Text + "', `surname` = '" + lastname_show.Text + "', `email` = '" + email_show.Text + "', `role` = '" + role_show.Text + "', `password` = `password` WHERE `tbl_user`.`id_user` = '" + id_show.Text + "'");
else
            dbSaver.DB_ExecuteNonQuery(" UPDATE `tbl_user` SET `username` = '" + username_show.Text + "', `name` = '" + firstname_show.Text + "', `surname` = '" + lastname_show.Text + "', `email` = '" + email_show.Text + "', `role` = '" + role_show.Text + "', `password` = '" + passHash(password_show.Text) + "' WHERE `tbl_user`.`id_user` = '" + id_show.Text + "'");


            Response.Write("ulozeno");
           
                    }

        protected void id_show_TextChanged(object sender, EventArgs e)
        {

        }
    }
}