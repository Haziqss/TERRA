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
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="A-AdminLogin.jsp" style="font-family: ABeeZee, sans-serif;"><strong>Admin</strong></a></li>
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="N-Home.html" style="font-family: ABeeZee, sans-serif;"><strong>Home</strong></a></li>
                    </ul><a class="btn ms-md-2" role="button" data-bss-hover-animate="pulse" href="N-Home.html#contacts" style="background: var(--bs-navbar-active-color);font-family: ABeeZee, sans-serif;border-color: var(--bs-navbar-active-color);color: rgb(255,255,255);">Get in touch</a>
                </div>
            </div>
        </nav>
    </div>

    <section class="position-relative py-4 py-xl-5">
        <div class="container" style="border-radius: 20px;background: #e0e0e0;">
            <div class="row">
                <div class="col-md-8 col-xl-6 text-center mx-auto">
                    <h2 class="pulse animated" style="font-family: 'Work Sans', sans-serif;color: var(--bs-emphasis-color);">Welcome back to Terra!</h2>
                    <p class="w-lg-50" style="font-family: 'Work Sans', sans-serif;color: var(--bs-emphasis-color);">Join us as we grow together towards a healthier and greener future. By logging in, you?ll gain access to our resources, planting guides, community updates, and collaboration tools that make farming more accessible and enjoyable. Let?s continue to cultivate our shared spaces and make an impact on our environment. Happy growing!</p>
                </div>
            </div>
            <div class="row d-flex flex-column justify-content-center align-items-center align-items-sm-center align-items-lg-center align-items-xl-center">
                <div class="col-md-6 col-xl-4" style="background: #c0eead;border-radius: 10px;margin-bottom: 10px;">
                    <div class="card" style="background: #dfefd7;border-radius: 10px;margin-top: 10px;margin-bottom: 10px;">
                        <div class="card-body d-flex flex-column align-items-center">
                            <div class="bs-icon-xl bs-icon-circle bs-icon-primary bs-icon my-4" style="background: var(--bs-emphasis-color);"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-person" style="color: var(--bs-body-bg);">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664z"></path>
                                </svg></div>
                            <!-- Modify form action to point to the login servlet -->
                            <form class="text-center" action="LoginUserServlet" method="post">
                                <div class="mb-3"><input class="form-control" type="email" name="email" placeholder="Email" required=""></div>
                                <div class="mb-3"><input class="form-control" type="password" name="password" placeholder="Password" required=""></div>
                                <div class="mb-3"><button class="btn d-block w-100" data-bss-hover-animate="pulse" type="submit" style="background: var(--bs-emphasis-color);color: rgb(255,255,255);font-family: 'Work Sans', sans-serif;border-color: #000000;">Login</button></div>
                                <p class="text-muted d-flex flex-column" style="font-family: 'Work Sans', sans-serif;">New to Terra?<a href="U-Register.jsp" style="color: #515f6e;font-family: 'Work Sans', sans-serif;">Sign up here!</a></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
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
