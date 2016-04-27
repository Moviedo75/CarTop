$(document).ready(function () {
    var expr = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
    $(".Cambiar").click(function () {
        //Guardar en variables el valor que tengan las cajas de texto
        //Por medio de los id's
        //Y tener mejor manipulación de dichos valores
        var passAntiguo = $("#ContraseñaAntigua").val().trim();
        var passNuevo = $("#txtPassNuevo").val().trim();
        var Veripass = $("#VeriContraseña").val().trim();
        var mensaje = $(".mensajejs");

        // --- Condicionales anidados ----
        //Si nombre está vacío
        //Muestra el mensaje
        //Con false sale de los if's y espera a que sea pulsado de nuevo el botón de enviar
        if (passAntiguo == "") {
            $("#mensaje4").fadeIn("slow");
            return false;
        }
            //en otro caso, el mensaje no se muestra
        else {
            $("#mensaje4").fadeOut();

            //Si correo está vacío y la expresión NO corresponde -test es función de JQuery
            //Muestra el mensaje
            //Con false sale de los if's y espera a que sea pulsado de nuevo el botón de enviar
            if (passNuevo == "") {
                $("#mensaje5").fadeIn("slow");
                return false;
            }
            else {
                $("#mensaje5").fadeOut();

                if (!expr.test(passNuevo)) {
                    $("#mensaje6").fadeIn("slow");
                    return false;
                } else {
                    $("#mensaje6").fadeOut();

                    if (Veripass == "") {
                        $("#mensaje7").fadeIn("slow");
                        return false;
                    } else {
                        $("#mensaje7").fadeOut();
                        if (Veripass != passNuevo) {
                            $("#mensaje8").fadeIn("slow");
                            return false;
                        }
                    }
                }
            }
        }
    });//click
});//ready

$(document).ready(function () {
    $('#txtPassNuevo').keyup(function () {
        // set password variable
        var pswd = $(this).val();
        $("#mensaje5").fadeOut('fast');
        $("#mensaje6").fadeOut('fast');
        //validate the length
        if (pswd.length < 8) {
            $('#length').removeClass('valid').addClass('invalid');
        } else {
            $('#length').removeClass('invalid').addClass('valid');

        }

        //validate letter
        if (pswd.match(/[A-z]/)) {
            $('#letter').removeClass('invalid').addClass('valid');
        } else {
            $('#letter').removeClass('valid').addClass('invalid');
        }

        //validate capital letter
        if (pswd.match(/[A-Z]/)) {
            $('#capital').removeClass('invalid').addClass('valid');
        } else {
            $('#capital').removeClass('valid').addClass('invalid');
        }

        //validate number
        if (pswd.match(/\d/)) {
            $('#number').removeClass('invalid').addClass('valid');
        } else {
            $('#number').removeClass('valid').addClass('invalid');
        }

    }).focus(function () {
        $('#pswd_info').show();
    }).blur(function () {
        $('#pswd_info').hide();
    });

});

$(document).ready(function () {
    $("#ContraseñaAntigua").keyup(function () {
        $("#mensaje4").fadeOut('fast');
    })
});
$(document).ready(function () {
    $('#VeriContraseña').keyup(function () {
        // set password variable
        var pswd = $(this).val();
        var pass = $("#txtPassword").val().trim();
        //validate the length
        if (pswd != pass) {
            $('#Validara').removeClass('valid').addClass('invalid');
        } else {
            $('#Validara').removeClass('invalid').addClass('valid');

        }
    }).focus(function () {
        $('#Varpswd_info').show();
    }).blur(function () {
        $('#Varpswd_info').hide();
    });

});