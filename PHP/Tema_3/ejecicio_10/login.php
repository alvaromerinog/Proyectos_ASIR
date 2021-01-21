<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            text-align: center;
        }
    </style>
</head>

<body>

    <?php
    //Validación de los datos del usuario
    if (isset($_POST["user"]) && isset($_POST["pass"])) {
        $user = $_POST["user"];
        $pass = sha1($_POST["pass"]);
        //Validación del usuario
        $password = "7c4a8d09ca3762af61e59520943dc26494f8941b";
        if ($user == "root" && $pass == $password) {
            echo "Autenticación correcta";
            echo "<nav>
                <a href='verdatos.php?user=" . $user . "'>Ver datos</a>
                <a href='index.html'>Cerrar sesión</a>
            </nav>";
        } else {
            header("location:index.html");
        };
    } else {
        header("location:index.html");
    };
    ?>
</body>

</html>