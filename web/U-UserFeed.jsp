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
            <div class="container-fluid"><button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvas-menu" aria-control="offcanvas-menu" style="background: rgb(0,0,0);border-color: rgb(0,0,0);font-family: 'Work Sans', sans-serif;color: rgb(255,255,255);">Open Menu</button><a class="navbar-brand d-flex align-items-center" href="#" style="margin-left: 10px;"><span class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon" style="background: #ffffff80;color: rgba(255,255,255,0.5);"><img src="assets/img/Logo.png" width="31" height="31"></span><span style="font-family: ABeeZee, sans-serif;">Terra</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-2"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navcol-2">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" style="font-family: ABeeZee, sans-serif;"><strong>Welcome (Username)</strong></a></li>
                    </ul><a class="btn ms-md-2" role="button" data-bss-hover-animate="pulse" href="U-HomeUser.jsp#contacts" style="background: var(--bs-navbar-active-color);font-family: ABeeZee, sans-serif;border-color: var(--bs-navbar-active-color);color: rgb(255,255,255);">Get in touch</a>
                </div>
            </div>
        </nav>
    </div>
    <div class="container" style="border-radius: 10px;background: #c0eead;margin-top: 10px;margin-bottom: 10px;">
    <h1 style="font-family: 'Work Sans', sans-serif;margin-top: 10px;">From Seeds to Harvest, Share Your Journey!</h1>
    <div class="card" style="background: #dfefd7;margin-bottom: 10px;">
        <div class="card-body">
            <h4 class="card-title" style="font-family: 'Work Sans', sans-serif;">Any planting tips to share?</h4>
            <!-- Modified form -->
            <form method="post" action="InsertFeedServlet" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="feedCaption" style="font-family: 'Work Sans', sans-serif;">Caption:</label>
                    <textarea class="form-control" name="feedCaption" id="feedCaption" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="feedPicture" style="font-family: 'Work Sans', sans-serif;">Upload Picture:</label>
                    <div class="input-group">
                        <input class="form-control-sm" type="file" name="feedPicture" id="feedPicture" accept="image/*" required>
                    </div>
                </div>
                <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-sm" style="background: rgb(0,0,0);border-color: var(--bs-emphasis-color);font-family: 'Work Sans', sans-serif;color: rgb(255,255,255);">Post</button>
                </div>
            </form>
        </div>
    </div>
</div>

    <div class="container" id="feed">
        
       <script>
    // Fetch plant data dynamically from the servlet
    fetch("FetchUserFeedServlet")
        .then(response => response.text())
        .then(data => {
            document.getElementById("feed").innerHTML = data;
        })
        .catch(error => console.error("Error fetching plant data:", error));
</script>
    </div>
    <div></div>
    <div class="offcanvas offcanvas-start bg-body" tabindex="-1" data-bs-backdrop="false" id="offcanvas-menu" aria-labelledby="offcanvasLabel">
        <div class="offcanvas-header"><a class="link-body-emphasis d-flex align-items-center me-md-auto mb-3 mb-md-0 text-decoration-none" href="U-HomeUser.jsp"><img src="assets/img/Logo.png" width="31" height="31"><span class="fs-4" style="font-family: 'Work Sans', sans-serif;margin-left: 10px;">Terra</span></a><button class="btn-close" type="button" aria-label="Close" data-bs-dismiss="offcanvas"></button></div>
        <div class="offcanvas-body d-flex flex-column justify-content-between pt-0">
            <div>
                <hr class="mt-0">
                <ul class="nav nav-pills flex-column mb-auto">
                    <li class="nav-item"><a class="nav-link active link-light" data-bss-hover-animate="pulse" href="U-HomeUser.jsp" aria-current="page" style="background: rgb(0,0,0);"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-house-door me-2">
                                <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4z"></path>
                            </svg> Home </a></li>
                    <li class="nav-item"><a class="nav-link link-body-emphasis" data-bss-hover-animate="pulse" href="U-EditProfile.jsp" style="margin-top: 10px;"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-person" style="font-size: 25px;margin-right: 5px;margin-bottom: 6px;">
                                <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664z"></path>
                            </svg>Profile</a></li>
                    <li class="nav-item"><a class="nav-link link-body-emphasis" data-bss-hover-animate="pulse" href="U-HowToTanam.html"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icon-tabler-plant" style="font-size: 24px;margin-right: 4px;">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M7 15h10v4a2 2 0 0 1 -2 2h-6a2 2 0 0 1 -2 -2v-4z"></path>
                                <path d="M12 9a6 6 0 0 0 -6 -6h-3v2a6 6 0 0 0 6 6h3"></path>
                                <path d="M12 11a6 6 0 0 1 6 -6h3v1a6 6 0 0 1 -6 6h-3"></path>
                                <path d="M12 15l0 -6"></path>
                            </svg>&nbsp;How To Tanam</a></li>
                </ul>
            </div>
        </div>
    </div>
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