<?php
include 'database.php';
global $db;
if(isset($_POST['formsend'])){
	extract($_POST);
	$options = [
	'cost' => 12,
	];
	$pass = password_hash($mdp, PASSWORD_BCRYPT, $options);
	$q = $db->prepare("INSERT INTO commercant(Nom_Commercant,Prenom_Commercant,AdresseMail_Commercant,NumTel_Commercant,MDPCrypte_Commercant,NumRue_Commercant,NomRue_Commercant,Ville_Commercant,CodePostal_Commercant) VALUES(:Nom_Commercant,:Prenom_Commercant,:AdresseMail_Commercant,:NumTel_Commercant,:MDPCrypte_Commercant,:NumRue_Commercant,:NomRue_Commercant,:Ville_Commercant,:CodePostal_Commercant)");
	$q->execute([
		'Nom_Commercant' => $lastname,
		'Prenom_Commercant' => $name,
		'AdresseMail_Commercant' => $mail,
		'NumTel_Commercant' => $tel,
		'MDPCrypte_Commercant' => $pass,
		'NumRue_Commercant' => $numrue,
		'NomRue_Commercant' => $rue,
		'Ville_Commercant' => $ville,
		'CodePostal_Commercant' => $codepostale
	]);
	header('Location: connectcommercant.php');
	exit();
	}
?>




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
		<title>Inscription Commercant</title>
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
				<small class="display-block">Entrez les informations suivantes:</small> 
			</h5> 
			<fieldset class="fieldset ">
				<div class="form-group input-text-wrapper"> 
				<label class="control-label" > Nom </label> 
				<div class="input-group"> 
					<span class="input-group-addon">
						<i class="fa fa-user"></i>
					</span> 
					<input class="field clearable form-control"type="text" value="" name="lastname" id="lastname" required/> 
				</div>
				<div class="form-group input-text-wrapper"> 
					<label class="control-label" > Prenom </label> 
					<div class="input-group"> 
						<span class="input-group-addon">
							<i class="fa fa-key"></i>
						</span> 
						<input class="field form-control" type="text" value="" name="name" id="name" required/> 
					</div>
				</div>
				<div class="form-group input-text-wrapper"> 
					<label class="control-label" > Ville magasin </label> 
					<div class="input-group"> 
						<span class="input-group-addon">
							<i class="fa fa-key"></i>
						</span> 
						<input class="field form-control" type="text" value="" name="ville" id="ville" required/> 
					</div>
				</div> 
				<div class="form-group input-text-wrapper"> 
					<label class="control-label" > Rue du magasin </label> 
					<div class="input-group"> 
						<span class="input-group-addon">
							<i class="fa fa-key"></i>
						</span> 
						<input class="field form-control" type="text" value="" name="rue" id="rue" required/> 
					</div>
				</div> 
				<div class="form-group input-text-wrapper"> 
					<label class="control-label" > Numero de Rue </label> 
					<div class="input-group"> 
						<span class="input-group-addon">
							<i class="fa fa-key"></i>
						</span> 
						<input class="field form-control" type="text" value="" name="numrue" id="numrue" > 
					</div>
				</div>
				<div class="form-group input-text-wrapper"> 
					<label class="control-label" > Code postale </label> 
					<div class="input-group"> 
						<span class="input-group-addon">
							<i class="fa fa-key"></i>
						</span> 
						<input class="field form-control" type="text" value="" name="codepostale" id="codepostale" > 
					</div>
				</div> 
				<div class="form-group input-text-wrapper"> 
					<label class="control-label" > Téléphone </label>
					<div class="input-group"> 
						<span class="input-group-addon">
							<i class="fa fa-key"></i>
						</span> 
						<input class="field form-control" type="text" value="" name="tel" id="tel" required/> 
					</div> 
				</div>
				<div class="form-group input-text-wrapper"> 
					<label class="control-label" > Mail </label> 
					<div class="input-group"> 
						<span class="input-group-addon">
							<i class="fa fa-key"></i>
						</span> 
						<input class="field form-control" type="text" value="" name="mail" id="mail" required/> 
					</div> 
				</div>
				<div class="form-group input-text-wrapper">
					<label class="control-label" > Mot de Passe </label> 
					<div class="input-group"> 
						<span class="input-group-addon">
							<i class="fa fa-key"></i>
						</span> 
						<input class="field form-control" type="password" value="" name="mdp" id="mdp" required/> 
					</div> 
				</div>
			</br>
			<div class="button-holder "> 
					<input type="submit" value="S'inscrire" name="formsend" id="formsend" />
			</div> 
			</fieldset>
			
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