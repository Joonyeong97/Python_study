<?php
$host = 'localhost';
$user = 'root';
$pw = 'root';
$dbName = 'board';
​
$mysqli = new mysqli($host, $user, $pw, $dbName);
​
$userId=$_POST['userId'];
$userPw=$_POST['userPw'];
$title=$_POST['title'];
$content=$_POST['content'];
​
if($db) {
echo '[연결실패] : '.mysql_error().'';
} else {
echo '[연결성공]';
}
​
?>