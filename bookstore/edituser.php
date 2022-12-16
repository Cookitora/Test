<?php
session_start();
$nameErr = $emailErr = $genderErr = $addressErr = $icErr = $contactErr = $usernameErr = $passwordErr = "";
$name = $email = $gender = $address = $ic = $contact = $uname = $upassword = "";
$cID;

$oUserName;
$oPassword;
$oName;
$oIC;
$oEmail;
$oPhone;
$oAddress;

$servername = "127.0.0.1";
$username = "20290";
$password = "1234";
$conn = new mysqli($servername, $username, $password); 

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "USE 20280_bookstore";
$conn->query($sql);

$sql = "SELECT users.UserName, users.Password, customer.CustomerName, customer.CustomerIC, customer.CustomerEmail, customer.CustomerPhone, customer.CustomerGender, customer.CustomerAddress
	FROM users, customer
	WHERE users.UserID = customer.UserID AND users.UserID = ".$_SESSION['id']."";
$result = $conn->query($sql);
while($row = $result->fetch_assoc()){
	$oUserName = $row['UserName'];
	$oPassword = $row['Password'];
	$oName = $row['CustomerName'];
	$oIC = $row['CustomerIC'];
	$oEmail = $row['CustomerEmail'];
	$oPhone = $row['CustomerPhone'];
	$oAddress = $row['CustomerAddress'];
}


if ($_SERVER["REQUEST_METHOD"] == "POST") {
	if (empty($_POST["name"])) {
		$nameErr = "Please enter your name";
	}else{
		if (!preg_match("/^[a-zA-Z ]*$/", $name)){
			$nameErr = "Only letters and white space allowed";
			$name = "";
		}else{
			$name = $_POST['name'];

			if (empty($_POST["uname"])) {
				$usernameErr = "Введите имя";
				$uname = "";
			}else{
				$uname = $_POST['uname'];

				if (empty($_POST["upassword"])) {
					$passwordErr = "Введите пароль";
					$upassword = "";
				}else{
					$upassword = $_POST['upassword'];

					if (empty($_POST["ic"])){
						$icErr = "Введите данные карты";
					}else{
						if(!preg_match("/^[0-9 -]*$/", $ic)){
							$icErr = "Введите верные данные";
							$ic = "";
						}else{
							$ic = $_POST['ic'];

							if (empty($_POST["email"])){
								$emailErr = "Введите почту";
							}else{
								if (filter_var($email, FILTER_VALIDATE_EMAIL)){
									$emailErr = "Invalid email format";
									$email = "";
								}else{
									$email = $_POST['email'];

									if (empty($_POST["contact"])){
										$contactErr = "Введите номер телефона";
									}else{
										if(!preg_match("/^[0-9 -]*$/", $contact)){
											$contactErr = "Пожалуйста, введите правильный номер телефона";
											$contact = "";
										}else{
											$contact = $_POST['contact'];

											if (empty($_POST["gender"])){
												$genderErr = "* Gender is required!";
												$gender = "";
											}else{
												$gender = $_POST['gender'];

												if (empty($_POST["address"])){
													$addressErr = "Please";
													$address = "";
												}else{
													$address = $_POST['address'];

													$servername = "localhost";
													$username = "root";
													$password = "";

													$conn = new mysqli($servername, $username, $password); 

													if ($conn->connect_error) {
													    die("Connection failed: " . $conn->connect_error);
													} 

													$sql = "USE bookstore";
													$conn->query($sql);

													$sql = "UPDATE users SET UserName = '".$uname."', Password = '".$upassword."' WHERE UserID = "
													.$_SESSION['id']."";
													$conn->query($sql);

													$sql = "UPDATE customer SET CustomerName = '".$name."', CustomerPhone = '".$contact."', 
													CustomerIC = '".$ic."', CustomerEmail = '".$email."', CustomerAddress = '".$address."', 
													CustomerGender = '".$gender."'";
													$conn->query($sql);

													header("Location:index.php");
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
}												
function test_input($data){
	$data = trim($data);
	$data = stripcslashes($data);
	$data = htmlspecialchars($data);
	return $data;
}
?>
<html>
<link rel="stylesheet" href="style.css">
<body>
<header>
<blockquote>
	<a href="index.php"><img src="image/logo.png"></a>
</blockquote>
</header>
<blockquote>
<div class="container">
<form method="post"  action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
	<h1>Редактирование профиля</h1>
	ФИО:<br><input type="text" name="name" placeholder="<?php echo $oName; ?>">
	<span class="error" style="color: red; font-size: 0.8em;"><?php echo $nameErr;?></span><br><br>

	Логин:<br><input type="text" name="uname" placeholder="<?php echo $oUserName; ?>">
	<span class="error" style="color: red; font-size: 0.8em;"><?php echo $usernameErr;?></span><br><br>

	Новый пароль:<br><input type="password" name="upassword" placeholder="<?php echo $oPassword; ?>">
	<span class="error" style="color: red; font-size: 0.8em;"><?php echo $passwordErr;?></span><br><br>

	Номер карты:<br><input type="text" name="ic" placeholder="<?php echo $oIC; ?>">
	<span class="error" style="color: red; font-size: 0.8em;"><?php echo $icErr;?></span><br><br>

	E-mail:<br><input type="text" name="email" placeholder="<?php echo $oEmail; ?>">
	<span class="error" style="color: red; font-size: 0.8em;"><?php echo $emailErr;?></span><br><br>

	Номер телефона:<br><input type="text" name="contact" placeholder="<?php echo $oPhone; ?>">
	<span class="error" style="color: red; font-size: 0.8em;"><?php echo $contactErr;?></span><br><br>

	<label>Пол:</label><br>
	<input type="radio" name="gender" <?php if (isset($gender) && $gender == "Male") echo "checked";?> value="Male">Мужской
	<input type="radio" name="gender" <?php if (isset($gender) && $gender == "Female") echo "checked";?> value="Female">Женский
	<span class="error" style="color: red; font-size: 0.8em;"><?php echo $genderErr;?></span><br><br>

	<label>Адрес:</label><br>
    <textarea name="address" cols="50" rows="5" placeholder="<?php echo $oAddress; ?>"></textarea>
    <span class="error" style="color: red; font-size: 0.8em;"><?php echo $addressErr;?></span><br><br>
	
	<input class="button" type="submit" name="submitButton" value="Изменить">
	<input class="button" type="button" name="cancel" value="Отменить" onClick="window.location='index.php';" />
</form>
</div>
</blockquote>
</center>
</body>
</html>