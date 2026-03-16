<?php
// Database connection settings (Railway provides env vars for the MySQL service)
$mysqlUrl = getenv('MYSQL_URL') ?: getenv('MYSQL_PUBLIC_URL') ?: getenv('MYSQLPUBLICURL');
if ($mysqlUrl) {
    $parts = parse_url($mysqlUrl);
    $servername = $parts['host'] ?? 'localhost';
    $port = $parts['port'] ?? 3306;
    $username = $parts['user'] ?? 'root';
    $password = $parts['pass'] ?? '';
    $database = ltrim($parts['path'] ?? '', '/');
} else {
    $servername = getenv('MYSQLHOST') ?: getenv('DB_HOST') ?: 'localhost';
    $database   = getenv('MYSQLDATABASE') ?: getenv('DB_NAME') ?: 'metr0n1c2';
    $username   = getenv('MYSQLUSER') ?: getenv('DB_USER') ?: 'root';
    $password   = getenv('MYSQLPASSWORD') ?: getenv('DB_PASS') ?: '0108';
    $port       = getenv('MYSQLPORT') ?: getenv('DB_PORT') ?: 3306;
}

$destino = "https://www.birdi3fy.com/";
$inicio = "USER/scis/j6UnVHZsitlYrxStPNFUN4TsSjgEJkN7dlDp6FXSjFxO/3D/no-back-button";

function conectar (){
	$host = $GLOBALS["servername"];
	$user = $GLOBALS["username"];
	$pass = $GLOBALS["password"];
	$db   = $GLOBALS["database"];
	$port = $GLOBALS["port"];

	// Try to connect; if it fails, return null instead of dying.
	$conn = @mysqli_connect($host, $user, $pass, $db, $port);
	if (!$conn) {
	    error_log("DB connect failed: " . mysqli_connect_error() . " (host=$host port=$port)");
	    return null;
	}
	return $conn;
}

function sentencia($conn, $sql){
	$rst = mysqli_query($conn, $sql);
	return $rst;
}

function contarfilas ($rst){
	$nRows = mysqli_num_rows($rst);
	return $nRows;
}

function traerdatos($rst){
	$filas = mysqli_fetch_assoc($rst);	
	return $filas;
}

function desconectar ($conn){
	mysqli_close($conn);
}


?>
