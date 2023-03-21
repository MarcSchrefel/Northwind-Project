<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Region.aspx.cs" Inherits="Projekt_m133_m151.WebForm2" %>

<asp:Content ID="Region" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Regins" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <link href="Region.css" rel="stylesheet" />

    <br />
    <br />  
    <asp:TextBox ID="OrtRegion" runat="server" CssClass="EingabeRegion"></asp:TextBox>
    <asp:Button ID="btnBigSmall" runat="server" Text="Gross/Klein" OnClick="btnBigSmall_Click" CssClass="aRegion" />
    <asp:Button ID="btnAdd" runat="server" Text="Hinzufügen" OnClick="btnAdd_Click" CssClass="AddRegion" />
    <asp:Button ID="btnDelete" runat="server" Text="Löschen" OnClick="btnDelete_Click" CssClass="DeleteRegion" />
    
    <br />
    <asp:Label ID="nothere" runat="server"></asp:Label>
    <br />
    <br />
    <div class="table-container">
    <asp:GridView ID="RegionsGrid" runat="server" CssClass="TabelleRegion"></asp:GridView>

    </div>
</asp:Content>