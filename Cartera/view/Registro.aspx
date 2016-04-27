<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Cartera.view.Registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    <link href="../assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../assets/css/mio.css" rel="stylesheet" />
    <link href="../assets/css/FaltanDatos.css" rel="stylesheet" />
    <script src="../js/jquery-2.2.2.min.js"></script>
    <script src="../js/ValidarContraseña.js"></script>
</head>
<body>
    <form runat="server">
        <div id="page-wrapper">

            <!-- Header -->
            <header id="header">
                <h1><a href="Inicio.aspx">Cartop</a></h1>
                <nav id="nav">
                    <ul>
                        <li><a href="Inicio.aspx">Inicio</a></li>
                        <li><a href="Login.aspx" class="button">¿Ya tienes cuenta?</a></li>
                    </ul>
                </nav>
            </header>
            <div id="banner1">
                <!-- Main -->
                <section id="main" class="container 75%">
                    <header>
                        <h2 style="color:white;">Actualizar Datos</h2>
                    </header>
                    <div class="box special"  style="background: transparent; box-shadow:none;">
                        <div style="padding-left:30%;text-align:center;">
                            <div class="row uniform 50%">
                                <div class="6u 12u(mobilep)">
                                    <label style="color:white;">Digite su Nombre</label>
                                    <asp:TextBox style="display:inline;width:125%;"  runat="server" ID="txtNombre" placeholder="Digita tu Nombre" />
                                    <div id="mensaje1" class="errores">Digita tus Nombres</div>
                                </div>
                            </div>
                            <div class="row uniform 50%">
                                <div class="6u 12u(mobilep)">
                                    <label style="color:white;">Digite su Apellido</label>
                                    <asp:TextBox style="display:inline;width:125%;" runat="server" placeholder="Digita tu Apellido" ID="txtApellido" />
                                    <div id="mensaje3" class="errores">Digita tus Apellidos</div>
                                </div>
                            </div>
                            <div class="row uniform 50%">
                                <div class="6u 12u(mobilep)">
                                    <label style="color:white;">Correo Electronico:</label>
                                    <asp:TextBox style="display:inline;width:125%;" runat="server" placeholder="Digita tu Correo Electrónico" ID="txtEmail" />
                                    <div id="mensaje2" class="errores">Digita tu Correo Electrónico</div>
                                    <div id="mensaje7" class="errores">Digita un Correo Electrónico Correcto</div>
                                </div>
                            </div>
                            <div class="row uniform 50%">

                                <div class="6u 12u(mobilep)">
                                    <label style="color:white;">Contraseña:</label>
                                    <span>
                                        <asp:TextBox style="display:inline;width:125%;" Placeholder="Digita Una Contraseñas" runat="server" ID="txtPass" TextMode="Password" /></span>
                                    <div id="mensaje4" class="errores">Digita Una nueva Contraseña</div>
                                    <div id="mensaje9" class="errores">Las contraseñas deben tener de 8 a 15 caracteres como mínimo y debe contener los siguientes elementos: mayúsculas, números.</div>
                                </div>
                                <div id="pswd_info">
                                    <h4 style="color:black;">La contraseña debería cumplir con los siguientes requerimientos:</h4>
                                    <ul>
                                        <li id="letter">Debe tener una letra</li>
                                        <li id="capital">Debe tener al menos una letra en mayúsculas</li>
                                        <li id="number">Debe tener al menos un número</li>
                                        <li id="length">Debe tener 8 carácteres como mínimo</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="row uniform 50%">
                                <div class="6u 12u(mobilep)">
                                    <label style="color:white;">Verificacion de Contraseña:</label>
                                    <asp:TextBox style="display:inline;width:125%;" placeholder="Digita de nuevo la Contraseña:" runat="server" ID="VeriContraseña" TextMode="Password" />
                                    <div id="mensaje5" class="errores">Digita La verificacion de contraseña</div>
                                </div>
                                <div id="Varpswd_info">
                                    <ul>
                                        <li id="Validara">Son Iguales</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <br />
                            <div class="row">
                                <div class="12u">
                                    <ul class="actions align-center">
                                        <asp:Button  runat="server" ID="btnRegistro" Text="Registrar" OnClick="btnRegistro_Click" />
                                    </ul>
                                </div>
                            </div>
                            <div>
                                <asp:Label ID="mensaje" class="mensaje" runat="server" />
                                <label id="mensajejs" class="mensajejs" style="display: none;"></label>
                            </div>
                    </div>
                </section>
            </div>


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
                    <li>Aplicación diseñada por: <a href="Inicio.aspx">Cartop</a></li>
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
