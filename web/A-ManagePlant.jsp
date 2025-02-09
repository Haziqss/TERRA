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
            <div class="container-fluid"><a class="navbar-brand d-flex align-items-center" href="#" style="margin-left: 10px;"><span class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon" style="background: var(--bs-body-bg);color: rgba(255,255,255,0.5);"><img src="assets/img/Logo.png" width="31" height="31"></span><span style="font-family: ABeeZee, sans-serif;color: var(--bs-body-bg);">Terra</span></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-2"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navcol-2">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"></li>
                        <li class="nav-item"><a class="nav-link" data-bss-hover-animate="pulse"  style="font-family: ABeeZee, sans-serif;color: var(--bs-body-bg);"><strong>Welcome (Username)</strong></a></li>
                    </ul>
                </div><a class="btn ms-md-2" role="button" data-bss-hover-animate="pulse" href="A-AdminDash.jsp" style="background: #FFFF00;font-family: ABeeZee, sans-serif;border-color: var(--bs-navbar-active-color);color: var(--bs-navbar-active-color);">Home</a>
            </div>
        </nav>
    </div>
    <section style="margin-top: 20px;">
        <div class="container" style="border-radius: 10px;background: #00b75b;">
            <div id="wrapper" style="padding-left: 0px;">
                <div class="d-flex flex-column" id="content-wrapper" style="background: #2d2f3e;">
                    <div id="content" style="color: #2D2F3E;border-radius: 10px;">
                        <div class="container-fluid" style="margin-bottom: 50px;">
                            <div class="row">
                                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                                    <h1 class="display-5" style="border-radius: 10px;color: var(--bs-body-bg);">Plant's Info</h1>
                                </div>
                            </div>
                            <div class="card" id="TableSorterCard" style="border-style: none;border-radius: 6.5px;">
                                <div class="card-header py-3" style="border-width: 0px;background: rgb(23,25,33);">
                                    <div class="row table-topper align-items-center">
                                        <div class="col-12 col-sm-12 col-md-12 col-xl-12 col-xxl-12 text-end d-xl-flex flex-column align-items-xl-end" style="margin: 0px;padding: 5px 15px;"><input type="search" id="searchInputPlant" placeholder="Search" style="margin-right: 10px;" oninput="searchTable('plantTable', 'searchInputPlant')">
                                            <div class="d-flex justify-content-end justify-content-sm-end justify-content-lg-end table-controls"><button class="btn btn-sm" type="button" style="font-family: 'Work Sans', sans-serif;color: var(--bs-body-bg);border-color: #000000;background: #000000;margin-right: 10px;margin-top: 10px;" onclick="printTable()">Print</button>
                                                <div class="dropdown" style="padding-left: 0px;" data-bs-toggle="dropdown" aria-expanded="false"><button class="btn btn-sm dropdown-toggle" aria-expanded="false" data-bs-toggle="dropdown" id="filterDropdown" type="button" style="color: #f1f2f1;background: #000000;margin-top: 10px;margin-right: 15px;font-family: 'Work Sans', sans-serif;">Filter</button>
                                                    <div class="dropdown-menu" aria-labelledby="filterDropdown"><a class="dropdown-item" href="#" onclick="sortTable('plantTable', 'date')">By Date</a><a class="dropdown-item" href="#" onclick="sortTable('plantTable', 'name')">By Name</a></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="table-responsive" style="border-top-style: none;background: #171921;">
                                            <table class="table table-striped table tablesorter" id="plantTable" style="display: block !important; visibility: visible !important;">
                                                <thead class="thead-dark" style="background: rgb(33,37,48);border-width: 0px;border-color: rgb(0,0,0);border-bottom-color: #21252F;">
                                                    <tr style="border-style: none;border-color: rgba(255,255,255,0);background: #21252f;">
                                                        <th class="text-center" style="font-family: 'Work Sans', sans-serif;color: var(--bs-table-striped-color);width: 30%;border-color: var(--bs-table-bg);">Plant ID</th>
                                                        <th class="text-center" style="font-family: 'Work Sans', sans-serif;color: var(--bs-table-striped-color);width: 30%;border-color: var(--bs-table-bg);">Plant Name</th>
                                                        <th class="text-center" style="font-family: 'Work Sans', sans-serif;color: var(--bs-table-striped-color);width: 130%;border-color: var(--bs-table-bg);">Plant Type</th>
                                                        <th class="text-center filter-false sorter-false" style="font-family: 'Work Sans', sans-serif;color: var(--bs-table-striped-color);border-color: var(--bs-table-bg);">Actions</th>
                                                    </tr>
                                                </thead>
                                              <tbody class="text-center" id="plantTableBody">
                                          <script>
                                                // Fetch plant data and populate the table body
                                                fetch("GetPlantServlet")
                                                    .then(response => response.text())
                                                    .then(data => {
                                                        document.getElementById("plantTableBody").innerHTML = data;

                                                        // Initialize search functionality after the table is populated
                                                        document.getElementById("searchInputPlant").addEventListener("input", () => {
                                                            searchTable('plantTable', 'searchInputPlant');
                                                        });
                                                    })
                                                    .catch(error => console.error("Error fetching plant data:", error));
                                            </script>

                                        </tbody>

                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up" style="color: var(--bs-emphasis-color);"></i></a>
            </div>
        </div>
    </section>
   <script>
    function searchTable(tableId, searchInputId) {
        // Get the table and search input elements
        const table = document.getElementById(tableId);
        const searchInput = document.getElementById(searchInputId);
        const filter = searchInput.value.toLowerCase(); // Convert search query to lowercase
        const rows = table.getElementsByTagName("tr"); // Get all rows in the table

        // Loop through the rows and filter based on the search query
        for (let i = 1; i < rows.length; i++) { // Start from 1 to skip the header row
            const cells = rows[i].getElementsByTagName("td"); // Get all cells in the row
            let match = false;

            // Check each cell in the row for a match
            for (let j = 0; j < cells.length; j++) {
                const cellValue = cells[j].textContent || cells[j].innerText;
                if (cellValue.toLowerCase().includes(filter)) {
                    match = true;
                    break;
                }
            }

            // Show or hide the row based on whether it matches the search query
            rows[i].style.display = match ? "" : "none";
        }
    }
</script>

<script>
function deletePlant(plantId) {
    if (confirm("Are you sure you want to delete this plant?")) {
        fetch("DeletePlantServlet", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "plantId=" + encodeURIComponent(plantId)
        })
        .then(response => response.text())
        .then(data => {
            if (data === "Success") {
                alert("Plant deleted successfully!");
                location.reload(); // Reload the table after deletion
            } else {
                alert("Failed to delete plant. Please try again.");
            }
        })
        .catch(error => {
            console.error("Error:", error);
            alert("An error occurred while deleting the plant.");
        });
    }
}

</script>



    
    
    <footer class="text-center">
        <div class="container text-muted py-4 py-lg-5">
            <p class="mb-0">Copyright © 2024 Terra</p>
        </div>
    </footer>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/bs-init.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2
