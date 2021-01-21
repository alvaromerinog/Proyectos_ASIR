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
        $pass = password_hash($_POST["pass"], PASSWORD_BCRYPT);
        //Validación del usuario
        if ($user == "root" && password_verify("123456", $pass)) {
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