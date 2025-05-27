package com.servlet;

import com.dao.OrderDAO;
import com.model.Cart;
import com.model.Order;
import com.model.User;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class PaymentServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    private OrderDAO orderDAO;

    @Override
    public void init() throws ServletException {
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pathInfo = request.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            // Show order history
            showOrderHistory(request, response);
        } else if (pathInfo.equals("/details")) {
            // Show order details
            showOrderDetails(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Place new order
        placeOrder(request, response);
    }

    private void showOrderHistory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            List<Order> orders = orderDAO.getOrdersByUserId(user.getUserId());
            request.setAttribute("orders", orders);
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }

    private void showOrderDetails(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderIdStr = request.getParameter("orderId");

        if (orderIdStr != null) {
            try {
                int orderId = Integer.parseInt(orderIdStr);
                Order order = orderDAO.getOrderById(orderId);

                if (order != null) {
                    request.setAttribute("payment", order);
                    request.getRequestDispatcher("payment.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                // Invalid order ID
            }
        }

        response.sendRedirect("payment");
    }

    private void placeOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        if (cart == null || cart.isEmpty()) {
            request.setAttribute("error", "Your cart is empty");
            request.getRequestDispatcher("cart").forward(request, response);
            return;
        }

        // Create new order
        Order order = new Order();
        order.setUserId(user.getUserId());
        order.setTotalAmount(cart.getTotal());
        order.setStatus("Placed");

        // Save order
        int orderId = orderDAO.createOrder(order);
        if (orderId > 0) {
            // Save order items
            if (orderDAO.addOrderItems(orderId, cart.getItems())) {
                // Clear cart
                cart.clear();
                session.setAttribute("cart", cart);

                // Redirect to order history
                response.sendRedirect("payment");
                return;
            }
        }

        // If we get here, something went wrong
        request.setAttribute("error", "Failed to place order. Please try again.");
        request.getRequestDispatcher("cart").forward(request, response);
    }
}
