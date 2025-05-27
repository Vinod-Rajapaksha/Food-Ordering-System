package com.servlet;

import com.model.Review;
import com.dao.ReviewDAO;
import com.dao.DBUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.time.LocalDate;

public class ReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String userIdStr = request.getParameter("user_id");
        String orderIdStr = request.getParameter("order_id");
        String ratingStr = request.getParameter("rating");
        String comment = request.getParameter("comment");
        String reviewDate = LocalDate.now().toString();

        HttpSession session = request.getSession();
        String message = null;
        String messageType = "success";

        int userId = 0, orderId = 0, rating = 0;

        try {
            if (userIdStr != null) userId = Integer.parseInt(userIdStr);
            if (orderIdStr != null) orderId = Integer.parseInt(orderIdStr);
            if (ratingStr != null && !ratingStr.isEmpty()) rating = Integer.parseInt(ratingStr);
        } catch (NumberFormatException e) {
            session.setAttribute("message", "Invalid data format.");
            session.setAttribute("messageType", "error");
            response.sendRedirect("order");
            return;
        }

        Connection con = null;

        try {
            con = DBUtil.getConnection();
            if (con == null) {
                session.setAttribute("message", "Database connection failed.");
                session.setAttribute("messageType", "error");
                response.sendRedirect("order");
                return;
            }

            ReviewDAO reviewDAO = new ReviewDAO(con);

            switch (action) {
                case "rate":
                    if (userId > 0 && orderId > 0 && rating > 0) {
                        Review newReview = new Review(0, userId, orderId, comment, rating, reviewDate);
                        boolean added = reviewDAO.addReview(newReview);
                        message = added ? "Review submitted successfully!" : "Failed to submit review.";
                        messageType = added ? "success" : "error";
                    } else {
                        message = "Invalid input for rating.";
                        messageType = "error";
                    }
                    break;

                case "edit":
                    if (userId > 0 && orderId > 0 && rating > 0) {
                        Review editedReview = new Review(0, userId, orderId, comment, rating, reviewDate);
                        boolean updated = reviewDAO.updateReview(editedReview);
                        message = updated ? "Review updated successfully!" : "Failed to update review.";
                        messageType = updated ? "success" : "error";
                    } else {
                        message = "Invalid input for editing.";
                        messageType = "error";
                    }
                    break;

                case "delete":
                    if (userId > 0 && orderId > 0) {
                        boolean deleted = reviewDAO.deleteReview(userId, orderId);
                        message = deleted ? "Review deleted successfully!" : "Failed to delete review.";
                        messageType = deleted ? "success" : "error";
                    } else {
                        message = "Invalid input for deletion.";
                        messageType = "error";
                    }
                    break;

                default:
                    message = "Invalid action.";
                    messageType = "error";
                    break;
            }

        } catch (Exception e) {
            e.printStackTrace();
            message = "Server error: " + e.getMessage();
            messageType = "error";
        } finally {
            if (con != null) try { con.close(); } catch (Exception ignore) {}
        }

        // Set feedback message for JSP
        session.setAttribute("message", message);
        session.setAttribute("messageType", messageType);

        // Redirect back to orders page
        response.sendRedirect("order");
    }
}