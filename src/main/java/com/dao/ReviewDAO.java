package com.dao;

import com.model.Review;
import java.sql.*;
import java.util.*;

public class ReviewDAO {
    private Connection con;

    public ReviewDAO(Connection con) {
        this.con = con;
    }

    public boolean addReview(Review review) {
        String sql = "INSERT INTO reviews(user_id, order_id, comment, rating, review_date) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, review.getUserId());
            ps.setInt(2, review.getOrderId());
            ps.setString(3, review.getComment());
            ps.setInt(4, review.getRating());
            ps.setString(5, review.getReviewDate());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Review> getReviewsByUserId(int userId) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT * FROM reviews WHERE user_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Review r = new Review();
                    r.setId(rs.getInt("id"));
                    r.setUserId(rs.getInt("user_id"));
                    r.setOrderId(rs.getInt("order_id"));
                    r.setComment(rs.getString("comment"));
                    r.setRating(rs.getInt("rating"));
                    r.setReviewDate(rs.getString("review_date"));
                    reviews.add(r);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public List<Review> getAllReviewsWithUserID() {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.id, r.user_id, r.order_id, r.comment, r.rating, r.review_date, u.FirstName AS author " +
                "FROM reviews r JOIN Users u ON r.user_id = u.UserID " +
                "ORDER BY r.review_date DESC";
        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Review r = new Review();
                r.setId(rs.getInt("id"));
                r.setUserId(rs.getInt("user_id"));
                r.setOrderId(rs.getInt("order_id"));
                r.setComment(rs.getString("comment"));
                r.setRating(rs.getInt("rating"));
                r.setReviewDate(rs.getString("review_date"));
                reviews.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public boolean updateReview(Review review) {
        String sql = "UPDATE reviews SET comment = ?, rating = ?, review_date = ? WHERE user_id = ? AND order_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, review.getComment());
            ps.setInt(2, review.getRating());
            ps.setString(3, review.getReviewDate());
            ps.setInt(4, review.getUserId());
            ps.setInt(5, review.getOrderId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteReview(int userId, int orderId) {
        String sql = "DELETE FROM reviews WHERE user_id = ? AND order_id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, orderId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}