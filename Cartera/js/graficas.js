$(function (e) {
    //var Mesas = $("#graficara");
    //var mesa = new Raphael(Mesas, 300, 400);
    $('.Graficar').on('click', function (e) {
        e.preventDefault();
        graficas();
    });
    function graficas() {
        var arrayX = new Array();
        var tam = 400;
        var corrX = new Array();
        var corrY = new Array();
        var XMayor;
        var YMayor;

        $('input[name=inputCoordenadasX]').each(function () {
            arrayX.push($(this).val().trim());
        });

        var arrayY = new Array();
        $('input[name=inputCoordenadasY]').each(function () {
            arrayY.push($(this).val().trim());
        })
        var n = $('#txtAgregar').val().trim();

        for (var i = 0 ; i < n; i++) {
            if (arrayX[i] >= tam) {
                XMayor = parseInt(arrayX[i]);
            } else if (arrayY[i] >= tam) {
                YMayor = parseInt(arrayY[i]);
            }
        }
        for (var u = 0 ; u < n ; u++) {
            if (XMayor > tam || YMayor > tam) {
                corrX[u] = parseInt(arrayX[u] / 3);
                corrY[u] = parseInt(arrayY[u] / 3);
            }
        }

        var grafica = '<svg  height="400px" width="400px" id="hola" viewBox="0 0 100 100"><polyline style="position: absolute;" id="prueba" points ="0,0' ;
        for (var o = 0 ; o < n; o++) {
            grafica += ' ' + corrX[o] + ',' + corrY[o] + '';
        }
        grafica += '" style="fill:white;stroke:red;stroke-width:4" ></polyline></svg>';

        $('#graficara').html(grafica);

    }



});
