$(function(){
    let texto;
    let $input = $("#texto");
    let $lista = $("#lista");
    $input.focus();
    /*
    Evento que captura el texto del input
     */
    $input.on("keyup", function(e){
        texto = $("#texto").val();
    });
    /*
    Evento para añadir elementos a la lista
     */
    $("#btAnadir").on("click", function(e){
        e.preventDefault();
        if(texto !== undefined) {
            $lista.append("<li><span>" + texto.trim() + "</span><a href=''>quitar</a><button class='btArriba'>↑</button><button class='btAbajo'>↓</button></li>");
            $("#texto").val("")
        }
    });
    /*
    Evento para quitar elementos de la lista
     */
    $lista.on("click","a",function(e){
        e.preventDefault();
        $(e.target).parent().remove();
    });
    /*
    Evento para poner primero el elemento al que se hace dblclick
     */
    $lista.on("click","span",function(e){
        let $elemento = $(e.currentTarget).parent().remove();
        $lista.prepend($elemento);
    });
    $lista.on("click",".btArriba",function(e){
        e.preventDefault();
        let $arriba = $(e.target).parent().prev();
        //console.log($arriba);
        if($arriba.length > 0) {
            let $elemento = $(e.target).parent().remove();
            $arriba.before($elemento);
        }
    });
    $lista.on("click",".btAbajo",function(e){
        e.preventDefault();
        let $abajo = $(e.target).parent().next();
        if($abajo.length > 0) {
            let $elemento = $(e.target).parent().remove();
            $abajo.after($elemento);
        }
    });
});