<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Ejercicio 9</title>
</head>
<body>
<h1>Ejecicio 9</h1>
    <?php
    print_r(hash_algos());
    echo "<br>";
    echo hash_algos()[5];
    //phpinfo();
    echo phpversion();
    ?>
</body>
</html>