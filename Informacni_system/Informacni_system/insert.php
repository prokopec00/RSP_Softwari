<?php

//insert.php

$conn = new PDO('sqlsrv:Server=SQL5053.site4now.net,1433;Database=DB_A6B685_prokopec', 'DB_A6B685_prokopec_admin', 'freeacc123');



//content
if(isset($_POST["title"]))
{
 $query = "
 INSERT INTO tbl_review_list 
 (id_article, deadline, deadline) 
 VALUES (:id_article, :deadline, :deadline)
 ";
 $statement = $conn->prepare($query);
 $statement->execute(
  array(
   ':id_article'  => $_POST['title'],
   ':deadline' => $_POST['start'],
   ':deadline' => $_POST['end']
  )
 );
}
//content



?>