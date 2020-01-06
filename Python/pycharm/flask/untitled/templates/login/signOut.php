<?php
include "session.php";
$res=session_destroy();
if($res){
echo "<script>alert('Logout Success'); location.href='index.php';</script>";
}
?>