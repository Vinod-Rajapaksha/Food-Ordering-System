package com.servlet;

import com.model.Cart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        
        String action = request.getParameter("action");
        
        if (action != null) {
            switch (action) {
                case "update":
                    updateCart(request, cart);
                    break;
                case "remove":
                    removeItem(request, cart);
                    break;
                case "clear":
                    cart.clear();
                    break;
            }
        }
        
        session.setAttribute("cart", cart);
        response.sendRedirect("cart");
    }
    
    private void updateCart(HttpServletRequest request, Cart cart) {
        String menuIdStr = request.getParameter("menuId");
        String quantityStr = request.getParameter("quantity");
        
        if (menuIdStr != null && quantityStr != null) {
            try {
                int menuId = Integer.parseInt(menuIdStr);
                int quantity = Integer.parseInt(quantityStr);
                cart.updateQuantity(menuId, quantity);
            } catch (NumberFormatException e) {
                // Invalid input, ignore
            }
        }
    }
    
    private void removeItem(HttpServletRequest request, Cart cart) {
        String menuIdStr = request.getParameter("menuId");
        
        if (menuIdStr != null) {
            try {
                int menuId = Integer.parseInt(menuIdStr);
                cart.removeItem(menuId);
            } catch (NumberFormatException e) {
                // Invalid input, ignore
            }
        }
    }
}
