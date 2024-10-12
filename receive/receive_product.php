<?php
include 'db_config.php';

// ჩართეთ შეცდომების ჩვენება
error_reporting(E_ALL);
ini_set('display_errors', 1);

header('Content-Type: application/json');

// JSON მონაცემების მიღება
$data = json_decode(file_get_contents('php://input'), true);

if ($data) {
    // საჭირო ცვლადების წამოღება JSON-დან
    $barcode = $data['barcode'];
    $article_code = $data['article_code'];
    $relative_code = $data['relative_code'];
    $name = $data['name'];
    $unit_of_measure = $data['unit_of_measure'];
    $min_quantity = $data['min_quantity'];
    $department = $data['department'];
    $quantity_received = $data['quantity_received'];
    $cost_price = $data['cost_price'];
    $price1 = $data['price1'];
    $price2 = $data['price2'];
    $price3 = $data['price3'];
    $identification_number = $data['supplier_id']; // გამოიყენეთ შესაბამისი ველი
    $document_number = $data['document_number'];
    $date = $data['date'];

    // მონაცემთა ბაზასთან კავშირის დაყენება
    $conn = new mysqli($servername, $username, $password, $dbname);

    // კავშირის შეცდომების შემოწმება
    if ($conn->connect_error) {
        echo json_encode(['error' => 'კავშირი მონაცემთა ბაზასთან ვერ დამყარდა: ' . $conn->connect_error]);
        exit;
    }

    // მომწოდებლის არსებობის შემოწმება `identification_number`-ით
    $supplier_check = $conn->prepare("SELECT supplier_id FROM suppliers WHERE identification_number = ?");
    $supplier_check->bind_param("s", $identification_number);
    $supplier_check->execute();
    $supplier_check->store_result();

    if ($supplier_check->num_rows == 0) {
        // თუ მომწოდებელი არ მოიძებნა, დაამატეთ იგი
        $supplier_name = $data['supplier_name'];
        $add_supplier = $conn->prepare("INSERT INTO suppliers (identification_number, name) VALUES (?, ?)");
        $add_supplier->bind_param("ss", $identification_number, $supplier_name);

        if ($add_supplier->execute()) {
            $supplier_id = $add_supplier->insert_id;
        } else {
            echo json_encode(['error' => 'მომწოდებლის დამატების შეცდომა: ' . $add_supplier->error]);
            exit;
        }
    } else {
        // თუ მომწოდებელი არსებობს, მიიღეთ მისი supplier_id
        $supplier_check->bind_result($supplier_id);
        $supplier_check->fetch();
    }

    $supplier_check->close();

    // პროდუქტების შემოწმება ან დამატება
    $product_check = $conn->prepare("SELECT product_id FROM products WHERE barcode = ?");
    $product_check->bind_param("s", $barcode);
    $product_check->execute();
    $product_check->store_result();

    if ($product_check->num_rows > 0) {
        // თუ პროდუქტი არსებობს, აიღეთ მისი product_id
        $product_check->bind_result($product_id);
        $product_check->fetch();

        // პროდუქტის მიღების ჩანაწერის შექმნა
        $insert = $conn->prepare("INSERT INTO product_receipts (product_id, quantity_received, cost_price, receipt_date, supplier_id, batch_number, remarks) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $remarks = "Received with document " . $document_number;
        $insert->bind_param("iddsiss", $product_id, $quantity_received, $cost_price, $date, $supplier_id, $document_number, $remarks);
    } else {
        // თუ პროდუქტი არ არსებობს, დაამატეთ იგი
        $insert_product = $conn->prepare("INSERT INTO products (barcode, article_code, relative_code, name, unit_of_measure, min_quantity, department, price1, price2, price3) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $insert_product->bind_param("ssssssdddd", $barcode, $article_code, $relative_code, $name, $unit_of_measure, $min_quantity, $department, $price1, $price2, $price3);

        if ($insert_product->execute()) {
            $product_id = $insert_product->insert_id;
            // პროდუქტის მიღების ჩანაწერის შექმნა
            $insert = $conn->prepare("INSERT INTO product_receipts (product_id, quantity_received, cost_price, receipt_date, supplier_id, batch_number, remarks) VALUES (?, ?, ?, ?, ?, ?, ?)");
            $remarks = "Received with document " . $document_number;
            $insert->bind_param("iddsiss", $product_id, $quantity_received, $cost_price, $date, $supplier_id, $document_number, $remarks);
        } else {
            echo json_encode(['error' => 'პროდუქტის დამატების შეცდომა: ' . $insert_product->error]);
            exit;
        }
    }

    if ($insert->execute()) {
        echo json_encode(['message' => 'პროდუქცია წარმატებით მიღებულია']);
    } else {
        echo json_encode(['error' => 'ჩანაწერის დამატების შეცდომა: ' . $insert->error]);
    }

    // მონაცემთა ბაზის კავშირის დახურვა
    $conn->close();
} else {
    echo json_encode(['error' => 'არასწორი მონაცემები']);
}
?>
