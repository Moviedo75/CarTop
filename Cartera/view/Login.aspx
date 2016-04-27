<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Cartera.view.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    <a href="../assets/fonts/fontawesome-webfont.eot">../assets/fonts/fontawesome-webfont.eot</a>
    <link href="../assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../assets/css/FaltanDatos.css" rel="stylesheet" />
    <link href="../assets/css/mio.css" rel="stylesheet" />
    <script src="../js/jquery-2.2.2.min.js"></script>
    <script src="../js/Validar.js"></script>
    <script src="../js/validarRecuperarContraseña.js"></script>
    <script src="../js/MostrarRecuperar.js"></script>
</head>
<body>
    <form runat="server">
        <div>
            <!-- Header -->
            <header id="header">
                <h1><a href="Inicio.aspx">Cartop</a></h1>
                <nav id="nav">
                    <ul>
                        <li><a href="Inicio.aspx">Inicio</a></li>
                        <li><a href="Registro.aspx" class="button">Registrate</a></li>
                    </ul>
                </nav>
            </header>
            <section id="banner1">

                <!-- Main -->
                <section id="main" class="container 75%">
                    <header>
                        <h2 style="color:white;">Inicio de Sesión</h2>
                        <p style="color:white;">Bienvenido a nuestro aplicativo CARTOP</p>
                    </header>
                    <div class="box special" style="background: transparent; box-shadow:none;">
                        <div id="a1">
                            <div style="padding-left: 30%">
                                <div class="row uniform 50%">
                                    <div class="12u(mobilep)">
                                        <asp:Label ID="labelEmail" runat="server" Text="Correo "></asp:Label>
                                        <asp:TextBox ID="txtEmail" style="display:inline;" runat="server" TextMode="Email" class="form-control" name="Validar" placeholder="Ingrese su Correo Electrónico" />
                                        <div id="mensaje1" class="errores">Digita tu Correo Electrónico</div>
                                        <div id="mensaje3" class="errores">Digita un Correo Electrónico Correcto</div>
                                    </div>
                                </div>
                                <div class="row uniform 50%">
                                    <div class="12u(mobilep)">
                                        <label style="color:white; " for="txtPass">Contraseña</label>
                                        <asp:TextBox ID="txtPass" style="display:inline;width:125%;" runat="server" TextMode="password" class="form-control" name="Validar" placeholder="Ingrese su contraseña" />
                                        <div id="mensaje2" class="errores">Digita tu Contraseña</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row uniform">
                                <div class="12u">
                                    <ul class="actions align-center">
                                        <li>
                                            <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" OnClick="btnIngresar_Click" class="button small" />

                                        </li>
                                        <li>
                                            <asp:Button runat="server" ID="btnRegistar" OnClick="btnRegistar_Click" Text="Registro" class="button small" />
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div class="row align-center" style="padding-left: 40%; padding-top: 2%;">
                                <asp:Button runat="server" ID="Menurecuperar" class="Menurecuperar" Style="border: none; background-color: transparent; color: white;" Text="Recuperar Contraseña" />
                            </div>
                        </div>
                        <div id="a2">

                            <div style="padding-left: 30%">
                                <div class="row uniform 50%">
                                    <div class="12u(mobilep)">
                                        <asp:Label ID="LabelCorreo" runat="server" Text="Correo Electronico"></asp:Label>
                                        <asp:TextBox ID="txtEmailUsuario" runat="server" TextMode="Email" class="form-control" name="Enviar" placeholder="Ingrese su Correo" />
                                        <div id="mensaje4" class="errores">Digita tu Correo</div>
                                    </div>
                                </div>
                            </div>
                            <div class="row uniform">
                                <div class="12u">
                                    <ul class="actions align-center">
                                        <li>
                                            <asp:Button ID="Recuperar" runat="server" Text="Recuperar"  class="recuperar btn btn-success" OnClick="Recuperar_Click"/>

                                        </li>
                                        <li>
                                            <asp:Button runat="server" ID="volver" Text="Volver" class="volver btn btn-link" />
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="row uniform" style="padding-left: 30%;">
                            <asp:Label ID="mensaje" class="mensaje" runat="server" />
                            <label id="mensajejs" class="mensajejs" style="display: none;"></label>
                            <asp:Label ID="mensajeEmail" runat="server"></asp:Label>
                        </div>
                    </div>

                </section>
            </section>

            <!-- Footer -->
            <footer id="footer">
                <ul class="icons">
                    <li><a href="https://twitter.com/?lang=es" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                    <li><a href="https://es-la.facebook.com/" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                    <li><a href="https://www.instagram.com/" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                    <li><a href="https://github.com/" class="icon fa-github"><span class="label">Github</span></a></li>
                    <li><a href="https://dribbble.com/" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
                    <li><a href="https://plus.google.com/?hl=es-419" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
                </ul>
                <ul class="copyright">
                    <li>&copy; Derechos Reservados a Cartop.</li>
                    <li>Aplicación diseñada por:<a href="Inicio.aspx">Cartop</a></li>
                </ul>
            </footer>

        </div>
    </form>
    <!-- Scripts -->
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/jquery.dropotron.min.js"></script>
    <script src="../assets/js/jquery.scrollgress.min.js"></script>
    <script src="../assets/js/skel.min.js"></script>
    <script src="../assets/js/util.js"></script>
    <script src="../assets/js/main.js"></script>
</body>
</html>

