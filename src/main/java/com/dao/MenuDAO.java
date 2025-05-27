package com.dao;

import com.model.MenuItem;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MenuDAO {
    // Get all menu items
    public List<MenuItem> getAllMenuItems() {
        List<MenuItem> menuItems = new ArrayList<>();
        String sql = "SELECT * FROM Menu ORDER BY Category, Name";
        
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                MenuItem item = new MenuItem();
                item.setMenuId(rs.getInt("MenuID"));
                item.setName(rs.getString("Name"));
                item.setDescription(rs.getString("Description"));
                item.setPrice(rs.getDouble("Price"));
                item.setCategory(rs.getString("Category"));
                item.setImageUrl(rs.getString("ImageUrl"));
                menuItems.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuItems;
    }

    // Get menu items by category
    public List<MenuItem> getMenuItemsByCategory(String category) {
        List<MenuItem> menuItems = new ArrayList<>();
        String sql = "SELECT * FROM Menu WHERE Category = ? ORDER BY Name";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, category);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    MenuItem item = new MenuItem();
                    item.setMenuId(rs.getInt("MenuID"));
                    item.setName(rs.getString("Name"));
                    item.setDescription(rs.getString("Description"));
                    item.setPrice(rs.getDouble("Price"));
                    item.setCategory(rs.getString("Category"));
                    item.setImageUrl(rs.getString("ImageUrl"));
                    menuItems.add(item);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuItems;
    }

    // Get menu item by ID
    public MenuItem getMenuItemById(int menuId) {
        String sql = "SELECT * FROM Menu WHERE MenuID = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, menuId);
            
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    MenuItem item = new MenuItem();
                    item.setMenuId(rs.getInt("MenuID"));
                    item.setName(rs.getString("Name"));
                    item.setDescription(rs.getString("Description"));
                    item.setPrice(rs.getDouble("Price"));
                    item.setCategory(rs.getString("Category"));
                    item.setImageUrl(rs.getString("ImageUrl"));
                    return item;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Add new menu item
    public boolean addMenuItem(MenuItem item) {
        String sql = "INSERT INTO Menu (Name, Description, Price, Category, ImageUrl) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, item.getName());
            pstmt.setString(2, item.getDescription());
            pstmt.setDouble(3, item.getPrice());
            pstmt.setString(4, item.getCategory());
            pstmt.setString(5, item.getImageUrl());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update menu item
    public boolean updateMenuItem(MenuItem item) {
        String sql = "UPDATE Menu SET Name = ?, Description = ?, Price = ?, Category = ?, ImageUrl = ? WHERE MenuID = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, item.getName());
            pstmt.setString(2, item.getDescription());
            pstmt.setDouble(3, item.getPrice());
            pstmt.setString(4, item.getCategory());
            pstmt.setString(5, item.getImageUrl());
            pstmt.setInt(6, item.getMenuId());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete menu item
    public boolean deleteMenuItem(int menuId) {
        String sql = "DELETE FROM Menu WHERE MenuID = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, menuId);
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get all categories
    public List<String> getAllCategories() {
        List<String> categories = new ArrayList<>();
        String sql = "SELECT DISTINCT Category FROM Menu ORDER BY Category";
        
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                categories.add(rs.getString("Category"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
}
