<?php

//require("./header.inc.php");
require($_SERVER['DOCUMENT_ROOT'] . '/HA_Login/header.inc.php');

if (!isset($_POST['req'])) {
   die("No request provided.");
} else {  // a request has been provided ...
   if ($_POST['req'] == "newLLD") {  // and the request is login
      $json = array("success"=>false, "msg"=>"", "req"=>"newLLD");

      if (!isset($_POST['user']) || empty($_POST['user'])) {  // user name not set or is empty
         $json['success'] = false;
         $json['msg'] = "No user name provided";
      } else {  // user name is provided
         global $mysql;

         if ( !isset($_POST['pass']) || empty($_POST['pass'])) { // password not set or is empty
            $json['success'] = false;
            $json['msg'] = "No password provided";
         } else {  // password provided
            $user = $mysql->real_escape_string($_POST['user']);
            $password = $mysql->real_escape_string($_POST['pass']);

            $hashword = hash("sha512", $password);
            $query = "SELECT `id`, `username` FROM `users` WHERE `username` = '" . $user . "' AND `password` = '" . $mysql->real_escape_string($hashword) . "' LIMIT 1";
            $result = $mysql->query($query);
            if ($result && $result->num_rows) {  // user name and password are correct

               $sessID = $mysql->real_escape_string(session_id());
               $hash = $mysql->real_escape_string(hash("sha512", $sessID.$_SERVER['HTTP_USER_AGENT']));

               $userData = $result->fetch_assoc();
               $expires = time() + (60 * 15);  // expire in 15 minutes

               $mysql->query("INSERT INTO `active_users` (`user_id`, `username`, `session_id`, `hash`, `expires`) VALUES (" .
                             (int) $userData['id'] . ", '" . $userData['username'] . ", '" . $sessID . "', '" . $hash . "', " . $expires . ")");
               $json['success'] = true;
               $json['msg'] = "Logged in!!!";
            } else {  // if the user name and password are not correct
               $json['success'] = false;
               $json['msg'] = "User name or password incorrect";
            }
         }
      }

      print(json_encode($json)); // output the JSON response ... passed over to login.js (data)
   }
}

?>