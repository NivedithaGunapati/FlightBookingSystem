import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/BookTicketServlet")
public class BookTicketServlet extends HttpServlet {
    private static final String URL = "jdbc:mysql://localhost:3306/flight";
    private static final String USER = "root";
    private static final String PASSWORD = "1234";

    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException(e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        String passengerName = request.getParameter("passengerName");
        String departureCity = request.getParameter("departureCity");
        String arrivalCity = request.getParameter("arrivalCity");
        String departureDate = request.getParameter("departureDate");
        String returnDate = request.getParameter("returnDate");
        int numPassengers = Integer.parseInt(request.getParameter("numPassengers"));
        int flightId;

        try {
            flightId = Integer.parseInt(request.getParameter("flight"));
        } catch (NumberFormatException e) {
            response.sendRedirect("bookTicket.jsp");
            return;
        }

        try (Connection connection = getConnection()) {
            String sql = "INSERT INTO bookings (username, passenger_name, departure_city, arrival_city, departure_date, return_date, num_passengers, flight_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
                statement.setString(1, username);
                statement.setString(2, passengerName);
                statement.setString(3, departureCity);
                statement.setString(4, arrivalCity);
                statement.setDate(5, java.sql.Date.valueOf(departureDate));
                statement.setDate(6, returnDate != null && !returnDate.isEmpty() ? java.sql.Date.valueOf(returnDate) : null);
                statement.setInt(7, numPassengers);
                statement.setInt(8, flightId);

                int affectedRows = statement.executeUpdate();
                if (affectedRows == 0) {
                    throw new SQLException("Creating booking failed, no rows affected.");
                }

                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int bookingId = generatedKeys.getInt(1);
                        response.sendRedirect("payment.jsp?bookingId=" + bookingId);
                    } else {
                        throw new SQLException("Creating booking failed, no ID obtained.");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error: " + e.getMessage());
        }
    }
}
