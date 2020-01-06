<?php
​
include "dbConnect2.php";
​
  if($userId != null)
  {
    $sql = "insert into store (userId, userPw, title, content)";
    $sql = $sql."values('$userId', '$userPw', '$title', '$content')";

    if($mysqli->query($sql)){
        echo "<script>alert('Success'); location.href='index.html';</script>";
​
    }else{
        echo "<script>alert('Failed');location.href='index.html';</script>";
    }
  }
  else {
        echo "<script>alert('no match');location.href='board.html';</script>";
  }
​
?>