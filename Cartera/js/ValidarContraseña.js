
var expr = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
$(document).ready(function () {
    //función click
    $("#btnRegistro").click(function () {
        //Guardar en variables el valor que tengan las cajas de texto
        //Por medio de los id's
        //Y tener mejor manipulación de dichos valores
        var nombre = $("#txtNombre").val().trim();
        var apellido = $("#txtApellido").val().trim();
        var email = $("#txtEmail").val().trim();
        var pass = $("#txtPassword").val().trim();
        var Veripass = $("#VeriContraseña").val().trim();
        var mensaje = $(".mensajejs");

        // --- Condicionales anidados ----
        //Si nombre está vacío
        //Muestra el mensaje
        //Con false sale de los if's y espera a que sea pulsado de nuevo el botón de enviar
        if (nombre == "") {
            $("#mensaje1").fadeIn("slow");
            return false;
        }
            //en otro caso, el mensaje no se muestra
        else {
            $("#mensaje1").fadeOut();

            //Si correo está vacío y la expresión NO corresponde -test es función de JQuery
            //Muestra el mensaje
            //Con false sale de los if's y espera a que sea pulsado de nuevo el botón de enviar
            if (apellido == "") {
                $("#mensaje3").fadeIn("slow");
                return false;
            }
            else {
                $("#mensaje3").fadeOut();

                if (email == "") {
                    $("#mensaje2").fadeIn("slow");
                    return false;
                } else {
                    $("#mensaje2").fadeOut();
                    if (!expr.test(email)) {
                        $("#mensaje7").fadeIn("slow");
                        return false;
                    }
                    else {
                        $("#mensaje7").fadeOut();

                        if (pass == "") {
                            $("#mensaje4").fadeIn("slow");
                            return false;
                        }
                        else {
                            $("#mensaje4").fadeOut();
                            if (!pass.match(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/)) {
                                $("#mensaje9").fadeIn("slow");
                                return false;
                            }else{
                                $("#mensaje9").fadeOut();
                                if (Veripass == "") {
                                    $("#mensaje5").fadeIn("slow");
                                    return false;
                                } else {
                                    $("#mensaje5").fadeOut();
                                    if (Veripass != pass) {
                                        $("#mensaje6").fadeIn("slow");
                                        return false;
                                    } else {
                                        $("#mensaje6").fadeOut();
                                        $("#mensaje8").fadeIn("slow");
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    });//click
});//ready
$(document).ready(function () {
$('#txtPassword').keyup(function () {
        // set password variable
        var pswd = $(this).val();

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