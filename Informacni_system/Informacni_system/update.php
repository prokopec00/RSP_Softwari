<?php

//update.php

$conn = new PDO('sqlsrv:Server=SQL5053.site4now.net,1433;Database=DB_A6B685_prokopec', 'DB_A6B685_prokopec_admin', 'freeacc123');

if(isset($_POST["id"]))
{
 $query = "
 UPDATE tbl_review_list 
 SET id_article=:id_article, deadline=:deadline, deadline=:deadline 
 WHERE id_article=:id_article
 ";
 $statement = $conn->prepare($query);
 $statement->execute(
  array(
   ':id_article'  => $_POST['title'],
   ':deadline' => $_POST['start'],
   ':deadline' => $_POST['end'],
   ':id_article'   => $_POST['id']
  )
 );
}

?>