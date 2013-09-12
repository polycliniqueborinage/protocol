<?php

	require("./init.php");

	$mailing = new mailing();
	
	$mails = $mailing->getAllMailToSend();
	echo "<br/> mail send : ";
	print_r($mails);
	foreach ($mails as $mail) {
		$emailer->send_mail($mail["recipient_email"],$mail['object'],$mail['content']);
		$mailing->markAsSend($mail['ID']);
	}
	echo "end";
?>