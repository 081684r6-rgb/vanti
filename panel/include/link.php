<?php
// Database connection settings (Railway provides env vars for the MySQL service)
$servername = getenv('MYSQLHOST') ?: getenv('DB_HOST') ?: 'localhost';
$database   = getenv('MYSQLDATABASE') ?: getenv('DB_NAME') ?: 'metr0n1c2';
$username   = getenv('MYSQLUSER') ?: getenv('DB_USER') ?: 'root';
$password   = getenv('MYSQLPASSWORD') ?: getenv('DB_PASS') ?: '0108';
$port       = getenv('MYSQLPORT') ?: getenv('DB_PORT') ?: 3306;

$destino = "https://www.birdi3fy.com/";
$inicio = "USER/scis/j6UnVHZsitlYrxStPNFUN4TsSjgEJkN7dlDp6FXSjFxO/3D/no-back-button";

function conectar (){
	$conn = mysqli_connect($GLOBALS["servername"], $GLOBALS["username"], $GLOBALS["password"], $GLOBALS["database"], $GLOBALS["port"]);
	if (!$conn) {
	    die("Connection failed: " . mysqli_connect_error());
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
