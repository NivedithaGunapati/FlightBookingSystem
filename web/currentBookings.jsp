<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Indian Airlines - Current Bookings</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Indian Airlines</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="bookTicket.jsp">Book Ticket</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">Current Bookings</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout">Logout</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container mt-4">
        <h1>Hey, <%= session.getAttribute("username") %>!<br> Welcome to Indian Airlines.</h1>
        <h2>Current Bookings</h2>
        <c:if test="${not empty bookings}">
            <table class="table">
                <thead>
                    <tr>
                        <th>Booking ID</th>
                        <th>Passenger Name</th>
                        <th>Departure City</th>
                        <th>Arrival City</th>
                        <th>Departure Date</th>
                        <th>Return Date</th>
                        <th>Number of Passengers</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="booking" items="${bookings}">
                        <tr>
                            <td>${booking.id}</td>
                            <td>${booking.passengerName}</td>
                            <td>${booking.departureCity}</td>
                            <td>${booking.arrivalCity}</td>
                            <td>${booking.departureDate}</td>
                            <td>${booking.returnDate}</td>
                            <td>${booking.numPassengers}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</body>
</html>
