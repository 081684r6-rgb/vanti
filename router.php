<?php
// Simple router for PHP built-in server (simulate .htaccess rewrite behavior)
$uri = urldecode(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
$base = __DIR__;

// Prevent directory traversal
if (strpos($uri, '..') !== false) {
    http_response_code(400);
    echo "Bad request";
    exit;
}

// Absolute path for the requested resource
$path = realpath($base . $uri);

// If the file exists and is not a directory, serve it directly
if ($path !== false && is_file($path)) {
    return false;
}

// If requesting a directory, try index.php / index.html
if ($path !== false && is_dir($path)) {
    $indexPhp = $path . '/index.php';
    $indexHtml = $path . '/index.html';
    if (is_file($indexPhp)) {
        require $indexPhp;
        return;
    }
    if (is_file($indexHtml)) {
        readfile($indexHtml);
        return;
    }
}

// Try appending .php or .html (mimic your .htaccess)
$tryPhp = $base . $uri . '.php';
if (is_file($tryPhp)) {
    require $tryPhp;
    return;
}

$tryHtml = $base . $uri . '.html';
if (is_file($tryHtml)) {
    readfile($tryHtml);
    return;
}

http_response_code(404);
echo "Not found";
