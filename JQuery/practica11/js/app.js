$(function(){
   //Variables globales
   var $iCom = $("#iCom");
   var $iProv = $("#iProv");
   var $iLoc = $("#iLoc");
   //Petición ajax de comunidades
   let comunidades = $.ajax({
       url:"http://jorgesanchez.net/practicas/iaw/practica11/comunidades.php",
       method:"GET",
       dataType:"json"
   });
   comunidades.done(function(data){
       let array = data.comunidades;
       $iCom.append("<option disabled selected >Elija una comunidad</option>");
       for(let com of array){
           $iCom.append("<option value='" + com.id_comunidad + "'>" + com.nombre + "</option>");
       }
   });
   //Evento de comunidades para rellenar provincias
   $iCom.on("change", function(e){
       let res = $.ajax({
           url:"http://jorgesanchez.net/practicas/iaw/practica11/provincias.php",
           method:"GET",
           data:{
               "comunidad":$iCom.val()
           },
           dataType:"json"
       });
       res.done(function(data){
           $iProv.html("<option disabled selected>Elija una provincia</option>");
           let array = data.provincias;
           for(let prov of array){
               $iProv.append("<option value='" + prov.n_provincia + "'>" + prov.nombre + "</option>");
           }
       })
   });
   //Evento de provincias para rellenar localidades
   $iProv.on("change", function(e){
       let res =$.ajax({
           url:"http://jorgesanchez.net/practicas/iaw/practica11/localidades.php",
           method:"GET",
           data:{
               "provincia":$iProv.val()
           },
           dataType:"json"
       });
       res.done(function(data){
           $iLoc.html("<option disabled selected>Elija una localidad</option>");
           let array = data.localidades;
           for(let loc of array){
                $iLoc.append("<option value='" + loc.id_localidad + "'>" + loc.nombre + "</option>");
           }
       })
   })
});