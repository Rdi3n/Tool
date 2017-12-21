connect.php

<?php
$connection = mysqli_connect('localhost', 'root', '');
if (!$connection){
    die("Database Connection Failed" . mysqli_error($connection));
}
$select_db = mysqli_select_db($connection, 'toolsforever');
if (!$select_db){
    die("Database Selection Failed" . mysqli_error($connection));
}

<!---------------------------------------------------------------------------------------->

footer.php


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
  </body>
</html>

<!------------------------------------------------------------------------------------------------------>


functions.php

<?php

define("DIR","http://localhost/tool/");

function locaties(){ 

	$SERVER = 'localhost'; $USER = 'root'; $PASS = ''; $DATABASE = 'toolsforever';


if (!($mylink = mysqli_connect( $SERVER, $USER, $PASS)))
	{ echo  "<h3>Sorry, could not connect to database.</h3><br/> Please contact your system's admin for more help\n"; exit; }
mysqli_select_db($mylink, $DATABASE );

$posts = array();

$sql = "select id, Locatiecode, Locatie from locatie"; 
$result = mysqli_query($mylink, $sql);
 while($data = mysqli_fetch_object($result)){  

 	$posts[] = array('id' => $data->id,'Locatiecode' => $data->Locatiecode,'Locatie' => $data->Locatie); 

 } 

 return $posts;
}


function add_locatie($locatiecode,$locatie){ 

	$sql = "insert into locatie (Locatiecode, Locatie) values ($locatiecode, '". mysql_real_escape_string($locatie). "')";

 $result = mysql_query($sql); 


}


function show_voorraad($locatiecode){ 
	$SERVER = 'localhost'; $USER = 'root'; $PASS = ''; $DATABASE = 'toolsforever';


if (!($mylink = mysqli_connect( $SERVER, $USER, $PASS)))
	{ echo  "<h3>Sorry, could not connect to database.</h3><br/> Please contact your system's admin for more help\n"; exit; }
mysqli_select_db($mylink, $DATABASE );

	$voorraads = array();
 	$sql = "select id, Locatiecode, Productcode, Aantal from voorraad  where Locatiecode = '$locatiecode' order by Productcode desc"; 

 	$result = mysqli_query($mylink, $sql);

 while($data = mysqli_fetch_object($result)){  
 	$voorraads[] = array('id' => $data->id,'Locatiecode' => $data->Locatiecode,'Productcode' => $data->Productcode, 'Aantal' => $data->Aantal); 


 } 

 return $voorraads;
}

function show_voorraad_per_p($locatiecode){

	$SERVER = 'localhost'; $USER = 'root'; $PASS = ''; $DATABASE = 'toolsforever';


if (!($mylink = mysqli_connect( $SERVER, $USER, $PASS)))
	{ echo  "<h3>Sorry, could not connect to database.</h3><br/> Please contact your system's admin for more help\n"; exit; }
mysqli_select_db($mylink, $DATABASE );

	$voorraads2 = array();
		$sql  = 'SELECT artikel.Productcode, artikel.Product, artikel.Type, SUM(artikel.Inkoopprijs * voorraad.Aantal) AS Totaal\n"

    "FROM artikel\n"

    "LEFT JOIN voorraad ON artikel.Productcode = voorraad.Productcode\n"

    "WHERE voorraad.Locatiecode = \'$locatiecode\' AND artikel.Productcode = \'KA280\'\n"

    "ORDER BY voorraad.Productcode';

    	$result = mysqli_query($mylink, $sql);

    	while($data = mysqli_fetch_object($result)){  
 	$voorraads2[] = array('artikel.Productcode' => $data->artikel.Productcode,'Locatiecode' => $data->Locatiecode,'Productcode' => $data->Productcode, 'Aantal' => $data->Aantal); 


 } 

 return $voorraads2;

}


