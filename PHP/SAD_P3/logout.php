<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Cerrar sesion</title>
</head>
<body>
<?php
//Recupera la sesión
session_start();
//Destruye la sesión
session_destroy();
//Vuelve al formulario inicial
header("location:index.html");
?>
</body>
</html>