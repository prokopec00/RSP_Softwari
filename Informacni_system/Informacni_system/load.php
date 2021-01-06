<?php

//load.php
echo "Connected Successfully1";
//$connect = new PDO('mysql:host=localhost;dbname=testing', 'root', '');
function OpenCon()
 {
     
 $dbhost = "https://mssql.site4now.net/default.asp";
 $dbuser = "DB_A6B685_prokopec_admin";
 $dbpass = "freeacc123";
 $db = "DB_A6B685_prokopec";
 
 $conn = new mysqli($dbhost, $dbuser, $dbpass,$db) or die("Connect failed: %s\n". $conn -> error);
 
 return $conn;
 }
 echo "Connected Successfully2";
//content
$data = array();

$query = "SELECT * FROM events ORDER BY id";

$statement = $connect->prepare($query);

$statement->execute();

$result = $statement->fetchAll();

foreach($result as $row)
{
 $data[] = array(
  'id'   => $row["id"],
  'title'   => $row["title"],
  'start'   => $row["start_event"],
  'end'   => $row["end_event"]
 );
}

echo json_encode($data);
//content

function CloseCon($conn)
 {
 $conn -> close();
 }

?>