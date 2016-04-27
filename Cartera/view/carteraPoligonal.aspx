<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="carteraPoligonal.aspx.cs" Inherits="Cartera.view.carteraPoligonal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Cartera Poligonal</title>
    <<meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="../assets/css/main.css" />
    <link href="../assets/css/div.css" rel="stylesheet" />
    <link href="../assets/css/menu.css" rel="stylesheet" />
    <script src="../js/jquery-2.2.2.min.js"></script>
    <script src="../js/graficas.js"></script>
    <script src="../js/validarRecuperarContraseña.js"></script>
    <script src="../js/ValidarCamposCartera.js"></script>
    <script src="../js/validarRangoNumerico.js"></script>
    <script src="../js/jquery.numeric.js"></script>
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
                        <li><a href="CambiarContrasenia" class="icon fa-angle-down"><asp:Label runat="server" ID="lblEmail"></asp:Label></a></li>
                        <li><a href="CerrarSesion.aspx">Salir</a></li>
                    </ul>
                </nav>
            </header>

            <!-- Main -->
            <section id="main" class="container">
                <header>
                    <h2>Cree Su Cartera</h2>
                    <p>De manera mas optima.</p>
                </header>
                <div class="row">
                    <div class="12u">
                        <section class="box">
                            <div class="row">
                                <h2>Cartera Poligonal</h2>
                                <div class="12u">

                                    <!-- Table -->
                                    <section class="box">
                                        <div class="6u 12u(mobilep)">
                                            <asp:Label runat="server">Digite el numero de puntos</asp:Label>
                                            <input type="text" class="uniform" id="txtAgregar" />
                                            <br />
                                        </div>
                                        <ul class="actions">
                                            <li>
                                                <asp:Button runat="server" name="agregar" class="Agregar button special small" Text="Agregar Filas" />
                                            </li>
                                            <li>
                                                <asp:Button runat="server" name="borrar" class="Borrar button special small" Text="Borrar Filas" />
                                            </li>
                                        </ul>
                                        <div class="uniform">
                                            <table id="tablePoligonal" class="alt">
                                                <tr>
                                                    <th>Fila</th>
                                                    <th>Estacion</th>
                                                    <th>Punto</th>
                                                    <th>Grados</th>
                                                    <th>Minutos</th>
                                                    <th>Segundos</th>
                                                    <th>Distancia</th>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="row uniform 50%">
                                            <div class="6u 12u(mobilep)">
                                                <asp:Label runat="server">Azimut</asp:Label>
                                                <asp:Label runat="server">Grados Azimut</asp:Label>
                                                <asp:TextBox style='text-align:center;' runat="server" ID="azGrados"></asp:TextBox>
                                                <asp:Label runat="server">Minutos Azimut</asp:Label>
                                                <asp:TextBox style='text-align:center;' runat="server" CssClass="small" ID="azMinutos"></asp:TextBox>
                                                <asp:Label runat="server">Segundos Azimut</asp:Label>
                                                <asp:TextBox style='text-align:center;' runat="server" ID="azSegundos"></asp:TextBox>
                                            </div>
                                            <div class="6u 12u(mobilep)">
                                                <asp:Label runat="server">Coordenadas</asp:Label>
                                                <asp:Label runat="server">Coordenadas del primer vertice en X</asp:Label>
                                                <asp:TextBox style='text-align:center;' runat="server" ID="txtCoordenadasX"></asp:TextBox>
                                                <asp:Label runat="server">Coordenadas del primer vertice en Y</asp:Label>
                                                <asp:TextBox style='text-align:center;' runat="server" ID="txtCoordenadasY"></asp:TextBox>
                                            </div>
                                        </div>
                                        <br />
                                        <ul class="actions">
                                            <li>
                                                <asp:Button runat="server" class="Calcular button special small" Text="Calcular" />
                                            </li>
                                            <li>
                                                <asp:Button runat="server" ID="Graficar" class="Graficar button special small" Text="Graficar"></asp:Button>
                                            </li>
                                        </ul>
                                        <div class="row uniform 50%">
                                            <div class="6u 12u(mobilep)" style="border-color: black;">
                                                <label>total de proyecciones en X</label>
                                                <asp:Label ID="lblProyeccionesTotalX" runat="server"></asp:Label>
                                            </div>
                                            <!-- nuevo -->
                                            <div class="6u 12u(mobilep)" style="border-color: black;">
                                                <label>Total de proyecciones en Y </label>
                                                <asp:Label ID="lblProyeccionesTotalY" runat="server"></asp:Label>
                                            </div>
                                            <!-- nuevo -->
                                        </div>
                                        <br />
                                        <br />
                                        <div>
                                            <ul class="actions">
                                                <li>
                                                    <input id="tab-1" type="radio" name="MostrarA1" class="MostrarA1" />
                                                    <label for="tab-1">Suma de angulos totales y perimetro</label>
                                                </li>
                                                <li>
                                                    <input id="tab-2" type="radio" name="MostrarA2" class="MostrarA2" />
                                                    <label for="tab-2">Angulos totales corregidos</label>
                                                </li>
                                                <li>
                                                    <input id="tab-4" type="radio" name="MostrarA4" class="MostrarA4" />
                                                    <label for="tab-4">Azimut</label>
                                                </li>
                                                <li>
                                                    <input id="tab-3" type="radio" name="MostrarA3" class="MostrarA3" />
                                                    <label for="tab-3">sumatoria de angulos corregidos</label>
                                                </li>
                                                <li>
                                                    <input id="tab-5" type="radio" name="MostrarA5" class="MostrarA5" />
                                                    <label for="tab-5">Proyecciones y coordenadas</label>
                                                </li>
                                                <li>
                                                    <input id="tab-6" type="radio" name="MostrarA6" class="MostrarA6" />
                                                    <label for="tab-6">Graficas</label>
                                                </li>
                                            </ul>
                                            <!--Contenido a mostrar/ocultar-->
                                            <div id="A">
                                                <!--Contenido de la Pestaña 1-->
                                                <div id="content-1">
                                                    <div id="a1">
                                                        <div>
                                                            <table class="alt">
                                                                <tr>
                                                                    <th  style="text-align:center;">Suma de angulos totales y perimetro
                                                                        <table class="alt">
                                                                            <tr>
                                                                                <th style="text-align:center;">Grados</th>
                                                                                <th style="text-align:center;">Minutos</th>
                                                                                <th style="text-align:center;">Segundos</th>
                                                                                <th style="text-align:center;">Perimetro</th>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <label id="grados"></label>
                                                                                </td>
                                                                                <td>
                                                                                    <label id="minutos"></label>
                                                                                </td>
                                                                                <td>
                                                                                    <label id="segundos"></label>
                                                                                </td>
                                                                                <td>
                                                                                    <label id="perimetro"></label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </th>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <div>
                                                            <table id="tableError" class="alt">
                                                                <tr>
                                                                    <th style="text-align:center;">Estacion</th>
                                                                    <th style="text-align:center;">Punto</th>
                                                                    <th style="text-align:center;">Grados</th>
                                                                    <th style="text-align:center;">Minutos</th>
                                                                    <th style="text-align:center;">Segundos</th>
                                                                    <th style="text-align:center;">Multiplos de correcion Minutos</th>
                                                                    <th style="text-align:center;">Correccion redondeada Minutos</th>
                                                                    <th style="text-align:center;">Diferencias sucesivas Minutos</th>
                                                                    <th style="text-align:center;">Multiplos de correcion Segundos</th>
                                                                    <th style="text-align:center;">Correccion redondeada Segundos</th>
                                                                    <th style="text-align:center;">Diferencias sucesivas Segundos</th>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--Contenido de la Pestaña 2-->
                                                <div id="content-2">
                                                    <div id="a2">
                                                        <div class="table-wrapper">
                                                            <table border="1">
                                                                <tr>
                                                                    <th style="text-align:center;">Angulos totales corregidos
                                                                        <table id="AngulosCorregidos">
                                                                            <tr>
                                                                                <th style="text-align:center;">Estacion</th>
                                                                                <th style="text-align:center;">Punto</th>
                                                                                <th style="text-align:center;">Grados</th>
                                                                                <th style="text-align:center;">Minutos</th>
                                                                                <th style="text-align:center;">Segundos</th>
                                                                            </tr>
                                                                        </table>
                                                                    </th>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!--Contenido de la Pestaña 3-->
                                                <div id="content-3">
                                                    <div id="a3">
                                                        <div class="table-wrapper">
                                                            <table border="1">
                                                                <tr>
                                                                    <!--s-->
                                                                    <th  style="text-align:center;">sumatoria de angulos corregidos
                                                                        <table id="totalCorregidos">
                                                                            <tr>
                                                                                <th  style="text-align:center;">Grados</th>
                                                                                <th style="text-align:center;">Minutos</th>
                                                                                <th style="text-align:center;">Segundos</th>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <label id="gradosC"></label>
                                                                                </td>
                                                                                <td>
                                                                                    <label id="minutosC"></label>
                                                                                </td>
                                                                                <td>
                                                                                    <label id="segundosC"></label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </th>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="content-4">
                                                    <div id="a4">
                                                        <div class="table-wrapper">
                                                            <table border="1">
                                                                <tr>
                                                                    <th  style="text-align:center;">Azimut
                                                            <table id="tableAzimut">
                                                                <tr>
                                                                    <th  style="text-align:center;">Estacion</th>
                                                                    <th  style="text-align:center;">Punto</th>
                                                                    <th  style="text-align:center;">Grados</th>
                                                                    <th  style="text-align:center;">Minutos</th>
                                                                    <th  style="text-align:center;">Segundos</th>
                                                                </tr>
                                                            </table>
                                                                    </th>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="content-5">
                                                    <div id="a5">
                                                        <div>
                                                            <table border="1">
                                                                <tr>
                                                                    <th  style="text-align:center;">Azimut
                                                                        <table id="tableProyeccionA">
                                                                            <tr>
                                                                                <th style="text-align:center;">Estacion</th>
                                                                                <th style="text-align:center;">Punto</th>
                                                                                <th style="text-align:center;">Grados</th>
                                                                                <th style="text-align:center;">Minutos</th>
                                                                                <th style="text-align:center;">Segundos</th>
                                                                                <th style="text-align:center;">Distancia</th>
                                                                            </tr>
                                                                        </table>
                                                                    </th>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <br />
                                                        <div>
                                                            <table border="1">
                                                                <tr>
                                                                    <th  style="text-align:center;">Proyecciones y coordenadas
                                                                        <table id="tableProyeccionB">
                                                                            <tr>
                                                                                <th style="text-align:center;">X</th>
                                                                                <th style="text-align:center;">Y</th>
                                                                                <th style="text-align:center;">Vertice</th>
                                                                                <th style="text-align:center;">Coordenadas X</th>
                                                                                <th style="text-align:center;">Coordenadas Y</th>
                                                                            </tr>
                                                                        </table>
                                                                    </th>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="a6">
                                            <div id="graficara" >
                                            </div>
                                        </div>
                                    </section>
                                    <h2 style="padding-left: 35%;">Guardar Cartera</h2>
                                    <div class="row uniform 50%">
                                        <div class="6u 12u(mobilep)">
                                            <asp:TextBox runat="server" ID="txtNombreCartera"></asp:TextBox>
                                            <asp:Label ID="Message" runat="server"></asp:Label>
                                        </div>
                                        <div class="6u 12u(mobilep)">
                                            <ul class="actions">
                                                <li>
                                                    <asp:Button runat="server" CssClass="button special small" ID="btnGuardar" Text="Guardar Cartera" OnClientClick="saveCartera(); return false" />
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
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
                <li>Aplicación diseñada por: <a href="InicioLogin.aspx">Cartop</a></li>
            </ul>
        </footer>
        <!-- Scripts -->
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/jquery.dropotron.min.js"></script>
        <script src="../assets/js/jquery.scrollgress.min.js"></script>
        <script src="../assets/js/skel.min.js"></script>
        <script src="../assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="../assets/js/main.js"></script>
        <a href="carteraPoligonal.aspx">carteraPoligonal.aspx</a>
        <script src="../js/generarTablas.js"></script>
        <script src="../js/Calculos.js"></script>
        <script src="../js/mostrar.js"></script>
        <script src="../js/raphael.min.js"></script>
        <script type="text/javascript">
            function saveCartera() {
                var estacion = new Array();
                $('input[name=inputEstacion]').each(function () {
                    estacion.push($(this).val().trim());
                });
                var punto = new Array();
                $('input[name=inputPunto]').each(function () {
                    punto.push($(this).val().trim());
                });
                var angulosGrados = new Array();
                $('input[name=inputGradosCorregidos]').each(function () {
                    angulosGrados.push($(this).val().trim());
                });
                var angulosMinutos = new Array();
                $('input[name=inputMinutosCorregidos]').each(function () {
                    angulosMinutos.push($(this).val().trim());
                });
                var angulosSegundos = new Array();
                $('input[name=inputSegundosCorregidos]').each(function () {
                    angulosSegundos.push($(this).val().trim());
                });
                var distancia = new Array();
                $('input[name=inputDistancia]').each(function () {
                    distancia.push($(this).val().trim());
                });
                var azGrados = new Array();
                $('input[name=inputazimutGrados]').each(function () {
                    azGrados.push($(this).val().trim());
                });
                var azMinutos = new Array();
                $('input[name=inputazimutMinutos]').each(function () {
                    azMinutos.push($(this).val().trim());
                });
                var azSegundos = new Array();
                $('input[name=inputazimutSegundos]').each(function () {
                    azSegundos.push($(this).val().trim());
                });
                var proyeccionesX = new Array();
                $('input[name=inputProyeccionX]').each(function () {
                    proyeccionesX.push($(this).val());
                });
                var proyeccionesY = new Array();
                $('input[name=inputProyeccionY]').each(function () {
                    proyeccionesY.push($(this).val().trim());
                });
                var vertice = new Array();
                $('input[name=inputVertice]').each(function () {
                    vertice.push($(this).val().trim());
                });
                var coordenadasX = new Array();
                $('input[name=inputCoordenadasX]').each(function () {
                    coordenadasX.push($(this).val().trim());
                });
                var coordenadasY = new Array();
                $('input[name=inputCoordenadasY]').each(function () {
                    coordenadasY.push($(this).val().trim());
                });
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: "carteraPoligonal.aspx/savePoligonal",
                    data: "{nombreCartera:'" + $('#txtNombreCartera').val().trim() + "', email:'" + $('#lblEmail').text() + "', estacion:" + JSON.stringify(estacion) + ", punto:" + JSON.stringify(punto) + ", angulosGrados:" + JSON.stringify(angulosGrados) + ", angulosMinutos:" + JSON.stringify(angulosMinutos) + ", angulosSegundos:" + JSON.stringify(angulosSegundos) + ", distancia:" + JSON.stringify(distancia) + ", azimutsGrados:" + JSON.stringify(azGrados) + ", azimutsMinutos:" + JSON.stringify(azMinutos) + ", azimutsSegundos:" + JSON.stringify(azSegundos) + ", proyeccionesX:" + JSON.stringify(proyeccionesX) + ", proyeccionesY:" + JSON.stringify(proyeccionesY) + ", vertice:" + JSON.stringify(vertice) + ", coordenadasX:" + JSON.stringify(coordenadasX) + ", coordenadasY:" + JSON.stringify(coordenadasY) + ", perimetro:'" + $('#perimetro').text() + "', totalProyeccionX:'" + $('#lblProyeccionesTotalX').text() + "', totalProyeccionY:'" + $('#lblProyeccionesTotalY').text() + "'}",
                    success: function (resultado) {
                        if (resultado.d != "") {
                            $('#Message').text('El nombre de la cartera es igual a otra');
                        } else {
                            $('#Message').text('Exito al guardar en la base de datos');
                            window.location.href = "http://localhost:64906/view/Menu.aspx";
                        }
                    }
                });
            }
        </script>
    </form>
</body>
</html>
