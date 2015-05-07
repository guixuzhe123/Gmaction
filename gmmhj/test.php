<?php
$callTrace = array();
function enterFunction($name){
	global $callTrace;
	$callTrace[] = $name;
	echo "Entering {$name} (stack is now: " . join(' -> ',$callTrace) . ")<br/>";
}
function exitFunction(){
	echo "Exiting<br/>";
	global $callTrace;
	array_pop($callTrace);
}
function first(){
	enterFunction("first");
	exitFunction();
}
function second(){
	enterFunction("second");
	first();
	exitFunction();
}
function third(){
	enterFunction("third");
	second();
	first();
	exitFunction();
}
first();
third();
?>