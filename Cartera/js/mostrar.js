$(function () {
    $("#a1").hide();
    $("#a2").hide();
    $("#a3").hide();
    $("#a4").hide();
    $("#a5").hide();
    $("#a6").hide();
    var q = 0;
    $('.MostrarA1').on('click', function (e) {
        q = q++;
        if (q < 1) {
            $('#a1').show();
            $("#a2").hide();
            $("#a3").hide();
            $("#a4").hide();
            $("#a5").hide();
            $("#a6").hide();
            e.preventDefault();
        }
    });
    $('.MostrarA2').on('click', function (e) {
        $('#a1').hide();
        $("#a2").show();
        $("#a3").hide();
        $("#a4").hide();
        $("#a5").hide();
        $("#a6").hide();
        q = q++;
        e.preventDefault();
    });
    $('.MostrarA3').on('click', function (e) {
        $("#a1").hide();
        $("#a2").hide();
        $('#a3').show();
        $("#a4").hide();
        $("#a5").hide();
        $("#a6").hide();
        q = q++;
        e.preventDefault();
    });
    $('.MostrarA4').on('click', function (e) {
        $("#a1").hide();
        $("#a2").hide();
        $('#a3').hide();
        $("#a4").show();
        $("#a5").hide();
        $("#a6").hide();
        q = q++;
        e.preventDefault();
    });
    $('.MostrarA5').on('click', function (e) {
        $("#a1").hide();
        $("#a2").hide();
        $('#a3').hide();
        $("#a4").hide();
        $("#a5").show();
        $("#a6").hide();
        q = q++;
        e.preventDefault();
    });
    $('.MostrarA6').on('click', function (e) {
        $("#a1").hide();
        $("#a2").hide();
        $('#a3').hide();
        $("#a4").hide();
        $("#a5").hide();
        $("#a6").show();
        q = q++;
        e.preventDefault();
    });
    $('.Agregar').on('click', function (e) {
        $("#a1").hide();
        $("#a2").hide();
        $('#a3').hide();
        $("#a4").show();
        $("#a5").hide();
        q = q++;
        e.preventDefault();
    });
});