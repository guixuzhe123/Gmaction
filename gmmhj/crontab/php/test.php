<?php

$url = "http://localhost/index.php?m=Home&c=Platcash&a=test";

$ch = curl_init();
curl_setopt($ch,CURLOPT_URL,$url);
curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
curl_setopt($ch,CURLOPT_HEADER,0);

$out = curl_exec($ch);

curl_close($ch);
echo $out;
?>
