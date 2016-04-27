<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambiarContrasenia.aspx.cs" Inherits="Cartera.view.CambiarContrasenia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <asp:Label runat="server" ID="lblEmail"></asp:Label>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtPassAntiguo" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtPassNuevo" runat="server"></asp:TextBox>
        <asp:Button runat="server" ID="btnCambiar" Text="Cambiar Contraseña" OnClick="btnCambiar_Click" />
        <asp:Label runat="server" ID="mensaje"></asp:Label>
    </div>
    </form>
</body>
</html>
