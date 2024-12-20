<?php
include 'db.php'; // Include the database connection file

// Check if the form is submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get form data
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm-password'];

    // Validate passwords match
    if ($password !== $confirm_password) {
        echo '<p class="text-danger">Passwords do not match.</p>';
    } else {
        // Hash the password
        $hashed_password = password_hash($password, PASSWORD_BCRYPT);

        // Insert user into the database
        $stmt = $pdo->prepare("INSERT INTO users (username, password) VALUES (:username, :password)");
        $stmt->bindParam(':username', $email); // Use email as username
        $stmt->bindParam(':password', $hashed_password);

        try {
            $stmt->execute();
            echo '<p class="text-success">User registered successfully. <a href="login.php">Login here</a></p>';
        } catch (PDOException $e) {
            echo '<p class="text-danger">Error: ' . $e->getMessage() . '</p>';
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container py-5">
        <h2 class="text-center mb-4">Sign Up for the Library</h2>
        <form action="signup.php" method="POST">
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="confirm-password" class="form-label">Confirm Password</label>
                <input type="password" id="confirm-password" name="confirm-password" class="form-control" required>
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="terms" required>
                <label class="form-check-label" for="terms">I agree to the <a href="#">terms and conditions</a></label>
            </div>
            <button type="submit" class="btn btn-primary w-100">Sign Up</button>
        </form>
        <p class="text-center mt-3">Already have an account? <a href="login.html">Log in here</a></p>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
