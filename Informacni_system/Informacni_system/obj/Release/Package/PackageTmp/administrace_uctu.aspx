<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="administrace_uctu.aspx.cs" Inherits="Informacni_system.administrace_uctu" %>--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/global_template.Master" AutoEventWireup="true" CodeBehind="administrace_uctu.aspx.cs" Inherits="Informacni_system.administrace_uctu" %>
<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            margin-left: 40px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <p class="auto-style1">
        Přidání nového článku:<br />
        Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="username" runat="server"></asp:TextBox>
    <br />
        Jméno:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="firstname" runat="server"></asp:TextBox>
        <br />
        Příjmení:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="lastname" runat="server"></asp:TextBox>
        <br />
        e-mail:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="email" runat="server"></asp:TextBox>
        <br />
        role:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="role" runat="server"></asp:TextBox>
        <br />
        heslo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="password" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="pridat" runat="server" OnClick="pridat_Click" Text="Přidat záznam" />
    <br />
    </p>
    <p class="auto-style1">
        Úprava záznamů:</p>
    <p class="auto-style1">
        Identifikační číslo záznamu:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="id_show" runat="server" OnTextChanged="id_show_TextChanged" Width="77px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="show" runat="server" Text="Zobrazit označený záznam" OnClick="show_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
        Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="username_show" runat="server"></asp:TextBox>
    <br />
        Jméno:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="firstname_show" runat="server"></asp:TextBox>
        <br />
        Příjmení:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="lastname_show" runat="server"></asp:TextBox>
        <br />
        e-mail:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="email_show" runat="server"></asp:TextBox>
        <br />
        role:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="role_show" runat="server"></asp:TextBox>
        <br />
        heslo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="password_show" runat="server"></asp:TextBox>
    <br />
    </p>
    <p class="auto-style1">
        <asp:Button ID="del" runat="server" Text="Odstranit označený záznam" OnClick="del_Click" />
        <asp:Button ID="alter" runat="server" Text="Uložit změny v označeném záznamu" OnClick="alter_Click" />
        <br />

    
    </p>

    
    <div style="height: 99px; width: 530px">&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        </div>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

<%--<!DOCTYPE html>--%>

<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 529px;
        }
    </style>
</head>
<body>


    <form id="form1" runat="server">
        <div>
            Přidat uživatele s těmito hodnotami</div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        jméno uživatele<br />
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        křestní jméno<br />
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        příjmení<br />
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        e-mail<br />
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        role<br />
        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        heslo<br />
        <asp:Button ID="add" runat="server" Text="přidat" OnClick="Button1_Click" />
        <br />
        <br />
        Zadejte číslo uživatele kterého chcete vybrat:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        <asp:Button ID="show" runat="server" Text="zobrazit vybraný záznam" />
        
        <br />
        údaje o označeném uživateli:<br />
        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
        jméno uživatele<br />
        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
        křestní jméno<br />
        <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
        příjmení<br />
        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
        e-mail<br />
        <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
        role<br />
        <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
        heslo<br />
        <asp:Button ID="del" runat="server" Text="odstranit vybraný záznam" />
        <asp:Button ID="alter" runat="server" Text="uložit nové hodnoty do vybraného záznamu" />
    </form>
</body>
</html>--%>


    </asp:Content>