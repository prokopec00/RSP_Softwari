<%@ Page Title="" Language="C#" MasterPageFile="~/global_template.Master" AutoEventWireup="true" CodeBehind="show_article.aspx.cs" Inherits="Informacni_system.show_article" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <asp:Panel runat="server" ID="pnlArticleOverview">

    <%--    <div>
        <div style="width:50%;margin: 0 auto;">
    <p class="nav-item nav-link">
        Soubory nahrané ke kontrole</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnRowDeleted="GridView1_RowDeleted" OnRowDeleting="GridView1_RowDeleting" HorizontalAlign="Center" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:CheckBox ID="theCheckBox" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Název článku">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("article") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("article") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Autor">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("author") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("author") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Název souboru">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("filename") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("filename") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField HeaderText="Odkaz souboru" SelectText="Download" ShowSelectButton="True" />
                
            </Columns>
            <EmptyDataTemplate>
                <asp:CheckBox ID="CheckBox1" runat="server" />
            </EmptyDataTemplate>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:LinkButton ID="Checked" runat="server" OnClick="Button1_Click1" ForeColor="black" >Zkontrolováno</asp:LinkButton>
    </p>
            </div>
        </div>--%>
    <div>
      <asp:GridView ID="gv_ArticleOverview" runat="server" AutoGenerateColumns="False" Style="width: 70%; border-radius: 15px; margin-top: 3%; font-size: small;" CssClass="table  
            table-bordered table-hover"
        HorizontalAlign="Center"
        AllowSorting="True" GridLines="Horizontal" BackColor="#CCCCCC">


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
              <asp:Label runat="server" Text="Stav"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
              <asp:Label runat="server" ID="lbArticle_state" CssClass="" Style="" Text='<%#Eval("state")%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField ItemStyle-CssClass="detail">
            <HeaderTemplate>
              <asp:Label runat="server" Text="Číslo časopisu"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
              <asp:Label runat="server" ID="lbArticle_magazine" CssClass="" Style="" Text='<%#Eval("magazine")%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField ItemStyle-CssClass="detail">
            <HeaderTemplate>
              <asp:Label runat="server" Text="Přijato"></asp:Label>
            </HeaderTemplate>
            <ItemTemplate>
              <asp:Label runat="server" ID="lbArticle_accepted" CssClass="" Style="" Text='<%#Eval("accepted")%>'></asp:Label>
            </ItemTemplate>
          </asp:TemplateField>
          <%--            <asp:TemplateField ItemStyle-CssClass="detail">
                    <HeaderTemplate>
                      <asp:Label runat="server" Text="Moduly"></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                      <asp:Label runat="server" ID="tbSloupecModuly" CssClass="" Style="" Text='<%#Eval("moduly")%>'></asp:Label>
                    </ItemTemplate>
                  </asp:TemplateField>--%>
          <asp:TemplateField ItemStyle-CssClass="detail">
            <ItemTemplate>
              <asp:Button runat="server" ID="btnDelete" CssClass="btn btn-default" Style="width: 100%" Value='<%#Eval("id_article")%>' OnClick="btnDelete_Click" OnClientClick="return confirm('Opravdu chcete odstranit článek?');" Text="Odstranit" />
            </ItemTemplate>
          </asp:TemplateField>
          <asp:TemplateField ItemStyle-CssClass="detail">
            <ItemTemplate>
              <asp:Button runat="server" ID="btnDetail" CssClass="btn btn-default" Style="width: 100%" Value='<%#Eval("id_article")%>' OnClick="btnDetail_Click" Text="Detail" />
            </ItemTemplate>
          </asp:TemplateField>
        </Columns>





      </asp:GridView>
    </div>
  </asp:Panel>
  <%--  Panel s detailem článku--%>
  <asp:Panel runat="server" ID="pnlArticleDetail" Visible="false">
    <asp:HiddenField runat="server" ID="hfArticleID" />
    <div class="container">
      <h1 class="text-center" style="margin-top: 10px; margin-bottom: 7px;">Stav článku</h1>
      <h3 class="text-center" style="margin-bottom: 10px;">
        <asp:Label ID="nazevClankuLb" runat="server" Text="Název článku"></asp:Label></h3>
      <h4 class="text-center" style="margin-bottom: 20px;">
        <asp:Label ID="authorClankuLb" runat="server" Text="Autor článku"></asp:Label></h4>

      <%-- Prvni radek --%>
      <div class="row">
        <%-- Sloupec se stavama --%>
        <div class="col-8">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>Stádium</th>
                  <th class="text-center">Stav</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Nově podaný</td>
                  <td class="text-center">
                    <%-- <i class="fa fa-check-circle facheck"></i>--%>
                    <asp:Label runat="server" ID="stavNovePodany" Text='<i class="fa fa-times-circle fauncheck"></i>'></asp:Label>
                  </td>

                </tr>
                <tr>
                  <td>Čeká na stanovení recenzentů</td>
                  <td class="text-center">
                    <asp:Label runat="server" ID="stavStanoveniRec" Text='<i class="fa fa-times-circle fauncheck"></i>'></asp:Label>
                  </td>
                </tr>
                <tr>
                  <td>Recenzní řízení probíhá</td>
                  <td class="text-center">
                    <asp:Label runat="server" ID="stavRecenze" Text='<i class="fa fa-times-circle fauncheck"></i>'></asp:Label>
                  </td>
                </tr>
                <tr>
                  <td>Posudek 1 doručen redakci</td>
                  <td class="text-center">
                    <asp:Label runat="server" ID="stavPosudek1" Text='<i class="fa fa-times-circle fauncheck"></i>'></asp:Label>
                  </td>
                </tr>
                <tr>
                  <td>Posudek 2 doručen redakci</td>
                  <td class="text-center">
                    <asp:Label runat="server" ID="stavPosudek2" Text='<i class="fa fa-times-circle fauncheck"></i>'></asp:Label>
                  </td>
                </tr>
                <tr>
                  <td>Posudek zveřejněn autorovi</td>
                  <td class="text-center">
                    <asp:Label runat="server" ID="stavZverejnen" Text='<i class="fa fa-times-circle fauncheck"></i>'></asp:Label>
                  </td>
                </tr>
                <tr>
                  <td>Probíhá úprava textu autorem</td>
                  <td class="text-center">
                    <asp:Label runat="server" ID="stavUpravaAutor" Text='<i class="fa fa-times-circle fauncheck"></i>'></asp:Label>
                  </td>
                </tr>
                <tr>
                  <td>Příspěvek je přijat k vydání nebo zamítnut</td>
                  <td class="text-center">
                    <asp:Label runat="server" ID="stavKonec" Text="Stav"></asp:Label>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <%-- Sloupec s verzemi --%>
        <div class="col">
          <div class="row">
            <div class="col">
              <div class="table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th>Verze</th>
                      <th></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>Verze 1</td>
                      <td class="text-right">
                        <button class="btn btn-primary btn-sm text-white loginModalBtn" style="width: 50%;" type="button">Otevřít</button></td>
                    </tr>
                    <tr>
                      <td>Verze 2</td>
                      <td class="text-right">
                        <button class="btn btn-primary btn-sm text-white loginModalBtn" style="width: 50%;" type="button">Otevřít</button></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>


