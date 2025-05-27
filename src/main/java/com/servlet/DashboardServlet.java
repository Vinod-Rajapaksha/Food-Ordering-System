package com.servlet;

import com.model.Order;
import com.model.MenuItem;
import com.dao.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

public class DashboardServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Check if admin is logged in
        if (session.getAttribute("admin") == null) {
            response.sendRedirect("admin-login");
            return;
        }

        try {
            Connection conn = getConnection(); // Implement your DB connection logic

            // Fetch stats
            int totalOrders = getTotalOrders(conn);
            int pendingOrders = getPendingOrders(conn);
            double totalRevenue = getTotalRevenue(conn);
            int totalUsers = getTotalUsers(conn);
            List<Order> recentOrders = getRecentOrders(conn);
            List<MenuItem> popularItems = getPopularItems(conn);

            // Set attributes for JSP
            request.setAttribute("totalOrders", totalOrders);
            request.setAttribute("pendingOrders", pendingOrders);
            request.setAttribute("totalRevenue", String.format("%.2f", totalRevenue));
            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("recentOrders", recentOrders);
            request.setAttribute("popularItems", popularItems);

            // Check for any message from other actions
            String message = request.getParameter("message");
            String messageType = request.getParameter("messageType");
            if (message != null && messageType != null) {
                request.setAttribute("message", message);
                request.setAttribute("messageType", messageType);
            }

            // Forward to JSP
            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error occurred. Please try again.");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("admin_dashboard.jsp").forward(request, response);
        }
    }

    private Connection getConnection() throws SQLException {
        return DBUtil.getConnection();
    }

    private int getTotalOrders(Connection conn) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Orders";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }

    private int getPendingOrders(Connection conn) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Orders WHERE Status = 'Placed'";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }

    private double getTotalRevenue(Connection conn) throws SQLException {
        String sql = "SELECT SUM(TotalAmount) FROM Orders WHERE Status = 'Placed'";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            return rs.next() ? rs.getDouble(1) : 0.0;
        }
    }

    private int getTotalUsers(Connection conn) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Users";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            return rs.next() ? rs.getInt(1) : 0;
        }
    }

    private List<Order> getRecentOrders(Connection conn) throws SQLException {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT TOP 3 OrderID, UserID, OrderDate, TotalAmount, Status FROM Orders ORDER BY OrderDate DESC";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderID"));
                order.setUserId(rs.getInt("UserID"));
                order.setOrderDate(rs.getTimestamp("OrderDate"));
                order.setTotalAmount(rs.getDouble("TotalAmount"));
                order.setStatus(rs.getString("Status"));
                orders.add(order);
            }
        }
        return orders;
    }

    private List<MenuItem> getPopularItems(Connection conn) throws SQLException {
        List<MenuItem> items = new ArrayList<>();
        String sql = "SELECT TOP 5 m.MenuID, m.Name, m.Category, m.Price, COUNT(oi.MenuID) as OrderCount " +
                "FROM Menu m LEFT JOIN OrderItems oi ON m.MenuID = oi.MenuID " +
                "GROUP BY m.MenuID, m.Name, m.Category, m.Price " +
                "ORDER BY OrderCount DESC";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                MenuItem item = new MenuItem();
                item.setMenuId(rs.getInt("MenuID"));
                item.setName(rs.getString("Name"));
                item.setCategory(rs.getString("Category"));
                item.setPrice(rs.getDouble("Price"));
                item.setOrderCount(rs.getInt("OrderCount"));
                items.add(item);
            }
        }
        return items;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
