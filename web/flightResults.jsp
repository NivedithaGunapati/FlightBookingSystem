<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Flight Search Results</title>
</head>
<body>
<h2>Flight Search Results</h2>
<table border="1">
    <thead>
    <tr>
        <th>Flight Number</th>
        <th>Departure Airport</th>
        <th>Arrival Airport</th>
        <th>Departure Time</th>
        <th>Arrival Time</th>
        <th>Airline</th>
        <th>Price</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${flights}" var="flight">
        <tr>
            <td>${flight.flightNumber}</td>
            <td>${flight.departureAirport}</td>
            <td>${flight.arrivalAirport}</td>
            <td>${flight.departureTime}</td>
            <td>${flight.arrivalTime}</td>
            <td>${flight.airline}</td>
            <td>${flight.price}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
