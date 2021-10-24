<?php
include("session.inc");

?>
<html>
<head>
<title>RadioFan.Club Group Favorites Sync Tool</title>
</head>
<body>
<pre>
<?php
	if ($_SESSION['sm61loggedin'] === true) {

		$cmd = "/usr/local/sbin/supermon-syncgrpfavs.sh";
		echo "Command: $cmd\n-----------------------------------------------------------------\n";
		passthru ($cmd);
		$cmd2 = "tail -11 /var/log/httpd/error_log";
		passthru ($cmd2);
		echo "\n\n";

		echo "\n\n";
		echo "\n\n";

		echo "Sync Complete, please close this window.\n\n";


	} else
		echo ("<br><h3>ERROR: You Must login to use this function!</h3>");
?>
</pre>
</body>
</html>
