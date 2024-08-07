<%@ page session="false" %>
<%
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Indian Airlines</title>
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
            margin-right: 150px;
        }
        .navbar-nav .nav-item:first-child {
            margin-left: 80px;
        }
        .navbar-nav .nav-item:last-child {
            margin-left: 10px;
            margin-right: 0;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand" href="#">SkyQuest Airlines</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="bookTicket.jsp">Book Ticket</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="searchFlights.jsp">Search Flights</a>
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
        <h1>Hey, <%= session.getAttribute("username") %>!<br> Welcome to SkyQuest Airlines.</h1>
    </div>
</body>
</html>
