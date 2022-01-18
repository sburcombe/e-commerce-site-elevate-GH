<?php
require_once('functions.php');
set_exception_handler('error_handler');
startup();

$products = file_get_contents('dummy-products-list.json');
print($products);
// if (!empty($_GET['id'])) {
//   $id = $_GET['id'];
//   if(!is_numeric($id)){
//     throw new Exception('id needs to be a number');
//   }
//   $query = "SELECT products.id, products.name, products.price, products.shortDescription, products.longDescription,
//             GROUP_CONCAT(images.img_url) AS images
//             FROM products JOIN images ON  products.id  =  images.product_id
//             WHERE  products.id =  $id
//             GROUP BY products.id ";


// } else {
//   $query = "SELECT products.id, products.name, products.price, products.shortDescription,
//           (SELECT img_url FROM images WHERE product_id = products.id LIMIT 1)
//           AS images FROM products";
// }
// require_once('db_connection.php');
// $result = mysqli_query($conn, $query);


// if (!$result){
//   throw new Exception('error with query: ' . mysqli_error($conn));
// } else if(!empty($_GET['id']) && !mysqli_num_rows($result) ) {
//   throw new Exception('invalid ID: ' . $_GET['id']);
// }
// $data = [];
// while($row = mysqli_fetch_assoc($result)){
//   $row['id'] = intval($row['id']);
//   $row['price'] = intval($row['price']);
//   $row['images'] = explode(",",$row['images']);
//   $data[] = $row;
// }
// if(empty($_GET['id'])){
//   print(json_encode($data));
// } else {
//     print(json_encode($data[0]));
// }

?>