<%--      pri stavu 3 - prirazeni recenzentu k clanku --%>
      <div id="divRecenzentAssigning" runat="server">
        <div class="row" style="margin-top: 20px;">
          <div class="col" id="assignRecenzent1" runat="server">
            <asp:Label ID="lbRecenzent1" runat="server" Text="Vybrat prvního recenzenta:"></asp:Label><br />
            <asp:DropDownList runat="server" ID="ddlRecenzenti1" Style="width: 100%; height: 30px; margin-top: 10px"></asp:DropDownList>


          </div>
          <div class="col" id="assignRecenzent2" runat="server">
            <asp:Label ID="lbRecenzent2" runat="server" Text="Vybrat druhého recenzenta:"></asp:Label><br />
            <asp:DropDownList runat="server" ID="ddlRecenzenti2" Style="width: 100%; height: 30px; margin-top: 10px"></asp:DropDownList>

          </div>
        </div>
        <center>
          <button id="btnAssignRecenzent" class="btn btn-danger loginRegisterRed" style="margin-top:20px"> Přiřadit recenzenty</button>
        </center>
      </div>




<%--      pri stavu 1 - kontrola zda clanek odpovida tematicky dilu casopisu--%>
      <div id="divCheckMagazineTheme" runat="server">
        <center>
                 <h3>Odpovídá článek tématu čísla magazínu ?</h3>
        </center>
        <div class="row" style="margin-top: 20px;">
          <div class="col" id="Div2" runat="server">
                        <asp:Button runat="server" ID="btnThemeChecks" class="btn confirmBtn" style="margin-top: 20px; color: white;" onclick="btnThemeChecks_click" Text="Téma odpovídá"/>
          </div>
          <div class="col" id="Div3" runat="server">
            <asp:Button runat="server" ID="btnThemeIncorrect" class="btn loginModalBtn" style="margin-top: 20px; color: white;" onclick="btnThemeIncorrect_click" Text="Téma neodpovídá"/>

          </div>
        </div>  

      </div>










      <%-- Radek s recenzemi --%>
      <div class="row" style="margin-top: 20px;">
        <%-- 1. recenze --%>
        <div class="col" id="recenzeDiv1" runat="server">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>Recenze 1</th>
                  <th class="text-right">Hodnocení</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Aktuálnost, zajímavost a přínosnost<br>
                  </td>
                  <td class="text-right">
                    <%--<i class="fa fa-star fastar"></i>--%>
                    <asp:Label ID="ratingInterest1" runat="server"></asp:Label>

                  </td>
                </tr>
                <tr>
                  <td>Originalita</td>
                  <td class="text-right">
                    <asp:Label ID="ratingOriginality1" runat="server"></asp:Label>
                  </td>
                </tr>
                <tr>
                  <td>Odborná úroveň<br>
                  </td>
                  <td class="text-right">
                    <asp:Label ID="ratingLevel1" runat="server"></asp:Label>
                  </td>
                </tr>
                <tr>
                  <td>Jazyková a stylistická úroveň<br>
                  </td>
                  <td class="text-right">
                    <asp:Label ID="ratingLanguage1" runat="server"></asp:Label>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <asp:Label ID="ratingText1" runat="server" Style="font-style: italic;"></asp:Label>
                    <br>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <asp:Label ID="ratingRecenzent1" runat="server"></asp:Label>
                    <br>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <%-- 2. recenze --%>
        <div class="col" id="recenzeDiv2" runat="server">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>Recenze 2</th>
                  <th class="text-right">Hodnocení</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Aktuálnost, zajímavost a přínosnost<br>
                  </td>
                  <td class="text-right">
                    <%--<i class="fa fa-star fastar"></i>--%>
                    <asp:Label ID="ratingInterest2" runat="server"></asp:Label>

                  </td>
                </tr>
                <tr>
                  <td>Originalita</td>
                  <td class="text-right">
                    <asp:Label ID="ratingOriginality2" runat="server"></asp:Label>
                  </td>
                </tr>
                <tr>
                  <td>Odborná úroveň<br>
                  </td>
                  <td class="text-right">
                    <asp:Label ID="ratingLevel2" runat="server"></asp:Label>
                  </td>
                </tr>
                <tr>
                  <td>Jazyková a stylistická úroveň<br>
                  </td>
                  <td class="text-right">
                    <asp:Label ID="ratingLanguage2" runat="server"></asp:Label>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <asp:Label ID="ratingText2" runat="server" Style="font-style: italic;"></asp:Label>
                    <br>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <asp:Label ID="ratingRecenzent2" runat="server"></asp:Label>
                    <br>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <%-- Radek na zpristupneni recenzi autorovi --%>
      <div class="row" style="margin-bottom: 20px;" id="allowButtonDiv" runat="server">
        <div class="col text-center">
          <%--<button class="btn btn-primary btn-lg text-white loginModalBtn" type="button">Zpřístupnit recenze autorům</button>--%>
          <asp:Button ID="allowAccess" CssClass="btn btn-primary btn-lg text-white loginModalBtn" Text="Zpřístupnit recenze autorovi" runat="server" OnClick="allowAccess_Click" />
        </div>
      </div>
      <%-- Radek na schvaleni/zamitnuti clanku --%>
      <div class="row text-center" id="acrejButtonDiv" runat="server">
        <div class="col" style="margin-bottom: 20px;">
          <%--<button class="btn btn-primary confirmBtn" type="button">Schválit článek <i class="fa fa-check-circle-o"></i></button>--%>
          <%--<asp:Button ID="aceptArticle" CssClass="btn btn-primary confirmBtn" Text='Schválit článek <i class="fa fa-check-circle-o"></i>' runat="server"/>--%>
          <asp:LinkButton runat="server" ID="aceptArt" CssClass="btn btn-primary confirmBtn" OnClick="aceptArt_Click">
                    Schválit článek <i class="fa fa-check-circle-o"></i>
                </asp:LinkButton>
        </div>
        <div class="col" style="margin-bottom: 20px;">
          <%--<button class="btn btn-primary loginModalBtn" type="button">Zamítnout článek <i class="fa fa-times-circle-o"></i></button>--%>
          <%--<asp:Button ID="rejectArticle" CssClass="btn btn-primary loginModalBtn" Text='Zamítnout článek <i class="fa fa-times-circle-o"></i>' runat="server"/>--%>
          <asp:LinkButton runat="server" ID="rejectArt" CssClass="btn btn-primary loginModalBtn" OnClick="rejectArt_Click">
                    Zamítnout článek <i class="fa fa-times-circle-o"></i>
                </asp:LinkButton>
        </div>
      </div>
    </div>


  </asp:Panel>
</asp:Content>
