<?php
// Start the session
session_start();

// Check if the form is submitted via POST method
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    // Retrieve data from POST request
    $first_name = $_POST['first_name'];
    $last_name = $_POST['last_name'];
    $book_id = $_POST['book_id'];
    $checkout_date = $_POST['checkout_date'];
    $return_date = $_POST['return_date'];

    // Connect to your database
    $servername = "localhost"; // Database host
    $username = "root"; // Database username
    $password = ""; // Database password (adjust for your local environment)
    $dbname = "library"; // Database name

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Insert checkout information into the database
    $sql = "INSERT INTO checkouts (first_name, last_name, book_id, checkout_date, return_date) 
            VALUES ('$first_name', '$last_name', '$book_id', '$checkout_date', '$return_date')";

    if ($conn->query($sql) === TRUE) {
        // Update the status of the book to 'Checked Out'
        $update_sql = "UPDATE books SET status='Checked Out' WHERE id=$book_id";
        $conn->query($update_sql);

        // Redirect to the home page after successful checkout
        header("Location: home.html");
        exit(); // Ensure no further code is executed after the redirect
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    // Close the database connection
    $conn->close();
} else {
    // If the form is not submitted using POST, show an error message
    echo "Invalid request method!";
}
?>
