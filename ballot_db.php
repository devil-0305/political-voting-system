
<?php
require_once "include/config.php";

session_start();
if(isset($_POST['submit']))
	{
        $email = $_SESSION['email']; 
		$vote = $_POST['vote'];
        $sql = "INSERT INTO result (email, vote) VALUES ('$email', '$vote')";
		if($conn->query($sql)){
			$_SESSION['success'] = 'Voted successfully';
			header('location: submitted.php');	
			exit;
		}
		else{
			$_SESSION['error'] = $conn->error;
            header('location: ballot.php');	
			exit;
		}
	}
	else{
		$_SESSION['error'] = 'Select one option first';
	}
	header('location: logout.php');	
?>

