import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/CurrentBookingsServlet")
public class CurrentBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/flight";
        String username = "root";
        String password = "1234";

        // SQL query to retrieve bookings
        String sql = "SELECT id,passenger_name,departure_city,arrival_city,departure_date,return_date,num_passengers FROM bookings";

        try (Connection conn = DriverManager.getConnection(jdbcUrl, username, password);
             PreparedStatement statement = conn.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            // Display the bookings in HTML format
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Current Bookings</title>");
            out.println("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">");
            out.println("<style>");
            out.println("body { background-image: url('https://as1.ftcdn.net/v2/jpg/03/06/77/42/1000_F_306774202_7dinRl1E9ruAXlDlIf0QRJBA4hUXj31g.jpg'); background-size: cover; background-repeat: no-repeat; color: white; }");
            out.println(".navbar { background-color: #2d3440; }");
            out.println(".navbar-nav { flex: 1; }");
            out.println(".navbar-nav .nav-item { margin-right: 40px; }");
            out.println(".navbar-nav .nav-item:first-child { margin-left: 40px; }");
            out.println(".navbar-nav .nav-item:last-child { margin-left: auto; margin-right: 0; }");
            out.println(".navbar-brand, .nav-link { color: white !important; }");
            out.println(".nav-link:hover { color: #b3bbc7 !important; }");
            out.println(".card { max-width: 800px; margin: 50px auto; background-color: rgba(255, 255, 255, 0.1); color: white; padding: 20px; }");
            out.println(".card-title { color: #a0a0a0; }");
            out.println(".table td { color: #c2c7cf; }"); // Setting table data color
            out.println(".return-date-column { width: 200px; }"); // Increase width for the return date column
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");

            // Navbar
            out.println("<nav class=\"navbar navbar-expand-lg navbar-light\">");
            out.println("<a class=\"navbar-brand\" href=\"#\">Indian Airlines</a>");
            out.println("<div class=\"collapse navbar-collapse\" id=\"navbarNav\">");
            out.println("<ul class=\"navbar-nav\">");
            out.println("<li class=\"nav-item\"><a class=\"nav-link\" href=\"home.jsp\">Home</a></li>");
            out.println("<li class=\"nav-item\"><a class=\"nav-link\" href=\"searchFlights.jsp\">Search Flights</a></li>");
            out.println("<li class=\"nav-item\"><a class=\"nav-link\" href=\"logout\">Logout</a></li>");
            out.println("</ul>");
            out.println("</div>");
            out.println("</nav>");

            // Card
            out.println("<div class=\"container\">");
            out.println("<div class=\"card\">");
            out.println("<div class=\"card-body\">");
            out.println("<h3 class=\"card-title text-center\">Current Bookings</h3>");

            // Table
            out.println("<table class=\"table table-striped\">");
            out.println("<thead class=\"thead-light\">");
            out.println("<tr>");
            out.println("<th>Booking ID</th>");
            out.println("<th>Passenger Name</th>");
            out.println("<th>Departure City</th>");
            out.println("<th>Arrival City</th>");
            out.println("<th>Departure Date</th>");
            out.println("<th class=\"return-date-column\">Return Date</th>"); // Set width for the return date column
            out.println("<th>Number of Passengers</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");

            // Loop through the result set and display each booking
            while (resultSet.next()) {
                out.println("<tr>");
                out.println("<td>" + resultSet.getInt("id") + "</td>");
                out.println("<td>" + resultSet.getString("passenger_name") + "</td>");
                out.println("<td>" + resultSet.getString("departure_city") + "</td>");
                out.println("<td>" + resultSet.getString("arrival_city") + "</td>");
                out.println("<td>" + resultSet.getDate("departure_date") + "</td>");
                out.println("<td class=\"return-date-column\">" + resultSet.getDate("return_date") + "</td>");
                out.println("<td>" + resultSet.getInt("num_passengers") + "</td>");
                out.println("</tr>");
            }

            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");

            out.println("</body>");
            out.println("</html>");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
