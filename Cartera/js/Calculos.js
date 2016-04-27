$(function () {
    var x = 0;
    var xM = 0;
    $('.Calcular').on('click', function (e) {
        e.preventDefault();
        calcularAngulos();
        calcularDistancia();
    });

    function calcularAngulos() {
        var totalSegundos = 0.0;
        var totalMinutos = 0.0;
        var totalGrados = 0.0;
        var m = 0;
        var g = 0;
        //calcular Segundos
        var arraySegundos = new Array();
        $('input[name=Segundos]').each(function () {
            arraySegundos.push($(this).val());
        });
        for (var i = 0; i < arraySegundos.length; i++) {
            totalSegundos += parseFloat(arraySegundos[i]);
        }
        while (totalSegundos >= 60) {
            totalSegundos -= 60;
            m++;
        }
        $('#segundos').text(totalSegundos);
        //Calcular minutos
        var arrayMinutos = new Array();
        $('input[name=Minutos]').each(function () {
            arrayMinutos.push($(this).val());
        });
        for (var i = 0; i < arrayMinutos.length; i++) {
            totalMinutos += parseFloat(arrayMinutos[i]);
        }
        totalMinutos += m;
        while (totalMinutos >= 60) {
            totalMinutos -= 60;
            g++;
        }
        $('#minutos').text(totalMinutos);
        //Calcular Grados
        var arrayGrados = new Array();
        $('input[name=Grados]').each(function () {
            arrayGrados.push($(this).val());
        });
        for (var i = 0; i < arrayGrados.length; i++) {
            totalGrados += parseFloat(arrayGrados[i]);
        }
        totalGrados += g;
        $('#grados').text(totalGrados);
        if (totalSegundos != 0 || totalMinutos != 0) {
            generarTablaErrores(totalSegundos, totalMinutos);
        }
    }

    function calcularAngulosCorregidos(arrayS, arrayM) {
        var totalSegundos = 0.0;
        var totalMinutos = 0.0;
        var totalGrados = 0.0;
        var m = 0;
        var g = 0;
        var arraySegundos = new Array();
        $('input[name=Segundos]').each(function () {
            arraySegundos.push($(this).val());
        });
        for (var i = 0; i < arraySegundos.length; i++) {
            arraySegundos[i] -= arrayS[i];
            totalSegundos += parseFloat(arraySegundos[i]);
        }
        while (totalSegundos >= 60) {
            totalSegundos -= 60;
            m++;
        }
        $('#segundosC').text(totalSegundos);
        //Calcular minutos
        var arrayMinutos = new Array();
        $('input[name=Minutos]').each(function () {
            arrayMinutos.push($(this).val());
        });
        for (var i = 0; i < arrayMinutos.length; i++) {
            arrayMinutos[i] -= arrayM[i];
            totalMinutos += parseFloat(arrayMinutos[i]);
        }
        totalMinutos += m;
        while (totalMinutos >= 60) {
            totalMinutos -= 60;
            g++;
        }
        $('#minutosC').text(totalMinutos);
        //Calcular Grados
        var arrayGrados = new Array();
        $('input[name=Grados]').each(function () {
            arrayGrados.push($(this).val());
        });
        for (var i = 0; i < arrayGrados.length; i++) {
            totalGrados += parseFloat(arrayGrados[i]);
        }
        totalGrados += g;
        $('#gradosC').text(totalGrados);

        generarAngulosCorregidos(arrayMinutos, arraySegundos, arrayGrados);
        calcularAzimut(arrayMinutos, arraySegundos, arrayGrados);
    }

    function calcularDistancia() {
        var arrayDistancia = new Array();
        $('input[name=Distancia]').each(function () {
            arrayDistancia.push($(this).val());
        });
        var total = 0.0;
        for (var i = 0; i < arrayDistancia.length; i++) {
            total += parseFloat(arrayDistancia[i]);
        }
        total.toFixed(2),
        $('#perimetro').text(total);
    }

    function generarTablaErrores(totalSegundos, totalMinutos) {
        var arrayPunto = new Array();
        var arrayEstacion = new Array();
        var arrayGrados = new Array();
        var arryMinutos = new Array();
        var arraySegundos = new Array();
        $('input[name=Punto]').each(function () {
            arrayPunto.push($(this).val());
        })
        $('input[name=Estacion').each(function () {
            arrayEstacion.push($(this).val());
        })
        $('input[name=Grados]').each(function () {
            arrayGrados.push($(this).val())
        })
        $('input[name=Minutos]').each(function () {
            arryMinutos.push($(this).val())
        })
        $('input[name=Segundos]').each(function () {
            arraySegundos.push($(this).val())
        })
        var n = parseInt($('#txtAgregar').val());
        var arrayS = [];
        var arrayM = [];
        totalSegundos = totalSegundos / n;
        totalMinutos = totalMinutos / n;
        totalM = totalMinutos;
        total = totalSegundos;
        var y = 0;
        var yM = 0;
        var num = totalSegundos;
        var numM = totalMinutos;
        for (var i = 0; i < n; i++) {
            numM = Math.round(totalMinutos);
            xM = numM;
            xM -= yM;
            arrayM[i] = xM;
            yM = numM;
            num = Math.round(totalSegundos);
            x = num;
            x -= y;
            arrayS[i] = x;
            y = num;
            var data = "<tr><td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' id='idEstacion" + i + "' name='lblestacion' value='" + arrayEstacion[i] + "'></input></td><td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' id='idPunto" + i + "' name='lblpunto' value='" + arrayPunto[i] + "'></input></td></td> <td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' name='lblGrados' value='" + arrayGrados[i] + "'></input></td> <td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' name='lblMinutos' value='" + arryMinutos[i] + "'></input></td> <td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' name='lblSegundos' value='" + arraySegundos[i] + "'></input></td> <td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' name='lblDivisionMinutos' value='" + totalMinutos + "'></input></td><td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' name='lblRedondeoMinutos' value='" + numM + "'></input></td><td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' name='lblDiferenciaMinutos' value='" + xM + "'></input></td> <td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' name='lblDivisionSegundos' value='" + totalSegundos + "'></input></td><td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' name='lblRedondeoSegundos' value='" + num + "'></input></td><td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' name='lblDiferenciaSegundos' value='" + x + "'></input></td></tr>";
            $('#tableError').append(data);
            totalMinutos += totalM;
            totalSegundos += total;
            numM = totalMinutos;
            num = totalSegundos;

        }

        calcularAngulosCorregidos(arrayS, arrayM);

    }

    function generarAngulosCorregidos(arrayMinutos, arraySegundos, arrayGrados) {
        var arrayPunto = new Array();
        var arrayEstacion = new Array();
        $('input[name=Punto]').each(function () {
            arrayPunto.push($(this).val());
        })
        $('input[name=Estacion').each(function () {
            arrayEstacion.push($(this).val());
        });
        var n = parseInt($('#txtAgregar').val());
        for (var i = 0; i < n; i++) {
            var data = "<tr><td><input type='text' style='border: none; text-align:center;' OnFocus='this.blur()' id='idEstacion" + i + "' name='lblestacion' value='" + arrayEstacion[i] + "'></input></td><td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' id='idPunto" + i + "' name='lblpunto' value='" + arrayPunto[i] + "'></input></td><td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' id='gradosC" + i + "'  name='inputGradosCorregidos' value='" + arrayGrados[i] + "'></input></td> <td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' id='minutosC" + i + "' name='inputMinutosCorregidos' value='" + arrayMinutos[i] + "'></input></td> <td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' id='segundosC" + i + "' name='inputSegundosCorregidos' value='" + arraySegundos[i] + "'></input></td></tr>";
            $('#AngulosCorregidos').append(data);
        }
    }

    function calcularAzimut(arrayMinutos, arraySegundos, arrayGrados) {
        var arrayPunto = new Array();
        var arrayEstacion = new Array();
        $('input[name=Punto]').each(function () {
            arrayPunto.push($(this).val());
        })
        $('input[name=Estacion').each(function () {
            arrayEstacion.push($(this).val());
        });
        var n = $('#txtAgregar').val().trim();
        var azGrados = parseInt($('#azGrados').val().trim());
        var azMinutos = parseInt($('#azMinutos').val().trim());
        var azSegundos = parseInt($('#azSegundos').val().trim());
        var arrayAzGrados = [];
        var arrayAzMinutos = [];
        var arrayAzSegundos = [];
        var i = 0;
        arrayAzGrados[i] = azGrados;
        arrayAzMinutos[i] = azMinutos;
        arrayAzSegundos[i] = azSegundos;
        i = 1;
        while (i < n) {
            var m = 0;
            var g = 0;
            azGrados += 180;
            azSegundos += parseInt(arraySegundos[i]);
            if (azSegundos >= 60) {
                azSegundos -= 60;
                m++;
            }
            azMinutos += parseInt(arrayMinutos[i]);
            azMinutos += m;
            if (azMinutos >= 60) {
                azMinutos -= 60;
                g++;
            }

            azGrados += parseInt(arrayGrados[i]);
            azGrados += g;
            if (azGrados >= 360) {
                azGrados -= 360;
                arrayAzGrados[i] = azGrados;
                arrayAzMinutos[i] = azMinutos;
                arrayAzSegundos[i] = azSegundos;
                i++;
            } else {
                arrayAzGrados[i] = azGrados;
                arrayAzMinutos[i] = azMinutos;
                arrayAzSegundos[i] = azSegundos;
                i++;
            }
        }

        for (var i = 0; i < n; i++) {
            var data = "<tr><td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' type='text' OnFocus='this.blur()' id='idEstacion" + i + "' name='lblestacion' value='" + arrayEstacion[i] + "'></input></td><td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' id='idPunto" + i + "' name='lblpunto' value='" + arrayPunto[i] + "'></input></td><td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' id='azimutGrados" + i + "' name='azimutGrados' value='" + arrayAzGrados[i] + "'></input></td> <td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' id='azimutMinutos" + i + "' name='azimutMinutos' value='" + arrayAzMinutos[i] + "'></input></td> <td><input style='border: none; text-align:center;' type='text' OnFocus='this.blur()' id='azimutSegundos" + i + "' name='azimutSegundos' value='" + arrayAzSegundos[i] + "'></input></td></tr>";
            $('#tableAzimut').append(data);
        }

        calcularProyecciones(arrayAzGrados, arrayAzMinutos, arrayAzSegundos);

    }

    function calcularProyecciones(arrayAzGrados, arrayAzMinutos, arrayAzSegundos) {
        var n = $('#txtAgregar').val().trim();
        var perimetro = 0.0;
        var totalX = 0.0;
        var totalY = 0.0;
        var arrayDistancia = new Array();
        var arrayX = new Array();
        var arrayY = new Array();
        var arrayCoordenadasX = new Array();
        var arrayCoordenadasY = new Array();
        var arrayPunto = new Array();
        var arrayEstacion = new Array();
        $('input[name=Punto]').each(function () {
            arrayPunto.push($(this).val());
        })
        $('input[name=Estacion').each(function () {
            arrayEstacion.push($(this).val());
        });
        $('input[name=Distancia]').each(function () {
            arrayDistancia.push($(this).val());
        });
        for (var i = 0; i < n; i++) {
            var total = 0.0;
            perimetro += parseFloat(arrayDistancia[i]);
            total = arrayAzGrados[i] + (arrayAzMinutos[i] / 60) + (arrayAzSegundos[i] / 3600);
            arrayX[i] = Math.round((parseFloat(arrayDistancia[i]) * Math.sin(total * Math.PI / 180)) * 1000) / 1000;
            totalX += arrayX[i];
            arrayY[i] = Math.round((parseFloat(arrayDistancia[i]) * Math.cos(total * Math.PI / 180)) * 1000) / 1000;
            totalY += arrayY[i];
        }
        if (totalX > 0.0) {
            for (var i = 0; i < n; i++) {
                var correccionX = 0.0;
                correccionX = (totalX / perimetro) * arrayDistancia[i];
                arrayX[i] -= correccionX;
            }
        } else {
            for (var i = 0; i < n; i++) {
                var correccionX = 0.0;
                correccionX = (totalX / perimetro) * arrayDistancia[i];
                arrayX[i] += correccionX;
            }
        }

        if (totalY > 0.0) {
            for (var i = 0; i < n; i++) {
                var correccionY = 0.0;
                correccionY = (totalY / perimetro) * arrayDistancia[i];
                arrayY[i] -= correccionY;
            }
        } else {
            for (var i = 0; i < n; i++) {
                var correccionY = 0.0;
                correccionY = (totalY / perimetro) * arrayDistancia[i];
                arrayY[i] += correccionY;
            }
        }

        var coordenadasX = parseFloat($('#txtCoordenadasX').val().trim());
        var coordenadasY = parseFloat($('#txtCoordenadasY').val().trim());
        var i = 0;
        var x= 0
        arrayCoordenadasX[i] = coordenadasX;
        arrayCoordenadasY[i] = coordenadasY;
        i = 1;
        while (i < n) {
            coordenadasX += arrayX[i - 1];
            arrayCoordenadasX[i] = coordenadasX;
            coordenadasY += arrayY[i - 1];
            arrayCoordenadasY[i] = coordenadasY;
            i++;
        }
        for (var i = 0; i < n; i++) {
            var data = "<tr><td><input type='text' style='border: none; text-align:center;' OnFocus='this.blur()' id='estacion" + i + "' name='inputEstacion' value='" + arrayEstacion[i] + "'></input></td><td><input  style='border: none; text-align:center;' type='text' OnFocus='this.blur()' id='punto" + i + "' name='inputPunto' value='" + arrayPunto[i] + "'></input></td><td><input style='border: none; text-align:center;'  type='text' OnFocus='this.blur()' id='azGrados" + i + "' name='inputazimutGrados' value='" + arrayAzGrados[i] + "'></input</td> <td><input style='border: none;text-align:center;'  type='text' OnFocus='this.blur()' id='azMinutos" + i + "' name='inputazimutMinutos' value='" + arrayAzMinutos[i] + "'></input></td> <td><input style='border: none; text-align:center;'  type='text' OnFocus='this.blur()' id='azSegundos" + i + "' name='inputazimutSegundos' value='" + arrayAzSegundos[i] + "'></input></td><td><input style='border: none;text-align:center;'  type='text' OnFocus='this.blur()' id='idDistanciaInput" + i + "' name='inputDistancia' value='" + arrayDistancia[i] + "'></input></td></tr>";
            $('#tableProyeccionA').append(data);
        }
        for (var i = 0; i < n; i++) {
            var data = "<tr><td><input type='text'  style='border: none; text-align:center;' OnFocus='this.blur()' id='idProyeccionXInput" + i + "' name='inputProyeccionX' value='" + arrayX[i].toFixed(3) + "'></input></td><td><input style='border: none;text-align:center;' type='text' OnFocus='this.blur()' id='idProyeccionYInput" + i + "' name='inputProyeccionY' value='" + arrayY[i].toFixed(3) + "'></input></td><td><input style='border: none;text-align:center;'  type='text' style='border: none;'  OnFocus='this.blur()' id='idVertice" + i + "' name='inputVertice' value='" + arrayEstacion[i] + "'></input></td><td><input style='border: none;text-align:center;'  type='text' OnFocus='this.blur()' id='coordenadasX" + i + "' name='inputCoordenadasX' value='" + arrayCoordenadasX[i].toFixed(3) + "'></input></td><td><input style='border: none;text-align:center;'  type='text' OnFocus='this.blur()' id='coordenadasY" + i + "' name='inputCoordenadasY' value='" + arrayCoordenadasY[i].toFixed(3) + "'></input></td></tr>";
            $('#tableProyeccionB').append(data);
        }

        $('#lblProyeccionesTotalX').text(totalX.toFixed(3));
        $('#lblProyeccionesTotalY').text(totalY.toFixed(3));
        
    }
});
