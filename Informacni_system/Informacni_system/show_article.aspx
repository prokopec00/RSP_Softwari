<%@ Page Title="" Language="C#" MasterPageFile="~/global_template.Master" AutoEventWireup="true" CodeBehind="show_article.aspx.cs" Inherits="Informacni_system.show_article" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div>
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
        </div>
    <div>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" style="width:70%;border-radius:15px;margin-top:3%; font-size: small;" CssClass="table  
            table-bordered table-hover" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" OnRowCommand="GridView2_RowCommand" HorizontalAlign="Center" 
            AllowSorting="True" GridLines="Horizontal" BackColor="#CCCCCC">
            <Columns>
                <asp:TemplateField HeaderText="Název článku">
                    <EditItemTemplate>
                        <asp:TextBox CssClass="" ID="TextBox2" runat="server" Text='<%# Bind("article") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("article") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Název souboru" Visible="false">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox6" Visible="false" runat="server" Text='<%# Bind("filename") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" Visible="false" runat="server" Text='<%# Bind("filename") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField   Text="Otevřít" ButtonType="Button" CommandName="openPdf" ControlStyle-CssClass="btn btn-block" ControlStyle-ForeColor="Black" FooterStyle-BackColor="White" FooterStyle-BorderStyle="Solid">
<ControlStyle CssClass="btn btn-block" ForeColor="Black"></ControlStyle>
<FooterStyle BackColor="White" BorderStyle="Solid"></FooterStyle>
                </asp:ButtonField>
                <asp:ButtonField Text="Detail" CommandName="openDetail" ControlStyle-CssClass="btn btn-block" ControlStyle-ForeColor="Black" FooterStyle-BackColor="White" FooterStyle-BorderStyle="Solid">
<ControlStyle CssClass="btn btn-block" ForeColor="Black"></ControlStyle>

<FooterStyle BackColor="White" BorderStyle="Solid"></FooterStyle>
                </asp:ButtonField>
                <asp:ButtonField ButtonType="Button" Text="Smazat" ControlStyle-CssClass="btn btn-block" ControlStyle-ForeColor="Black" FooterStyle-BackColor="White" FooterStyle-BorderStyle="Solid" >
<ControlStyle CssClass="btn btn-block" ForeColor="Black"></ControlStyle>

<FooterStyle BackColor="White" BorderStyle="Solid"></FooterStyle>
                </asp:ButtonField>
            </Columns>
            <EditRowStyle Height="20px" />
            <EmptyDataRowStyle Height="20px" />
            <HeaderStyle BackColor="#E8212E" ForeColor="White" BorderColor="Red" Font-Names="Times New Roman" HorizontalAlign="Center" />
        </asp:GridView>       
         
</div>
</asp:Content>
