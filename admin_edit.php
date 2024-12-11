<?php
session_start();
if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'admin') {
    header('Location: ../index.php');
    exit();
}

require '../config.php';

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "SELECT * FROM books WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $book = $result->fetch_assoc();

    if (!$book) {
        header('Location: index.php');
        exit();
    }

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $title = $_POST['title'];
        $author = $_POST['author'];
        $description = $_POST['description'];

        $updateQuery = "UPDATE books SET title = ?, author = ?, description = ? WHERE id = ?";
        $updateStmt = $conn->prepare($updateQuery);
        $updateStmt->bind_param("sssi", $title, $author, $description, $id);

        if ($updateStmt->execute()) {
            header('Location: index.php');
            exit();
        } else {
            $error = "Error updating book.";
        }
    }
} else {
    header('Location: index.php');
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>
</head>
<body>
    <h1>Edit Book</h1>
    <a href="index.php">Back to Dashboard</a>
    <form method="POST">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="<?= $book['title'] ?>" required>
        <br>
        <label for="author">Author:</label>
        <input type="text" id="author" name="author" value="<?= $book['author'] ?>" required>
        <br>
        <label for="description">Description:</label>
        <textarea id="description" name="description"><?= $book['description'] ?></textarea>
        <br>
        <button type="submit">Update Book</button>
    </form>
    <?php if (isset($error)): ?>
        <p><?= $error ?></p>
    <?php endif; ?>
</body>
</html>
