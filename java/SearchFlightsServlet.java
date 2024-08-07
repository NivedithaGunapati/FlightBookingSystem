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

@WebServlet("/SearchFlightsServlet")
public class SearchFlightsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/flight";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String departureAirport = request.getParameter("departureAirport");
        String arrivalAirport = request.getParameter("arrivalAirport");
        String departureDate = request.getParameter("departureDate");

        String sql = "SELECT * FROM flights WHERE departure_airport = ? AND arrival_airport = ? AND departure_date = ?";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
             PreparedStatement statement = conn.prepareStatement(sql)) {
            statement.setString(1, departureAirport);
            statement.setString(2, arrivalAirport);
            statement.setString(3, departureDate);

            try (ResultSet resultSet = statement.executeQuery()) {
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Search Results</title>");
                out.println("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">");
                out.println("<style>");
                out.println("body { background-image: url('https://as1.ftcdn.net/v2/jpg/03/06/77/42/1000_F_306774202_7dinRl1E9ruAXlDlIf0QRJBA4hUXj31g.jpg'); background-size: cover; background-repeat: no-repeat; color: white; }");
                out.println(".navbar { background-color: #2d3440; }");
                out.println(".navbar-nav { flex: 1; }");
                out.println(".navbar-nav .nav-item { margin-right: 200px; }");
                out.println(".navbar-nav .nav-item:first-child { margin-left: 130px; }");
                out.println(".navbar-nav .nav-item:last-child { margin-left: 10px; margin-right: 0; }");
                out.println(".navbar-brand, .nav-link { color: white !important; }");
                out.println(".nav-link:hover { color: #b3bbc7 !important; }");
                out.println(".card { max-width: 800px; margin: 50px auto; background-color: rgba(255, 255, 255, 0.1); color: white; padding: 20px; }");
                out.println(".card-title { color: #a0a0a0; }");
                out.println(".table td { color: #c2c7cf; }"); // Setting table data color
                out.println("</style>");
                out.println("</head>");
                out.println("<body>");

                // Navbar
                out.println("<nav class=\"navbar navbar-expand-lg navbar-light\">");
                out.println("<a class=\"navbar-brand\" href=\"#\">SkyQuest Airlines</a>");
                out.println("<div class=\"collapse navbar-collapse\" id=\"navbarNav\">");
                out.println("<ul class=\"navbar-nav\">");
                out.println("<li class=\"nav-item\"><a class=\"nav-link\" href=\"#\">Home</a></li>");
                out.println("<li class=\"nav-item\"><a class=\"nav-link\" href=\"searchFlights.jsp\">Search Flight</a></li>");
                out.println("<li class=\"nav-item\"><a class=\"nav-link\" href=\"logout\">Logout</a></li>");
                out.println("</ul>");
                out.println("</div>");
                out.println("</nav>");

                // Card
                out.println("<div class=\"container\">");
                out.println("<div class=\"card\">");
                out.println("<div class=\"card-body\">");
                out.println("<h3 class=\"card-title text-center\">Search Results</h3>");
                out.println("<table class=\"table table-striped\">");
                out.println("<thead class=\"thead-light\">");
                out.println("<tr>");
                out.println("<th>Flight Number</th>");
                out.println("<th>Departure Airport</th>");
                out.println("<th>Arrival Airport</th>");
                out.println("<th>Departure Time</th>");
                out.println("<th>Arrival Time</th>");
                out.println("<th>Price</th>");
                out.println("<th>Book</th>");
                out.println("</tr>");
                out.println("</thead>");
                out.println("<tbody>");

                while (resultSet.next()) {
                    out.println("<tr>");
                    out.println("<td>" + resultSet.getString("flight_number") + "</td>");
                    out.println("<td>" + resultSet.getString("departure_airport") + "</td>");
                    out.println("<td>" + resultSet.getString("arrival_airport") + "</td>");
                    out.println("<td>" + resultSet.getString("departure_time") + "</td>");
                    out.println("<td>" + resultSet.getString("arrival_time") + "</td>");
                    out.println("<td>" + resultSet.getString("price") + "</td>");
                    out.println("<td><a href=\"bookTicket.jsp?flightNumber=" + resultSet.getString("flight_number") + "\" style=\"color:#c474ba\">Book Ticket</a></td>"); // Change the color of the Book link
                    out.println("</tr>");
                }

                out.println("</tbody>");
                out.println("</table>");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
                out.println("</body>");
                out.println("</html>");
            }

        } catch (SQLException e) {
            out.println("<p>Error retrieving flights: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
    }
}
