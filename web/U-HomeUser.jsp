<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Terra</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Work+Sans:200,300,400,500,600,700&amp;display=swap">
    <link rel="stylesheet" href="assets/css/aos.min.css">
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
                    <li class="nav-item">
                        <a class="nav-link" data-bss-hover-animate="pulse" href="Cart.jsp" style="font-family: ABeeZee, sans-serif;"><strong>Start Planting!</strong></a>
                    </li>
                </ul>
                <a class="btn ms-md-2" role="button" data-bss-hover-animate="pulse" href="#contacts" style="background: var(--bs-navbar-active-color);font-family: ABeeZee, sans-serif;border-color: var(--bs-navbar-active-color);color: rgb(255,255,255);">Get in touch</a>
                <a class="btn ms-md-2" role="button" href="LogoutUserServlet" data-bss-hover-animate="pulse" style="background: #dc3545;font-family: ABeeZee, sans-serif;border-color: #dc3545;color: #ffffff;">Logout</a>
            </div>
        </div>
    </nav>
</div>
 
    <section style="margin-top: 20px;">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-5 d-flex flex-column align-items-start align-items-md-start">
                    <h1 class="display-1" data-aos="fade" data-aos-duration="700" data-aos-delay="150" style="font-family: 'Work Sans', sans-serif;text-align: left;">Growing a Greener Tomorrow, Together.</h1><a class="btn btn-lg flex-grow-1 flex-shrink-1" role="button" data-bss-hover-animate="pulse" style="background: var(--bs-emphasis-color);border-color: var(--bs-emphasis-color);font-family: 'Work Sans', sans-serif;margin-top: 10px;color: rgb(255,255,255);" href="U-UserFeed.jsp">Get Started!</a>
                </div>
                <div class="col d-flex d-xl-flex justify-content-xl-center"><img class="img-fluid" data-aos="fade" data-aos-duration="700" data-aos-delay="200" src="assets/img/Home.png" width="662" height="441" style="border-radius: 30px;margin-top: 10px;"></div>
            </div>
        </div>
    </section>
    <section style="margin-top: 10px;">
        <div class="container">
            <div class="card" style="border-radius: 30px;background: #c0eead;">
                <section style="margin-top: 10px;">
    <div class="container">
        <div class="row g-3" id="plantSection">
            <!-- Dynamic plant data will be loaded here -->
    </div>
</section>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Fetch plant data dynamically from the servlet
        fetch("GetPLantInfoServlet")
            .then(response => response.text())
            .then(data => {
                let plantSection = document.getElementById("plantSection");
                plantSection.innerHTML = data; // Inject the fetched HTML

                // Select all plant items and append a Buy button
                document.querySelectorAll(".plant-item").forEach(plant => {
                    let buyButton = document.createElement("button");
                    buyButton.textContent = "BUY";
                    buyButton.className = "btn btn-success mt-2"; // Bootstrap styling
                    buyButton.onclick = function() {
                        alert("Plant added to cart!"); // Replace with actual cart function
                    };

                    // Append the button inside the plant item container
                    plant.appendChild(buyButton);
                });
            })
            .catch(error => console.error("Error fetching plant data:", error));
    });
