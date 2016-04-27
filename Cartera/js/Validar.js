var expr = /^[a-zA-Z0-9_\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-\.]+$/;
$(document).ready(function () {
    //función click
    $("#btnIngresar").click(function () {
        var correo = $("#txtEmail").val();
        var pass = $("#txtPass").val();
        if (correo == "" && pass == "") {
            $(".mensaje").empty();
            $("#mensaje1").fadeIn("slow");
            $("#mensaje2").fadeIn("slow");
            $("#mensaje3").fadeOut();
            return false;
        }else{
            if (correo == "") {
                $("#mensaje3").fadeOut();
                $(".mensaje").empty();
                $("#mensaje2").fadeOut();
                $("#mensaje1").fadeIn("slow");
                return false;
            } else {
                $("#mensaje1").fadeOut();
                if (!expr.test(correo)) {
                    $(".mensaje").empty();
                    $("#mensaje1").fadeOut();
                    $("#mensaje3").fadeIn("slow");
                    return false;
                } else {
                    $("#mensaje1").fadeOut();
                    $("#mensaje3").fadeOut();
                    if (pass == "") {
                        $(".mensaje").empty();
                        $("#mensaje2").fadeIn("slow");
                        return false;
                    } else {
                        $("#mensaje1").fadeOut();
                        $("#mensaje3").fadeOut();
                        $("#mensaje2").fadeOut();
                    }
                }
            }
        };//click
    })
})