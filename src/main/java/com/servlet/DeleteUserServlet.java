package com.servlet;

import com.dao.UserDAO;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // false = don't create if not exists
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login");
            return;
        }

        String userIdStr = request.getParameter("userId");
        boolean deleted = false;
        if (userIdStr != null) {
            try {
                int userId = Integer.parseInt(userIdStr);
                deleted = userDAO.deleteUser(userId);
            } catch (NumberFormatException e) {
                // log or ignore
            }
        }

        session.invalidate();

        if (deleted) {
            request.setAttribute("message", "Account deleted successfully!");
            request.setAttribute("messageType", "success");
        } else {
            request.setAttribute("message", "Account deletion failed. Please try again.");
            request.setAttribute("messageType", "error");
        }
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
}