function show_producten(){ 
	$SERVER = 'localhost'; $USER = 'root'; $PASS = ''; $DATABASE = 'toolsforever';


if (!($mylink = mysqli_connect( $SERVER, $USER, $PASS)))
	{ echo  "<h3>Sorry, could not connect to database.</h3><br/> Please contact your system's admin for more help\n"; exit; }
mysqli_select_db($mylink, $DATABASE );

	$show_producten = array();
 	$sql = "select Productcode, Product, Type, Fabriekscode, Inkoopprijs, Verkoopprijs from artikel order by Productcode desc"; 

 	$result = mysqli_query($mylink, $sql);

 while($data = mysqli_fetch_object($result)){  
 	$show_producten[] = array('Productcode' => $data->Productcode,'Product' => $data->Product,'Type' => $data->Type, 'Fabriekscode' => $data->Fabriekscode, 'Inkoopprijs'=>$data->Inkoopprijs, 'Verkoopprijs'=>$data->Verkoopprijs); 


 } 

 return $show_producten;
}





function search($like){

	$SERVER = 'localhost'; $USER = 'root'; $PASS = ''; $DATABASE = 'toolsforever';


if (!($mylink = mysqli_connect( $SERVER, $USER, $PASS)))
	{ echo  "<h3>Sorry, could not connect to database.</h3><br/> Please contact your system's admin for more help\n"; exit; }
mysqli_select_db($mylink, $DATABASE );

$sql = "SELECT *
		FROM artikel, voorraad
			WHERE artikel.Productcode = voorraad.Productcode AND artikel.Type LIKE '$like%' OR artikel.Product LIKE '$like%'" or die(mysql_error());


		$result = mysqli_query($mylink, $sql);

	 while($data = mysqli_fetch_object($result)){  
 	$show_search[] = array('Productcode' => $data->Productcode,'Product' => $data->Product,'Type' => $data->Type, 'Fabriekscode' => $data->Fabriekscode, 'Inkoopprijs'=>$data->Inkoopprijs, 'Verkoopprijs'=>$data->Verkoopprijs, 'Aantal'=>$data->Aantal, 'Locatiecode'=>$data->Locatiecode);

 }


    return $show_search;

}



?>


<!------------------------------------------------------------------------------------------------------------------>

header.php

<?php
$SERVER = 'localhost'; $USER = 'root'; $PASS = ''; $DATABASE = 'toolsforever';


if (!($mylink = mysqli_connect( $SERVER, $USER, $PASS)))
	{ echo  "<h3>Sorry, could not connect to database.</h3><br/> Please contact your system's admin for more help\n"; exit; }



mysqli_select_db($mylink, $DATABASE );




<!--------------------------------------------------------------------------------------------------------------------------->



index.php 



<!-- <?php

//include_once("header.php"); 
//include_once("functions.php");

//include_once("top.php"); 
?>


    <div class="row" style="margin-top: 50px;">
    <div class="col-6 col-md-4">
    	
    	 <?php //include_once("sidebar.php"); ?>

    </div>
  <div class="col-12 col-sm-6 col-md-8">
  	 -->
 <!--  	<?php
    session_start();
    echo isset($_SESSION['login']);
    if(isset($_SESSION['login'])) {
      header('LOCATION:locaties.php'); die();
    }
?> -->


<!DOCTYPE html>
<html>
   <head>
     <meta http-equiv='content-type' content='text/html;charset=utf-8' />
     <title>Tools</title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   </head>
<body>
  <div class="container">
    <!-- <h3 class="text-center">Tools</h3>
    <?php
      if(isset($_POST['submit'])){
        $username = $_POST['username']; $password = $_POST['password'];
        if($username === 'admin' && $password === 'password'){
          $_SESSION['login'] = true; header('LOCATION:locaties.php'); die();
        } {
          echo "<div class='alert alert-danger'>Username and Password do not match.</div>";
        }

      }
    ?>
    <form action="" method="post">
      <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" class="form-control" id="username" name="username" required>
      </div>
      <div class="form-group">
        <label for="pwd">Password:</label>
        <input type="password" class="form-control" id="pwd" name="password" required>
      </div>
      <button type="submit" name="submit" class="btn btn-default">Login</button>
    </form> -->






    		      <form class="form-signin" method="POST" action="login.php">
        <h2 class="form-signin-heading">Please Login</h2>
        <div class="input-group">
	  <span class="input-group-addon" id="basic-addon1">@</span>
	  <input type="text" name="username" class="form-control" placeholder="Username" required>
	</div>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
        <a class="btn btn-lg btn-primary btn-block" href="register.php">Register</a>
      </form>

  </div>
