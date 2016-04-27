$(function () {
    $('.Configurar').on('click', function (e) {
        if ($('#txtNombre').attr("disabled")) {
            e.preventDefault();
            habilitar();
        }
    });
    function habilitar() {
            $('#txtNombre').removeAttr("disabled");
            $('#txtApellido').removeAttr("disabled");
            $('#txtEmail').removeAttr("disabled");
    }
});