<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
        <link rel="stylesheet" href="css/home.css" type="text/css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<title>Hello, world!</title>
	</head>
	<body class="">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark pl-3 pr-3">
			<a class="navbar-brand" href="./index.html">Space</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item active">
						<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
					</li>
				</ul>
			</div>
		</nav>
		<section class="text-center mb-4">
            <!-- Background image -->
            <div class="p-5 bg-image" style="background-image: url('https://mdbootstrap.com/img/new/textures/full/171.jpg');height: 200px;"></div>
            <!-- Background image -->
            
            <div class="card mx-4 mx-md-5 shadow-5-strong" style="margin-top: -100px;background: hsla(0, 0%, 100%, 0.8);backdrop-filter: blur(30px);">
                <div class="card-body py-5 px-md-5">
                
                    <div class="row d-flex justify-content-center">
                        <div class="col-lg-7">
                            <h2 class="fw-bold mb-5">Sign up now</h2>
                            <form class="needs-validation" novalidate action="RegisterServlet" method="post">
                            <!-- 2 column grid layout with text inputs for the first and last names -->
                                <div class="row">
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline text-left">
                                            <label class="form-label" for="FirstName">First name</label>
                                            <input type="text" id="FisrstName" class="form-control" name="userFirstName" required/>
                                            <div class="valid-feedback">Nice! You got this one!</div>
                                            <div class="invalid-feedback">Name can't be numeric.</div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline text-left">
                                            <label class="form-label" for="LastName">Last name</label>
                                            <input type="text" id="LastName" class="form-control" name="userLastName" required/>
                                            <div class="valid-feedback">Nice! You got this one!</div>
                                            <div class="invalid-feedback">Name can't be numeric.</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-outline mb-4 text-left">
                                    <label class="form-label" for="Email">Email address</label>
                                    <input type="email" id="Email" class="form-control" name="userEmail" required/>
                                    <div class="valid-feedback">Nice! You got this one!</div>
                                    <div class="invalid-feedback">Invalid email.</div>
                                </div>
                                
                                <!-- Password input -->
                                <div class="form-outline mb-4 text-left">
                                    <label class="form-label" for="Password">Password</label>
                                    <input type="password" name="userPassword" id="Password" class="form-control" required pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$" autocomplete="no"/>
                                    <div class="valid-feedback">Nice! You got this one!</div>
                                    <div class="invalid-feedback">At least 6 chars: 1 uppercase, 1 lowercase and numeric</div>
                                </div>
                                
                                <!-- Checkbox -->
                                <div class="form-check d-flex justify-content-left mb-4">
                                    <input class="form-check-input me-2" type="checkbox" value="" id="Subscribe" name="subscribe" checked />
                                    <label class="form-check-label" for="Subscribe">Subscribe to our newsletter</label>
                                </div>
    
                                <button type="submit" class="btn btn-primary btn-block mb-4">Sign up</button>
 
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
			
	    
	</body>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="js/script.js"></script>
	<script>
            
        (function() {
            'use strict';
            window.addEventListener('load', function() {
            // fetch all the forms we want to apply custom style
            var inputs = document.getElementsByClassName('form-control')
        
            // loop over each input and watch blue event
            var validation = Array.prototype.filter.call(inputs, function(input) {
                
                input.addEventListener('blur', function(event) {
                // reset
                input.classList.remove('is-invalid')
                input.classList.remove('is-valid')
                
                if (input.checkValidity() === false) {
                    input.classList.add('is-invalid')
                }
                else {
                    input.classList.add('is-valid')
                }
                }, false);
            });
            }, false);
        })()
    </script>
</html>