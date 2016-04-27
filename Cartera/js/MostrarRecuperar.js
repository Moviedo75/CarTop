$(function () {
        $("#a1").show();
    $("#a2").hide();
    var q = 0;
    $("#Menurecuperar").on('click', function (e) {
        q = q++;
        if (q < 1) {
            $("#a1").hide();
            $("#a2").show();
            e.preventDefault();
        }
    });
    $("#volver").on('click', function (e) {
        q = q++;
        if (q < 1) {
            $("#a1").show();
            $("#a2").hide();
            e.preventDefault();
        }
    });
});