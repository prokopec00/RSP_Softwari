<%@ Page Title="Detail článku" Language="C#" MasterPageFile="~/global_template.Master" AutoEventWireup="true" CodeBehind="artDetailRedaktor.aspx.cs" Inherits="Informacni_system.artDetailRedaktor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Detail článku</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        (zatím jen pro článek s ID 12)
        <h1 class="text-center" style="margin-top: 10px;margin-bottom: 7px;">Stav článku</h1>
        <h3 class="text-center" style="margin-bottom: 10px;"><asp:label ID="nazevClankuLb" runat="server" Text="Název článku"></asp:label></h3>
        <h4 class="text-center" style="margin-bottom: 20px;"><asp:label ID="authorClankuLb" runat="server" Text="Autor článku"></asp:label></h4>
        
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
                                        <td class="text-right"><button class="btn btn-primary btn-sm text-white loginModalBtn" style="width: 50%;" type="button">Otevřít</button></td>
                                    </tr>
                                    <tr>
                                        <td>Verze 2</td>
                                        <td class="text-right"><button class="btn btn-primary btn-sm text-white loginModalBtn" style="width: 50%;" type="button">Otevřít</button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- Radek s recenzemi --%>
        <div class="row" style="margin-top: 20px;">
            <%-- 1. recenze --%>
            <div class="col" id="recenzeDiv1"  runat="server">
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
                                <td>Aktuálnost, zajímavost a přínosnost<br></td>
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
                                <td>Odborná úroveň<br></td>
                                <td class="text-right">
                                    <asp:Label ID="ratingLevel1" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Jazyková a stylistická úroveň<br></td>
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
                                <td>Aktuálnost, zajímavost a přínosnost<br></td>
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
                                <td>Odborná úroveň<br></td>
                                <td class="text-right">
                                    <asp:Label ID="ratingLevel2" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>Jazyková a stylistická úroveň<br></td>
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
                <asp:Button ID="allowAccess" CssClass="btn btn-primary btn-lg text-white loginModalBtn" Text="Zpřístupnit recenze autorovi" runat="server" OnClick="allowAccess_Click"/>
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
</asp:Content>

