<?php
// MySQL მონაცემთა ბაზის პარამეტრები
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "shop_inventory"; // შეცვალეთ თქვენი მონაცემთა ბაზის სახელი

// კავშირი MySQL მონაცემთა ბაზასთან
$conn = new mysqli($servername, $username, $password, $dbname);

// შეამოწმეთ კავშირი
if ($conn->connect_error) {
    die(json_encode(["error" => "კავშირი წარუმატებელია: " . $conn->connect_error]));
}
?>