<?php
header('Content-Type: application/json'); // აღნიშნეთ, რომ პასუხი JSON ფორმატში იქნება

// MySQL მონაცემთა ბაზის პარამეტრები
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "shop_inventory";

// კავშირი MySQL მონაცემთა ბაზასთან
$conn = new mysqli($servername, $username, $password, $dbname);

// შეამოწმეთ კავშირი
if ($conn->connect_error) {
    die(json_encode(["error" => "კავშირი წარუმატებელია: " . $conn->connect_error]));
}

// SQL შეკითხვის შექმნა დაგრუპვით
$sql = "SELECT products.barcode, products.name, products.cost_price, products.price1 AS sale_price, SUM(product_receipts.quantity_received) AS total_quantity 
        FROM products 
        JOIN product_receipts ON products.product_id = product_receipts.product_id 
        GROUP BY products.product_id"; // პროდუქტის მიხედვით გრუპირება

$result = $conn->query($sql);

$products = [];

if ($result->num_rows > 0) {
    // ციკლი შედეგების გამოტანისთვის
    while($row = $result->fetch_assoc()) {
        $products[] = [
            "barcode" => $row["barcode"],
            "name" => $row["name"],
            "cost_price" => $row["cost_price"],
            "sale_price" => $row["sale_price"],
            "total_quantity" => $row["total_quantity"]
        ];
    }
} else {
    echo json_encode(["message" => "პროდუქცია არ მოიძებნა."]);
    exit;
}

echo json_encode($products); // JSON ფორმატში მონაცემების დაბრუნება

// კავშირის დახურვა
$conn->close();
?>
