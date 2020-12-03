<%@ Page Title="" Language="C#" MasterPageFile="~/global_template.Master" AutoEventWireup="true" CodeBehind="zadani_recenze.aspx.cs" Inherits="Informacni_system.zadani_recenze" %>
<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    Identifikační číslo hodnoceného článku:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="id_article" runat="server" TextMode="Number"></asp:TextBox>
    <br />
    <br />
    Název recenze:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="review_title" runat="server"></asp:TextBox>
    <br />
    <br />
    Text recenze:<br />

    
    <div><FTB:FreeTextBox ID="texteditor" runat="server" DisableIEBackButton="False">
    </FTB:FreeTextBox>

        <asp:DropDownList ID="rating" runat="server" DataMember="doporucit" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>doporučit</asp:ListItem>
            <asp:ListItem>doporučit po úpravě</asp:ListItem>
            <asp:ListItem>nedoporučit</asp:ListItem>
        </asp:DropDownList>

        &nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:Button ID="odeslat" runat="server" Text="Odeslat recenzi" OnClick="odeslat_Click" />

        </div>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</asp:Content>