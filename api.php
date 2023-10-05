<?php
 
header("Content-Type:application/json");
include('connection.php');

if(isset($_GET['action']) && $_GET['action']!='')
{
	if($_GET['action'] == "login")
	{
		if ((isset($_GET['username']) && $_GET['username']!="") && (isset($_GET['password']) && $_GET['password']!="")) {
			$username = $_GET['username'];
			$password = $_GET['password'];
			$query = "SELECT * FROM `users` WHERE username='$username' AND password='$password'";
			$result = mysqli_query($con, $query);
			if ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
			{
				$userData['id'] = $row['id'];
				$userData['username'] = $row['username'];
				$userData['password'] = $row['password'];
				$userData['name'] = $row['name'];
				$userData['cnic'] = $row['cnic'];

				$response["status"] = "true";
				$response["message"] = "User Details";
				$response["users"] = $userData;
			} else {
				$response["status"] = "true";
				$response["message"] = "Login failed";
			}
		}
		else{
			 $response["status"] = "false";
			$response["message"] = "No user(s) found!";
		}
	}
	else if($_GET['action'] == "signup")
	{
		if ((isset($_GET['username']) && $_GET['username']!="") && (isset($_GET['password']) && $_GET['password']!="") && (isset($_GET['name']) && $_GET['name']!="") && (isset($_GET['cnic']) && $_GET['cnic']!="") && (isset($_GET['address']) && $_GET['address']!="")) 
		{
			$username = $_GET['username'];
			$password = $_GET['password'];
			$name = $_GET['name'];
			$cnic = $_GET['cnic'];
			$address = $_GET['address'];
			$query = "SELECT * FROM `users` WHERE username='$username'";
			$result = mysqli_query($con, $query);
			if ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
			{
				$response["status"] = "true";
				$response["message"] = "Username already exists";
			} else {
				$query = "INSERT INTO `users` (username, password, name, cnic, address) VALUES('$username', '$password', '$name', '$cnic', '$address')";
				if(mysqli_query($con, $query)) {
					$response["status"] = "true";
					$response["message"] = "User created";
				} else{
					$response["status"] = "true";
					$response["message"] = "Error in creating user";
				}
			}
		}
		else{
			$response["status"] = "false";
			$response["message"] = "Error in creating user";
		}
	}
	else if($_GET['action'] == "get_users")
	{
		$query = "SELECT * FROM `users`";
		$result = mysqli_query($con, $query);
		$data = array();
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
			$userData['id'] = $row['id'];
			$userData['username'] = $row['username'];
			$userData['password'] = $row['password'];
			$userData['name'] = $row['name'];
			$userData['cnic'] = $row['cnic'];
			
			$data[]=array("id"=>$row['id'],"name"=>$row['name'],"username"=>$row['username'],"password"=>$row['password'],"cnic"=>$row['cnic']);
		}

		$response["status"] = "true";
		$response["message"] = "Users Details";
		$response["users"] = $data;
	} 
	else if($_GET['action'] == "get_user")
	{
		if (isset($_GET['user_id']) && $_GET['user_id']!="") {
			$user_id = $_GET['user_id'];
			$query = "SELECT * FROM `users` WHERE id=$user_id";
			$result = mysqli_query($con, $query);
			if ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
			{
				$userData['id'] = $row['id'];
				$userData['username'] = $row['username'];
				$userData['password'] = $row['password'];
				$userData['name'] = $row['name'];
				$userData['cnic'] = $row['cnic'];

				$response["status"] = "true";
				$response["message"] = "User Details";
				$response["users"] = $userData;
			} else {
				$response["status"] = "true";
				$response["message"] = "No user found";
			}
		}
		else{
			$response["status"] = "false";
			$response["message"] = "No user found";
		}
	}
	else if($_GET['action'] == "get_user_quotes")
	{
		$data = array();
		if (isset($_GET['user_id']) && $_GET['user_id']!="") {
			$user_id = $_GET['user_id'];
			$query = "SELECT uq.id 'uq_id', q.id 'q_id', q.quote, q.author, 	q.background_image_filename FROM `users_quotes` uq INNER JOIN quotes q ON uq.quote_id=q.id WHERE uq.user_id=$user_id";
			$result = mysqli_query($con, $query);
			while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC))
			{
				$userData['uq_id'] = $row['uq_id'];
				$userData['q_id'] = $row['q_id'];
				$userData['quote'] = $row['quote'];
				$userData['author'] = $row['author'];
				$userData['background_image_filename'] = $row['background_image_filename'];

				$data[]=array("uq_id"=>$row['uq_id'],"q_id"=>$row['q_id'],"quote"=>$row['quote'],"author"=>$row['author'],"background_image_filename"=>$row['background_image_filename']);
			} 
			$response["status"] = "true";
			$response["message"] = "No quote found";
			$response["quotes"] = $data;
		}
		else{
			$response["status"] = "false";
			$response["message"] = "No quote found";
			$response["quotes"] = $data;
		}
	}
	else 
	{
	}
} else {
	$response["status"] = "false";
	$response["message"] = "Action not provided";
}
echo json_encode($response); exit;
 
?>