</body>
</html>
  <!-- </div>
  
</div>




<?php
//include_once("footer.php"); 

?> -->


<!----------------------------------------------------------------------------------------------------------------------->



locatie-toevoegen-add.php

<?php  
include_once("header.php"); 
//include_once("functions.php");

$locatiecode =  $_POST['Locatiecode']; 
$locatie =  $_POST['Locatie'];

//add_locatie($locatiecode,$locatie);




$servername = "localhost";
$username = "root";
$password = "";
$dbname = "toolsforever";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

$sql = "INSERT INTO locatie (Locatiecode, Locatie)
VALUES ('$locatiecode', '$locatie')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();


$_SESSION['message'] = "Locatie-toegevoegd!";
header("Location:locatie-toevoegen.php"); 

?>
<!------------------------------------------------------------------------------------------------------------------->



locatie-toevoegen.php



<?php

include_once("header.php"); 
include_once("functions.php");

include_once("top.php"); 
?>


    <div class="row" style="margin-top: 50px;">
    <div class="col-6 col-md-4">
    	
    	 <?php include_once("sidebar.php"); ?>

    </div>
  <div class="col-12 col-sm-6 col-md-8">
  	
  					<form class="form-horizontal" role="form" method="POST" action=<?php echo DIR;?>locatie-toevoegen-add.php>

            		<div class="form-group">
					 <div class="col-md-6"> 
					 	<label> locatiecode</label>
                    <input id="Locatiecode" type="text" class="form-control" name="Locatiecode" required autofocus>
                            </div>
                        </div>

                        <div class="form-group">
					 <div class="col-md-6"> 
					 	<label>Locatie</label>
                    <input id="Locatie" type="text" class="form-control" name="Locatie" required autofocus>
                            </div>
                        </div>
                         <div class="form-group">
					 <div class="col-md-6"> 
                        <p><input type='submit' value='submit'/></p>
                          </div>
                        </div>
                    </form>


  </div>		
  
</div>




<?php
include_once("footer.php"); 

?>



<!------------------------------------------------------------------------------------------------------------------------>

locaties.php



<?php

include_once("header.php"); 
include_once("functions.php");

include_once("top.php"); 
?>


    <div class="row" style="margin-top: 50px;">
    <div class="col-6 col-md-4">
    	
    	 <?php include_once("sidebar.php"); ?>

    </div>
  <div class="col-12 col-sm-6 col-md-8">
  	
 <?php 
  	$posts = locaties(); ?>

  	<!--  	<?php 


if (count($posts)){ ?> 
<table border='1' cellspacing='0' cellpadding='5' width='500'> 
	<?php foreach ($posts as $key => $list){ 
		echo "<tr valign='top'>\n"; 
		echo "<td>".$list['id'] ."</td>\n"; 
		echo "<td>".$list['Locatiecode'] ."<br/>\n"; 
		echo "<small>".$list['Locatie'] ."</small></td>\n"; 
		echo "</tr>\n"; } ?> </table> 
		<?php }
		else{ ?> <p><b>You haven't posted anything yet!</b></p> 

		<?php } ?>  -->
