<?php


//load.php
$conn = new PDO('sqlsrv:Server=sql5102.site4now.net,1433;Database=DB_A6F378_klobou01', 'DB_A6F378_klobou01_admin', 'klobou01');


$data = array();

$query = "SELECT * FROM tbl_review_list ORDER BY id_article";

$statement = $conn->prepare($query);

$statement->execute();

$result = $statement->fetchAll();

foreach($result as $row)
{
    $data[] = array(
        'id'   => $row["id_article"],
        'title'   => $row["id_article"],
        'start'   => $row["deadline"],
        'end'   => $row["deadline"]
    );
}

echo json_encode($data);







?>