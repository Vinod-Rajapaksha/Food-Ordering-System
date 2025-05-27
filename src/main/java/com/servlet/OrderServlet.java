package com.servlet;

import com.dao.OrderDAO;
import com.dao.ReviewDAO;
import com.dao.DBUtil;
import com.model.Cart;
import com.model.Order;
import com.model.Review;
import com.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.util.*;
import java.util.stream.Collectors;

public class OrderServlet extends HttpServlet {
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
            showOrderHistory(request, response);
        } else if (pathInfo.equals("/details")) {
            showOrderDetails(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        placeOrder(request, response);
    }

    private void showOrderHistory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            List<Order> orders = orderDAO.getOrdersByUserId(user.getUserId());
            request.setAttribute("orders", orders);

            // --- Review section (LIST<String> ONLY!) ---
            Connection con = null;
            try {
                con = DBUtil.getConnection();
                ReviewDAO reviewDAO = new ReviewDAO(con);
                List<Review> userReviews = reviewDAO.getReviewsByUserId(user.getUserId());

                List<String> reviewedOrderIds = new ArrayList<>();
                Map<Integer, Review> reviewsMap = new HashMap<>();
                for (Review r : userReviews) {
                    reviewedOrderIds.add(String.valueOf(r.getOrderId()));
                    reviewsMap.put(r.getOrderId(), r);
                }
                request.setAttribute("reviewedOrderIds", reviewedOrderIds); // List<String>
                request.setAttribute("reviewsMap", reviewsMap);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("reviewedOrderIds", new ArrayList<String>());
                request.setAttribute("reviewsMap", new HashMap<>());
            } finally {
                if (con != null) try { con.close(); } catch (Exception ignore) {}
            }
            // --- end review section ---

            request.getRequestDispatcher("order.jsp").forward(request, response);
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
                    request.setAttribute("order", order);

                    HttpSession session = request.getSession();
                    User user = (User) session.getAttribute("user");
                    if (user != null) {
                        Connection con = null;
                        try {
                            con = DBUtil.getConnection();
                            ReviewDAO reviewDAO = new ReviewDAO(con);
                            List<Review> userReviews = reviewDAO.getReviewsByUserId(user.getUserId());

                            List<String> reviewedOrderIds = new ArrayList<>();
                            Map<Integer, Review> reviewsMap = new HashMap<>();
                            for (Review r : userReviews) {
                                reviewedOrderIds.add(String.valueOf(r.getOrderId()));
                                reviewsMap.put(r.getOrderId(), r);
                            }
                            request.setAttribute("reviewedOrderIds", reviewedOrderIds);
                            request.setAttribute("reviewsMap", reviewsMap);
                        } catch (Exception e) {
                            e.printStackTrace();
                            request.setAttribute("reviewedOrderIds", new ArrayList<String>());
                            request.setAttribute("reviewsMap", new HashMap<>());
                        } finally {
                            if (con != null) try { con.close(); } catch (Exception ignore) {}
                        }
                    }

                    request.getRequestDispatcher("order.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                // Invalid order ID
            }
        }

        response.sendRedirect("order");
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

        Order order = new Order();
        order.setUserId(user.getUserId());
        order.setTotalAmount(cart.getTotal());
        order.setStatus("Placed");

        int orderId = orderDAO.createOrder(order);
        if (orderId > 0) {
            if (orderDAO.addOrderItems(orderId, cart.getItems())) {
                cart.clear();
                session.setAttribute("cart", cart);
                response.sendRedirect("order");
                return;
            }
        }

        request.setAttribute("error", "Failed to place order. Please try again.");
        request.getRequestDispatcher("cart").forward(request, response);
    }
}