<%@ Page Title="" Language="C#" MasterPageFile="~/global_template.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Informacni_system.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <asp:Panel runat="server">
  <div class="row">
    <div class="col-md-12 indexText">
          <center>
          LOGOS POLYTECHNIKOS je vysokoškolský odborný <br />recenzovaný časopis, který slouží pro publikační aktivity akademických <br />pracovníků Vysoké školy polytechnické Jihlava <br />i jiných vysokých škol, univerzit a výzkumných organizací.<br /> Je veden na seznamu recenzovaných odborných a vědeckých časopisů ERIH PLUS.
           <br />
  
          </center>
      <center>
                          <asp:Button runat ="server" class="btn btn-danger loginRegisterRed" style="width:250px; height:60px; font-size:23px;margin-top:60px" text="Prohlédnout články" OnClick="Unnamed_Click"/>
      </center>

    </div>

  </div>
    </asp:Panel>

</asp:Content>

