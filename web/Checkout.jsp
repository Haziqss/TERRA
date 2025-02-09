<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Terra - Plant Details</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
</head>

<body style="background: #F0FFFF;">
    <div class="container" style="margin-top: 10px;">
        <nav class="navbar navbar-expand-md bg-body py-3" style="border-radius: 19px;background: linear-gradient(white, #dff0d8 0%), var(--bs-navbar-brand-color);">
            <div class="container-fluid">
                <a class="navbar-brand d-flex align-items-center" href="#" style="margin-left: 10px;">
                    <span class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon" style="background: #ffffff80;color: rgba(255,255,255,0.5);">
                        <img src="assets/img/Logo.png" width="31" height="31">
                    </span>
                    <span style="font-family: ABeeZee, sans-serif;">Terra</span>
                </a>
                <button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-2">
                    <span class="visually-hidden">Toggle navigation</span>
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navcol-2">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" data-bss-hover-animate="pulse" style="font-family: ABeeZee, sans-serif;"><strong>Welcome (Username)</strong></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bss-hover-animate="pulse" href="U-HowToTanam.html" style="font-family: ABeeZee, sans-serif;"><strong>How To Tanam</strong></a>
                        </li>
                    </ul>
                    <a class="btn ms-md-2" role="button" href="LogoutUserServlet" data-bss-hover-animate="pulse" style="background: #dc3545;font-family: ABeeZee, sans-serif;border-color: #dc3545;color: #ffffff;">Logout</a>
                </div>
            </div>
        </nav>
    </div>
 
    <div class="container" style="margin-top: 10px;">
    <div class="row g-3" style="margin-bottom: 20px">
        <h2>Plant Details</h2>
        <div class="card p-4 shadow-sm">
            <p><strong>Name:</strong> ${param.plantName}</p>
            <p><strong>Description:</strong> ${param.plantDescription}</p>
            <p><strong>Type:</strong> ${param.plantType}</p>
            <p><strong>Image:</strong></p>
            <img src="${param.plantPicture}" alt="Current Image" class="img-fluid" style="max-width: 200px; margin-top: 10px; border-radius: 10px;" />
        </div>
        <div class="card p-4 shadow-sm">
            <h1 class="display-5 d-flex justify-content-left" style="font-family: 'Work Sans', sans-serif;">Payment</h1><img class="img-fluid d-flex d-lg-flex" data-aos="fade" data-aos-duration="700" data-aos-delay="200" data-aos-once="true" src="assets/img/QR.jpg" style="border-radius: 30px;margin-top: 10px;" width="300" height="247">
            <p><strong>Account Number</strong>1234 1234 1234 1234(MAYBANK)</p>
            <div class="display-5 d-flex">
            <a class="btn btn-primary mt-3" href="Receipt.jsp">Upload Receipt</a>
            </div>
        </div>     
    </div>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
