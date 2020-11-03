<%@ Page Title="" Language="C#" MasterPageFile="~/predloha.Master" AutoEventWireup="true" CodeBehind="Add_article.aspx.cs" Inherits="Informacni_system.Add_article" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:FileUpload ID="FileUpload1" runat="server" accept=" .pdf"/><br />
    <asp:Label ID="Label1" runat="server" Text="Label">Jmeno autora : </asp:Label>
    <asp:TextBox ID="autorJmeno" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox><br />
    <asp:Label ID="Jmenoclanku" runat="server" Text="Jmeno clanku : "></asp:Label>
    <asp:TextBox ID="clanekJmeno" runat="server"></asp:TextBox><br />
<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="UploadFile" />
<hr />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText = "No files uploaded" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="Text" HeaderText="File Name" />
        <asp:BoundField HeaderText="Název článku" />
        <asp:BoundField HeaderText="Jméno Autora" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="lnkDownload" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "DownloadFile"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID = "lnkDelete" Text = "Delete" CommandArgument = '<%# Eval("Value") %>' runat = "server" OnClick = "DeleteFile" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/show_article.aspx">Potvrdit</asp:HyperLink>
</asp:Content>
