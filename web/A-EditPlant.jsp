<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html data-bs-theme="light" lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Terra - Edit Plant</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/fontawesome-all.min.css">
</head>

<body style="background: #F0FFFF;">
    <div class="container mt-5">
        <h2>Edit Plant Details</h2>
        <form action="EditPlantServlet" method="post" enctype="multipart/form-data">
            <div class="row mb-3">
                <div class="col">
                    <label for="plantID"><strong>Plant ID</strong></label>
                    <input type="text" class="form-control" id="plantID" name="plantID" readonly 
                        value="${param.plantID}" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col">
                    <label for="plantName"><strong>Plant Name</strong></label>
                    <input type="text" class="form-control" id="plantName" name="plantName" required
                        value="${param.plantName}" />
                </div>
                <div class="col">
                    <label for="plantDescription"><strong>Plant Description</strong></label>
                    <input type="text" class="form-control" id="plantDescription" name="plantDescription" required
                        value="${param.plantDescription}" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col">
                    <label for="plantType"><strong>Plant Type</strong></label>
                    <input type="text" class="form-control" id="plantType" name="plantType" required
                        value="${param.plantType}" />
                </div>
                <div class="col">
                    <label for="plantTutorial"><strong>Plant Tutorial</strong></label>
                    <input type="text" class="form-control" id="plantTutorial" name="plantTutorial"
                        value="${param.plantTutorial}" />
                </div>
            </div>
            <div class="row mb-3">
                <div class="col">
                    <label for="plantPicture"><strong>Plant Image</strong></label>
                    <input type="file" class="form-control" id="plantPicture" name="plantPicture" />
                    <img src="${param.plantPicture}" alt="Current Image" style="max-width: 100px; margin-top: 10px;" />
                </div>
            </div>
            <button class="btn btn-success" type="submit">Save Changes</button>
            <a class="btn btn-secondary" href="A-ManagePlant.jsp">Cancel</a>
        </form>
    </div>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>
