$(function () {
    let heHechoClick = false; //Centinela
    /*
    Temporizador
     */
    let temp = setTimeout(function (e) {
        //if(!heHechoClick) Condición que da uso al centinela
        $("#mensaje").show();
    }, 10000);
    $("#mensaje").on("click", function (e) {
        $(e.currentTarget).hide();
        clearTimeout(temp);
    });
    /*
    Eventos títulos
     */
    let $titulos = $("h2, h3");
    $titulos.on("click", function (e) {
        clearTimeout(temp);
        let $div = $(e.currentTarget).next("div")
        $div.slideToggle(500); //No hace falta poner display:block, con este efecto lo hace automáticamente
        $(e.currentTarget).toggleClass("selected");
        heHechoClick = true;
        /* Prueba para que el botón cambie cuando se abre algún título
        let $oculto = $(".ocultar").length;
        if ($oculto >= 0) {
            $("button").text("Ocultar todo");
        } else {
            $("button").text("Expandir todo");
        }
        */
    });
    /*
    Botón expandir/ocultar todo
     */
    $("#bt1").on("click", function (e) {
        /* Una solución
        Provoca que si algún titulo está expandido los oculta cuando le das a expandir y viceversa
        if ($titulos.next("div").hasClass("ocultar")) {
            $("button").text("Ocultar todo");
        } else {
            $("button").text("Expandir todo");
        };
        $titulos.trigger("click");
        */
        if($("#bt1").text() === "Expandir todo"){
            $titulos.next().slideDown(500);
            $titulos.addClass("selected");
            $("#bt1").text("Ocultar todo");
        } else {
            $titulos.next().slideUp(500);
            $titulos.removeClass("selected");
            $("#bt1").text("Expandir todo");
        }
    });
});