<?php
if (count($posts)){ ?> 
<table class="table">
  <thead>
  
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Locatiecode</th>
      <th scope="col">Locatie</th>
      <th scope="col">Voorraad</th>
    </tr>
  </thead>
  <tbody>
  	<?php foreach ($posts as $key => $list){ ?>
    <tr>     
      <td><?php echo $list['id']; ?></td>
      <td><?php echo $list['Locatiecode']; ?></td>
      <td><?php echo $list['Locatie']; ?></td>
      <td> <a href=<?php echo DIR; ?>voorraad.php?locatie=<?php echo $list['Locatiecode']; ?> class="btn btn-xs btn-info"> Voorraad</a></td>
    </tr>
 <?php  } ?> 
</table>
<?php }
		else{ ?> <p><b>Er zijn geen locatie toegevoegd!</b></p> 

		<?php } ?> 




  </div>
  
</div>




<?php
include_once("footer.php"); 

?>

<!--------------------------------------------------------------------------------------------------------------------->


login.php



<?php  //Start the Session
session_start();
 require('connect.php');
//3. If the form is submitted or not.
//3.1 If the form is submitted
if (isset($_POST['username']) and isset($_POST['password'])){
//3.1.1 Assigning posted values to variables.
$username = $_POST['username'];
$password = $_POST['password'];
//3.1.2 Checking the values are existing in the database or not
$query = "SELECT * FROM `user3` WHERE username='$username' and password='$password'";
 
$result = mysqli_query($connection, $query) or die(mysqli_error($connection));
$count = mysqli_num_rows($result);
//3.1.2 If the posted values are equal to the database values, then session will be created for the user.
if ($count == 1){
$_SESSION['username'] = $username;
}else{
//3.1.3 If the login credentials doesn't match, he will be shown with an error message.
$fmsg = "Invalid Login Credentials.";
}
}
//3.1.4 if the user is logged in Greets the user with message
if (isset($_SESSION['username'])){
$username = $_SESSION['username'];

header("Location:locaties.php");
echo "Hai " . $username . "
";
echo "This is the Members Area
";
echo "<a href='logout.php'>Logout</a>";
 
}else{
//3.2 When the user visits the page first time, simple login form will be displayed.
header("Location:index.php");
}
?>


<!---------------------------------------------------------------------------------------------------------------------------->

Logout.php


<?php 

session_start();
session_destroy();
$home_url = 'http://' . $_SERVER['HTTP_HOST'] . dirname($_SERVER['PHP_SELF']) . '/index.php';
header('Location: ' . $home_url);

?>



<!------------------------------------------------------------------------------------------------------------------------->

producten.php


<?php

include_once("header.php"); 
include_once("functions.php");

include_once("top.php"); 
?>

<?php 
  	$show_voorraads = show_producten(); ?>

    <div class="row" style="margin-top: 50px;">
    <div class="col-6 col-md-4">
    	
    	 <?php include_once("sidebar.php"); ?>

    </div>
  <div class="col-12 col-sm-6 col-md-8">
  	

  			<?php
if (count($show_voorraads)){ ?> 
<table class="table">
  <thead>
  
    <tr>
      <th scope="col">Productcode</th>
      <th scope="col">Product</th>
      <th scope="col">Type</th>
      <th scope="col">Fabriekscode</th>
      <th scope="col">Inkoopprijs</th>
      <th scope="col">Verkoopprijs</th>
    </tr>
  </thead>
  <tbody>
  	<?php foreach ($show_voorraads as $key => $list){ ?>
    <tr>     
      <td><?php echo $list['Productcode']; ?></td>
      <td><?php echo $list['Product']; ?></td>
      <td><?php echo $list['Type']; ?></td>
      <td><?php echo $list['Fabriekscode']; ?></td>
      <td><?php echo $list['Inkoopprijs']; ?></td>
      <td><?php echo $list['Verkoopprijs']; ?></td>
    </tr>
 <?php  } ?> 
</table>
<?php }
		else{ ?> <p><b>Er zijn geen locatie toegevoegd!</b></p> 

		<?php } ?> 




  </div>
  
</div>




<?php
include_once("footer.php"); 

?>

<!------------------------------------------------------------------------------------------------------------------------>


