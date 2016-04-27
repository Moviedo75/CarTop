$(function () {
    $('.Agregar').on('click', function (e) {
        generarTablaPoligonal();
        e.preventDefault();
    });

    $('.Borrar').on('click', borrarFilas());
    function generarTablaPoligonal() {
        var n = $('#txtAgregar').val();
        for (var i = 1; i <= n; i++) {
            var data = "<tr><td class='narrowder'><input type='checkbox' class='case ' id='borrar" + i + "' /><label for='borrar" + i + "'></td>";
            data += "<td><input style='text-align:center;' type='text' required class='form-control' id='idEstacion" + i + "' name='Estacion' /></td> <td><input style='text-align:center;' type='text' id='idPunto" + i + "' name='Punto' /></td> <td><input style='text-align:center;' type='text' id='idGrados" + i + "' name='Grados' /></td><td><input style='text-align:center;' type='text' id='idMinutos" + i + " class='solo-numero' name='Minutos' /> </td><td><input style='text-align:center;' type='text' id='idSegundos" + i + "' name='Segundos' /></td> <td><input type='text' id='idDistancia" + i + "' name='Distancia' /></td></tr>";
            $('#tablePoligonal').append(data);
        }
      }
    function borrarFilas() {
        $('.Borrar').on('click', function (e) {
            $('.case:checkbox:checked').parents("tr").remove();
            e.preventDefault();
        });
    }

});