</script>



                </div>
            </div>
        </div>
    </section>
    
    <section>
        <section id="contacts" class="position-relative py-4 py-xl-5">
            <div class="container position-relative">
                <div class="row mb-5">
                    <div class="col-md-8 col-xl-6 text-center mx-auto">
                        <h2 style="font-family: 'Work Sans', sans-serif;">Contact us</h2>
                        <p class="w-lg-50" style="font-family: 'Work Sans', sans-serif;">Have questions, feedback, or ideas for our Community Farming Platform? Our team is here to help! Whether you?re a member looking for support, a visitor with inquiries, or someone interested in contributing to our mission, don?t hesitate to reach out.</p>
                    </div>
                </div>
                <div class="row d-flex justify-content-center">
                    <div class="col-md-6 col-lg-4 col-xl-4">
                        <div class="d-flex flex-column justify-content-center align-items-start h-100">
                            <div class="d-flex align-items-center p-3">
                                <div class="bs-icon-md bs-icon-rounded bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center d-inline-block bs-icon"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-telephone">
                                        <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"></path>
                                    </svg></div>
                                <div class="px-2">
                                    <h6 class="mb-0">Phone</h6>
                                    <p class="mb-0">+123456789</p>
                                </div>
                            </div>
                            <div class="d-flex align-items-center p-3">
                                <div class="bs-icon-md bs-icon-rounded bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center d-inline-block bs-icon"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-envelope">
                                        <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1zm13 2.383-4.708 2.825L15 11.105zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741M1 11.105l4.708-2.897L1 5.383z"></path>
                                    </svg></div>
                                <div class="px-2">
                                    <h6 class="mb-0">Email</h6>
                                    <p class="mb-0">info@example.com</p>
                                </div>
                            </div>
                            <div class="d-flex align-items-center p-3">
                                <div class="bs-icon-md bs-icon-rounded bs-icon-primary d-flex flex-shrink-0 justify-content-center align-items-center d-inline-block bs-icon"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-pin">
                                        <path d="M4.146.146A.5.5 0 0 1 4.5 0h7a.5.5 0 0 1 .5.5c0 .68-.342 1.174-.646 1.479-.126.125-.25.224-.354.298v4.431l.078.048c.203.127.476.314.751.555C12.36 7.775 13 8.527 13 9.5a.5.5 0 0 1-.5.5h-4v4.5c0 .276-.224 1.5-.5 1.5s-.5-1.224-.5-1.5V10h-4a.5.5 0 0 1-.5-.5c0-.973.64-1.725 1.17-2.189A5.921 5.921 0 0 1 5 6.708V2.277a2.77 2.77 0 0 1-.354-.298C4.342 1.674 4 1.179 4 .5a.5.5 0 0 1 .146-.354zm1.58 1.408-.002-.001.002.001m-.002-.001.002.001A.5.5 0 0 1 6 2v5a.5.5 0 0 1-.276.447h-.002l-.012.007-.054.03a4.922 4.922 0 0 0-.827.58c-.318.278-.585.596-.725.936h7.792c-.14-.34-.407-.658-.725-.936a4.915 4.915 0 0 0-.881-.61l-.012-.006h-.002A.5.5 0 0 1 10 7V2a.5.5 0 0 1 .295-.458 1.775 1.775 0 0 0 .351-.271c.08-.08.155-.17.214-.271H5.14c.06.1.133.191.214.271a1.78 1.78 0 0 0 .37.282"></path>
                                    </svg></div>
                                <div class="px-2">
                                    <h6 class="mb-0">Location</h6>
                                    <p class="mb-0">12 Example Street</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-5 col-xl-4">
                        <div>
                            <form class="p-3 p-xl-4" data-bss-recipient="1e1422c6c39faec8bbf780e4d9512969">
                                <div class="mb-3"><input class="form-control" type="text" id="name-1" name="name" placeholder="Name" required=""></div>
                                <div class="mb-3"><input class="form-control" type="email" id="email-1" name="email" placeholder="Email" required=""></div>
                                <div class="mb-3"><textarea class="form-control" id="message-1" name="message" rows="6" placeholder="Message" required=""></textarea></div>
                                <div><button class="btn d-block w-100" type="submit" style="background: var(--bs-emphasis-color);border-color: var(--bs-emphasis-color);font-family: 'Work Sans', sans-serif;color: rgb(255,255,255);">Send </button></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="text-center">
                <div class="container text-muted py-4 py-lg-5">
                    <p class="mb-0">Copyright � 2024 Terra</p>
                </div>
            </footer>
        </section>
    </section>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/aos.min.js"></script>
    <script src="assets/js/smart-forms.min.js"></script>
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