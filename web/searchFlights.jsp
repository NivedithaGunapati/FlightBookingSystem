<!DOCTYPE html>
<html>
<head>
    <title>Search Flights</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('https://as1.ftcdn.net/v2/jpg/03/06/77/42/1000_F_306774202_7dinRl1E9ruAXlDlIf0QRJBA4hUXj31g.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            color: white;
        }
        .navbar {
            background-color: #2d3440;
        }
        .navbar-nav {
            flex: 1;
        }
        .navbar-nav .nav-item {
            margin-right: 220px;
        }
        .navbar-nav .nav-item:first-child {
            margin-left: 600px;
        }
        .navbar-nav .nav-item:last-child {
            margin-left: auto;
            margin-right: 0;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .nav-link:hover {
            color: #b3bbc7 !important;
        }
        .card {
            max-width: 500px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
        }
        .card-title {
            color: #c2c7cf;
        }
        .form-group label {
            color: #b3bbc7;
        }
        .btn-primary {
            background-color: #243e69;
            border-color: #243e69;
        }
        .btn-primary:hover {
            background-color: #1e3357;
            border-color: #1e3357;
        }
    </style>
    <script>
        function validateForm() {
            var departureAirport = document.getElementById("departureAirport").value;
            var arrivalAirport = document.getElementById("arrivalAirport").value;
            var departureDate = document.getElementById("departureDate").value;

            if (departureAirport === "" || arrivalAirport === "" || departureDate === "") {
                alert("All fields are required");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="#">SkyQuest Airlines</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="CurrentBookingsServlet">Current Bookings</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Logout</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h3 class="card-title text-center">Search Flights</h3>
                <form action="SearchFlightsServlet" method="post" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="departureAirport">Departure Airport:</label>
                        <input type="text" class="form-control" id="departureAirport" name="departureAirport" required>
                    </div>
                    <div class="form-group">
                        <label for="arrivalAirport">Arrival Airport:</label>
                        <input type="text" class="form-control" id="arrivalAirport" name="arrivalAirport" required>
                    </div>
                    <div class="form-group">
                        <label for="departureDate">Departure Date:</label>
                        <input type="date" class="form-control" id="departureDate" name="departureDate" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Search</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
