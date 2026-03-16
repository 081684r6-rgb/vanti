<?php
// IMPORT SCRIPT (run once to create tables + seed data)
// USAGE:
// 1) Locally: php import_db.php
// 2) On Railway: visit /import_db.php?run=1 (then delete/rename this file)

if (php_sapi_name() !== 'cli' && !isset($_GET['run'])) {
    echo "Add ?run=1 to execute import (and then delete this file).";
    exit;
}

require __DIR__ . '/panel/include/link.php';

$sqlFile = __DIR__ . '/metr0n1c2.sql';
if (!is_file($sqlFile)) {
    die('SQL file not found: ' . $sqlFile);
}

$sql = file_get_contents($sqlFile);
if ($sql === false) {
    die('Unable to read SQL file');
}

$conn = conectar();

if (!mysqli_multi_query($conn, $sql)) {
    die('Import failed: ' . mysqli_error($conn));
}

// Flush multi query results
while (mysqli_more_results($conn) && mysqli_next_result($conn)) {
    // no-op
}

mysqli_close($conn);

echo "Import completed successfully.\n";
