<?php

function show_board() {
	
	global $mysqli;
	$sql = 'select * from board';
$st = $mysqli->prepare($sql);

print $mysqli->error;
$st->execute();
$res = $st->get_result();

header('Content-type: application/json');
print json_encode($res->fetch_all(MYSQLI_ASSOC), JSON_PRETTY_PRINT);

}

?>