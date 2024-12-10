<?php
session_start();

// Check if the admin is logged in
if (!isset($_SESSION['admin_id'])) {
    header('Location: login.php');
    exit;
}

echo "Welcome, " . $_SESSION['admin_username'] . "!";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
</head>
<body>
    <h2>Admin Dashboard</h2>
    <p>Here, admins can manage the library system, users, books, etc.</p>
    <ul>
        <li><a href="manage_books.php">Manage Books</a></li>
        <li><a href="manage_users.php">Manage Users</a></li>
        <!-- Add more links as necessary -->
    </ul>
    <a href="logout.php">Logout</a>
</body>
</html>
