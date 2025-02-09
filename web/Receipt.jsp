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
            <h2>Upload Receipt</h2>
           <form action="ReceiptUpload" method="post" enctype="multipart/form-data">
    <div class="mb-3">
        <label for="memberName" class="form-label">Customer Name</label>
        <input type="text" class="form-control" id="memberName" name="memberName" placeholder="Enter your name" required>
    </div>
               <div class="mb-3">
        <label for="memberAddress" class="form-label">Customer Address</label>
        <input type="text" class="form-control" id="memberAddress" name="memberAddress" placeholder="Enter your Address" required>
    </div>
    <div class="mb-3">
        <label for="receiptPicture" class="form-label">Receipt</label>
        <input type="file" class="form-control" id="receiptPicture" name="receiptPicture" accept="image/*" required>
    </div>
    <div class="d-grid">
        <button type="submit" class="btn btn-primary btn-lg">Upload</button>
    </div>
</form>

            <a class="btn ms-md-2" role="button" data-bss-hover-animate="pulse" href="Checkout.jsp" style="background: #FFFF00;font-family: ABeeZee, sans-serif;border-color: var(--bs-navbar-active-color);color: var(--bs-navbar-active-color);margin-top: 10px;margin-bottom: 10px;">Back</a>
        </div>
    </div>
   
    <script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>