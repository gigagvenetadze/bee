<?php
include 'db_config.php'; // მონაცემთა ბაზის კავშირის ჩართვა

$searchTerm = $_GET['term'] ?? ''; // შემოწმება, თუ არის რამე აკრეფილი

$products = [];

if ($searchTerm) {
    $searchTerm = $conn->real_escape_string($searchTerm);
    $query = "SELECT barcode, article_code, relative_code, name, unit_of_measure, department, min_quantity, cost_price, price1, price2, price3 
              FROM products 
              WHERE barcode LIKE '%$searchTerm%' OR article_code LIKE '%$searchTerm%' OR name LIKE '%$searchTerm%' 
              LIMIT 10";
    
    $result = $conn->query($query);

    while ($row = $result->fetch_assoc()) {
        $products[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($products);
?>
