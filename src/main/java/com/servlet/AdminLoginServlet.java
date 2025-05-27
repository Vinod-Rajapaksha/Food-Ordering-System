package com.servlet;

import com.dao.AdminDAO;
import com.model.Admin;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO;

    @Override
    public void init() throws ServletException {
        adminDAO = new AdminDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input
        if (email == null || password == null ||
                email.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("error", "Email and password are required");
            request.getRequestDispatcher("admin_login.jsp").forward(request, response);
            return;
        }

        // Authenticate user
        Admin admin = adminDAO.login(email, password);
        if (admin != null) {
            // Login successful
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            session.setMaxInactiveInterval(30 * 60); // 30 minutes timeout

            // Redirect to dashboard page
            response.sendRedirect("dashboard");
        } else {
            // Login failed
            request.setAttribute("error", "Invalid email or password");
            request.getRequestDispatcher("admin_login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if admin is already logged in
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("admin") != null) {
            response.sendRedirect("dashboard");
        } else {
            request.getRequestDispatcher("admin_login.jsp").forward(request, response);
        }
    }
}
