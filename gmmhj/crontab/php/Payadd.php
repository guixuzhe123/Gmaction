<?php

$url = "http://gm.3595.com/index.php?m=Home&c=Platcash&a=payadd";

$ch = curl_init();
curl_setopt($ch,CURLOPT_URL,$url);
curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
curl_setopt($ch,CURLOPT_HEADER,0);

curl_exec($ch);

curl_close($ch);

?>
