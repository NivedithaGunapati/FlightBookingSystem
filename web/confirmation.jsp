<%@ page import="java.sql.*" %>
<%
    int bookingId = Integer.parseInt(request.getParameter("bookingId"));
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String passengerName = "";
    String departureCity = "";
    String arrivalCity = "";
    String departureDate = "";
    String returnDate = "";
    int numPassengers = 0;
    double price = 0.0;

    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/flight", "root", "1234")) {
        String sql = "SELECT b.passenger_name, b.departure_city, b.arrival_city, b.departure_date, b.return_date, b.num_passengers, f.price " +
                     "FROM bookings b JOIN flights f ON b.flight_id = f.id WHERE b.id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, bookingId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    passengerName = resultSet.getString("passenger_name");
                    departureCity = resultSet.getString("departure_city");
                    arrivalCity = resultSet.getString("arrival_city");
                    departureDate = resultSet.getString("departure_date");
                    returnDate = resultSet.getString("return_date");
                    numPassengers = resultSet.getInt("num_passengers");
                    price = resultSet.getDouble("price") * numPassengers;
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Confirmation</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('https://as1.ftcdn.net/v2/jpg/03/06/77/42/1000_F_306774202_7dinRl1E9ruAXlDlIf0QRJBA4hUXj31g.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            color: white;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .card {
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            padding: 20px;
            width: 400px;
        }
        .card-title {
            text-align: center;
            color:#9738c9;
        }
        .form-group {
            margin-bottom: 20px;
        }
        p {
            margin-bottom: 0;
            display: inline-block;
            margin-left: 10px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card mt-5">
            <div class="card-body">
                <h3 class="card-title text-center">Booking Confirmation</h3>
                <div class="form-group">
                    <label>Passenger Name:</label>
                    <p><%= passengerName %></p>
                </div>
                <div class="form-group">
                    <label>Departure City:</label>
                    <p><%= departureCity %></p>
                </div>
                <div class="form-group">
                    <label>Arrival City:</label>
                    <p><%= arrivalCity %></p>
                </div>
                <div class="form-group">
                    <label>Departure Date:</label>
                    <p><%= departureDate %></p>
                </div>
                <div class="form-group">
                    <label>Return Date:</label>
                    <p><%= returnDate != null && !returnDate.isEmpty() ? returnDate : "N/A" %></p>
                </div>
                <div class="form-group">
                    <label>Number of Passengers:</label>
                    <p><%= numPassengers %></p>
                </div>
                <div class="form-group">
                    <label>Total Price:</label>
                    <p>$<%= price %></p>
                </div>
                <form action="home.jsp">
                    <button type="submit" class="btn btn-primary btn-block">Go to Home Page</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
