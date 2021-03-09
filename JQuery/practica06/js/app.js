$(function () {
    let $input = $("[type='checkbox']");
    //Evento de los checkbox
    $input.on("change", function (e) {
        let check = $(e.currentTarget).prop("checked");
        if (check) {
            $("#" + $(e.currentTarget).val()).fadeIn(1000);
        } else {
            $("#" + $(e.currentTarget).val()).trigger("click");
        }
    });
    //Evento de los artículos
    $("article").on("click", function (e) {
        let idCheckbox = $(e.currentTarget).attr("id");
        $("[value=" + idCheckbox + "]").prop("checked", false);
        $(e.currentTarget).fadeOut(1000);
    });
    //Evento del botón de Mostrar todos
    $("#btMostrar").on("click", function (e) {
        e.preventDefault();
        $input.prop("checked", true);
        $input.trigger("change");
    });
    //Evento del botón de Ocultar todos
    $("#btOcultar").on("click", function (e) {
        e.preventDefault();
        $input.prop("checked", false);
        $input.trigger("change");
    });
});