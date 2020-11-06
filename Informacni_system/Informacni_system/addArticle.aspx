<%@ Page Title="" Language="C#" MasterPageFile="~/global_template.Master" AutoEventWireup="true" CodeBehind="addArticle.aspx.cs" Inherits="Informacni_system.addArticle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:FileUpload ID="FileUpload1" runat="server" accept=" .pdf" /><br />
    <asp:Label ID="Label1" runat="server" Text="Label">Jmeno autora : </asp:Label>
    <asp:TextBox ID="autorJmeno" runat="server" ></asp:TextBox><br />
    <asp:Label ID="Jmenoclanku" runat="server" Text="Jmeno clanku : "></asp:Label>
    <asp:TextBox ID="clanekJmeno" runat="server"></asp:TextBox><br />
    <asp:LinkButton ID="Upload" runat="server" OnClick="Upload_Click">Nahrát ke kontrole</asp:LinkButton>
 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EmptyDataText = "No files uploaded" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand">
    <Columns>
        <asp:TemplateField HeaderText="Název článku">
            <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name_article") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("name_article") %>'></asp:Label>
                    </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Jméno autora">
        <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name_author") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("name_author") %>'></asp:Label>
                    </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Název souboru">
            <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("filename") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("filename") %>'></asp:Label>
                    </ItemTemplate>
        </asp:TemplateField>
       
            
                <%--dowload--%>
                <asp:ButtonField Text="Stáhnout" ButtonType="Button" CommandName="dowload" />
            
       
                <%--delete--%>
          <asp:ButtonField Text="Delete" ButtonType="Button" CommandName="delete" />
    </Columns>
</asp:GridView>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/show_article.aspx">Potvrdit</asp:HyperLink>

</asp:Content>
