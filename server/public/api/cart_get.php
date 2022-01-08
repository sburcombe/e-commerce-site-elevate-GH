<?php
require_once('functions.php');
require_once('db_connection.php');
if (!defined('INTERNAL')) {
  print('Direct access not allowed');
  exit();
}

if(empty($_SESSION['cartId'])) {
  print(json_encode([]));
  exit();
}

$cartId = intval($_SESSION['cartId']);
//Select all from cartItems where cartId = cartId
                  //Join cartitems with products on productID
                  //to get id, name, price, shortDescription
                  //subquery to get the first image from images table
                  //you'll need to only get the cart where the cart ID is the
                  //one you are looking for
$cartItemsQuery = "SELECT cartItems.cartID, products.id, products.name, products.price, products.shortDescription,
(SELECT img_url FROM images WHERE product_id = products.id LIMIT 1)AS images FROM products
INNER JOIN cartItems ON cartItems.productID = products.id WHERE cartItems.cartID = $cartId";

//Send the query to mysql and get the result
 $cartItemsQueryResult = mysqli_query($conn, $cartItemsQuery);

//Retrieve the data you got from the query and print it out.
//If there is nothing there, make sure it prints out an empty array
$data=[];
if (!$cartItemsQueryResult) {
  print(json_encode($data));
} else {
  while ($row = mysqli_fetch_assoc($cartItemsQueryResult)) {
    $row['id'] = intval($row['id']);
    $row['price'] = intval($row['price']);
    $row['images'] = explode(",", $row['images']);
    $data[] = $row;
}
  print(json_encode($data));
}




//left off with the final query testing accurately but not printing what I
//am expecting.  Possibly has to do with the SESSION? Might need to test
//differently.

?>
