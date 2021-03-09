$(function () {
    //Petición inicial de 10 resultados
    let jqhxr = $.ajax({
        url: "https://randomuser.me/api/",
        method: "GET",
        data: {
            "results": 10
        },
        dataType: "json"
    });
    let $main = $("#objetivo");
    jqhxr.done(function (data) {
        let resultados = data.results;
        for (let persona of resultados) {
            let local = persona.location;
            $main.append("<section>"
                + "<article>"
                + "<figure><img src='" + persona.picture.large + "' alt='Foto Persona'></figure>"
                + "<p>" + persona.name.first + " " + persona.name.last + "</p>"
                + "<p>" + persona.email + "</p>"
                + "<p>" + local.street.name + ", " + local.street.number + "</p>"
                + "<p>" + local.city + "(" + local.state + ")</p>"
                + "</article>"
                + "<button>Cambiar</button>"
                + "</section>");
        }
    });
    //Petición cuando se pulsa botón
    $main.on("click","button",function(e){
        let $article = $(e.currentTarget).siblings("article");
        let res = $.ajax({
            url:"https://randomuser.me/api/",
            method:"GET",
            dataType:"json"
        });
        $(e.currentTarget).text("Esperando usuario nuevo...");
        res.done(function(data){
            $(e.currentTarget).text("Cambiar");
            let persona = data.results[0];
            let local = persona.location
            $article.html(
                "<figure><img src='" + persona.picture.large +"' alt='Foto persona'></figure>"
                + "<p>" + persona.name.first + " " + persona.name.last +"</p>"
                + "<p>" + persona.email +"</p>"
                + "<p>" + local.street.name + ", " + local.street.number  +"</p>"
                + "<p>" + local.city + "(" + local.state + ")" + "</p>"
            );
        });
    })

})