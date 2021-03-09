$(function () {
    //Petición de equipos
    let jqxhr = $.ajax({
        url: "https://www.balldontlie.io/api/v1/teams",
        method: "GET",
        dataType: "json"
    });
    //Llegada de la petición
    jqxhr.done(function (data) {
        //Variables de la función
        let datos = data.data;
        //Muestra de resultados
        for (let equipo of datos) {
            //División de equipos en las secciones este y oeste
            if (equipo.conference === "East") {
                $("#este").append("<p>" + equipo.full_name + " (<strong>" + equipo.abbreviation + "</strong>)</p>");
            } else {
                $("#oeste").append("<p>" + equipo.full_name + " (<strong>" + equipo.abbreviation + "</strong>)</p>");
            }
        }
    })
});