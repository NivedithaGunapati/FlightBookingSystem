<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Ticket</title>
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
            margin-right: 190px;
        }
        .navbar-nav .nav-item:first-child {
            margin-left: 130px;
        }
        .navbar-nav .nav-item:last-child {
            margin-left: 5px;
            margin-right: 0;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .nav-link:hover {
            color: #b3bbc7 !important; /* Color for hover effect */
        }
        .card {
            max-width: 500px;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.1); /* Transparent background */
            color: white;
        }
        .card-title {
            color: #a0a0a0; /* Greyish color for the heading */
        }
        .form-group label {
            color: #b3bbc7; /* Column color */
        }
        .btn-primary {
            background-color: #243e69; /* Button color */
            border-color: #243e69;
        }
        .btn-primary:hover {
            background-color: #1e3357; /* Darker shade on hover */
            border-color: #1e3357;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="#">SkyQuest Airlines</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="searchFlights.jsp">SearchFlights</a>
                </li>
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
                <h3 class="card-title text-center">Book Ticket</h3>
                <form action="BookTicketServlet" method="post">
                    <div class="form-group">
                        <label for="passengerName">Passenger Name</label>
                        <input type="text" class="form-control" id="passengerName" name="passengerName" required>
                    </div>
                    <div class="form-group">
                        <label for="departureCity">Departure City</label>
                        <input type="text" class="form-control" id="departureCity" name="departureCity" required>
                    </div>
                    <div class="form-group">
                        <label for="arrivalCity">Arrival City</label>
                        <input type="text" class="form-control" id="arrivalCity" name="arrivalCity" required>
                    </div>
                    <div class="form-group">
                        <label for="departureDate">Departure Date</label>
                        <input type="date" class="form-control" id="departureDate" name="departureDate" required>
                    </div>
                    <div class="form-group">
                        <label for="returnDate">Return Date (optional)</label>
                        <input type="date" class="form-control" id="returnDate" name="returnDate">
                    </div>
                    <div class="form-group">
                        <label for="numPassengers">Number of Passengers</label>
                        <input type="number" class="form-control" id="numPassengers" name="numPassengers" min="1" required>
                    </div>
                    <div class="form-group">
                        <label for="flight">Flight</label>
                        <select class="form-control" id="flight" name="flight" required>
                            <%
                                try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight", "root", "1234")) {
                                    String sql = "SELECT id, flight_number, price FROM flights";
                                    try (PreparedStatement statement = connection.prepareStatement(sql); 
                                         ResultSet resultSet = statement.executeQuery()) {
                                        while (resultSet.next()) {
                                            int flightId = resultSet.getInt("id");
                                            String flightNumber = resultSet.getString("flight_number");
                                            double price = resultSet.getDouble("price");
                                            out.println("<option value=\"" + flightId + "\">" + flightNumber + " ($" + price + ")</option>");
                                        }
                                    }
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            %>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Book Ticket</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
