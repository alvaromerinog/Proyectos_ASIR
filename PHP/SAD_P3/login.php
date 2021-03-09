<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style type="text/css">
        body {
            text-align: center;
        }

        table {
            display: inline-block;
            border-collapse: collapse;
            margin-bottom: 10px;
        }

        td, th {
            border: 1px solid black;
        }
    </style>
</head>
<body>
<?php
//Inicia o recupera la sesión
session_start();
if (isset($_POST["login"]) && isset($_POST["pass"])) {
    //Si viene del formulario de ingreso
    $login = $_POST["login"];
    $pass = $_POST["pass"];
} else if (isset($_SESSION["login"]) && isset($_SESSION["pass"])) {
    //Si ya inició sesión
    $login = $_SESSION["login"];
    $pass = $_SESSION["pass"];
} else {
    //Si se accede por otros medios
    header("location:index.html");
}
//Conexión con la base de datos de MySQL
$mysql = mysqli_connect("127.0.0.1", "root", "");
$mysql->select_db("sad_p3");
//Realizamos la consulta
$query = "
        select *
        from usuarios
        where Login='$login';";
$result = $mysql->query($query);
$resultado = $result->fetch_assoc();
$hash = $resultado["Password"];
//Comprobación de la contraseña
if (password_verify($pass, $hash)) {
    if (!isset($_SESSION["login"])) {
        //Generamos las variables de sesión si no están generadas
        $_SESSION["login"] = $login;
        $_SESSION["pass"] = $pass;
        $_SESSION["rol"] = $resultado["Rol"];
    }
    //Opción para que el usuario cierre sesión
    echo "<a href='logout.php'><button>Cerrar sesión</button></a><br><br>";
    //Dividimos el tipo de sesión si es admin o no
    if ($_SESSION["rol"] == "admin") {
        //Si es admin le muestra algunos datos de los demás usuarios
        $consulta = "select * from usuarios where Login<>'$login';";
        $res = $mysql->query($consulta);
        while ($resultado = $res->fetch_assoc()) {
            $id = $resultado["id"];
            $user = $resultado["Login"];
            $rol = $resultado["Rol"];
            //Mostramos parte de los resultados
            echo "
            <table>
                <tr>
                    <th>ID</th>
                    <th>USUARIO</th>
                    <th>ROL</th>
                    <th>+INFO</th>
                </tr>
                <tr>
                    <td>$id</td>
                    <td>$user</td>
                    <td>$rol</td>
                    <td><a href='infouser.php?id=$id'><button>Ver info</button></a></td>
                </tr>
            </table>
            <br>
            ";
        }
        //Cerramos la conexión con MySQL
        mysqli_close($mysql);
    } else {
        //Si no es admin solo le muestra sus datos
        $consulta = "select * from usuarios where Login='$login';";
        $res = $mysql->query($consulta);
        $resultado = $res->fetch_assoc();
        //Mostramos los resultados
        $id = $resultado["id"];
        $user = $resultado["Login"];
        $password = $resultado["Password"];
        $nombre = $resultado["Nombre"];
        $apellido1 = $resultado["Apellido1"];
        $apellido2 = $resultado["Apellido2"];
        $rol = $resultado["Rol"];
        echo "
        <table>
            <tr>
                <th>ID</th>
                <th>USUARIO</th>
                <th>CONTRASEÑA</th>
                <th>NOMBRE</th>
                <th>APELLIDO 1</th>
                <th>APELLIDO 2</th>
                <th>ROL</th>
            </tr>
            <tr>
                <td>$id</td>
                <td>$user</td>
                <td>$password</td>
                <td>$nombre</td>
                <td>$apellido1</td>
                <td>$apellido2</td>
                <td>$rol</td>
            </tr>
        </table>
        ";
        //Cerramos la conexión con MySQL
        mysqli_close($mysql);
    }
} else {
    //Si no coincide la contraseña
    header("location:index.html");
}
?>
</body>
</html>