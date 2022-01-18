<?php
require_once('functions.php');
require_once('db_connection.php');
  if(!defined('INTERNAL')){
    print('Direct access not allowed');
    exit();
  }
$bodyData = getBodyData();
if(empty($bodyData['productId'])){
  throw new Exception('Must have a productId to add to cart');
}
$productId = intval($bodyData['productId']);
// print_r($productId);

if(is_numeric($productId) && $productId <=0){
  throw new Exception('Product Id must be a valid Id' . $productId);
}



if (empty($_SESSION['cartId'])) {
  $cartId = false;
} else {
  $cartId = $_SESSION['cartId'];
}
// print_r("cart id ". $cartId);
//query to  get the price from products for the given id
$priceQuery = "SELECT `price` FROM products WHERE `id` = $productId";
//send the query to the database and store the result
$priceResult = mysqli_query($conn, $priceQuery);


//make sure the result is valid and throw an exception if there isn't one
//check how mnany rows came back
if (!$priceResult) {
  throw new Exception('error with query: ' . mysqli_error($conn));
} else if (!empty($bodyData['productId']) && !mysqli_num_rows($priceResult)) {
  throw new Exception('invalid ID: ' . $bodyData['productId']);
}
//extract the data for the row form the database, store the results


$row = mysqli_fetch_assoc($priceResult);

$transactionQuery = "START TRANSACTION";
$transactionResult = mysqli_query($conn, $transactionQuery);
//left off on Back End 7, step 10 xi
if (!$transactionResult){
  throw new Exception('error with transaction '. mysqli_error($conn));
} else if (!$cartId){
  /*if our cart ID is false, make an insert query to insert a new entry into the cart table
    Do NOT specify the id, it is auto incrementing.  specify 'created' as being equal to the mysql function NOW()*/
  $insertCartQuery = "INSERT INTO `cart`
                  SET `created` = NOW()";

  //send query to mysql and get the result
  $insertCartResult = mysqli_query($conn, $insertCartQuery);
  if(!$insertCartResult){
    throw new Exception ('error with insert ' . mysqli_error($conn));
  }
  //Use mysqli affected rows to see if a row was inserted or not
  if(mysqli_affected_rows($conn) != 1){
    throw new Exception ('rows inserted do not equal 1');
  };
  //use mysqli insert id to get the id of the cart that was created
  //store it into both cartId and $_SESSION[`cartId`]
  $cartId = mysqli_insert_id($conn);
  $_SESSION['cartId'] = mysqli_insert_id($conn);
  // print_r('cartId '. $cartId);
}

$insertCartItemQuery =
"INSERT INTO `cartItems`
  SET `count`=1, `productID`=$productId, `price`={$row['price']}, `added`= NOW(),
  `cartID`= $cartId
  ON DUPLICATE KEY UPDATE `count`= `count` + 1 ";
$insertCartItemResult = mysqli_query($conn, $insertCartItemQuery);
if (!$insertCartItemResult) {
  throw new Exception('error with insert ' . mysqli_error($conn));
}
//check to make sure your query updated AT LEAST 1 row. If not, send this query to mysql: "ROLLBACK"
//this will undo the cart insert so you don't have partial inserts
if (mysqli_affected_rows($conn) < 1) {
  $rollbackQuery = "ROLLBACK";
  mysqli_query($conn, $rollbackQuery);
  throw new Exception('rows inserted do not equal 1');
};


$commitQuery = "COMMIT";
mysqli_query($conn, $commitQuery);


?>
