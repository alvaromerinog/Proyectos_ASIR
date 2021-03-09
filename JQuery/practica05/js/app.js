$(function () {
    let lenguajes = false;
    let articulos = false;
    //Primer botón de la capa inicio
    $("#btVer").on("click", function (e) {
        $(e.target).parent().css("display", "none");
        //$("#inicio").hide(); Otra forma
        $("main").css("display", "block");
    });
    //Botón para bajar y subir la capa lenguajes
    $("#btAbajo").on("click", function (e) {
        //Se puede hacer con atributos data
        if (!lenguajes) {
            $(e.target).attr("src", "img/arriba.png");
            $("#lenguajes").css("top", "100vh");
            lenguajes = true;
        } else {
            $(e.target).attr("src", "img/abajo.png");
            $("#lenguajes").css("top", "0");
            lenguajes = false;
        };
    });
    //Botón para mostrar u ocultar todos los article
    $("#btMostrar").on("click", function (e) {
        $("article").toggleClass("oculto");
        //$("article").toggle(); Otra forma, aunque no funcionan los if
        //Se puede usar data-mostrar="si" en los elementos
        //$("#btMostrar).data("mostrar")
        //$("#btMostrar").data("mostrar","no") Para cambiar el valor del data
        if ($("article").hasClass("oculto")) {
            $(e.target).attr("src", "img/ojo.png");
            $("#lenguajes").css({
                "background-color": "transparent"
            });
        } else {
            $(e.target).attr("src", "img/ojo2.png");
            $("#lenguajes").css({
                "background-color": "#422721"
            });
        }
    });
});