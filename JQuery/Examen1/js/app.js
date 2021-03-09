$(function(){
    //Evento botón aplicar
    $("#btAplicar").on("click", function(e){
        e.preventDefault();
       let texto = $("#iTexto").val();
       let fondo = $("#iFondo").val();
       let num = $("#iNumero").val();
       let $diapo = $("#d" + num);
       $diapo.html(texto);
       $diapo.css({
           "background-color":fondo
       });
    });

    //Eventos secciones
    let $section = $("section");
    $section.on("click", function(e){
        let $article = $(e.currentTarget).children("article");
        let diapo = $article.attr("id").replace("d","");
        $("#iNumero").val(diapo);
    });
    $section.on("dblclick", function(e){
        let $article = $(e.currentTarget).children("article");
        $article.html("");
        $article.css({
            "background-color":"#c8b699"
        });
    })
});