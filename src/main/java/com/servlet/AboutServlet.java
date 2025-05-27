package com.servlet;

import com.dao.ReviewDAO;
import com.dao.DBUtil;
import com.model.Review;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class AboutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection con = null;
        try {
            con = DBUtil.getConnection();
            ReviewDAO reviewDAO = new ReviewDAO(con);

            // Use instance method to get reviews
            List<Review> reviews = reviewDAO.getAllReviewsWithUserID();

            // Set attributes for JSP
            request.setAttribute("reviews", reviews);

            // Forward to about.jsp
            request.getRequestDispatcher("about.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error loading reviews: " + e.getMessage());
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("about.jsp").forward(request, response);
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ignore) {
                    ignore.printStackTrace();
                }
            }
        }
    }
}