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
        <div class="col" style="margin: auto; width: 24%; padding-top: 10px;">
            <i href="" data-toggle="modal" data-target="#profilAvatar">
                <div class="col profileImg">
                    <%--<img src="/Images/profile_empty.png" alt="Avatar" class="profileIm">--%>
                    <asp:Image ID="profileAvatarBig" runat="server" CssClass="profileIm" />
                    <div class="middleProfileImg">
                        <div class="avatarEdit"><i class="fa fa-pencil"></i></div>
                    </div>
                </div>
            </i>
        </div>
        <div class="row" style="padding-top: 10px;">
            <div class="col" style="text-align: right;">
                <label class="col-form-label profileTable">Uživatelské jméno</label>
            </div>
            <div class="col profileCol" style="text-align: left; padding-top: 7px;">
                <asp:label id="profileUsername" cssclass="col-form-label profileTable" runat="server" text=""></asp:label>
            </div>
        </div>
        <div class="row">
            <div class="col" style="text-align: right;">
                <label class="col-form-label profileTable">Jméno</label>
            </div>
            <div class="col profileCol" style="text-align: left; padding-top: 7px;">
                <asp:label id="profilName" cssclass="col-form-label profileTable" runat="server" text=""></asp:label>
            </div>
        </div>
        <div class="row">
            <div class="col" style="text-align: right;">
                <label class="col-form-label profileTable">Přjímení</label>
            </div>
            <div class="col profileCol" style="text-align: left; padding-top: 7px;">
                <asp:label id="profilSurname" cssclass="col-form-label profileTable" runat="server" text=""></asp:label>
            </div>
        </div>
        <div class="row">
            <div class="col" style="text-align: right;">
                <label class="col-form-label profileTable">Email</label>
            </div>
            <div class="col profileCol" style="text-align: left; padding-top: 7px;">
                <asp:label id="profilEmail" cssclass="col-form-label profileTable" runat="server" text=""></asp:label>
            </div>
        </div>
        <div class="row">
            <div class="col" style="text-align: right;">
                <label class="col-form-label profileTable">Role</label>
            </div>
            <div class="col profileCol" style="text-align: left; padding-top: 7px;">
                <asp:label id="profilRole" cssclass="col-form-label profileTable" runat="server" text=""></asp:label>
            </div>
        </div>
        <div class="row" style="margin: 45px;">
            <div class="col" style="text-align: right;">
                <button class="btn btn-danger loginRegisterRed" type="button" data-toggle="modal" data-target="#profilUdaje">Upravit údaje</button>
            </div>
            <div class="col" style="text-align: left;">
                <button class="btn btn-danger loginRegisterRed" type="button" data-toggle="modal" data-target="#profilHeslo">Změnit heslo</button>
            </div>
        </div>

        <div class="modal fade" role="dialog" tabindex="-1" id="profilHeslo">
            <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Změnit heslo</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    </div>
                    <div class="modal-body">
                        <asp:label id="passGeneralErr" class="loginErrMsg" runat="server" visible="false" text=""></asp:label>
                        <asp:label id="passOldErr" class="loginErrMsg" runat="server" visible="false" text=""></asp:label>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend"><span class="text-primary input-group-text imgBox"><i class="fa fa-key modalIcon"></i></span></div>
                                <%--<input class="form-control loginForm" type="password" required="" placeholder="Staré heslo">--%>
                                <asp:textbox id="profileOldPass" runat="server" cssclass="form-control loginForm" placeholder="Staré heslo" textmode="Password"></asp:textbox>
                                <div class="input-group-append"></div>
                            </div>
                        </div>
                        <asp:label id="passNewErr" class="loginErrMsg" runat="server" visible="false" text=""></asp:label>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend"><span class="text-primary input-group-text imgBox"><i class="fa fa-lock modalIcon"></i></span></div>
                                <%--<input class="form-control loginForm" type="password" required="" placeholder="Nové heslo">--%>
                                <asp:textbox id="profileNewPass" runat="server" cssclass="form-control loginForm" placeholder="Nové heslo" textmode="Password"></asp:textbox>
                                <div class="input-group-append"></div>
                            </div>
                        </div>
                        <asp:label id="passConfErr" class="loginErrMsg" runat="server" visible="false" text=""></asp:label>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend"><span class="text-primary input-group-text imgBox"><i class="fa fa-repeat modalIcon"></i></span></div>
                                <%--<input class="form-control loginForm" type="password" required="" placeholder="Zopakovat heslo">--%>
                                <asp:textbox id="profileConfPass" runat="server" cssclass="form-control loginForm" placeholder="Zopakovat heslo" textmode="Password"></asp:textbox>
                                <div class="input-group-append"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <%--<button class="btn btn-primary btn-lg text-white loginModalBtn" style="width: 100%;" type="button">Uložit</button>--%>
                            <asp:button id="profilePassSaveBtn" runat="server" text="Uložit" onclick="profilePassSaveBtn_Click" causesvalidation="False" cssclass="btn btn-primary btn-lg text-white loginModalBtn" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" role="dialog" tabindex="-1" id="profilUdaje">
            <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Upravit údaje</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    </div>
                    <div class="modal-body">
                        <asp:label id="infoGeneralErr" class="loginErrMsg" runat="server" visible="false" text=""></asp:label>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend"><span class="text-primary input-group-text imgBox"><i class="fa fa-user-circle modalIcon"></i></span></div>
                                <%--<input class="form-control loginForm" type="text" required="" placeholder="Jméno">--%>
                                <asp:textbox id="profileNewName" runat="server" cssclass="form-control loginForm" placeholder="Jméno"></asp:textbox>
                                <div class="input-group-append"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend"><span class="text-primary input-group-text imgBox"><i class="fa fa-user-circle-o modalIcon"></i></span></div>
                                <%--<input class="form-control loginForm" type="text" required="" placeholder="Příjmení">--%>
                                <asp:textbox id="profileNewSurname" runat="server" cssclass="form-control loginForm" placeholder="Příjmení"></asp:textbox>
                                <div class="input-group-append"></div>
                            </div>
                        </div>
                        <asp:label id="infoEmailErr" class="loginErrMsg" runat="server" visible="false" text=""></asp:label>
                        <div class="form-group">
                            <div class="input-group">
                                <div class="input-group-prepend"><span class="text-primary input-group-text imgBox"><i class="fa fa-envelope-o modalIcon"></i></span></div>
                                <%--<input class="form-control loginForm" type="email" required="" placeholder="Email">--%>
                                <asp:textbox id="profileNewEmail" runat="server" cssclass="form-control loginForm" placeholder="Email"></asp:textbox>
                                <div class="input-group-append"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <%--<button class="btn btn-primary btn-lg text-white loginModalBtn" style="width: 100%;" type="button">Uložit</button></div>--%>
                            <asp:button id="profileInfoSaveBtn" runat="server" text="Uložit" onclick="profileInfoSaveBtn_Click" causesvalidation="False" cssclass="btn btn-primary btn-lg text-white loginModalBtn" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" role="dialog" tabindex="-1" id="profilAvatar">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Změna avatara</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="row" style="margin-bottom: 18px;">
                            <div class="col">
                                <asp:Image ID="profileAvataImg" Style="width: 200px; height: 200ox; min-height: 200px; min-width: 200px" runat="server" ImageUrl="/Images/profile_empty.png" />
                                <%--<img src="/Images/profile_empty.png" style="width: 200px; height: 200ox;">--%>
                            </div>
                            <div class="col" style="text-align: right; margin-top: 36px;">
                                <asp:FileUpload ID="FileUpload1" Style="display: none" runat="server" onchange="upload()" accept=".jpg, .png"/>
                                <button class="btn btn-primary btn-lg text-white loginModalBtn" type="button" style="width: 100%;" onclick="showBrowseDialog()">Nahrát avatar</button>
                                <asp:Button runat="server" ID="uploadButton" Text="" Style="display: none;" OnClick="uploadButton_Click" />

                                <%--<button class="btn btn-primary btn-lg text-white loginModalBtn" style="width: 100%; margin-top: 26px;" type="button">Výchozí avatar</button>--%>
                                <asp:Button ID="avatarDefault" OnClick="avatarDefault_Click" runat="server" CssClass="btn btn-primary btn-lg text-white loginModalBtn" Style="width: 100%; margin-top: 26px;" Text="Výchozí avatar" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <%--<button class="btn btn-primary btn-lg text-white loginModalBtn" style="width: 100%;" type="button">Uložit</button>--%>
                                <asp:Button ID="saveAvatar" runat="server" OnClick="saveAvatar_Click" Text="Uložit" Style="width: 100%;" CssClass="btn btn-primary btn-lg text-white loginModalBtn" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script>
        function showProfilePass() {
            $('#profilHeslo').modal('show');
        }
        function showProfileInfo() {
            $('#profilUdaje').modal('show');
        }
        function showBrowseDialog() {
            document.getElementById('<%=FileUpload1.ClientID%>').click();
        }
        function showAvatar() {
            $('#profilAvatar').modal('show');
        }
        function upload() {
            var btn = document.getElementById('<%= uploadButton.ClientID %>');
        btn.click();
    }
    </script>
</asp:Content>
