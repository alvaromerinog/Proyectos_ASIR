$(function(){
    /*
    Botones para cambiar el fondo
    Sería más recomendable utilizar clases
     */
   $("[id^=btFondo]").on("click", function(e){
       let fondo = $(e.target).css("background-color");
       $("main").css("background-color", fondo);
   });
   /*
   Botones para cambiar el color de la letra
    */
   $("[id^=btLetra]").on("click", function(e){
       let color = $(e.target).css("background-color");
       $("main").css("color", color);
   });
   /*
   Botón para mostrar/ocultar la imagen
    */
   $("#btImagen").on("click", function(e){
       let $imagen = $("#neruda");
       $imagen.toggleClass("ocultar");
       if($imagen.hasClass("ocultar")){
           $("#btImagen").text("Mostrar");
       } else {
           $("#btImagen").text("Ocultar");
       };
   });
});