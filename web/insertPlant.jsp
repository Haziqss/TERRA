<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Plant</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,600&display=swap">
    <style>
        body {
            background: linear-gradient(to right, #4caf50, #2e7d32);
            font-family: 'Work Sans', sans-serif;
            color: #fff;
        }
        .form-container {
            background: #ffffff;
            color: #333;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 50px auto;
        }
        .form-container h2 {
            font-weight: 600;
            text-align: center;
            margin-bottom: 30px;
        }
        .btn-primary {
            background-color: #4caf50;
            border: none;
        }
        .btn-primary:hover {
            background-color: #2e7d32;
        }
        footer {
            background: #2e7d32;
            color: #fff;
            text-align: center;
            padding: 15px 0;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="form-container">
            <h2>Insert New Plant</h2>
           <form action="InsertPlantServlet" method="post" enctype="multipart/form-data">
    <div class="mb-3">
        <label for="plantName" class="form-label">Plant Name</label>
        <input type="text" class="form-control" id="plantName" name="plantName" placeholder="Enter plant name" required>
    </div>
    <div class="mb-3">
        <label for="plantPicture" class="form-label">Plant Picture</label>
        <input type="file" class="form-control" id="plantPicture" name="plantPicture" accept="image/*" required>
    </div>
    <div class="mb-3">
        <label for="plantType" class="form-label">Plant Type</label>
        <input type="text" class="form-control" id="plantType" name="plantType" placeholder="Enter plant type">
    </div>
    <div class="mb-3">
        <label for="plantDescription" class="form-label">Plant Description</label>
        <textarea class="form-control" id="plantDescription" name="plantDescription" placeholder="Describe the plant" rows="3"></textarea>
    </div>
    <div class="mb-3">
        <label for="plantTutorial" class="form-label">Plant Tutorial</label>
        <textarea class="form-control" id="plantTutorial" name="plantTutorial" placeholder="Provide a tutorial (if any)" rows="3"></textarea>
    </div>
    <div class="mb-3">
        <label for="plantPrice" class="form-label">Plant Price</label>
        <input class="form-control" id="plantPrice" name="plantPrice" placeholder="0.00" rows="3">
    </div>    
    <div class="mb-3">
        <label for="adminID" class="form-label">Admin ID</label>
        <input type="number" class="form-control" id="adminID" name="adminID" placeholder="Enter Admin ID (Optional)">
    </div>
    <div class="d-grid">
        <button type="submit" class="btn btn-primary btn-lg">Insert Plant</button>
    </div>
</form>

            <a class="btn ms-md-2" role="button" data-bss-hover-animate="pulse" href="A-AdminDash.jsp" style="background: #FFFF00;font-family: ABeeZee, sans-serif;border-color: var(--bs-navbar-active-color);color: var(--bs-navbar-active-color);margin-top: 10px;margin-bottom: 10px;">Back</a>
        </div>
    </div>
   
    <script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
