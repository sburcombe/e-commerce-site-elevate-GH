<?php
 if(!function_exists('handleError')){
  function error_handler($error)
  {
    http_response_code(500);
    $output = array(
      "success" => false,
      "error" => $error->getMessage()
      );
    $json_output = json_encode($output);
    print($json_output);
  }
 }

 function startup(){
  header('Content-Type: application/json');
 }

 function getBodyData(){
  $json_input = file_get_contents('php://input');
  $data_structure = json_decode($json_input, true);
  return $data_structure;
 }

?>
