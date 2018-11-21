<!DOCTYPE HTML>
<!--
    #####################################
	 __   __   __  ______  ____ ______ 
	|  | |  | |  |   |    |        |
	|__| |__| |  |   |    | __     |
	|    |\   |  |   |    |        |
	|    | \  |__| __|    |____    |  
	
     __      ___   __              ____ 
	|  | |  |     |    |  |\   |  |        
	|__| |  |___  |    |  | \  |  |__     
	|    |      | |    |  |  \ |  |       
	|    |   ___| |__  |  |   \|  |____    
	
	#####################################
-->
<html>
	<head>
		<title>Connection Client</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">
		<div id="page-wrapper">
			<form method="post">
			<!-- Header -->
				<div id="header">

					<!-- Logo -->
						<h1><a href="index.html" id="logo">"LOGO + Nom du site"</a></h1>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li class="current"><a href="index.html">Accueil</a></li>
								<li><a href="#">F.A.Q</a></li>
							</ul>
						</nav>
				</div>

			</br>
			<h5 class="content-group">
				<small class="display-block">Entrez vos identifiants ci-dessous</small> 
			</h5> 
			<fieldset class="fieldset ">
				<div class="form-group input-text-wrapper"> 
				<label class="control-label" > Identifiant </label> 
				<div class="input-group"> 
					<span class="input-group-addon">
						<i class="fa fa-user"></i>
					</span> 
					<input class="field clearable form-control"type="text" value="" name="mail" id="mail" required/> 
				</div> 
				<div class="form-group input-text-wrapper"> 
					<label class="control-label" > Mot de passe </label> 
					<div class="input-group"> 
						<span class="input-group-addon">
							<i class="fa fa-key"></i>
						</span> 
						<input class="field form-control" type="password" value="" name="mdp" id="mdp" required/> 
					</div> 
				</div></br>
				<div class="form-group input-text-wrapper"> 
					<a href="InscriptionClient.php">
						<label class="control-label" > Pas encore inscrit ? </label> 
					</a>
				</div> 
			</fieldset> 
			</br>
			<div class="button-holder "> 
				<input type="submit" value="Ouvrir une session" name="formsend" id="formsend" />
			</div>
			
			<?php
				include 'database.php';
				global $db;
				$test_id=0;
				$test_mdp=0;
				if(isset($_POST['formsend'])){
					extract($_POST);
					
					$q = $db->query("SELECT *FROM client");
					while ($user = $q->fetch()){
						if ($user['AdresseMail_Client'] == $mail){
							$test_id=1;
						}
						if (password_verify($mdp, $user['MDPCrypte_Client'])) {
							$test_mdp=1;
						}
					}
					
					if ($test_mdp == 1 && $test_id ==1){
						header('Location: index.html');
						exit();
					}
					else{ echo "Identifiant ou Mdp incorrect";}
					
				}
			?>
			</form>
			<!-- Footer -->
				<div id="footer">

					<!-- Icons -->
						<ul class="icons">
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
						</ul>


				</div>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>