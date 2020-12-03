<%@ Page Title="" Language="C#" MasterPageFile="~/global_template.Master" AutoEventWireup="true" CodeBehind="addArticle.aspx.cs" Inherits="Informacni_system.addArticle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 44%;
            height: 29px;
        }
        .auto-style3 {
            height: 29px;
        }
        .auto-style4 {
            width: 44%
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:50%;margin: 0 auto;margin-top:5%;">
        <table class="tg">
<thead>
  <tr>
    <th class="tg-krq0" colspan="2">
    <asp:FileUpload ID="FileUpload1" runat="server" accept=" .pdf" Width="100%" /><br />
    </th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="auto-style4">
    <asp:Label ID="Label1" runat="server" Text="Label">Jméno autora : </asp:Label>
    </td>
    <td class="tg-0pky">    <asp:TextBox ID="autorJmeno" runat="server" ></asp:TextBox><br />
</td>
  </tr>
  <tr>
    <td class="auto-style2">    <asp:Label ID="Jmenoclanku" runat="server" Text="Jméno clanku : "></asp:Label>
</td>
    <td class="auto-style3">    <asp:TextBox ID="clanekJmeno" runat="server"></asp:TextBox>
</td>
  </tr>
  <tr>
    <td class="auto-style4">      <asp:Label runat="server" Text="Magazín"> <br /></asp:Label> 
</td>
    <td class="tg-0pky">    <asp:DropDownList Width="100%" ID="magazinList" runat="server"></asp:DropDownList>
</td>
  </tr>
</tbody>
</table>
        <asp:Button ID="uploadBtn" runat="server" Text="Nahrá ke kontrole" OnClick="uploadBtn_Click" />
        <br />
<div style="margin-top:5%;">
    <asp:GridView ID="GridView1" runat="server" Width="100%" AutoGenerateColumns="False" EmptyDataText = "No files uploaded" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnDataBound="GridView1_DataBound">
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
     <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
     <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
     <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
     <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
     <SortedAscendingCellStyle BackColor="#F7F7F7" />
     <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
     <SortedDescendingCellStyle BackColor="#E5E5E5" />
     <SortedDescendingHeaderStyle BackColor="#242121" />
</asp:GridView>
         </div>   
        </div>
</asp:Content>
