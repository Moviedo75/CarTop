<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InicioLogin.aspx.cs" Inherits="Cartera.view.InicioLogin1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Inicio Cartop</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="../assets/css/main.css" />
    <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
</head>
<body class="landing">
    <form runat="server">
        <div id="page-wrapper">

            <!-- Header -->
            <header id="header">
                <h1><a href="InicioLogin.aspx">Cartop</a></h1>
                <nav id="nav">
                    <ul>
                        <li><a href="InicioLogin.aspx">Inicio</a></li>
                        <li><a href="Menu.aspx">Crear Nuevas Carteras</a></li>
                        <li><a href="CambiarContrasenia.aspx" class="icon fa-angle-down"><asp:Label runat="server" ID="lblEmail"></asp:Label></a></li>
                        <li><a href="CerrarSesion.aspx">Salir</a></li>
                    </ul>
                </nav>
            </header>

            <!-- Banner -->
            <section id="banner">
                <h2>Cartop</h2>
                <p>
                    Lo Mejor Para Optimizar La Creacion De Carteras
                    <br />
                    y Proteger Sus Datos.
                </p>
                <ul class="actions">
                    <li><a href="Menu.aspx" class="button special">Crear Cartera</a></li>
                </ul>
            </section>

            <!-- Main -->
            <section id="main" class="container">

                <section class="box special">
                    <header class="major">
                        <h2>La Creacion de Carteras
                            <br />
                            Mas Eficiente y Segura De La Web
                        </h2>
                        <p>
                            Esta Aplicacion Es De Utilidad Para La Creacion<br />
                            y Sus Respectivos Calculos, Tambien Permite El Almacenamiento De Estas Carteras.
                        </p>
                    </header>
                    <span class="image featured">
                        <img src="../images/logoCartografia.jpg" alt="" /></span>
                </section>

                <section class="box special features">
                    <div class="features-row">
                        <section>
                            <span class="icon major fa-bolt accent2"></span>
                            <h3>Optimizacion</h3>
                            <p>
                                Le permitira mejorar el tiempo de realizacion de sus proyectos a solo unos
                                pasos de manera segura y sencilla.
                            </p>
                        </section>
                        <section>
                            <span class="icon major fa-book accent3"></span>
                            <h3>Creacion de Carteras</h3>
                            <p>
                                Este Software permite le permitira crear sus cartera de manera
                                rapida y eficiente.
                            </p>
                        </section>
                    </div>
                    <div class="features-row">
                        <section>
                            <span class="icon major fa-area-chart accent4"></span>
                            <h3>Graficas</h3>
                            <p>
                                Podra visualizar las estaciones y puntos en un plano mediante las
                                coordenadas que digite en el sistema.
                            </p>
                        </section>
                        <section>
                            <span class="icon major fa-lock accent5"></span>
                            <h3>Seguridad</h3>
                            <p>
                                Almacenara y protegera la informacion de sus carteras para que
                                pueda consultarlas solo usted o su grupo de trabajo.
                            </p>
                        </section>
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
                    <li>Aplicacion diseñada por: <a href="InicioLogin.aspx">Cartop</a></li>
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
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="../assets/js/main.js"></script>
</body>
</html>
