<?php
// Database connection settings
$db_host = 'localhost';  // Replace with your host
$db_name = 'library_system'; // Replace with your database name
$db_user = 'root';       // Replace with your database username
$db_pass = '';           // Replace with your database password

try {
    $db = new PDO("mysql:host=$db_host;dbname=$db_name;charset=utf8", $db_user, $db_pass);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // Log the error for debugging
    error_log("Database Error: " . $e->getMessage());

    // Provide a user-friendly message
    die("We're sorry, we're experiencing problems at this time.");
}
?>
