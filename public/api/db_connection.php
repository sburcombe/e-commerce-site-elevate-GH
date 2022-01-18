<?php

$conn = mysqli_connect('localhost', 'root', 'root', 'wickedsales', 3301);

if (!$conn) {
  throw new Exception("Error Message: " . mysqli_connect_error());
}

?>
