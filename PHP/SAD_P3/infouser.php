<!doctype html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ver información</title>
    <style>
        body {
            text-align: center;
        }

        table {
            display: inline-block;
            border-collapse: collapse;
        }

        td, th {
            border: 1px solid black;
        }
    </style>
</head>
<body>
<?php
session_start();
if (isset($_GET["id"]) && isset($_SESSION["rol"])) {
    if ($_SESSION["rol"] == "admin") {
        $id = $_GET["id"];
        //Conexión con la base de datos de MySQL
        $mysql = mysqli_connect("127.0.0.1", "root", "");
        $mysql->select_db("sad_p3");
        $query = "select * from usuarios where Id='$id'";
        //Realizamos la consulta
        $result = $mysql->query($query);
        $resultado = $result->fetch_assoc();
        //Mostramos los resultados
        $user = $resultado["Login"];
        $password = $resultado["Password"];
        $nombre = $resultado["Nombre"];
        $apellido1 = $resultado["Apellido1"];
        $apellido2 = $resultado["Apellido2"];
        $rol = $resultado["Rol"];
        echo "<a href='login.php'><button>Volver</button></a>";
        echo "<a href='logout.php'><button>Cerrar sesión</button></a>";
        echo "<h1>Ver información de $user</h1>";
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
    } else {
        //Ha iniciado sesión, pero no es admin
        header("location:login.php");
    }
} else {
    //No ha iniciado sesión
    header("location:index.html");
}
?>
</body>
</html>