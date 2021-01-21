<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Ver datos</title>
    <style>
        body {
            text-align: center;
        }
    </style>
</head>

<body>
    <?php
    if (isset($_GET["user"])) {
        $user = $_GET["user"];
        //Método para evitar ataques de inyección de código
        $scripts = array("<", ">", "script", "/");
        $user = str_replace($scripts, "", $user);
        //
        echo "Ver datos<br>";
        echo $user;
    } else {
        header("location:index.html");
    };
    ?>
</body>

</html>