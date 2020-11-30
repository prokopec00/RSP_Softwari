<%@ Page Title="Recenze" Language="C#" MasterPageFile="~/global_template.Master" AutoEventWireup="true" CodeBehind="reviewV2.aspx.cs" Inherits="Informacni_system.reviewV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Recenze</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="testLb" runat="server"></asp:Label>
    <div class="container">
        <h1 class="text-center" style="margin-top: 10px; margin-bottom: 7px;">Recenze článků</h1>
        <h2 class="text-center" style="margin-top: 10px; margin-bottom: 7px;">Články čekající na recenzi</h2>
        <asp:GridView ID="recenzeGridView" runat="server" AutoGenerateColumns="False" Style="width: 70%; border-radius: 15px; margin-top: 3%; font-size: medium;" CssClass="table  
        table-bordered table-hover"
            HorizontalAlign="Center"
            AllowSorting="True" GridLines="Horizontal" BackColor="White">
            <Columns>
                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Název Článku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbArticle_name" CssClass="" Style="" Text='<%#Eval("name_article")%>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Autor článku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbArticle_author" CssClass="" Style="" Text='<%#Eval("name_author")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Deadline"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbDeadline" CssClass="" Style="" Text='<%#Eval("deadline")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <ItemTemplate>
                        <asp:Button runat="server" ID="btnRecenzovat" CssClass="btn btn-default" Style="width: 100%" Value='<%#Eval("id_review_list")%>' OnClick="btnRecenzovat_Click" Text="Recenzovat" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#E8212E" ForeColor="White" Height="80%" HorizontalAlign="Center" />
            <RowStyle VerticalAlign="Middle" />
            <SelectedRowStyle VerticalAlign="Middle" />
        </asp:GridView>
        <asp:HiddenField runat="server" ID="hiddenIDlist" />

        <h2 class="text-center" style="margin-top: 10px; margin-bottom: 7px;">Zrecenzované články</h2>
        <asp:GridView ID="recenzeDoneGridView" runat="server" AutoGenerateColumns="False" Style="width: 70%; border-radius: 15px; margin-top: 3%; font-size: medium;" CssClass="table  
        table-bordered table-hover"
            HorizontalAlign="Center"
            AllowSorting="True" GridLines="Horizontal" BackColor="White">
            <Columns>
                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Název Článku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbArticle_name" CssClass="" Style="" Text='<%#Eval("name_article")%>' />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Autor článku"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbArticle_author" CssClass="" Style="" Text='<%#Eval("name_author")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                        <asp:Label runat="server" Text="Deadline"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbDeadline" CssClass="" Style="" Text='<%#Eval("deadline")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField ItemStyle-CssClass="detail">
                    <ItemTemplate>
                        <asp:Button runat="server" ID="btnZobrazitRecenzi" CssClass="btn btn-default" Style="width: 100%" Value='<%#Eval("id_review_list")%>' OnClick="btnZobrazitRecenzi_Click" Text="Zobrazit" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#E8212E" ForeColor="White" Height="80%" HorizontalAlign="Center" />
            <RowStyle VerticalAlign="Middle" />
            <SelectedRowStyle VerticalAlign="Middle" />
        </asp:GridView>

        <div class="modal fade" role="dialog" tabindex="-1" id="recenzniForm">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Recenzovat článek</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Recenze</th>
                                        <th class="text-right">Známka</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>aktuálnost, zajímavost a přínosnost<br>
                                        </td>
                                        <td class="text-right">
                                            <asp:DropDownList runat="server" ID="dropDown1">
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>originalita</td>
                                        <td class="text-right">
                                            <asp:DropDownList runat="server" ID="dropDown2">
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>odborná úroveň<br>
                                        </td>
                                        <td class="text-right">
                                            <asp:DropDownList runat="server" ID="dropDown3">
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>jazyková a stylistická úroveň<br>
                                        </td>
                                        <td class="text-right">
                                            <asp:DropDownList runat="server" ID="dropDown4">
                                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:TextBox ID="tbOpenAnswer" runat="server" Text="Poznámka" Style="width: 100%"></asp:TextBox>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <%--<button class="btn btn-primary btn-lg text-white loginModalBtn" type="button">Recenzovat</button>--%>
                        <asp:Button ID="saveReview" runat="server" Text="Recenzovat" OnClick="saveReview_Click" CausesValidation="False" CssClass="btn btn-primary btn-lg text-white loginModalBtn" />
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" role="dialog" tabindex="-1" id="recenzniDoneForm">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Moje recenze</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Recenze</th>
                                        <th class="text-right">Hodnocení</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>aktuálnost, zajímavost a přínosnost<br>
                                        </td>
                                        <td class="text-right">
                                            <asp:Label ID="done1" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>originalita</td>
                                        <td class="text-right">
                                            <asp:Label ID="done2" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>odborná úroveň<br>
                                        </td>
                                        <td class="text-right">
                                            <asp:Label ID="done3" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>jazyková a stylistická úroveň<br>
                                        </td>
                                        <td class="text-right">
                                            <asp:Label ID="done4" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">Poznámka:
                                            <asp:Label ID="done5" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script>
        function showRecenzniForm() {
            $('#recenzniForm').modal('show');
        }

        function showRecenzniDoneForm() {
            $('#recenzniDoneForm').modal('show');
        }
    </script>
</asp:Content>

