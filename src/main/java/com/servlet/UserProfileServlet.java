package com.servlet;

import com.model.User;
import com.dao.UserDAO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UserProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        request.setAttribute("user", user);
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        String action = request.getParameter("action");
        try {
            if ("update".equals(action)) {
                // Update user profile
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String phoneNumber = request.getParameter("phoneNumber");
                String address = request.getParameter("address");
                String gender = request.getParameter("gender");
                String password = request.getParameter("password");

                user.setFirstName(firstName);
                user.setLastName(lastName);
                user.setEmail(email);
                user.setPhoneNumber(phoneNumber);
                user.setAddress(address);
                user.setGender(gender != null && !gender.isEmpty() ? gender : null);

                // Update password only if provided
                if (password != null && !password.trim().isEmpty()) {
                    user.setPassword(password);
                }

                userDAO.updateUser(user); // Update user in database
                session.setAttribute("user", user); // Update session
                request.setAttribute("message", "Profile updated successfully!");
                request.setAttribute("messageType", "success");
            } else if ("delete".equals(action)) {
                // Delete user account
                int userId = Integer.parseInt(request.getParameter("userId"));
                boolean deleted = userDAO.deleteUser(userId); 
                session.invalidate(); 
                if (deleted) {
                    request.setAttribute("message", "Account deleted successfully!");
                    request.setAttribute("messageType", "success");
                } else {
                    request.setAttribute("message", "Account deletion failed. Please try again.");
                    request.setAttribute("messageType", "error");
                }
                request.getRequestDispatcher("/login.jsp").forward(request, response); 
                return;
            }
        } catch (Exception e) {
            request.setAttribute("message", "An error occurred: " + e.getMessage());
            request.setAttribute("messageType", "error");
        }

        request.setAttribute("user", user);
        request.getRequestDispatcher("/profile.jsp").forward(request, response);
    }
}