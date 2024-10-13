<?php
$data = json_decode(file_get_contents('php://input'), true);
$sale_type = $data['sale_type'];
$cart_items = $data['cart_items'];

// გამოსახე გაყიდვის ტიპი (სტრინგი)
echo "გაყიდვის ტიპი: " . $sale_type . "<br>";

/*$data = json_decode(file_get_contents('php://input'), true);
//print_r($data); 
 //var_dump($data);

// მონაცემთა ბაზის დაკავშირება
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "shop_inventory";

$conn = new mysqli($servername, $username, $password, $dbname);

// შეამოწმე კავშირის სტატუსი
if ($conn->connect_error) {
    die("კავშირის პრობლემა: " . $conn->connect_error);
}

// JSON მონაცემების მიღება
$data = json_decode(file_get_contents('php://input'), true);
$sale_type = $data['sale_type'];
$cart_items = $data['cart_items'];
echo $sale_type;
echo $cart_items;

/*
// თითოეულ პროდუქტზე გაყიდვის დამატება
foreach ($cart_items as $product_code => $item) {
    $product_name = $item['name'];
    $quantity_sold = $item['quantity'];
    $sale_price = $item['salePrice'];

    $sql = "INSERT INTO product_sales (product_code, product_name, quantity_sold, sale_price, sale_type, sale_date) 
            VALUES ('$product_code', '$product_name', '$quantity_sold', '$sale_price', '$sale_type', NOW())";

    if (!$conn->query($sql)) {
        echo "შეცდომა: " . $sql . "<br>" . $conn->error;
    }
}
*/
echo "გაყიდვა წარმატებით შესრულდა!";
$conn->close();

?>
