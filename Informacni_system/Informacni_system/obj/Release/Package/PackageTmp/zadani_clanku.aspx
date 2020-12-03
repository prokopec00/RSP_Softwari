<%@ Page Title="" Language="C#" MasterPageFile="~/predloha.Master" AutoEventWireup="true" CodeBehind="zadani_clanku.aspx.cs" Inherits="Informacni_system.zadani_clanku" %>
<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
Clanek po odeslani musi zkontrolovat redaktor az po te se clanek zobrazi na uvodni strane.<br />    
Nazev clanku <asp:TextBox ID="clanek" runat="server"></asp:TextBox><br />
Jmeno a prijmeni<asp:TextBox ID="autor" runat="server"></asp:TextBox><br />
    <div><FTB:FreeTextBox ID="texteditor" runat="server" DisableIEBackButton="False">
    </FTB:FreeTextBox>

        </div>

    <asp:Button ID="odeslat" runat="server" Text="Odeslat clanke ke kontrole" OnClick="odeslat_Click" />
</asp:Content>
    