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
        <nav class="navbar navbar-expand-md bg-body py-3" style="border-radius: 19px;background: linear-gradient(white, #004429 0%), var(--bs-navbar-brand-color);">
            <div class="container-fluid">
                <a class="navbar-brand d-flex align-items-center" href="#" style="margin-left: 10px;">
                    <span class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon" style="background: var(--bs-body-bg);color: rgba(255,255,255,0.5);">
                        <img src="assets/img/Logo.png" width="31" height="31">
                    </span>
                    <span style="font-family: ABeeZee, sans-serif;color: var(--bs-body-bg);">Terra</span>
                </a>
                <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-2">
                    <span class="visually-hidden">Toggle navigation</span>
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navcol-2">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" href="N-Home.html" style="font-family: ABeeZee, sans-serif;color: var(--bs-body-bg);"><strong>Welcome (Username)</strong></a></li>
                        <li class="nav-item">
                            <!-- Logout Button -->
                            <a class="btn ms-md-2" role="button" href="LogoutUserServlet" data-bss-hover-animate="pulse" style="background: #dc3545;font-family: ABeeZee, sans-serif;border-color: #dc3545;color: #ffffff;">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <section style="margin-top: 15px;">
        <div class="container d-flex d-lg-flex flex-column justify-content-lg-center align-items-lg-center" style="background: #004328;border-radius: 10px;">
            <a class="btn ms-md-2" role="button" data-bss-hover-animate="pulse" href="A-ManageUser.jsp" style="background: #FFFF00;font-family: ABeeZee, sans-serif;border-color: var(--bs-navbar-active-color);color: var(--bs-navbar-active-color);margin-top: 10px;margin-bottom: 10px;">Manage User</a>
            <a class="btn ms-md-2" role="button" data-bss-hover-animate="pulse" href="A-ManagePlant.jsp" style="background: #FFFF00;font-family: ABeeZee, sans-serif;border-color: var(--bs-navbar-active-color);color: var(--bs-navbar-active-color);margin-top: 10px;margin-bottom: 10px;">Manage Plant</a>
            <a class="btn ms-md-2" role="button" data-bss-hover-animate="pulse" href="insertPlant.jsp" style="background: #FFFF00;font-family: ABeeZee, sans-serif;border-color: var(--bs-navbar-active-color);color: var(--bs-navbar-active-color);margin-top: 10px;margin-bottom: 10px;">Insert Plant</a>
               <a class="btn ms-md-2" role="button" data-bss-hover-animate="pulse" href="A-ManageOrder.jsp" style="background: #FFFF00;font-family: ABeeZee, sans-serif;border-color: var(--bs-navbar-active-color);color: var(--bs-navbar-active-color);margin-top: 10px;margin-bottom: 10px;">Manage Order</a>