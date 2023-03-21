<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Projekt_m133_m151.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="login-styles.css" rel="stylesheet" />

        <asp:Literal ID="litInfo" runat="server" Text="Bitte Anmelden:" ></asp:Literal>
    <br />
    


    <br />
    <asp:Label runat="server" CssClass="firstName">Vorname</asp:Label>
    &nbsp;&nbsp;
    <br />
    <asp:TextBox ID="Textbox1" runat="server" CssClass="TextBox1"></asp:TextBox>
    <asp:RequiredFieldValidator id="requiredFieldValidator1" ControlToValidate="TextBox1"
        ErrorMessage="Bitte geben Sie ihren Namen ein!"
        runat="server" CssClass="validator"/> 
     <asp:RegularExpressionValidator ID="namevali" ErrorMessage="Bitte einen gültigen Namen eingeben" ControlToValidate="TextBox1" CssClass="Validator" runat="server" ValidationExpression="[a-zA-ZäÄöÖüÜ]+[a-zA-ZäÄöÖüÜ]+"  />
    <br />
    <br />

    <br />
    <asp:Label runat="server" CssClass="lastname">Nachname</asp:Label>
    &nbsp;&nbsp;
    <br />
    <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBox2"></asp:TextBox>
    <asp:RequiredFieldValidator id="requiredFieldValidator2" ControlToValidate="TextBox2"
        ErrorMessage="Bitte geben Sie ihren Nachnamen ein!"
        runat="server" CssClass="validator"/> 
     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ErrorMessage="Bitte einen gültigen Nachnamen eingeben" ControlToValidate="TextBox2" CssClass="Validator" runat="server" ValidationExpression="[a-zA-ZäÄöÖüÜ]+[a-zA-ZäÄöÖüÜ]+"  />
    <br />
    <br />

    <br />
    <asp:Label runat="server" CssClass="username">Benutzername</asp:Label>
    &nbsp;&nbsp;
    <br />
    <asp:TextBox ID="TextBox3" runat="server" CssClass="TextBox3"></asp:TextBox>
    <asp:RequiredFieldValidator id="requiredFieldValidator3" ControlToValidate="TextBox3"
        ErrorMessage="Bitte geb Sie einen Benutzernamen ein!"
        runat="server" CssClass="validator"/> 
     <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ErrorMessage="Bitte einen gültigen Benutzernamen eingeben" ControlToValidate="TextBox3" CssClass="Validator" runat="server" ValidationExpression="[a-zA-ZäÄöÖüÜ]+[a-zA-ZäÄöÖüÜ]+"  />
    <br />
    <br />

    <br />
    <asp:Label runat="server" CssClass="E-Mail">E-Mail</asp:Label>
    &nbsp;&nbsp;
    <br />
    <asp:TextBox ID="TextBox4" runat="server" CssClass="TextBox4"></asp:TextBox>
    <asp:RequiredFieldValidator id="requiredFieldValidator4" ControlToValidate="TextBox4"
        ErrorMessage="Bitte geben Sie eine gültige E-Mail an"
        runat="server" CssClass="validator"/> 
        
    <br />
    <br />

     <br />
    <asp:Label runat="server" CssClass="Geburtsjahr">Geburtsjahr</asp:Label>
    &nbsp;&nbsp;
    <br />
    <asp:TextBox ID="TextBox5" runat="server" CssClass="TextBox5"></asp:TextBox>
    <asp:RequiredFieldValidator id="requiredFieldValidator5" ControlToValidate="TextBox5"
        ErrorMessage="Bitte geben Sie ihr Geburtsjahr an!"
        runat="server" CssClass="validator"/> 
     <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ErrorMessage="Bitte eine gültiges Geburtsjahr eingeben" ControlToValidate="TextBox5" CssClass="Validator" runat="server" ValidationExpression="[1-9]+"  />
    <br />
    <br />


    
    
      

      
 AGB Akzeptieren
        <asp:CheckBox ID="CheckBox1" runat="server" />
    <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Required !" ClientValidationFunction = "ValidateCheckBox" CssClass="Validator"> </asp:CustomValidator>
    <br />
    <br />

     <input name="Button1" value="Anmelden" id="Button1" title="Anmelden" style="border-style:Solid;" type="submit">  
        
    </asp:Content>