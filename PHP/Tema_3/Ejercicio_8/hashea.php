<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Hashea</title>
    </head>
    <body>
        <?php
            if (isset($_POST["cadena"])) {
                $cadena = $_POST["cadena"];
                echo $cadena;
                echo strlen($cadena);
            };
        ?>
    </body>
</html>