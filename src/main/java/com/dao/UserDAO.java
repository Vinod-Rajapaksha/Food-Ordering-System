package com.dao;

import com.model.User;
import java.sql.*;

public class UserDAO {
    // Register a new user
    public boolean register(User user) {
        String sql = "INSERT INTO Users (FirstName, LastName, PhoneNumber, Email, Address, Password, Gender) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getFirstName());
            pstmt.setString(2, user.getLastName());
            pstmt.setString(3, user.getPhoneNumber());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getAddress());
            pstmt.setString(6, user.getPassword());
            pstmt.setString(7, user.getGender());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Login user
    public User login(String email, String password) {
        String sql = "SELECT * FROM Users WHERE Email = ? AND Password = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setUserId(rs.getInt("UserID"));
                    user.setFirstName(rs.getString("FirstName"));
                    user.setLastName(rs.getString("LastName"));
                    user.setPhoneNumber(rs.getString("PhoneNumber"));
                    user.setEmail(rs.getString("Email"));
                    user.setAddress(rs.getString("Address"));
                    user.setPassword(rs.getString("Password"));
                    user.setGender(rs.getString("Gender"));
                    user.setCreatedAt(rs.getTimestamp("CreatedAt"));
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Check if email exists
    public boolean emailExists(String email) {
        String sql = "SELECT COUNT(*) FROM Users WHERE Email = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get user by ID
    public User getUserById(int userId) {
        String sql = "SELECT * FROM Users WHERE UserID = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setUserId(rs.getInt("UserID"));
                    user.setFirstName(rs.getString("FirstName"));
                    user.setLastName(rs.getString("LastName"));
                    user.setPhoneNumber(rs.getString("PhoneNumber"));
                    user.setEmail(rs.getString("Email"));
                    user.setAddress(rs.getString("Address"));
                    user.setPassword(rs.getString("Password"));
                    user.setGender(rs.getString("Gender"));
                    user.setCreatedAt(rs.getTimestamp("CreatedAt"));
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update user profile
    public boolean updateUser(User user) {
        String sql = "UPDATE Users SET FirstName = ?, LastName = ?, PhoneNumber = ?, Email = ?, Address = ?, Gender = ?" +
                (user.getPassword() != null && !user.getPassword().isEmpty() ? ", Password = ?" : "") +
                " WHERE UserID = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getFirstName());
            pstmt.setString(2, user.getLastName());
            pstmt.setString(3, user.getPhoneNumber());
            pstmt.setString(4, user.getEmail());
            pstmt.setString(5, user.getAddress());
            pstmt.setString(6, user.getGender());
            int paramIndex = 7;
            if (user.getPassword() != null && !user.getPassword().isEmpty()) {
                pstmt.setString(paramIndex++, user.getPassword());
            }
            pstmt.setInt(paramIndex, user.getUserId());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete user by ID
    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM Users WHERE UserID = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, userId);

            int rows = pstmt.executeUpdate();
            System.out.println("Delete user result: " + rows + " row(s) affected.");
            return rows > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting user with ID " + userId + ": " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}