search.php

<?php

include_once("header.php"); 
include_once("functions.php");

include_once("top.php"); 
?>


    <div class="row" style="margin-top: 50px;">
    <div class="col-6 col-md-4">
        
         <?php include_once("sidebar.php"); ?>

    </div>
  <div class="col-12 col-sm-6 col-md-8">
        

  </div>
  
  
  <!----------------------------------------------------------------------------------------------------------------->
  
  sidebar.php
  
  
  <ul class="list-group">
			<li class="list-group-item"><?php $medewerker = $_SESSION['username'];
        echo "<b> Ingelogd als: ". $medewerker. "</b>";
      ?></li>
        	<li class="list-group-item"><a href=<?php echo DIR; ?>locaties.php>Locaties</a></li>
        	<li class="list-group-item"><a href=<?php echo DIR; ?>producten.php>Producten</a></li>
        	<li class="list-group-item"><a href=<?php echo DIR; ?>locatie-toevoegen.php>Locatie toevoegen</a></li>

            
     
            <li class="list-group-item"><a href=<?php echo DIR; ?>zoek.php>Zoek</a></li>
            <li class="list-group-item"><a href=<?php echo DIR; ?>logout.php>Logout</a></li>     
     </ul>
     
     
     <!---------------------------------------------------------------------------------------------------------------------->
     
     top.php
     
     
     <?php
    session_start();
    if(!isset($_SESSION['username'])) {
        header('LOCATION:index.php'); die();
    }
?>

<?php

include_once("header.php"); 
include_once("functions.php");
include_once("top.php"); 
?>

<!doctype html>
<html lang="en">
  <head>
    <title>Hello, world!</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
  </head>
  <body>
    
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href=<?php echo DIR; ?>locaties.php>Tools</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href=<?php echo DIR; ?>locaties.php>Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Menu
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href=<?php echo DIR; ?>locaties.php>Locaties</a>
          <a class="dropdown-item" href=<?php echo DIR; ?>locatie-toevoegen.php>Locatie toevoegen</a>
          <a class="dropdown-item" href=<?php echo DIR; ?>producten.php>Producten</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#"></a>
        </div>
      </li>
    </ul>
    <ul class="navbar-nav" style="margin-right: 15px">
      
      <li><?php $medewerker = $_SESSION['username'];
        echo "<b>". $medewerker. "</b>";
      ?></li>

    </ul>
  </div>
</nav>


<!---------------------------------------------------------------------------------------------------------------------------->


voorraad-update.php

<?php 
include_once("header.php"); 
//include_once("functions.php");

$locatiecode = $_GET['locatie']; 
$aantal = $_POST['aantal'];
$productcode = $_GET['productcode'];

//update_voorraad($locatiecode,$aantal); 



$servername = "localhost";
$username = "root";
$password = "";
$dbname = "toolsforever";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 


$sum = 0; 

$sq = "SELECT Aantal AS sum FROM  `voorraad` WHERE `Locatiecode` = '$locatiecode' AND Productcode = '$productcode'"or die(mysql_error());

$result = mysqli_query($mylink, $sq);

   while($row = mysqli_fetch_assoc( $result))
   {
    $GLOBALS['sum'] = $row["sum"];
   }

   $GLOBALS['productaantal']= $sum + $aantal;

   echo $productaantal . "<br>";



$sql = "UPDATE voorraad SET Aantal='$productaantal' WHERE Locatiecode= '$locatiecode' AND Productcode = '$productcode'";

if ($conn->query($sql) === TRUE) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . $conn->error;
}

$conn->close();


$_SESSION['message'] = "voorraad toegevoegd!";
header("Location:voorraad.php?locatie=".$locatiecode); 





?>



<!------------------------------------------------------------------------------------------------------------------->

voorraad.php




<?php

