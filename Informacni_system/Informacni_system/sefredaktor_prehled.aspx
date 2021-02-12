<%@ Page Language="C#" MasterPageFile="~/global_template.Master" AutoEventWireup="true" CodeBehind="sefredaktor_prehled.aspx.cs" Inherits="Informacni_system.sefredaktor_prehled" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Přehled pro šéfredaktora</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <a class="helpSign float-right" href="#">
        <i class="fa fa-question-circle" rel="tooltip" data-toggle="tooltip" data-placement="left" title="Na této stránce najde šéfredakto přehled čiností autorů, recenzentů a redaktorů."></i>
    </a>

    <h1 class="text-center" style="margin-top: 10px; margin-bottom: 20px;">Přehled činností pro šéfredaktora</h1>
    <div id="autorSR0" runat="server">
        <h2 class="text-center" style="margin-top: 10px;">Posudky odeslané na přezkoumání</h2>
        <asp:GridView ID="autorPrehledGV0" runat="server" AutoGenerateColumns="False" Style="width: 70%; border-radius: 15px; margin-top: 3%; font-size: medium;" CssClass="table  
        table-bordered table-hover"
            HorizontalAlign="Center"
            AllowSorting="True" GridLines="Horizontal" BackColor="White">
            <Columns>
                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="ID clanku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbIDArticle0" CssClass="" Style="" Text='<%#Eval("id_article")%>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Název Článku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbNameArticle0" CssClass="" Style="" Text='<%#Eval("name_article")%>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Autor článku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbNameAuthor0" CssClass="" Style="" Text='<%#Eval("name_author")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="ID posudku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbIDArticle0" CssClass="" Style="" Text='<%#Eval("id_article")%>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Kritik"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbMagazin0" CssClass="" Style="" Text='<%#Eval("username")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

<%--                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Stav"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbState0" CssClass="" Style="" Text='<%#Eval("state")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>--%>
            </Columns>
            <HeaderStyle BackColor="#E8212E" ForeColor="White" Height="80%" HorizontalAlign="Center" />
            <RowStyle VerticalAlign="Middle" />
            <SelectedRowStyle VerticalAlign="Middle" />
        </asp:GridView>
    </div>

    <p class="text-center" style="margin-top: 10px; margin-bottom: 20px;">Vybrat nové kritiky pro Článek s tímto ID</p>
    <p class="text-center" style="margin-top: 10px; margin-bottom: 20px;">
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </p>
    <p class="text-center" style="margin-top: 10px; margin-bottom: 20px;">
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Vybrat" />
    </p>


    <%-- Podane clanky --%>
    <div id="autorSR" runat="server">
        <h2 class="text-center" style="margin-top: 10px;">Aktivita autorů</h2>
        <asp:GridView ID="autorPrehledGV" runat="server" AutoGenerateColumns="False" Style="width: 70%; border-radius: 15px; margin-top: 3%; font-size: medium;" CssClass="table  
        table-bordered table-hover"
            HorizontalAlign="Center"
            AllowSorting="True" GridLines="Horizontal" BackColor="White">
            <Columns>
                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="ID"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbIDArticle" CssClass="" Style="" Text='<%#Eval("id_article")%>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Název Článku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbNameArticle" CssClass="" Style="" Text='<%#Eval("name_article")%>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Autor článku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbNameAuthor" CssClass="" Style="" Text='<%#Eval("name_author")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Magazín"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbMagazin" CssClass="" Style="" Text='<%#Eval("magazine")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Stav"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbState" CssClass="" Style="" Text='<%#Eval("state")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#E8212E" ForeColor="White" Height="80%" HorizontalAlign="Center" />
            <RowStyle VerticalAlign="Middle" />
            <SelectedRowStyle VerticalAlign="Middle" />
        </asp:GridView>
    </div>

    <%-- prehled recenzi --%>
    <div id="recenzeSR" runat="server">
        <h2 class="text-center" style="margin-top: 10px;">Aktivita recenzentů - zrecenzováno</h2>
        <asp:GridView ID="recenzePrehledGV" runat="server" AutoGenerateColumns="False" Style="width: 70%; border-radius: 15px; margin-top: 3%; font-size: medium;" CssClass="table  
        table-bordered table-hover"
            HorizontalAlign="Center"
            AllowSorting="True" GridLines="Horizontal" BackColor="White">
            <Columns>
                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Název Článku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbNameArticle" CssClass="" Style="" Text='<%#Eval("name_article")%>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Autor článku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbNameAuthor" CssClass="" Style="" Text='<%#Eval("username")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#E8212E" ForeColor="White" Height="80%" HorizontalAlign="Center" />
            <RowStyle VerticalAlign="Middle" />
            <SelectedRowStyle VerticalAlign="Middle" />
        </asp:GridView>
    </div>

    <%-- prehled recenzi --%>
    <div id="Div1" runat="server">
        <h2 class="text-center" style="margin-top: 10px;">Aktivita recenzentů - čeká na recenzi</h2>
        <asp:GridView ID="recenzePrehledGV2" runat="server" AutoGenerateColumns="False" Style="width: 70%; border-radius: 15px; margin-top: 3%; font-size: medium;" CssClass="table  
        table-bordered table-hover"
            HorizontalAlign="Center"
            AllowSorting="True" GridLines="Horizontal" BackColor="White">
            <Columns>
                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Název Článku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbNameArticle" CssClass="" Style="" Text='<%#Eval("name_article")%>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Autor článku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbNameAuthor" CssClass="" Style="" Text='<%#Eval("username")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#E8212E" ForeColor="White" Height="80%" HorizontalAlign="Center" />
            <RowStyle VerticalAlign="Middle" />
            <SelectedRowStyle VerticalAlign="Middle" />
        </asp:GridView>
    </div>

    <%-- schvalene/zamitnute clanky --%>
    <div id="redaktorSR" runat="server">
        <h2 class="text-center" style="margin-top: 10px;">Aktivita redaktora</h2>
        <asp:GridView ID="redaktorPrehledGV" runat="server" AutoGenerateColumns="False" Style="width: 70%; border-radius: 15px; margin-top: 3%; font-size: medium;" CssClass="table  
        table-bordered table-hover"
            HorizontalAlign="Center"
            AllowSorting="True" GridLines="Horizontal" BackColor="White">
            <Columns>
                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="ID"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbIDArticle" CssClass="" Style="" Text='<%#Eval("id_article")%>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Název Článku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbNameArticle" CssClass="" Style="" Text='<%#Eval("name_article")%>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Autor článku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbNameAuthor" CssClass="" Style="" Text='<%#Eval("name_author")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Magazín"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbMagazin" CssClass="" Style="" Text='<%#Eval("magazine")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Stav"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbState" CssClass="" Style="" Text='<%#Eval("state")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#E8212E" ForeColor="White" Height="80%" HorizontalAlign="Center" />
            <RowStyle VerticalAlign="Middle" />
            <SelectedRowStyle VerticalAlign="Middle" />
        </asp:GridView>
    </div>
  <script>
    $(function () {
      $('[data-toggle="tooltip"]').tooltip()
    })
  </script>
</asp:Content>
