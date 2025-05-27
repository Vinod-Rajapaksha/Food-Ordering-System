package com.dao;

import com.model.Admin;
import java.sql.*;

public class AdminDAO {

    public Admin login(String email, String password) {
        String sql = "SELECT * FROM Admins WHERE Email = ? AND Password = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Admin admin = new Admin();
                    admin.setAdminId(rs.getInt("AdminID"));
                    admin.setEmail(rs.getString("Email"));
                    admin.setPassword(rs.getString("Password"));
                    return admin;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
