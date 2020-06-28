<?php
		require_once("../controller/session_handler.php");
		require_once("../model/functions.php");
		open_connetion();

		$from = $_POST['from'];
		$to = $_POST['to'];

		$sql2= "SELECT * from flight WHERE depart='$from' AND distination='$to'";
		/* Crée une requête préparée */
		$prep_request =$con->prepare($sql2);
		/* Exécution de la requête */
		$prep_request->execute();
		$result=$prep_request->get_result();

		
	?>