include_once("header.php"); 
include_once("functions.php");
include_once("top.php"); 
?>

	<?php  $voorraads = show_voorraad($_GET['locatie']); ?>

    <div class="row" style="margin-top: 50px;">
    <div class="col-6 col-md-4">
    	
    	 <?php include_once("sidebar.php"); ?>

    </div>
  <div class="col-12 col-sm-6 col-md-8">


  	
  			<?php
if (count($voorraads)){ ?> 
<table class="table">
  <thead>
  
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Locatiecode</th>
      <th scope="col">Locatie</th>
      <th scope="col">Voorraad</th>
      <th scope="col">Voorraad toevoegen</th>
    </tr>
  </thead>
  <tbody>
  	<?php foreach ($voorraads as $key => $voorraad){ ?>
    <tr>     
    	<?php $GLOBALS['Productcode_1'] = $voorraad['Productcode']; ?>
      <td><?php echo $voorraad['id']; ?></td>
      <td><?php echo $voorraad['Locatiecode']; ?></td>
      <td><?php echo $voorraad['Productcode']; ?></td>
      <td><?php echo $voorraad['Aantal']; ?></td>
      <!-- <td> <a href=<?php echo DIR; ?>voorraad.php?locatie=<?php echo $voorraad['Locatiecode']; ?> class="btn btn-xs btn-info"> Voorraad</a></td> -->
      <td> 

      	

      	<form class="form-horizontal" role="form" method="POST" action=<?php echo DIR;?>voorraad-update.php?locatie=<?php echo $voorraad['Locatiecode']; ?>&productcode=<?php echo $voorraad['Productcode']; ?>>
            <div class="form-group">
                            <div class="col-md-6"> 
                    <input id="Aantal" type="number" class="form-control" name="aantal" required autofocus>
                            </div>
                        </div>
                    </form>

      </td>
    </tr>
 <?php  } ?> 
</tbody>
</table>
<?php }
		else{ ?> <p><b>Er zijn geen producten op locatie!</b></p> 

		<?php } ?> 

					<?php
					$locatie_p = $_GET['locatie'];

					$sq ="SELECT artikel.Product,  artikel.Productcode , SUM(artikel.Inkoopprijs * voorraad.Aantal) AS Totaal

							    	FROM artikel

							     LEFT JOIN voorraad ON artikel.Productcode = voorraad.Productcode
							     WHERE voorraad.Locatiecode ='$locatie_p' 
							     
							     ";

									$result = mysqli_query($mylink, $sq);

						 		 ?>

						 		 <?php
								 while($row = mysqli_fetch_object($result))
							   { ?>

      							<?php echo "<b>Voorraad totale waarde :</b>" . $row->Totaal; ?>

      					<?php } ?>

  </div>
  
</div>


			<div class="row" style="margin-top: 50px;">
			    <div class="col-6 col-md-4">
			    	
			    	

			    </div>
			  <div class="col-12 col-sm-6 col-md-8">
			  	<?php

			  $locatie_p = $_GET['locatie'];
			  	
						 // $sq = mysql_query("SELECT SUM('artikel.Inkoopprijs' * 'voorraad.Aantal' ) AS sum FROM  `voorraad` LEFT JOIN 'artikel'
						 // 	ON artikel.Productcode =voorraad.Productcode
							//  WHERE `Locatiecode` = '$locatie_p'")or die(mysql_error());

						 		$sq ="SELECT artikel.Product,  artikel.Productcode , SUM(artikel.Inkoopprijs * voorraad.Aantal) AS Totaal

							    	FROM artikel

							     LEFT JOIN voorraad ON artikel.Productcode = voorraad.Productcode
							     WHERE voorraad.Locatiecode ='$locatie_p' 
							     GROUP BY artikel.Productcode
							     ";

						 		$result = mysqli_query($mylink, $sq);

						 		 ?>

									<table class="table">					 		 
								 <thead>
								  
								    <tr>
								      <th scope="col">Product</th>
								      <th scope="col">Productcode</th>
								      <th scope="col">Totaal</th>
								    </tr>
								  </thead>
								  <tbody>
  					<?php
								 while($row = mysqli_fetch_object($result))
							   { ?>
							   	<tr>     
      							<td><?php echo $row->Product; ?></td>
      							<td><?php echo  $row->Productcode; ?></td>
      							<td><?php echo  $row->Totaal; ?></td>

      							</tr>

      					<?php } ?>
      				</tbody>
      				</table>




			  </div>
			  
			</div>




