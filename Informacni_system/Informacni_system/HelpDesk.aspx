<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HelpDesk.aspx.cs" Inherits="Informacni_system.HelpDesk" MasterPageFile="~/global_template.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div style="border-style: none; border-color: inherit; border-width: medium; width:574px; text-align: center; margin-left: 750px; height: 294px;" >
    Ticket<br />
    Jméno&nbsp;&nbsp;&nbsp; :<asp:TextBox ID="id_name" runat="server"></asp:TextBox>
    <br />
    <br>
    Email&nbsp;&nbsp;&nbsp;&nbsp; :<asp:TextBox ID="id_email" runat="server"></asp:TextBox>
    <br />
    <br />
    Příjmení :<asp:TextBox ID="id_surname" runat="server"></asp:TextBox>
    <br>
    Zpráva:<br />
    <asp:TextBox ID="id_text" runat="server" Height="67px" Width="404px"></asp:TextBox>
    <br />
    <asp:Button ID="odeslat" runat="server" Text="Odeslat" OnClick="odeslat_Click" Height="34px" />
    <br />
    <br />
    <asp:TextBox ID="alert" runat="server" BackColor="#00CC99" Font-Size="Medium" ForeColor="#006600" Height="25px" ReadOnly="True"></asp:TextBox>
    <br />
</div>
</asp:Content>
