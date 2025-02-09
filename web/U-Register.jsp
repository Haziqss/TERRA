<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Terra</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Work+Sans:200,300,400,500,600,700&amp;display=swap">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/Articles-Cards-images.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.2/css/theme.bootstrap_4.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
    <link rel="stylesheet" href="assets/css/Ludens---Dark-Mode-Admin-Dashboard.css">
    <link rel="stylesheet" href="assets/css/Navbar-Right-Links-icons.css">
    <link rel="stylesheet" href="assets/css/Sidebar-Menu-sidebar.css">
    <link rel="stylesheet" href="assets/css/Sidebar-Menu.css">
</head>

<body style="background: #F0FFFF;">
    <div class="container" style="margin-top: 10px;">
        <nav class="navbar navbar-expand-md bg-body py-3" style="border-radius: 19px;background: linear-gradient(white, #dff0d8 0%), var(--bs-navbar-brand-color);">
            <div class="container-fluid"><a class="navbar-brand d-flex align-items-center" href="#" style="margin-left: 10px;"><span class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon" style="background: #ffffff80;color: rgba(255,255,255,0.5);"><img src="assets/img/Logo.png" width="31" height="31"></span><span style="font-family: ABeeZee, sans-serif;">Terra</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-2"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navcol-2">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="A-AdminLogIn.html" style="font-family: ABeeZee, sans-serif;"><strong>Admin</strong></a></li>
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="N-Home.html" style="font-family: ABeeZee, sans-serif;"><strong>Home</strong></a></li>
                    </ul><a class="btn ms-md-2" role="button" data-bss-hover-animate="pulse" href="N-Home.html#contacts" style="background: var(--bs-navbar-active-color);font-family: ABeeZee, sans-serif;border-color: var(--bs-navbar-active-color);color: rgb(255,255,255);">Get in touch</a>
                </div>
            </div>
        </nav>
    </div>
    <section class="register mt-5">
        <div class="container">
            <div class="row d-flex d-xl-flex flex-column justify-content-center justify-content-xl-center align-items-xl-center" style="background: #e0e0e0;border-radius: 15px;">
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <h2 class="pulse animated" style="font-family: 'Work Sans', sans-serif;color: var(--bs-emphasis-color);margin-top: 10px;">Join Our Community Today!</h2>
                    <p class="w-lg-50" style="font-family: 'Work Sans', sans-serif;color: var(--bs-emphasis-color);">Ready to be a part of a thriving community that cares about sustainable farming and healthy living? Register now to start your journey in building a greener and more connected world.&nbsp;</p>
                </div>
                <div class="col bg-white shadow-lg" style="border-radius: 20px;background: linear-gradient(black, #c0eead 0%), #c0eead;margin-top: 10px;margin-bottom: 10px;">
                    <div class="p-5" style="background: #dfefd7;border-radius: 15px;margin-top: 10px;margin-bottom: 10px;">
                        <div class="text-center">
                            <h4 class="text-dark mb-4" style="font-family: 'Work Sans', sans-serif;">Create an Account!</h4>
                        </div>
                       <form class="user" action="RegisterUserServlet" method="POST">
                        <div class="mb-3">
                            <input class="form-control form-control-user" name="username" type="text" placeholder="Username" required="">
                        </div>
                        <div class="mb-3">
                            <input class="form-control form-control-user" name="email" type="email" placeholder="Email Address" required="">
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <input class="form-control form-control-user" name="password" type="password" placeholder="Password" required="">
                            </div>
                            <div class="col-sm-6">
                                <input class="form-control form-control-user" name="confirmPassword" type="password" placeholder="Repeat Password" required="">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <input class="form-control form-control-user" name="firstName" type="text" placeholder="First Name" required="">
                            </div>
                            <div class="col-sm-6">
                                <input class="form-control form-control-user" name="lastName" type="text" placeholder="Last Name" required="">
                            </div>
                        </div>
                        <div class="mb-3">
                            <input class="form-control form-control-user" name="phoneNumber" type="text" placeholder="Phone Number" required="">
                        </div>
                        <button class="btn btn-primary w-100" type="submit">Register Account</button>
                    </form>

                        <div class="text-center"></div>
                        <div class="text-center"><a class="small" href="U-LogIn.html" style="color: rgb(81,95,110);">Already have an account? Login!</a></div>
                    </div>
                </div>
            </div><script>
	let email = document.getElementById("email")
	let password = document.getElementById("password")
	let verifyPassword = document.getElementById("verifyPassword")
	let submitBtn = document.getElementById("submitBtn")
	let emailErrorMsg = document.getElementById('emailErrorMsg')
	let passwordErrorMsg = document.getElementById('passwordErrorMsg')

	function displayErrorMsg(type, msg) {
		if(type == "email") {
			emailErrorMsg.style.display = "block"
			emailErrorMsg.innerHTML = msg
			submitBtn.disabled = true
		}
		else {
			passwordErrorMsg.style.display = "block"
			passwordErrorMsg.innerHTML = msg
			submitBtn.disabled = true
		}
	}

	function hideErrorMsg(type) {
		if(type == "email") {
			emailErrorMsg.style.display = "none"
			emailErrorMsg.innerHTML = ""
			submitBtn.disabled = true
			if(passwordErrorMsg.innerHTML == "")
				submitBtn.disabled = false
		}
		else {
			passwordErrorMsg.style.display = "none"
			passwordErrorMsg.innerHTML = ""
			if(emailErrorMsg.innerHTML == "")
				submitBtn.disabled = false
		}
	}
	
	// Validate password upon change
	password.addEventListener("change", function() {

		// If password has no value, then it won't be changed and no error will be displayed
		if(password.value.length == 0 && verifyPassword.value.length == 0) hideErrorMsg("password")
		
		// If password has a value, then it will be checked. In this case the passwords don't match
		else if(password.value !== verifyPassword.value) displayErrorMsg("password", "Passwords do not match")
		
		// When the passwords match, we check the length
		else {
			// Check if the password has 8 characters or more
			if(password.value.length >= 8)
				hideErrorMsg("password")
			else
				displayErrorMsg("password", "Password must be at least 8 characters long")
		}
	})
	
	verifyPassword.addEventListener("change", function() {
		if(password.value !== verifyPassword.value)
			displayErrorMsg("password", "Passwords do not match")
		else {
			// Check if the password has 8 characters or more
			if(password.value.length >= 8)
				hideErrorMsg("password")
			else
				displayErrorMsg("password", "Password must be at least 8 characters long")
		}
	})

	// Validate email upon change
	email.addEventListener("change", function() {
		// Check if the email is valid using a regular expression (string@string.string)
		if(email.value.match(/^[^@]+@[^@]+\.[^@]+$/))
			hideErrorMsg("email")
		else
			displayErrorMsg("email", "Invalid email")
	});
</script>
        </div>
    </section>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="assets/js/buySeeds.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.2/js/jquery.tablesorter.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.2/js/widgets/widget-filter.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.31.2/js/widgets/widget-storage.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="assets/js/imageUpload.js"></script>
    <script src="assets/js/Ludens---Dark-Mode-Admin-Dashboard-Ludens---1-Index-Table-with-Search--Sort-Filters-v20-1.js"></script>
    <script src="assets/js/Ludens---Dark-Mode-Admin-Dashboard-Ludens---1-Index-Table-with-Search--Sort-Filters-v20.js"></script>
    <script src="assets/js/Ludens---Dark-Mode-Admin-Dashboard-Ludens---Sleek-Image-Input-with-Preview.js"></script>
    <script src="assets/js/Ludens---Dark-Mode-Admin-Dashboard-main.js"></script>
    <script src="assets/js/Ludens---Dark-Mode-Admin-Dashboard-modalDelete.js"></script>
    <script src="assets/js/Ludens---Dark-Mode-Admin-Dashboard-theme.js"></script>
    <script src="assets/js/Sidebar-Menu-sidebar.js"></script>
    <script src="assets/js/tableInput.js"></script>
</body>

</html>