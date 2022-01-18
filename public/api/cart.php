<?php
session_start();
header('Content-Type: application/json');


$item = file_get_contents('dummy-cart-items.json');

if ($method == 'GET') {
  readfile('dummy-cart-items.json');
} else if ($method == 'POST') {
  http_response_code(201);
  print($item);
} else {
  http_response_code(404);
  print(json_encode([
    'error' => 'Not Found',
    'message' => "Cannot $method /api/cart.php"
  ]));
}

// define('INTERNAL', true);
// require_once('functions.php');

// set_exception_handler('error_handler');
// require_once('db_connection.php');

// $method = $_SERVER['REQUEST_METHOD'];

// $item = file_get_contents('php://input');
// switch($method){

//   case 'POST':
//     require_once('cart_add.php');
//     // http_response_code(201);
//     print($item);
//     break;
//   case 'GET':
//     require_once('cart_get.php');

//     break;
// }
?>
