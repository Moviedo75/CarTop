<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperarContrasenia.aspx.cs" Inherits="Cartera.view.RecuperarContrasenia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtCorreo" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtPassNuevo" runat="server"></asp:TextBox>
        <asp:Button runat="server" ID="btnCambiar" Text="Cambiar Contraseña" OnClick="btnCambiar_Click" />
        <asp:Label runat="server" ID="mensaje"></asp:Label>
    </div>
    </form>
</body>
</html>
