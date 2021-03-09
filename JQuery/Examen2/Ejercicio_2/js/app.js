$(function () {
    //Variables globales
    var year = $("#temp").val();
    var $equipos = $("#equipos");
    var $pilotos = $("#conductores");
    var $tituloEquipos = $equipos.children("h1");
    var $tituloPilotos = $pilotos.children("h1");
    //Evento botón Ver equipos
    $("#btEquipos").on("click", function (e) {
        e.preventDefault();
        year = $("#temp").val();
        //Cambio de título de equipos y vaciado de la sección
        $tituloEquipos.text("Lista de equipos, temporada " + year);
        $tituloEquipos.nextAll().remove();
        //Cambio de título de conductores y vaciado de la sección
        $tituloPilotos.text("Conductores");
        $tituloPilotos.nextAll().remove();
        //Petición de los equipos de la temporada
        let jqhxr = $.ajax({
            url: "http://ergast.com/api/f1/" + year + "/constructors.json",
            method: "GET",
            dataType: "json"
        });
        //Petición de equipos recibida
        jqhxr.done(function (data) {
            //Variables de la función
            let teams = data.MRData.ConstructorTable.Constructors;
            //Mostrar resultado de equipos
            for (let equipo of teams) {
                $equipos.append(`<p><strong data-constructor="${equipo.constructorId}">${equipo.name}</strong> <button class="btPiloto">Ver pilotos</button>`);
            }
        });
    });
    //Evento botón Ver pilotos
    $equipos.on("click", ".btPiloto", function (e) {
        //Variables de la función
        let nombreEquipo = $(e.target).prev().text();
        let equipoId = $(e.target).prev().data("constructor");
        //Cambio de título de pilotos y vaciado de la sección
        $tituloPilotos.text("Conductores del equipo " + nombreEquipo + ", temporada " + year);
        $tituloPilotos.nextAll().remove();
        let res = $.ajax({
            url: "http://ergast.com/api/f1/" + year + "/constructors/" + equipoId + "/drivers.json",
            method: "GET",
            dataType: "json"
        });
        //Petición de conductores recibida
        res.done(function (data) {
            //Variables de la función
            let drivers = data.MRData.DriverTable.Drivers;
            //Mostrar resultado de conductores
            for (let driver of drivers) {
                $pilotos.append(`<p>${driver.givenName} ${driver.familyName}</p>`);
            }
        });
    });
})