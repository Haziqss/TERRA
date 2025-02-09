<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Terra</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Work+Sans:200,300,400,500,600,700&amp;display=swap">
    <link rel="stylesheet" href="assets/css/animate.min.css">
</head>

<body style="background: #F0FFFF;">
    <div class="container" style="margin-top: 10px;">
        <nav class="navbar navbar-expand-md bg-body py-3" style="border-radius: 19px; background: linear-gradient(white, #004429);">
            <div class="container-fluid">
                <a class="navbar-brand d-flex align-items-center" href="#" style="margin-left: 10px;">
                    <img src="assets/img/Logo.png" width="31" height="31" alt="Terra Logo">
                    <span style="font-family: ABeeZee, sans-serif; color: var(--bs-body-bg); margin-left: 10px;">Terra</span>
                </a>
                <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navcol-2">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navcol-2">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" href="U-LogIn.html" style="font-family: ABeeZee, sans-serif; color: var(--bs-body-bg);">Member</a></li>
                        <li class="nav-item"><a class="nav-link" href="N-Home.html" style="font-family: ABeeZee, sans-serif; color: var(--bs-body-bg);">Home</a></li>
                    </ul>
                    <a class="btn ms-md-2" href="N-Home.html#contacts" style="background: #FFFF00; font-family: ABeeZee, sans-serif; color: #000;">Get in Touch</a>
                </div>
            </div>
        </nav>
    </div>

    <section class="position-relative py-4 py-xl-5">
        <div class="container" style="border-radius: 20px; background: #004429;">
            <div class="row">
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <h2 class="pulse animated" style="font-family: 'Work Sans', sans-serif; color: #FFF;">Administrator Access</h2>
                    <p class="w-lg-50" style="font-family: 'Work Sans', sans-serif; color: #FFF;">
                        Welcome, Admin! Please log in to access the management tools and resources that help keep our community thriving. From overseeing user contributions to updating plant information and managing system settings, your role is essential to our success.
                    </p>
                </div>
            </div>
            <div class="row d-flex justify-content-center">
                <div class="col-md-6 col-xl-4" style="background: #00FF7F; border-radius: 10px; margin-bottom: 10px;">
                    <div class="card" style="background: #F0FFFF; border-radius: 10px; margin-top: 10px; margin-bottom: 10px;">
                        <div class="card-body">
                            <div class="text-center">
                                <div class="bs-icon-xl bs-icon-circle bs-icon-primary my-4" style="background: #FFFF00;">
                                    <i class="fas fa-user" style="color: #000;"></i>
                                </div>
                            </div>
                            <!-- Login Form -->
                            <form action="AdminLoginServlet" method="post">
                                <div class="mb-3">
                                    <label for="id" class="form-label">Admin ID</label>
                                    <input type="text" class="form-control" name="id" id="id" placeholder="Enter Admin ID" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password" required>
                                </div>
                                <div class="mb-3">
                                    <button type="submit" class="btn btn-primary w-100" style="background: #FFFF00; color: #000;">Login</button>
                                </div>
                                <%-- Error Message Display --%>
                                <div class="text-danger text-center">
                                    <% 
                                        String errorMessage = (String) request.getAttribute("errorMessage");
                                        if (errorMessage != null) { 
                                    %>
                                        <p><%= errorMessage %></p>
                                    <% } %>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="text-center">
        <div class="container text-muted py-4 py-lg-5">
            <p class="mb-0">Copyright © 2024 Terra</p>
        </div>
    </footer>

    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
</body>

</html>
