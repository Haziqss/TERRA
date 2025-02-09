<%@page import="java.sql.*" %>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%
    // Database connection details
    String url = "jdbc:derby://localhost:1527/terraDB";
    String user = "haziq";
    String password = "haziq";

    // Fetch the logged-in user's ID from the session
    
    Integer memberId = (Integer) session.getAttribute("member_id");

    if (memberId == null) {
        response.sendRedirect("U-LogIn.jsp?error=sessionExpired");
        return;
    }

    // Declare variables to hold user data
    String username = null;
    String email = null;
    String firstName = null;
    String lastName = null;
    String phoneNumber = null;

    try {
        // Establish database connection
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection conn = DriverManager.getConnection(url, user, password);

        // Fetch user details from the database
        String sql = "SELECT username, email, firstName, lastName, phoneNumber FROM member WHERE member_id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, memberId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            username = rs.getString("username");
            email = rs.getString("email");
            firstName = rs.getString("firstName");
            lastName = rs.getString("lastName");
            phoneNumber = rs.getString("phoneNumber");
        }

        rs.close();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("U-LogIn.jsp?error=serverError");
        return;
    }
%>


<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Terra</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Work+Sans:200,300,400,500,600,700&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
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
            <div class="container-fluid"><button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvas-menu" aria-control="offcanvas-menu" style="background: rgb(0,0,0);border-color: rgb(0,0,0);font-family: 'Work Sans', sans-serif;color: var(--bs-secondary-bg);">Open Menu</button><a class="navbar-brand d-flex align-items-center" href="#" style="margin-left: 10px;"><span class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon" style="background: #ffffff80;color: rgba(255,255,255,0.5);"><img src="assets/img/Logo.png" width="31" height="31"></span><span style="font-family: ABeeZee, sans-serif;">Terra</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-2"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navcol-2">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse" style="font-family: ABeeZee, sans-serif;"><strong>Welcome (Username)</strong></a></li>
                    </ul><a class="btn ms-md-2" role="button" data-bss-hover-animate="pulse" href="U-HomeUser.jsp#contacts" style="background: var(--bs-navbar-active-color);font-family: ABeeZee, sans-serif;border-color: var(--bs-navbar-active-color);color: var(--bs-secondary-bg);">Get in touch</a>
                </div>
            </div>
        </nav>
    </div>
    <section>
        <div class="d-flex d-xl-flex justify-content-start align-items-end align-items-sm-end justify-content-xl-start" data-bss-parallax-bg="true" style="height: 500px;background-image: url(&quot;assets/img/profileEdit.png&quot;);background-position: center;background-size: cover;">
            <h1 class="display-4 d-flex d-xl-flex" style="font-family: 'Work Sans', sans-serif;padding-top: 4px;background: var(--bs-emphasis-color);padding-bottom: 0px;color: var(--bs-body-bg);padding-left: 15px;margin-left: 28px;padding-right: 15px;"><strong>Profile</strong></h1>
        </div>
    </section>
    <section class="d-flex d-lg-flex d-xxl-flex justify-content-sm-center align-items-sm-center justify-content-lg-center align-items-lg-center justify-content-xxl-center align-items-xxl-center">
        <div class="container" style="background: #e0e0e0;border-radius: 10px;margin-top: 15px;">
            <div id="wrapper" style="padding-left: 0px;margin-top: 10px;">
                <div class="d-flex flex-column" id="content-wrapper">
                    <div id="content">
                        <div class="container-fluid" style="width: 100%;padding-right: 0px;padding-left: 0px;border-radius: 10px;background: #c0eead;">
                            <div class="row d-flex flex-column mb-3" style="margin-right: 0px;margin-left: 0px;">
                                <div class="col-lg-12 col-xl-12">
                                    <div class="row mb-3 d-none">
                                        <div class="col">
                                            <div class="card text-white bg-primary shadow">
                                                <div class="card-body">
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <p class="m-0">Peformance</p>
                                                            <p class="m-0"><strong>65.2%</strong></p>
                                                        </div>
                                                        <div class="col-auto"><i class="fas fa-rocket fa-2x"></i></div>
                                                    </div>
                                                    <p class="text-white-50 small m-0"><i class="fas fa-arrow-up"></i>&nbsp;5% since last month</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="card text-white bg-success shadow">
                                                <div class="card-body">
                                                    <div class="row mb-2">
                                                        <div class="col">
                                                            <p class="m-0">Peformance</p>
                                                            <p class="m-0"><strong>65.2%</strong></p>
                                                        </div>
                                                        <div class="col-auto"><i class="fas fa-rocket fa-2x"></i></div>
                                                    </div>
                                                    <p class="text-white-50 small m-0"><i class="fas fa-arrow-up"></i>&nbsp;5% since last month</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-12" style="padding-right: 0px;padding-left: 0px;">
                                            <div class="card shadow mb-3" style="background: #dfefd7;">
                                                <div class="card-header py-3">
                                                    <p class="fs-5" style="color: var(--bs-emphasis-color);"><strong>User Settings</strong></p>
                                                </div>
                                                <div class="card-body" style="padding-top: 0px;">
                                             <form method="post" action="UpdateUserProfileServlet">
                                                        <input type="hidden" name="member_id" value="<%= memberId %>">

                                                        <div class="mb-3">
                                                            <label for="username">Username:</label>
                                                            <input type="text" name="username" value="<%= username %>" class="form-control" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="email">Email:</label>
                                                            <input type="email" name="email" value="<%= email %>" class="form-control" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="firstName">First Name:</label>
                                                            <input type="text" name="firstName" value="<%= firstName %>" class="form-control" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="lastName">Last Name:</label>
                                                            <input type="text" name="lastName" value="<%= lastName %>" class="form-control" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="phoneNumber">Phone Number:</label>
                                                            <input type="text" name="phoneNumber" value="<%= phoneNumber %>" class="form-control" required>
                                                        </div>
                                                        <button type="submit" class="btn btn-primary">Save</button>
                                                    </form>




                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="offcanvas offcanvas-start bg-body" tabindex="-1" data-bs-backdrop="false" id="offcanvas-menu" aria-labelledby="offcanvasLabel">
        <div class="offcanvas-header"><a class="link-body-emphasis d-flex align-items-center me-md-auto mb-3 mb-md-0 text-decoration-none" href="U-HomeUser.jsp"><img src="assets/img/Logo.png" width="31" height="31"><span class="fs-4" style="font-family: 'Work Sans', sans-serif;margin-left: 10px;">Terra</span></a><button class="btn-close" type="button" aria-label="Close" data-bs-dismiss="offcanvas"></button></div>
        <div class="offcanvas-body d-flex flex-column justify-content-between pt-0">
            <div>
                <hr class="mt-0">
                <ul class="nav nav-pills flex-column mb-auto">
                    <li class="nav-item"><a class="nav-link active link-light" data-bss-hover-animate="pulse" href="U-HomeUser.jsp" aria-current="page" style="background: rgb(0,0,0);"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-house-door me-2">
                                <path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4z"></path>
                            </svg> Home </a></li>
                    <li class="nav-item"><a class="nav-link link-body-emphasis" data-bss-hover-animate="pulse" href="U-UserFeed.jsp" style="margin-top: 10px;"><img src="assets/img/feed.png" width="21" height="21" style="padding-bottom: 0px;margin-bottom: 5px;margin-right: 5px;">&nbsp;User Feed</a></li>
                    <li class="nav-item"><a class="nav-link link-body-emphasis" data-bss-hover-animate="pulse" href="U-HowToTanam.html"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round" class="icon icon-tabler icon-tabler-plant" style="font-size: 24px;margin-right: 4px;">
                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                <path d="M7 15h10v4a2 2 0 0 1 -2 2h-6a2 2 0 0 1 -2 -2v-4z"></path>
                                <path d="M12 9a6 6 0 0 0 -6 -6h-3v2a6 6 0 0 0 6 6h3"></path>
                                <path d="M12 11a6 6 0 0 1 6 -6h3v1a6 6 0 0 1 -6 6h-3"></path>
                                <path d="M12 15l0 -6"></path>
                            </svg>&nbsp;How To Tanam</a></li>
                </ul>
            </div>
            <div>
                <hr>
                <div class="dropdown show"><a class="dropdown-toggle link-body-emphasis d-flex align-items-center text-decoration-none" aria-expanded="true" data-bs-toggle="dropdown" role="button"><svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" viewBox="0 0 16 16" class="bi bi-person" style="font-size: 30px;margin-right: 5px;">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664z"></path>
                        </svg><strong>User</strong>&nbsp;</a>
                    <div class="dropdown-menu show shadow text-small" data-bs-popper="none" data-popper-placement="top-start"><a class="dropdown-item" href="#">Sign out</a></div>
                </div>
            </div>
        </div>
    </div>
    <footer class="text-center">
        <div class="container text-muted py-4 py-lg-5">
            <p class="mb-0">Copyright © 2024 Terra</p>
        </div>
    </footer>
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