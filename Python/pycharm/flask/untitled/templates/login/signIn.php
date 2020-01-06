<?php
include "session.php";
include "dbConnect.php";
​
$check="select * from member where userId='$userId'";
$result=$mysqli->query($check);
if($result->num_rows==1){
  $row=$result->fetch_array(MYSQLI_ASSOC);
  if($row['userPw']==$userPw){
    $_SESSION['userId']=$userId;
    if(isset($_SESSION['userId'])) {
        echo "<script>alert('Login Success'); location.href='main.html';</script>";
    }
    else {
      echo "세션 저장 실패";
    }
  }
  else{
    echo "wrong id or pw";
  }
}
else{
  echo "wrong id or pw";
}
​
?>