$(function () {
    //Variable que recorre el array
    let i = 0;
    //Petición inicial
    let jqhxr = $.ajax({
        url: "https://randomuser.me/api/",
        method: "GET",
        data: {
            "results": 50
        },
        dataType: "json"
    });
    //Establecer intervalo en el que se pone cada section
    let cont = setInterval(function (e) {
        jqhxr.done(function (data) {
            let persona = data.results[i];
            let local = persona.location;
            $("#objetivo").append(
                "<section><figure><img src='" + persona.picture.large + "' alt='Foto persona'></figure>"
                + "<article><p>" + persona.name.first + " " + persona.name.last + "</p>"
                + "<p>" + persona.email + "</p>"
                + "<p>" + local.street.name + ", " + local.street.number + "</p>"
                + "<p>" + local.city + ",(" + local.state + ")</p>"
                + "</article></section>");
        });
        i++;
        //Elimina el intervalo cuando el contador es 50
        if (i == 50) {
            clearInterval(cont);
        }
    }, 500);
    //Evento cambio imagen
    $("#objetivo").on("click", "figure", function (e) {
        let image = $.ajax({
            url: "https://randomuser.me/api/",
            method: "GET",
            dataType: "json"
        });
        image.done(function (data) {
            $(e.currentTarget).html(
                "<img src='" + data.results[0].picture.large + "' alt='Foto persona'>"
            );
        });
    });
    //Evento cambio informacion
    $("#objetivo").on("click", "article", function (e) {
        let info = $.ajax({
            url: "https://randomuser.me/api/",
            method: "GET",
            dataType: "json"
        });
        info.done(function (data) {
            let persona = data.results[0];
            let local = persona.location;
            $(e.currentTarget).html(
                "<p>" + persona.name.first + " " + persona.name.last + "</p>"
                + "<p>" + persona.email + "</p>"
                + "<p>" + local.street.name + ", " + local.street.number + "</p>"
                + "<p>" + local.city + ",(" + local.state + ")" + "</p>"
            );
        });
    });
});