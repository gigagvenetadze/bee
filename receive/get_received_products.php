<?php
include 'db_config.php'; // მოიცავს მონაცემთა ბაზის კავშირის პარამეტრებს

// მომწოდებლისა და საბუთის ნომრის მიხედვით მონაცემების წამოღება
$supplier_name = $_GET['supplier_name'];
$document_number = $_GET['document_number'];

// მონაცემთა ბაზის კავშირის შემოწმება
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// SQL მოთხოვნა: დარწმუნდით, რომ ყველა ცხრილისა და სვეტის სახელები სწორია
$sql = "SELECT p.barcode, p.name AS product_name, pr.quantity_received, pr.cost_price, p.price1, pr.receipt_date AS date_received, pr.receipt_date AS time_received
        FROM products p
        JOIN product_receipts pr ON p.product_id = pr.product_id
        JOIN suppliers s ON pr.supplier_id = s.supplier_id
        WHERE s.name = ? AND pr.batch_number = ?";

$stmt = $conn->prepare($sql);
$stmt->bind_param("si", $supplier_name, $document_number);
$stmt->execute();
$result = $stmt->get_result();

$products = [];
while ($row = $result->fetch_assoc()) {
    $products[] = $row;
}

$stmt->close();
$conn->close();

// JSON ფორმატში მონაცემების დაბრუნება
header('Content-Type: application/json');
echo json_encode($products);
?>