<?php
include_once("footer.php"); 

?>



<!--------------------------------------------------------------------------------------------------------------------->

zoek.php


<?php
include_once("top.php"); 
include_once("header.php"); 
include_once("functions.php");


?>

<?php 
   ?>

    <div class="row" style="margin-top: 50px;">
    <div class="col-6 col-md-4">
    	
    	 <?php include_once("sidebar.php"); ?>

    </div>
  <div class="col-12 col-sm-6 col-md-8">

  	<form class="form-horizontal" role="form" action="zoek.php" method="GET">
        <input type="text" placeholder="zoek op Type of productnaam" name="query" />
        <input type="submit" value="Search" />
    </form>


<?php
if (isset($_GET['query'])) {
   $like = $_GET['query'];
    $show_searchs = search($like);
if (count($show_searchs)){ ?> 
<table class="table">
  <thead>
  
    <tr>
      
      <th scope="col">Product</th>
      <th scope="col">Type</th>
      <th scope="col">Locatiecode</th>
      <th scope="col">Aantal op voorraad</th>

    </tr>
  </thead>
  <tbody>
    <?php foreach ($show_searchs as $key => $list){ ?>
    <tr>     
      
      <td><?php echo $list['Product']; ?></td>
      <td><?php echo $list['Type']; ?></td>
      <td><?php echo $list['Locatiecode']; ?></td>
       <td><?php echo $list['Aantal']; ?></td>
      
    </tr>
 <?php  } ?> 
</table>
<?php }
    else{ ?> <p><b>Er zijn geen locatie toegevoegd!</b></p> 

    <?php } }?> 



    
  	
<!--
  	<form class="form-horizontal" role="form" method="POST" action=<?php echo DIR;?>zoeken-info.php>
            <div class="form-group">
                            <div class="col-md-6"> 
                    <input id="zoek" type="text" class="form-control" name="zoeken" required autofocus>
                            </div>
                        </div>
                    </form>


 
           <?php

			  $locatie_p = $_GET['locatie'];
			  	
						 // $sq = mysql_query("SELECT SUM('artikel.Inkoopprijs' * 'voorraad.Aantal' ) AS sum FROM  `voorraad` LEFT JOIN 'artikel'
						 // 	ON artikel.Productcode =voorraad.Productcode
							//  WHERE `Locatiecode` = '$locatie_p'")or die(mysql_error());

						 		$sq =mysql_query("SELECT artikel.Product,  artikel.Productcode , SUM(artikel.Inkoopprijs * voorraad.Aantal) AS Totaal

							    	FROM artikel

							     LEFT JOIN voorraad ON artikel.Productcode = voorraad.Productcode
							     WHERE voorraad.Locatiecode ='$locatie_p' 
							     GROUP BY artikel.Productcode
							     ")or die(mysql_error());

						 		 ?>

									<table class="table">					 		 
								 <thead>
								  
								    <tr>
								      <th scope="col">Product</th>
								      <th scope="col">Productcode</th>
								      <th scope="col">Totaal</th>
								    </tr>
								  </thead>
								  <tbody>
  					<?php
								 while($row = mysql_fetch_assoc($sq))
							   { ?>
							   	<tr>     
      							<td><?php echo $row['Product']; ?></td>
      							<td><?php echo  $row['Productcode']; ?></td>
      							<td><?php echo  $row['Totaal']; ?></td>

      							</tr>

      					<?php } ?>
      				</tbody>
      				</table>


 -->
  </div>
  
</div>




<?php
include_once("footer.php"); 

?>




