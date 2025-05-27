package com.servlet;

import com.dao.MenuDAO;
import com.model.MenuItem;
import com.model.Cart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MenuDAO menuDAO;

    @Override
    public void init() throws ServletException {
        menuDAO = new MenuDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get category filter if any
        String category = request.getParameter("category");
        
        // Get menu items
        List<MenuItem> menuItems;
        if (category != null && !category.isEmpty()) {
            menuItems = menuDAO.getMenuItemsByCategory(category);
        } else {
            menuItems = menuDAO.getAllMenuItems();
        }
        
        // Get all categories for filter
        List<String> categories = menuDAO.getAllCategories();
        
        // Set attributes
        request.setAttribute("menuItems", menuItems);
        request.setAttribute("categories", categories);
        request.setAttribute("selectedCategory", category);
        
        // Forward to menu page
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get cart from session or create new one
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        
        // Get menu item ID and quantity
        String menuIdStr = request.getParameter("menuId");
        String quantityStr = request.getParameter("quantity");
        
        if (menuIdStr != null && quantityStr != null) {
            try {
                int menuId = Integer.parseInt(menuIdStr);
                int quantity = Integer.parseInt(quantityStr);
                
                if (quantity > 0) {
                    MenuItem menuItem = menuDAO.getMenuItemById(menuId);
                    if (menuItem != null) {
                        cart.addItem(menuItem, quantity);
                        session.setAttribute("cart", cart);
                    }
                }
            } catch (NumberFormatException e) {
                // Invalid input, ignore
            }
        }
        
        // Redirect back to menu page
        response.sendRedirect("menu");
    }
}
