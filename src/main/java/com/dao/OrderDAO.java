package com.dao;

import com.model.Order;
import com.model.OrderItem;
import com.model.MenuItem;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    // Create a new order
    public int createOrder(Order order) {
        String sql = "INSERT INTO Orders (UserID, TotalAmount, Status) VALUES (?, ?, ?)";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setInt(1, order.getUserId());
            pstmt.setDouble(2, order.getTotalAmount());
            pstmt.setString(3, order.getStatus());
            
            int affectedRows = pstmt.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    // Add order items
    public boolean addOrderItems(int orderId, List<OrderItem> items) {
        String sql = "INSERT INTO OrderItems (OrderID, MenuID, Quantity, Price) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            for (OrderItem item : items) {
                pstmt.setInt(1, orderId);
                pstmt.setInt(2, item.getMenuId());
                pstmt.setInt(3, item.getQuantity());
                pstmt.setDouble(4, item.getPrice());
                pstmt.addBatch();
            }
            
            int[] results = pstmt.executeBatch();
            for (int result : results) {
                if (result <= 0) {
                    return false;
                }
            }
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get order by ID
    public Order getOrderById(int orderId) {
        String sql = "SELECT * FROM Orders WHERE OrderID = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, orderId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Order order = new Order();
                    order.setOrderId(rs.getInt("OrderID"));
                    order.setUserId(rs.getInt("UserID"));
                    order.setOrderDate(rs.getTimestamp("OrderDate"));
                    order.setTotalAmount(rs.getDouble("TotalAmount"));
                    order.setStatus(rs.getString("Status"));
                    order.setOrderItems(getOrderItems(orderId));
                    return order;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get order items
    private List<OrderItem> getOrderItems(int orderId) {
        List<OrderItem> items = new ArrayList<>();
        String sql = "SELECT oi.*, m.Name, m.Description, m.Category " +
                    "FROM OrderItems oi " +
                    "JOIN Menu m ON oi.MenuID = m.MenuID " +
                    "WHERE oi.OrderID = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, orderId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    OrderItem item = new OrderItem();
                    item.setOrderItemId(rs.getInt("OrderItemID"));
                    item.setOrderId(rs.getInt("OrderID"));
                    item.setMenuId(rs.getInt("MenuID"));
                    item.setQuantity(rs.getInt("Quantity"));
                    item.setPrice(rs.getDouble("Price"));
                    
                    // Set menu item details
                    MenuItem menuItem = new MenuItem();
                    menuItem.setMenuId(rs.getInt("MenuID"));
                    menuItem.setName(rs.getString("Name"));
                    menuItem.setDescription(rs.getString("Description"));
                    menuItem.setCategory(rs.getString("Category"));
                    item.setMenuItem(menuItem);
                    
                    items.add(item);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    // Get orders by user ID
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE UserID = ? ORDER BY OrderDate DESC";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setOrderId(rs.getInt("OrderID"));
                    order.setUserId(rs.getInt("UserID"));
                    order.setOrderDate(rs.getTimestamp("OrderDate"));
                    order.setTotalAmount(rs.getDouble("TotalAmount"));
                    order.setStatus(rs.getString("Status"));
                    order.setOrderItems(getOrderItems(order.getOrderId()));
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    // Get all orders (for admin)
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM Orders ORDER BY OrderDate DESC";
        
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderID"));
                order.setUserId(rs.getInt("UserID"));
                order.setOrderDate(rs.getTimestamp("OrderDate"));
                order.setTotalAmount(rs.getDouble("TotalAmount"));
                order.setStatus(rs.getString("Status"));
                order.setOrderItems(getOrderItems(order.getOrderId()));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    // Update order status
    public boolean updateOrderStatus(int orderId, String status) {
        String sql = "UPDATE Orders SET Status = ? WHERE OrderID = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, status);
            pstmt.setInt(2, orderId);
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
