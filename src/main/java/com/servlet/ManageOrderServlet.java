package com.servlet;

import com.dao.OrderDAO;
import com.model.Order;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManageOrderServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

    private OrderDAO orderDAO;

    @Override
    public void init() throws ServletException {
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Order> orders = orderDAO.getAllOrders();
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("manage_order.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("message", "Error retrieving orders: " + e.getMessage());
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("manage_order.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String message = "";
        String messageType = "success";

        try {
            if ("updateStatus".equals(action)) {
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                String status = request.getParameter("status");

                boolean success = orderDAO.updateOrderStatus(orderId, status);
                if (success) {
                    message = "Order #" + orderId + " status updated to " + status;
                } else {
                    message = "Failed to update order status";
                    messageType = "error";
                }
            }
        } catch (Exception e) {
            message = "Error processing request: " + e.getMessage();
            messageType = "error";
        }

        request.setAttribute("message", message);
        request.setAttribute("messageType", messageType);
        doGet(request, response);
    }

}