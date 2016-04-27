<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="Cartera.view.Menu" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="../assets/css/main.css" />
    <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

</head>
<body>
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

            <!-- Main -->
            <section id="main" class="container">
                <header>
                    <h2>Menu De Carteras</h2>
                </header>
                <div class="box special">
                    <span class="image featured">
                        <img src="../images/topo.jpg" alt="" /></span>
                    <h2>Hola <asp:label runat="server" ID="lblUsuario"></asp:label>  &nbsp;Seleccione Cartera</h2>
                    <p>Por Favor Seleccione el Tipo de Cartera a Trabajar Ya sea Poligonal o Nivelacion</p>
                    <div class="row">
                        <div class="6u 12u(mobilep)">
                            <a href="carteraPoligonal.aspx" class="button">Cartera Poligonal</a>
                            <br />
                        </div>
                        <div class="6u 12u(mobilep)">
                            <a href="carteraPoligonal.aspx" class="button">Cartera Nivelacion</a>
                        </div>
                        <div>
                            <asp:Label runat="server" Text="Carteras Realizadas"></asp:Label>
                            <div>
                                <asp:GridView runat="server" ID="CarterasPoligonales" OnRowCommand="CarterasPoligonales_RowCommand" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField HeaderText="Nombre de la cartera" DataField="nombreCartera"/>
                                        <asp:BoundField HeaderText="Fecha de realizacion" DataField="fRealizacion" DataFormatString="{0:M-dd-yyyy}"/>
                                        <asp:ButtonField ButtonType="Button" Text="Ver" CommandName="Ver" HeaderText="Ver Carteras"/>
                                        <asp:ButtonField ButtonType="Button" Text="Editar" CommandName="Editar" HeaderText="Editar Carteras"/>
                                        <asp:ButtonField ButtonType="Button" Text="Eliminar" CommandName="Eliminar" HeaderText="Eliminar Carteras"/>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div>
                            <asp:Label runat="server" ID="lblNombreCartera"></asp:Label>
                            <div>
                                <asp:GridView runat="server" ID="CarteraPoligonal" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField HeaderText="Estacion" DataField="estacion" />
                                        <asp:BoundField HeaderText="Punto" DataField="punto" />
                                        <asp:BoundField HeaderText="Angulos en Grados" DataField="aGrados"/>
                                        <asp:BoundField HeaderText="Angulos en Minutos" DataField="aMinutos"/>
                                        <asp:BoundField HeaderText="Angulos en Segundos" DataField="aSegundos"/>
                                        <asp:BoundField HeaderText="Distancia" DataField="distancia"/>
                                        <asp:BoundField HeaderText="Grados en Azimut" DataField="azGrados"/>
                                        <asp:BoundField HeaderText="Minutos en Azimut" DataField="azMinutos"/>
                                        <asp:BoundField HeaderText="Segundo en Azimut" DataField="azSegundos"/>
                                        <asp:BoundField HeaderText="Proyecciones en X" DataField="proyeccionX"/>
                                        <asp:BoundField HeaderText="Proyecciones en Y" DataField="proyeccionY"/>
                                        <asp:BoundField HeaderText="Vertice" DataField="vertice"/>
                                        <asp:BoundField HeaderText="Coordenadas en X" DataField="coordenadasX"/>
                                        <asp:BoundField HeaderText="Coordenadas en Y" DataField="coordenadasY"/>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div>
                            <div>
                                <asp:GridView runat="server" ID="CaracPoligonal"  AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:BoundField HeaderText="Perimetro" DataField="perimetro" />
                                        <asp:BoundField HeaderText="Total proyeccion en X" DataField="tProyeccionX" />
                                        <asp:BoundField HeaderText="Total proyeccion en Y" DataField="tProyeccionY"/>
                                        <asp:BoundField HeaderText="Tipo de poligonal" DataField="tipo"/>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div>
                            <asp:Button ID="btnExportar" runat="server" OnClick="btnExportar_Click" Text="Exportar"/>
                        </div>
                    </div>
                </div>
                <div>

                </div>
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
                    <li>Aplicacion diseñada por: <a href="InicioLogin.html">Cartop</a></li>
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
