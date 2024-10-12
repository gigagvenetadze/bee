<?php
header('Content-Type: application/json');

// მონაცემთა ბაზის პარამეტრების ჩატვირთვა
include 'db_config.php';

// მომწოდებლების მონაცემების მიღება
$sql = "SELECT supplier_id, identification_number, name, address, phone FROM suppliers";
$result = $conn->query($sql);

$suppliers = [];

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $suppliers[] = $row;
    }
    echo json_encode($suppliers);
} else {
    echo json_encode([]);
}

// კავშირის დახურვა
$conn->close();
?>
