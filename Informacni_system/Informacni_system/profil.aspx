<%@ Page Language="C#" MasterPageFile="~/global_template.Master" AutoEventWireup="true" CodeBehind="profil.aspx.cs" Inherits="Informacni_system.profil" Title="Profil uživatele" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <title>Profil uživatele</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
            <div class="row">
                <div class="col" style="text-align: center;">
                    <h1>Můj Profil</h1>
                </div>
            </div>
            <div class="row">
                <div class="col" style="text-align: center;">
                    <picture><img class="rounded-circle profileImg" src="/Images/profile_empty.png"></picture>
                </div>
            </div>
            <div class="row" style="padding-top: 10px;">
                <div class="col" style="text-align: right;"><label class="col-form-label profileTable">Uživatelské jméno</label></div>
                <div class="col profileCol" style="text-align: left; padding-top: 7px;">
                    <asp:Label ID="profileUsername" CssClass="col-form-label profileTable" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col" style="text-align: right;"><label class="col-form-label profileTable">Jméno</label></div>
                <div class="col profileCol" style="text-align: left; padding-top: 7px;">
                    <asp:Label ID="profilName" CssClass="col-form-label profileTable" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col" style="text-align: right;"><label class="col-form-label profileTable">Přjímení</label></div>
                <div class="col profileCol" style="text-align: left; padding-top: 7px;">
                    <asp:Label ID="profilSurname" CssClass="col-form-label profileTable" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col" style="text-align: right;"><label class="col-form-label profileTable">Email</label></div>
                <div class="col profileCol" style="text-align: left; padding-top: 7px;">
                    <asp:Label ID="profilEmail" CssClass="col-form-label profileTable" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col" style="text-align: right;"><label class="col-form-label profileTable">Role</label></div>
                <div class="col profileCol" style="text-align: left; padding-top: 7px;">
                    <asp:Label ID="profilRole" CssClass="col-form-label profileTable" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="row" style="margin: 45px;">
                <div class="col" style="text-align: right;"><button class="btn btn-danger loginRegisterRed" type="button">Upravit údaje</button></div>
                <div class="col" style="text-align: center;"><button class="btn btn-danger loginRegisterRed" type="button">Změnit avatar</button></div>
                <div class="col" style="text-align: left;"><button class="btn btn-danger loginRegisterRed" type="button">Změnit heslo</button></div>
            </div>
        </div>
</asp:Content>
