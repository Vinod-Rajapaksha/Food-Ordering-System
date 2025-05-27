package com.servlet;

import com.dao.MenuDAO;
import com.model.MenuItem;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,    // 1 MB
        maxFileSize = 1024 * 1024 * 10,     // 10 MB
        maxRequestSize = 1024 * 1024 * 100  // 100 MB
)
public class ManageMenuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";
    private MenuDAO menuDAO;

    @Override
    public void init() throws ServletException {
        menuDAO = new MenuDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<MenuItem> menuItems = menuDAO.getAllMenuItems();
        request.setAttribute("menuItems", menuItems);
        request.getRequestDispatcher("manage_menu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String message = "";
        String messageType = "error";

        try {
            if (action != null) {
                switch (action) {
                    case "add":
                        message = addMenuItem(request);
                        messageType = "success";
                        break;
                    case "update":
                        message = updateMenuItem(request);
                        messageType = "success";
                        break;
                    case "delete":
                        message = deleteMenuItem(request);
                        messageType = "success";
                        break;
                }
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
            messageType = "error";
            e.printStackTrace();
        }

        request.setAttribute("message", message);
        request.setAttribute("messageType", messageType);
        doGet(request, response);
    }

    private String addMenuItem(HttpServletRequest request) throws IOException, ServletException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String category = request.getParameter("category");

        if (name == null || priceStr == null || category == null) {
            return "Required fields are missing";
        }

        try {
            double price = Double.parseDouble(priceStr);
            String imagePath = handleFileUpload(request);

            MenuItem item = new MenuItem();
            item.setName(name);
            item.setDescription(description);
            item.setPrice(price);
            item.setCategory(category);
            item.setImageUrl(imagePath);

            boolean success = menuDAO.addMenuItem(item);
            return success ? "Menu item added successfully!" : "Failed to add menu item";
        } catch (NumberFormatException e) {
            return "Invalid price format";
        }
    }

    private String updateMenuItem(HttpServletRequest request) throws IOException, ServletException {
        String menuIdStr = request.getParameter("menuId");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String priceStr = request.getParameter("price");
        String category = request.getParameter("category");
        String currentImage = request.getParameter("currentImage");

        if (menuIdStr == null || name == null || priceStr == null || category == null) {
            return "Required fields are missing";
        }

        try {
            int menuId = Integer.parseInt(menuIdStr);
            double price = Double.parseDouble(priceStr);

            // Handle file upload - if no new file, keep current image
            String imagePath = currentImage;
            Part filePart = request.getPart("imageFile");
            if (filePart != null && filePart.getSize() > 0) {
                imagePath = handleFileUpload(request);
            }

            MenuItem item = new MenuItem();
            item.setMenuId(menuId);
            item.setName(name);
            item.setDescription(description);
            item.setPrice(price);
            item.setCategory(category);
            item.setImageUrl(imagePath);

            boolean success = menuDAO.updateMenuItem(item);
            return success ? "Menu item updated successfully!" : "Failed to update menu item";
        } catch (NumberFormatException e) {
            return "Invalid input format";
        }
    }

    private String deleteMenuItem(HttpServletRequest request) {
        String menuIdStr = request.getParameter("menuId");
        if (menuIdStr == null) {
            return "Menu ID is required";
        }

        try {
            int menuId = Integer.parseInt(menuIdStr);
            boolean success = menuDAO.deleteMenuItem(menuId);
            return success ? "Menu item deleted successfully!" : "Failed to delete menu item";
        } catch (NumberFormatException e) {
            return "Invalid menu ID";
        }
    }

    private String handleFileUpload(HttpServletRequest request) throws IOException, ServletException {
        // Get the absolute path of the web application's root directory
        String appPath = request.getServletContext().getRealPath("");
        
        // Construct the path to the uploads folder (inside src/main/webapp/uploads/)
        String uploadPath = appPath + File.separator + UPLOAD_DIR;

        // Create the uploads directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            if (!uploadDir.mkdirs()) {
                throw new IOException("Failed to create upload directory: " + uploadPath);
            }
        }

        // Get the file part from the request
        Part filePart = request.getPart("imageFile");
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }

        // Generate a unique file name using timestamp
        String fileName = System.currentTimeMillis() + "_" +
                Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Construct the full file path
        String filePath = uploadPath + File.separator + fileName;

        // Save the file to the uploads folder
        try {
            filePart.write(filePath);
        } catch (IOException e) {
            throw new IOException("Failed to save file: " + filePath, e);
        }

        // Return the relative path for database storage
        return UPLOAD_DIR + File.separator + fileName;
    }
}