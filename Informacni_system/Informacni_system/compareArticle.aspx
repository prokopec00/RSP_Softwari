<%@ Page Title="" Language="C#" MasterPageFile="~/global_template.Master" AutoEventWireup="true" CodeBehind="compareArticle.aspx.cs" Inherits="Informacni_system.compareArticle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<div style="width:50%;margin: 0 auto;">
    <asp:Label ID="errorlabel" runat="server" Text="Nelze porovnat dva stejné soubory." CssClass="text-danger" Visible="false"></asp:Label><br />

    <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
    </asp:DropDownList><br />
    <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" AutoPostBack="True">
    </asp:DropDownList>
    



    <br />
    <asp:Button runat="server" Text="Porovnat" OnClick="Unnamed1_Click"/>
    <br />
<asp:LinkButton text="Poslední porovnání." runat="server" ForeColor="#FF3300" OnClick="Unnamed4_Click" ></asp:LinkButton>
    </div>
</asp:Content>
